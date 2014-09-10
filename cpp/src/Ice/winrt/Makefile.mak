# **********************************************************************
#
# Copyright (c) 2003-2014 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

top_srcdir		= ..\..\..
LIBNAME		= $(SDK_LIBRARY_PATH)\ice.lib
TARGETS		= $(LIBNAME)
SOURCE_DIR	= ..

SLICE_SRCS 	= ..\BuiltinSequences.cpp \
		  ..\CommunicatorF.cpp \
		  ..\Communicator.cpp \
		  ..\ConnectionF.cpp \
		  ..\Connection.cpp \
		  ..\Current.cpp \
		  ..\Endpoint.cpp \
		  ..\EndpointF.cpp \
		  ..\EndpointTypes.cpp \
		  ..\FacetMap.cpp \
		  ..\Identity.cpp \
		  ..\ImplicitContextF.cpp \
		  ..\ImplicitContext.cpp \
		  ..\LocalException.cpp \
		  ..\LocatorF.cpp \
		  ..\Locator.cpp \
		  ..\LoggerF.cpp \
		  ..\Logger.cpp \
		  ..\ObjectAdapterF.cpp \
		  ..\ObjectAdapter.cpp \
		  ..\ObjectFactoryF.cpp \
		  ..\ObjectFactory.cpp \
		  ..\PluginF.cpp \
		  ..\Plugin.cpp \
		  ..\ProcessF.cpp \
		  ..\Process.cpp \
		  ..\PropertiesF.cpp \
		  ..\Properties.cpp \
		  ..\PropertiesAdmin.cpp \
		  ..\RemoteLogger.cpp \
		  ..\Router.cpp \
		  ..\RouterF.cpp \
		  ..\ServantLocatorF.cpp \
		  ..\ServantLocator.cpp \
		  ..\SliceChecksumDict.cpp \
		  ..\Version.cpp \
		  ..\Metrics.cpp \
		  ..\Instrumentation.cpp \
		  EndpointInfo.cpp \
		  ConnectionInfo.cpp

