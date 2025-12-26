# 目标锁定为 14.5，这是最稳的防封插件编译版本
TARGET := iphone:clang:latest:14.5
ARCHS = arm64
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WeChatHook

WeChatHook_FILES = Tweak.x
WeChatHook_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
