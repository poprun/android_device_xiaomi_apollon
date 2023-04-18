#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/apollon

# Inherit from sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

BUILD_BROKEN_DUP_RULES := true

# Display
TARGET_SCREEN_DENSITY := 440

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_xiaomi_apollon
TARGET_RECOVERY_DEVICE_MODULES := init_xiaomi_apollon

# Kernel
TARGET_KERNEL_CONFIG := vendor/apollo_defconfig

# OTA assert
TARGET_OTA_ASSERT_DEVICE := apollon,apollo,apollopro

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Inherit from the proprietary version
include vendor/xiaomi/apollon/BoardConfigVendor.mk

# twrp特有
ALLOW_MISSING_DEPENDENCIES = true # 由于同步的只有 TWRP 源码，编译时需要打开这个
VENDOR_SECURITY_PATCH := 2025-07-05 # 需要加入补丁更新日期来回避防回滚机制
TW_THEME := portrait_hdpi # TWRP 要使用的主题
TW_MAX_BRIGHTNESS := 255 # 设置最高亮度
TW_DEFAULT_BRIGHTNESS := 155 # 设置最低亮度
TW_EXTRA_LANGUAGES := ture # 设置是否添加亚洲语言
TW_IGNORE_MISC_WIPE_DATA := true # 是否在 wipe data 时忽略 misc
TW_SCREEN_BLANK_ON_BOOT := true # 这个我也不知道什么作用
TW_NO_EXFAT_FUSE := true # 这个我也不知道什么作用
TW_INCLUDE_CRYPTO := true #是否添加加密支持
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw # 解密所需依赖的源码路径
RECOVERY_SDCARD_ON_DATA := true # 设置内部存储的数据是否在 data 分区
BOARD_HAS_NO_REAL_SDCARD := true # 这个我也不知道什么作用
BOARD_PROVIDES_GPTUTILS := true # 这个我也不知道什么作用
TW_USE_TOOLBOX := true # 是否使用 ToolBox
TWRP_INCLUDE_LOGCAT := true # 是否启用 logcat
TARGET_USES_LOGD := true # 是否启用 logcat
