#pragma once

#include <functional>

#include <Ice/BuiltinSequences.h>

#ifdef ICE_CPP11_MAPPING
namespace Ice {
template<typename Fn>
struct CallbackObject
{
    ::std::function<Fn> response;
    ::std::function<void(::std::exception_ptr)> ex = nullptr;
    ::std::function<void(bool)> sent = nullptr;
};

template<typename Fn>
using CallbackObjectPtr = std::shared_ptr<CallbackObject<Fn>>;

using Callback_Object_ice_invokePtr = CallbackObjectPtr<void(bool, ::std::pair<const ::Ice::Byte*, const ::Ice::Byte*>)>;
using AMD_Object_ice_invokePtr = Callback_Object_ice_invokePtr;
using Callback_Connection_flushBatchRequestsPtr = Callback_Object_ice_invokePtr;
using AMD_Router_refreshSessionPtr = Callback_Object_ice_invokePtr;
using AsyncResultPtr = ::std::function<void()>;
//using LocalObjectPtr = ::std::shared_ptr<void>;
}

namespace Glacier2
{
using Callback_Session_destroyPtr = Ice::CallbackObjectPtr<void()>;
}
#endif // ICE_CPP11_MAPPING
