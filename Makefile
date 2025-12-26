ARCHS = arm64
# 强制指定最新的编译器和 14.5 SDK 
TARGET := iphone:clang:latest:14.5
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WeChatHook
WeChatHook_FILES = Tweak.x
WeChatHook_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