OBJS		= $(ARCH)\$(CONFIG)\Acceptor.obj \
		  $(ARCH)\$(CONFIG)\ACM.obj \
		  $(ARCH)\$(CONFIG)\Base64.obj \
		  $(ARCH)\$(CONFIG)\BasicStream.obj \
		  $(ARCH)\$(CONFIG)\Buffer.obj \
		  $(ARCH)\$(CONFIG)\BuiltinSequences.obj \
		  $(ARCH)\$(CONFIG)\CollocatedRequestHandler.obj \
		  $(ARCH)\$(CONFIG)\Communicator.obj \
		  $(ARCH)\$(CONFIG)\CommunicatorI.obj \
		  $(ARCH)\$(CONFIG)\Connection.obj \
		  $(ARCH)\$(CONFIG)\ConnectionFactory.obj \
		  $(ARCH)\$(CONFIG)\ConnectionI.obj \
		  $(ARCH)\$(CONFIG)\ConnectionRequestHandler.obj \
		  $(ARCH)\$(CONFIG)\Connector.obj \
		  $(ARCH)\$(CONFIG)\ConnectRequestHandler.obj \
		  $(ARCH)\$(CONFIG)\Current.obj \
		  $(ARCH)\$(CONFIG)\DefaultsAndOverrides.obj \
		  $(ARCH)\$(CONFIG)\DispatchInterceptor.obj \
		  $(ARCH)\$(CONFIG)\DynamicLibrary.obj \
		  $(ARCH)\$(CONFIG)\Endpoint.obj \
		  $(ARCH)\$(CONFIG)\EndpointFactory.obj \
		  $(ARCH)\$(CONFIG)\EndpointFactoryManager.obj \
		  $(ARCH)\$(CONFIG)\EndpointI.obj \
		  $(ARCH)\$(CONFIG)\EndpointTypes.obj \
		  $(ARCH)\$(CONFIG)\EventHandler.obj \
		  $(ARCH)\$(CONFIG)\Exception.obj \
		  $(ARCH)\$(CONFIG)\FacetMap.obj \
		  $(ARCH)\$(CONFIG)\FactoryTable.obj \
		  $(ARCH)\$(CONFIG)\FactoryTableInit.obj \
		  $(ARCH)\$(CONFIG)\GCObject.obj \
		  $(ARCH)\$(CONFIG)\HttpParser.obj \
		  $(ARCH)\$(CONFIG)\Identity.obj \
		  $(ARCH)\$(CONFIG)\ImplicitContext.obj \
		  $(ARCH)\$(CONFIG)\ImplicitContextI.obj \
		  $(ARCH)\$(CONFIG)\Incoming.obj \
		  $(ARCH)\$(CONFIG)\IncomingAsync.obj \
		  $(ARCH)\$(CONFIG)\Initialize.obj \
		  $(ARCH)\$(CONFIG)\Instance.obj \
		  $(ARCH)\$(CONFIG)\Instrumentation.obj \
		  $(ARCH)\$(CONFIG)\InstrumentationF.obj \
		  $(ARCH)\$(CONFIG)\InstrumentationI.obj \
		  $(ARCH)\$(CONFIG)\IPEndpointI.obj \
		  $(ARCH)\$(CONFIG)\LocalException.obj \
		  $(ARCH)\$(CONFIG)\LocalObject.obj \
		  $(ARCH)\$(CONFIG)\Locator.obj \
		  $(ARCH)\$(CONFIG)\LocatorInfo.obj \
		  $(ARCH)\$(CONFIG)\Logger.obj \
		  $(ARCH)\$(CONFIG)\LoggerAdminI.obj \
		  $(ARCH)\$(CONFIG)\LoggerI.obj \
		  $(ARCH)\$(CONFIG)\LoggerUtil.obj \
		  $(ARCH)\$(CONFIG)\Metrics.obj \
		  $(ARCH)\$(CONFIG)\MetricsAdminI.obj \
		  $(ARCH)\$(CONFIG)\MetricsObserverI.obj \
		  $(ARCH)\$(CONFIG)\Network.obj \
		  $(ARCH)\$(CONFIG)\NetworkProxy.obj \
		  $(ARCH)\$(CONFIG)\Object.obj \
		  $(ARCH)\$(CONFIG)\ObjectAdapter.obj \
		  $(ARCH)\$(CONFIG)\ObjectAdapterFactory.obj \
		  $(ARCH)\$(CONFIG)\ObjectAdapterI.obj \
		  $(ARCH)\$(CONFIG)\ObjectFactory.obj \
		  $(ARCH)\$(CONFIG)\ObjectFactoryManager.obj \
		  $(ARCH)\$(CONFIG)\ObserverHelper.obj \
		  $(ARCH)\$(CONFIG)\OpaqueEndpointI.obj \
		  $(ARCH)\$(CONFIG)\Outgoing.obj \
		  $(ARCH)\$(CONFIG)\OutgoingAsync.obj \
		  $(ARCH)\$(CONFIG)\Plugin.obj \
		  $(ARCH)\$(CONFIG)\PluginManagerI.obj \
		  $(ARCH)\$(CONFIG)\Process.obj \
		  $(ARCH)\$(CONFIG)\Properties.obj \
		  $(ARCH)\$(CONFIG)\PropertiesAdmin.obj \
		  $(ARCH)\$(CONFIG)\PropertiesAdminI.obj \
		  $(ARCH)\$(CONFIG)\PropertiesI.obj \
		  $(ARCH)\$(CONFIG)\PropertyNames.obj \
		  $(ARCH)\$(CONFIG)\Protocol.obj \
		  $(ARCH)\$(CONFIG)\ProtocolInstance.obj \
		  $(ARCH)\$(CONFIG)\ProtocolPluginFacade.obj \
		  $(ARCH)\$(CONFIG)\Proxy.obj \
		  $(ARCH)\$(CONFIG)\ProxyFactory.obj \
		  $(ARCH)\$(CONFIG)\Reference.obj \
		  $(ARCH)\$(CONFIG)\ReferenceFactory.obj \
		  $(ARCH)\$(CONFIG)\RemoteLogger.obj \
		  $(ARCH)\$(CONFIG)\RequestHandler.obj \
		  $(ARCH)\$(CONFIG)\ResponseHandler.obj \
		  $(ARCH)\$(CONFIG)\RetryQueue.obj \
		  $(ARCH)\$(CONFIG)\Router.obj \
		  $(ARCH)\$(CONFIG)\RouterInfo.obj \
		  $(ARCH)\$(CONFIG)\Selector.obj \
		  $(ARCH)\$(CONFIG)\ServantLocator.obj \
		  $(ARCH)\$(CONFIG)\ServantManager.obj \
		  $(ARCH)\$(CONFIG)\SliceChecksumDict.obj \
		  $(ARCH)\$(CONFIG)\SliceChecksums.obj \
		  $(ARCH)\$(CONFIG)\SlicedData.obj \
		  $(ARCH)\$(CONFIG)\Stream.obj \
		  $(ARCH)\$(CONFIG)\StreamI.obj \
		  $(ARCH)\$(CONFIG)\ThreadPool.obj \
		  $(ARCH)\$(CONFIG)\TraceLevels.obj \
		  $(ARCH)\$(CONFIG)\TraceUtil.obj \
		  $(ARCH)\$(CONFIG)\Transceiver.obj \
		  $(ARCH)\$(CONFIG)\UdpConnector.obj \
		  $(ARCH)\$(CONFIG)\UdpEndpointI.obj \
		  $(ARCH)\$(CONFIG)\UdpTransceiver.obj \
		  $(ARCH)\$(CONFIG)\Version.obj \
		  $(ARCH)\$(CONFIG)\WSAcceptor.obj \
		  $(ARCH)\$(CONFIG)\WSConnector.obj \
		  $(ARCH)\$(CONFIG)\WSEndpoint.obj \
		  $(ARCH)\$(CONFIG)\WSTransceiver.obj \

