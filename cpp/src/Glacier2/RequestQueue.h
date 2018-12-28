// **********************************************************************
//
// Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#ifndef REQUEST_H
#define REQUEST_H

#include <IceUtil/Thread.h>
#include <IceUtil/Monitor.h>
#include <Ice/VirtualShared.h>
#include <Ice/Ice.h>

#include <Glacier2/CallbackObject.h>
#include <Glacier2/Instrumentation.h>

#include <deque>

namespace Glacier2
{
class Instance;
typedef IceUtil::Handle<Instance> InstancePtr;

class Request;
ICE_DEFINE_PTR(RequestPtr, Request);

class RequestQueueThread;
typedef IceUtil::Handle<RequestQueueThread> RequestQueueThreadPtr;

class Request
#ifdef ICE_CPP11_MAPPING
    : public IceInternal::EnableSharedFromThis<Request>
#else
    : public Ice::LocalObject
#endif
{
public:

    Request(const Ice::ObjectPrxPtr&, const std::pair<const Ice::Byte*, const Ice::Byte*>&, const Ice::Current&, bool,
            const Ice::Context&, const Ice::AMD_Object_ice_invokePtr&);

    Ice::AsyncResultPtr invoke(const Ice::Callback_Object_ice_invokePtr& callback);
    bool override(const RequestPtr&) const;
    void addBatchProxy(std::set<Ice::ObjectPrx>&);
    bool hasOverride() const { return !_override.empty(); }

private:

    friend class RequestQueue;
    void response(bool, const std::pair<const Ice::Byte*, const Ice::Byte*>&);
    void exception(const Ice::Exception&);
    void queued();

    const Ice::ObjectPrxPtr _proxy;
    const Ice::ByteSeq _inParams;
    const Ice::Current _current;
    const bool _forwardContext;
    const Ice::Context _sslContext;
    const std::string _override;
    const Ice::AMD_Object_ice_invokePtr _amdCB;
};

class RequestQueue : public IceUtil::Mutex, public IceUtil::Shared
{
public:

    RequestQueue(const RequestQueueThreadPtr&, const InstancePtr&, const Ice::ConnectionPtr&);

    bool addRequest(const RequestPtr&);
    void flushRequests();

    void destroy();

    void updateObserver(const Glacier2::Instrumentation::SessionObserverPtr&);

private:

    void destroyInternal();

    void flush();

    void response(bool, const std::pair<const Ice::Byte*, const Ice::Byte*>&, const RequestPtr&);
    void exception(const Ice::Exception&, const RequestPtr&);
    void sent(bool, const RequestPtr&);

    const RequestQueueThreadPtr _requestQueueThread;
    const InstancePtr _instance;
    const Ice::ConnectionPtr _connection;
    const Ice::Callback_Object_ice_invokePtr _callback;
    const Ice::Callback_Connection_flushBatchRequestsPtr _flushCallback;

    std::deque<RequestPtr> _requests;
    std::set<Ice::ObjectPrx> _batchProxies;
    bool _pendingSend;
    RequestPtr _pendingSendRequest;
    bool _destroyed;
    Glacier2::Instrumentation::SessionObserverPtr _observer;
};
typedef IceUtil::Handle<RequestQueue> RequestQueuePtr;

class RequestQueueThread : public IceUtil::Thread, public IceUtil::Monitor<IceUtil::Mutex>
{
public:

    RequestQueueThread(const IceUtil::Time&);
    virtual ~RequestQueueThread();

    void flushRequestQueue(const RequestQueuePtr&);
    void destroy();

    virtual void run();

private:

    const IceUtil::Time _sleepTime;
    bool _destroy;
    bool _sleep;
    IceUtil::Time _sleepDuration;
    std::vector<RequestQueuePtr> _queues;
};

}

#endif
