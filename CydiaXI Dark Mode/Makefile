THEOS_DEVICE_IP = xxx.xxx.xxx.xxx
ARCHS = arm64
include /home/EvenDev/theos/makefiles/common.mk

TWEAK_NAME = CydiaXIdark
CydiaXIdark_FILES = Tweak.xm
CydiaXIdark_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Cydia"
