#
# Copyright (C) 2011 The Android Open-Source Project
# Copyright (C) 2012 bikedude880
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := false

# Use the non-open-source parts, if they're present
-include vendor/motorola/omap34com/BoardConfigVendor.mk

TARGET_ARCH := arm

# Processor
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := false
TARGET_CPU_VARIANT := cortex-a8
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
ARCH_ARM_HAVE_TLS_REGISTER := false

# Conserve memory in the Dalvik heap
# Details: https://github.com/CyanogenMod/android_dalvik/commit/15726c81059b74bf2352db29a3decfc4ea9c1428
TARGET_ARCH_LOWMEM := true
TARGET_ARCH_HAVE_NEON := true

# Kernel
BOARD_KERNEL_BASE := 0x10000000

# OMAP
OMAP_ENHANCEMENT := true
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP3
endif

# Graphics
BOARD_EGL_CFG := device/motorola/omap34com/prebuilt/etc/egl.cfg
COMMON_GLOBAL_CFLAGS += -DOMAP_COMPAT -DBINDER_COMPAT
DEFAULT_FB_NUM := 0
GL_OES_compressed_ETC1_RGB8_texture := true
BOARD_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
TARGET_USE_OMX_RECOVERY := true
TARGET_USES_ION := false

# Recovery
BOARD_HAS_LOCKED_BOOTLOADER := true
BOARD_ALWAYS_INSECURE := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /data/.recovery_mode; sync;"
TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true

BOARD_MKE2FS := device/motorola/omap34com/releaseutils/mke2fs

# Wifi related defines
USES_TI_MAC80211 := true
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_wl12xx
PRODUCT_WIRELESS_TOOLS := true
BOARD_WLAN_DEVICE := wl12xx_mac80211
BOARD_SOFTAP_DEVICE := wl12xx_mac80211
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "wl12xx_sdio"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_TI := true

# Sensors
ENABLE_SENSORS_COMPAT := true

# Camera
BOARD_OVERLAY_BASED_CAMERA_HAL := true

# OMX
OMX_JPEG := true
HARDWARE_OMX := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
   hardware/ti/omx/system/src/openmax_il/omx_core/inc \
   hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
BUILD_WITH_TI_AUDIO := 1
TARGET_USE_OMAP_COMPAT  := true
BUILD_PV_OMX_ONLY := true
BUILD_WITHOUT_PV := false

ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOVERLAY_SUPPORT_USERPTR_BUF
endif

# MOTOROLA
USE_MOTOROLA_CODE := true
USE_MOTOROLA_USERS := true
COMMON_GLOBAL_CFLAGS += -DUSE_MOTOROLA_CODE -DUSE_MOTOROLA_USERS -DMOTOROLA_UIDS

# Hijack
TARGET_NEEDS_MOTOROLA_HIJACK := true

# OTA Packaging
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_CUSTOM_RELEASETOOL := device/motorola/omap34com/releasetools/squisher
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/motorola/omap34com/releasetools/droid_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/motorola/omap34com/releasetools/droid_img_from_target_files

# Misc.
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_NEEDS_CUTILS_LOG := true
BOARD_USES_SECURE_SERVICES := true
BOARD_USES_KEYBOARD_HACK := true
BOARD_USE_LEGACY_TOUCHSCREEN := true
BOARD_USE_KINETO_COMPATIBILITY := true
BOARD_USE_CID_ROTATE_34 := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
ENABLE_WEBGL := true

# TESTING
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

# customize the malloced address to be 16-byte aligned
BOARD_MALLOC_ALIGNMENT := 16