LOCAL_OBJS	= \
		  $(ARCH)\$(CONFIG)\ConnectionInfo.obj \
		  $(ARCH)\$(CONFIG)\EndpointInfo.obj \
		  $(ARCH)\$(CONFIG)\StreamAcceptor.obj \
		  $(ARCH)\$(CONFIG)\StreamConnector.obj \
		  $(ARCH)\$(CONFIG)\StreamEndpointI.obj \
		  $(ARCH)\$(CONFIG)\StreamTransceiver.obj \

SLICE_CORE_SRCS	= \
		  $(slicedir)\Ice\BuiltinSequences.ice \
		  $(slicedir)\Ice\Communicator.ice \
		  $(slicedir)\Ice\CommunicatorF.ice \
		  $(slicedir)\Ice\Connection.ice \
		  $(slicedir)\Ice\ConnectionF.ice \
		  $(slicedir)\Ice\Current.ice \
		  $(slicedir)\Ice\Endpoint.ice \
		  $(slicedir)\Ice\EndpointF.ice \
		  $(slicedir)\Ice\EndpointTypes.ice \
		  $(slicedir)\Ice\FacetMap.ice \
		  $(slicedir)\Ice\Identity.ice \
		  $(slicedir)\Ice\ImplicitContext.ice \
		  $(slicedir)\Ice\ImplicitContextF.ice \
		  $(slicedir)\Ice\Instrumentation.ice \
		  $(slicedir)\Ice\LocalException.ice \
		  $(slicedir)\Ice\Locator.ice \
		  $(slicedir)\Ice\LocatorF.ice \
		  $(slicedir)\Ice\Logger.ice \
		  $(slicedir)\Ice\LoggerF.ice \
		  $(slicedir)\Ice\Metrics.ice \
		  $(slicedir)\Ice\ObjectAdapter.ice \
		  $(slicedir)\Ice\ObjectAdapterF.ice \
		  $(slicedir)\Ice\ObjectFactory.ice \
		  $(slicedir)\Ice\ObjectFactoryF.ice \
		  $(slicedir)\Ice\Plugin.ice \
		  $(slicedir)\Ice\PluginF.ice \
		  $(slicedir)\Ice\Process.ice \
		  $(slicedir)\Ice\ProcessF.ice \
		  $(slicedir)\Ice\Properties.ice \
		  $(slicedir)\Ice\PropertiesAdmin.ice \
		  $(slicedir)\Ice\PropertiesF.ice \
		  $(slicedir)\Ice\RemoteLogger.ice \
		  $(slicedir)\Ice\Router.ice \
		  $(slicedir)\Ice\RouterF.ice \
		  $(slicedir)\Ice\ServantLocator.ice \
		  $(slicedir)\Ice\ServantLocatorF.ice \
		  $(slicedir)\Ice\SliceChecksumDict.ice \
		  $(slicedir)\Ice\Version.ice \

SLICE_SSL_SRCS	= \
		  $(slicedir)\IceSSL\ConnectionInfo.ice \
		  $(slicedir)\IceSSL\EndpointInfo.ice \

