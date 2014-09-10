# **********************************************************************
#
# Copyright (c) 2003-2014 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

top_srcdir	= ..\..

!include $(top_srcdir)\config\Make.rules.mak

SUBDIRS		= async \
		  bidir \
		  callback \
		  context \
		  converter \
		  hello \
		  interleaved \
		  invoke \
		  latency \
		  minimal \
		  multicast \
		  nested \
		  nrvo \
		  optional \
		  plugin \
		  properties \
		  session \
		  throughput \
		  value


!if "$(HAS_MFC)" == "yes"
SUBDIRS		= $(SUBDIRS) \
		  MFC
!endif

$(EVERYTHING)::
	@for %i in ( $(SUBDIRS) ) do \
	    @echo "making $@ in %i" && \
	    cmd /c "cd %i && $(MAKE) -nologo -f Makefile.mak $@" || exit 1
