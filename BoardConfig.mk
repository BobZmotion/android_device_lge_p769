# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/lge/p769/BoardConfigVendor.mk

# Flags
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4 -DOMAP_ENHANCEMENT_CPCAM -DOMAP_ENHANCEMENT_VTC

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
NEEDS_ARM_ERRATA_754319_754320 := true
BOARD_GLOBAL_CFLAGS += -DNEEDS_ARM_ERRATA_754319_754320

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# Linaro Optimizations
TARGET_USE_O3 := true
TARGET_USE_GRAPHITE := true
TARGET_USE_LINARO_STRING_ROUTINES := true

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := p769
TARGET_BOARD_PLATFORM := omap4
TARGET_PRODUCT := u2_mpcs_us
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_OTA_ASSERT_DEVICE := p769,p760

# Kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/lge/p769/include

# Try to build the kernel
TARGET_KERNEL_CONFIG := 1chaos_defconfig
TARGET_KERNEL_SOURCE := kernel/lge/ms769

# fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1043857600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1965031424
BOARD_FLASH_BLOCK_SIZE := 131072

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/fw_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
BOARD_LEGACY_NL80211_STA_EVENTS := true
WIFI_BAND := 802_11_ABGN

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/lge/p769/bluetooth/vnd_lge_p769.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/p769/bluetooth

# Camera
BOARD_USES_TI_CAMERA_HAL := true
TI_OMAP4_CAMERAHAL_VARIANT := DONOTBUILDIT
USE_CAMERA_STUB := false

# Graphics
BOARD_EGL_CFG := device/lge/p769/prebuilt/egl.cfg
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
USE_OPENGL_RENDERER := true

KERNEL_SGX_MODULES:
	make -C device/lge/p769/sgx-module/eurasia_km/eurasiacon/build/linux2/omap4430_android/ O=$(KERNEL_OUT) KERNELDIR=$(ANDROID_BUILD_TOP)/$(KERNEL_SRC) ARCH="arm" $(ARM_CROSS_COMPILE) KERNEL_CROSS_COMPILE=$(ARM_CROSS_COMPILE) TARGET_PRODUCT="blaze_tablet" BUILD=release TARGET_SGX=540 PLATFORM_VERSION=4.0
	mkdir -p $(TARGET_OUT)/modules/
	mv $(OUT)/target/*sgx540_120.ko $(TARGET_OUT)/modules/

TARGET_KERNEL_MODULES := KERNEL_SGX_MODULES

# Misc
TARGET_USES_GL_VENDOR_EXTENSIONS := false

# OMAP
OMAP_ENHANCEMENT := true
OMAP_ENHANCEMENT_CPCAM := true
HARDWARE_OMX := true

# Radio fixes
BOARD_RIL_CLASS := ../../../device/lge/p769/ril/

# Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/lge/p769/recovery/recovery-gfx.c
BOARD_CHARGER_ENABLE_SUSPEND := true
TARGET_RECOVERY_FSTAB := device/lge/p769/root/fstab.lgep769board
RECOVERY_FSTAB_VERSION := 2

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/lge/p769/prebuilt/vibrator.c

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun0/file"

# Charging
COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"chg"' -DBOARD_CHARGING_CMDLINE_VALUE='"68"'

# adb root
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1

# Security Enhanced Linux
BOARD_SEPOLICY_DIRS := \
    device/lge/p769/selinux

BOARD_SEPOLICY_UNION := \
    file_contexts \
    pvrsrvinit.te \
    device.te \
    domain.te
