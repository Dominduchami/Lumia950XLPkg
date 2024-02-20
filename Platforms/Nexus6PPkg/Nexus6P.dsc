## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = Nexus6P
  PLATFORM_GUID                  = b6325ac2-9f3f-4b1d-b129-ac7b35ddde60
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/Nexus6P-$(ARCH)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Nexus6PPkg/Nexus6P.fdf
  SECURE_BOOT_ENABLE             = 1
  USE_PHYSICAL_TIMER             = 1
  USE_SCREEN_FOR_SERIAL_OUTPUT   = 1
  USE_MEMORY_FOR_SERIAL_OUTPUT   = 0
  SEND_HEARTBEAT_TO_SERIAL       = 0
  MEMORY_3GB                     = 1

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DSILICON_PLATFORM=8994

[PcdsFixedAtBuild.common]
  # Platform-specific
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xC0000000        # 3GB Size

  # SMBIOS
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosSystemModel|"Nexus 6P"
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"H1511"
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"H1511"
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosBoardModel|"Nexus 6P"

  # Simple FrameBuffer
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x03400000
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1440
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2560
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32

  gQcomPkgTokenSpaceGuid.SynapticsXMax|1440
  gQcomPkgTokenSpaceGuid.SynapticsYMax|2560

  # Device Driver Synaptics 3202
  gQcomPkgTokenSpaceGuid.SynapticsCtlrAddress|0x70
  gQcomPkgTokenSpaceGuid.SynapticsCtlrResetPin|96
  gQcomPkgTokenSpaceGuid.SynapticsCtlrIntPin|77
  gQcomPkgTokenSpaceGuid.SynapticsCtlrI2cDevice|2

[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1440
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|2560
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1440
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|2560
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|120
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|160
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|120
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|160

!include QcomPkg/QcomPkg.dsc.inc
!include NexusFamilyPkg/NexusFamily.dsc.inc
!include NexusFamilyPkg/Frontpage.dsc.inc