SRCS		= $(OBJS:.obj=.cpp)
SRCS		= $(SRCS:x86\=)
SRCS		= $(SRCS:x64\=)
SRCS		= $(SRCS:arm\=)
SRCS		= $(SRCS:Retail\=..\)
SRCS		= $(SRCS:Debug\=..\)

LOCAL_SRCS	= $(LOCAL_OBJS:.obj=.cpp)
LOCAL_SRCS	= $(LOCAL_SRCS:x86\=)
LOCAL_SRCS	= $(LOCAL_SRCS:x64\=)
LOCAL_SRCS	= $(LOCAL_SRCS:arm\=)
LOCAL_SRCS	= $(LOCAL_SRCS:Retail\=.\)
LOCAL_SRCS	= $(LOCAL_SRCS:Debug\=.\)

SRCS		= $(SRCS) \
		  $(LOCAL_SRCS) \
		  ..\CommunicatorF.cpp \
		  ..\ConnectionF.cpp \
		  ..\EndpointF.cpp \
		  ..\ImplicitContextF.cpp \
		  ..\LocatorF.cpp \
		  ..\LoggerF.cpp \
		  ..\ObjectAdapterF.cpp \
		  ..\ObjectFactoryF.cpp \
		  ..\PluginF.cpp \
		  ..\ProcessF.cpp \
		  ..\PropertiesF.cpp \
		  ..\RouterF.cpp \
		  ..\ServantLocatorF.cpp

HDIR		= $(headerdir)\Ice
SDIR		= $(slicedir)\Ice

PDBNAME			= $(LIBNAME:.lib=.pdb)
CPPFLAGS		= /Fd$(PDBNAME) -I..\.. $(CPPFLAGS) -DICE_API_EXPORTS -DWIN32_LEAN_AND_MEAN
CORE_SLICE2CPPFLAGS	= --ice --include-dir Ice --dll-export ICE_API $(SLICE2CPPFLAGS)
SSL_SLICE2CPPFLAGS 	= --ice --include-dir IceSSL --dll-export ICE_SSL_API $(SLICE2CPPFLAGS)

!include $(top_srcdir)\config\Make.rules.mak

$(LIBNAME): $(LOCAL_OBJS) $(OBJS) sdks
	$(AR) $(ARFLAGS) $(OBJS) $(LOCAL_OBJS) /out:$(LIBNAME)

Service.obj: $(SOURCE_DIR)\EventLoggerMsg.h

Ice.res: $(SOURCE_DIR)\EventLoggerMsg.rc

.cpp{$(ARCH)\$(CONFIG)\}.obj::
	@if not exist "$(ARCH)\$(CONFIG)" mkdir $(ARCH)\$(CONFIG)
	$(CXX) /c /Fo$(ARCH)\$(CONFIG)\ $(CPPFLAGS) $(CXXFLAGS) /showIncludes $< | \
		cscript /NoLogo $(top_srcdir)\..\config\makedepend.vbs $< "$$(ARCH)\$$(CONFIG)\"

{$(slicedir)\Ice}.ice.cpp:
	@echo c
	del /q $(headerdir)\Ice\$(*F).h $(*F).cpp
	"$(SLICE2CPP)" $(CORE_SLICE2CPPFLAGS) $<
	"$(SLICE2CPP)" $(CORE_SLICE2CPPFLAGS) --depend $< | \
		cscript /NoLogo $(top_srcdir)\..\config\makedepend-slice.vbs "$(headerdir)\Ice\$(*F).h ..\$(*F).cpp: \" > .depend\$(*F).ice.d.mak
	move $(*F).h $(headerdir)\Ice
	move $(*F).cpp ..

{$(slicedir)\IceSSL}.ice.cpp:
	@echo d
	del /q $(headerdir)\IceSSL\$(*F).h $(*F).cpp
	"$(SLICE2CPP)" $(SSL_SLICE2CPPFLAGS) $<
	"$(SLICE2CPP)" $(SSL_SLICE2CPPFLAGS) --depend $< | \
		cscript /NoLogo $(top_srcdir)\..\config\makedepend-slice.vbs "$(headerdir)\Ice\$(*F).h $(*F).cpp: \" > .depend\$(*F).ice.d.mak
	move $(*F).h $(headerdir)\IceSSL

# These files are not automatically generated because VC2008 Express doesn't have mc.exe
#EventLoggerMsg.h EventLoggerMsg.rc: EventLoggerMsg.mc
#	mc EventLoggerMsg.mc

