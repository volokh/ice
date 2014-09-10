# **********************************************************************
#
# Copyright (c) 2003-2014 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

#
# Define DEBUG as yes if you want to build with debug information and
# assertions enabled.
#

#DEBUG			= yes

#
# Define OPTIMIZE as yes if you want to build with optimized.
#

#OPTIMIZE		= yes

#
# Set the key file used to sign assemblies.
#

!if "$(KEYFILE)" == ""
KEYFILE                 = $(top_srcdir)\..\config\IceDevKey.snk
!endif

# ----------------------------------------------------------------------
# Don't change anything below this line!
# ----------------------------------------------------------------------

#
# Common definitions
#
ice_language = vb
slice_translator = slice2cs.exe

!if exist ($(top_srcdir)\..\config\Make.common.rules.mak)
!include $(top_srcdir)\..\config\Make.common.rules.mak
!else
!include $(top_srcdir)\config\Make.common.rules.mak
!endif

!if "$(ice_src_dist)" != ""
csbindir		= $(ice_dir)\cs\Assemblies
!else
csbindir		= $(ice_dir)\bin
!endif

#
# If a slice directory is contained along with this distribution -- use it. 
# Otherwise use paths relative to $(ICE_HOME).
#

VBC			= vbc -nologo /r:system.dll

VBCFLAGS = -warnaserror
!if "$(DEBUG)" == "yes"
VBCFLAGS 		= $(VBCFLAGS) -debug+ -define:DEBUG=yes
!endif

MCS			= csc -nologo

MCSFLAGS = -warnaserror -d:MAKEFILE_BUILD
!if "$(DEBUG)" == "yes"
!if "$(OPTIMIZE)" == "yes"
MCSFLAGS               = $(MCSFLAGS) -debug:pdbonly
!else
MCSFLAGS               = $(MCSFLAGS) -debug
!endif
MCSFLAGS               = $(MCSFLAGS) -define:DEBUG
!endif

!if "$(OPTIMIZE)" == "yes"
MCSFLAGS 		= $(MCSFLAGS) -optimize+
!endif

!if "$(ice_src_dist)" != ""
!if "$(ice_cpp_dir)" == "$(ice_dir)\cpp"
SLICE2CS		= $(ice_cpp_dir)\bin\slice2cs.exe
SLICEPARSERLIB		= $(ice_cpp_dir)\lib\slice.lib
!if !exist ("$(SLICEPARSERLIB)")
SLICEPARSERLIB		= $(ice_cpp_dir)\lib\sliced.lib
!endif
!else
SLICE2CS		= $(ice_cpp_dir)\bin$(x64suffix)\slice2cs.exe
SLICEPARSERLIB		= $(ice_cpp_dir)\lib$(x64suffix)\slice.lib
!if !exist ("$(SLICEPARSERLIB)")
SLICEPARSERLIB		= $(ice_cpp_dir)\lib$(x64suffix)\sliced.lib
!endif
!endif
!else
SLICE2CS		= $(ice_dir)\bin$(x64suffix)\slice2cs.exe
SLICEPARSERLIB		= $(ice_dir)\lib$(x64suffix)\slice.lib
!if !exist ("$(SLICEPARSERLIB)")
SLICEPARSERLIB		= $(ice_dir)\lib$(x64suffix)\sliced.lib
!endif
!endif

EVERYTHING		= all clean

.SUFFIXES:
.SUFFIXES:		.cs .vb .ice

!if "$(GEN_SRCS)" != ""
GEN_DEPENDS = $(GEN_SRCS:.cs=.ice.d.mak)
GEN_DEPENDS = $(GEN_DEPENDS:generated\=)
DEPENDS = $(DEPENDS) $(GEN_DEPENDS)
!endif

!if "$(CGEN_SRCS)" != ""
CGEN_DEPENDS = $(CGEN_SRCS:.cs=.ice.d.mak)
CGEN_DEPENDS = $(CGEN_DEPENDS:generated\=)
DEPENDS = $(DEPENDS) $(CGEN_DEPENDS)
!endif

!if "$(SGEN_SRCS)" != ""
SGEN_DEPENDS = $(SGEN_SRCS:.cs=.ice.d.mak)
SGEN_DEPENDS = $(SGEN_DEPENDS:generated\=)
DEPENDS = $(DEPENDS) $(SGEN_DEPENDS)
!endif

!if "$(GEN_AMD_SRCS)" != ""
GEN_AMD_DEPENDS = $(GEN_AMD_SRCS:.cs=.ice.d.mak)
GEN_AMD_DEPENDS = $(GEN_AMD_DEPENDS:generated\=)
DEPENDS = $(DEPENDS) $(GEN_AMD_DEPENDS)
!endif

!if "$(SAMD_GEN_SRCS)" != ""
SAMD_GEN_DEPENDS = $(SAMD_GEN_SRCS:.cs=.ice.d.mak)
SAMD_GEN_DEPENDS = $(SAMD_GEN_DEPENDS:generated\=)
DEPENDS = $(DEPENDS) $(SAMD_GEN_DEPENDS)
!endif

!if "$(DEPENDS)" != ""
all:: .depend\ice.depend.mak

.depend\ice.depend.mak: Makefile.mak
	@echo Creating Slice dependencies list
	@if not exist ".depend" mkdir .depend
	cscript /NoLogo $(top_srcdir)\..\config\makedepend-list.vbs $(DEPENDS) > .depend\ice.depend.mak
!endif

!if exist(.depend\ice.depend.mak)
!include .depend\ice.depend.mak
!endif

{$(SDIR)\}.ice{$(GDIR)}.cs:
	"$(SLICE2CS)" --output-dir $(GDIR) $(SLICE2CSFLAGS) $<

!if "$(SLICE_ASSEMBLY)" != ""
$(SLICE_ASSEMBLY): $(GEN_SRCS)
        $(MCS) $(MCSFLAGS) -target:library -out:$@ -r:"$(csbindir)\Ice.dll" $(GEN_SRCS)
!endif

all:: $(TARGETS) $(SLICE_ASSEMBLY)

clean::
	del /q $(TARGETS) $(SLICE_ASSEMBLY) *.pdb


!if "$(GEN_SRCS)" != ""
clean::
	del /q $(GEN_SRCS)
!endif
!if "$(CGEN_SRCS)" != ""
clean::
	del /q $(CGEN_SRCS)
!endif
!if "$(SGEN_SRCS)" != ""
clean::
	del /q $(SGEN_SRCS)
!endif
!if "$(GEN_AMD_SRCS)" != ""
clean::
	del /q $(GEN_AMD_SRCS)
!endif
!if "$(SAMD_GEN_SRCS)" != ""
clean::
	del /q $(SAMD_GEN_SRCS)
!endif
