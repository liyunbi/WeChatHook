TARGET := iphone:clang:latest:14.0
ARCHS = arm64
MODULES = jailed
FINALPACKAGE = 1
CODESIGN_IPA = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WeChatHook

WeChatHook_FILES = Tweak.x
WeChatHook_CFLAGS = -fobjc-arc
WeChatHook_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
