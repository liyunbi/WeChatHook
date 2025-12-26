# 锁定为 arm64 架构，支持所有现代 iPhone
ARCHS = arm64
# 兼容模式：虽然你手机版本高，但用 14.5 编译出的插件兼容性最强
TARGET := iphone:clang:latest:14.5
# 采用 rootless 模式（现在主流多开都用这个）
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WeChatHook
WeChatHook_FILES = Tweak.x
WeChatHook_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