clean::
	-del /q $(SOURCE_DIR)\BuiltinSequences.cpp $(HDIR)\BuiltinSequences.h
	-del /q $(SOURCE_DIR)\CommunicatorF.cpp $(HDIR)\CommunicatorF.h
	-del /q $(SOURCE_DIR)\Communicator.cpp $(HDIR)\Communicator.h
	-del /q $(SOURCE_DIR)\ConnectionF.cpp $(HDIR)\ConnectionF.h
	-del /q $(SOURCE_DIR)\Connection.cpp $(HDIR)\Connection.h
	-del /q $(SOURCE_DIR)\Current.cpp $(HDIR)\Current.h
	-del /q $(SOURCE_DIR)\Endpoint.cpp $(HDIR)\Endpoint.h
	-del /q $(SOURCE_DIR)\EndpointF.cpp $(HDIR)\EndpointF.h
	-del /q $(SOURCE_DIR)\EndpointTypes.cpp $(HDIR)\EndpointTypes.h
	-del /q $(SOURCE_DIR)\FacetMap.cpp $(HDIR)\FacetMap.h
	-del /q $(SOURCE_DIR)\ImplicitContextF.cpp $(HDIR)\ImplicitContextF.h	
	-del /q $(SOURCE_DIR)\ImplicitContext.cpp $(HDIR)\ImplicitContext.h	
	-del /q $(SOURCE_DIR)\Identity.cpp $(HDIR)\Identity.h
	-del /q $(SOURCE_DIR)\LocalException.cpp $(HDIR)\LocalException.h
	-del /q $(SOURCE_DIR)\LocatorF.cpp $(HDIR)\LocatorF.h
	-del /q $(SOURCE_DIR)\Locator.cpp $(HDIR)\Locator.h
	-del /q $(SOURCE_DIR)\LoggerF.cpp $(HDIR)\LoggerF.h
	-del /q $(SOURCE_DIR)\Logger.cpp $(HDIR)\Logger.h
	-del /q $(SOURCE_DIR)\Metrics.cpp $(HDIR)\Metrics.h
	-del /q $(SOURCE_DIR)\Observer.cpp $(HDIR)\Observer.h
	-del /q $(SOURCE_DIR)\ObserverF.cpp $(HDIR)\ObserverF.h
	-del /q $(SOURCE_DIR)\ObjectAdapterF.cpp $(HDIR)\ObjectAdapterF.h
	-del /q $(SOURCE_DIR)\ObjectAdapter.cpp $(HDIR)\ObjectAdapter.h
	-del /q $(SOURCE_DIR)\ObjectFactoryF.cpp $(HDIR)\ObjectFactoryF.h
	-del /q $(SOURCE_DIR)\ObjectFactory.cpp $(HDIR)\ObjectFactory.h
	-del /q $(SOURCE_DIR)\PluginF.cpp $(HDIR)\PluginF.h
	-del /q $(SOURCE_DIR)\Plugin.cpp $(HDIR)\Plugin.h
	-del /q $(SOURCE_DIR)\ProcessF.cpp $(HDIR)\ProcessF.h
	-del /q $(SOURCE_DIR)\Process.cpp $(HDIR)\Process.h
	-del /q $(SOURCE_DIR)\PropertiesF.cpp $(HDIR)\PropertiesF.h
	-del /q $(SOURCE_DIR)\Properties.cpp $(HDIR)\Properties.h
	-del /q $(SOURCE_DIR)\RemoteLogger.cpp $(HDIR)\RemoteLogger.h
	-del /q $(SOURCE_DIR)\RouterF.cpp $(HDIR)\RouterF.h
	-del /q $(SOURCE_DIR)\Router.cpp $(HDIR)\Router.h
	-del /q $(SOURCE_DIR)\ServantLocatorF.cpp $(HDIR)\ServantLocatorF.h
	-del /q $(SOURCE_DIR)\ServantLocator.cpp $(HDIR)\ServantLocator.h
	-del /q $(SOURCE_DIR)\SliceChecksumDict.cpp $(HDIR)\SliceChecksumDict.h
	-del /q EndpointInfo.cpp $(headerdir)\IceSSL\EndpointInfo.h
	-del /q ConnectionInfo.cpp $(headerdir)\IceSSL\ConnectionInfo.h
	-del /q $(ARCH)\$(CONFIG)\*.obj
	-del /q $(PDBNAME)

install:: all
