#
# Makefile for ghost
#

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI8_ghost.zip

# the location for local-ota to save target-file
local-previous-target-dir := 

# All apps from original ZIP, but has smali files chanded
local-modified-apps :=

local-modified-jars := org.cyanogenmod.platform

# All apks from MIUI
local-miui-removed-apps := BugReport GameCenter FM Mipay XiaomiVip MiGameCenterSDKService MiLivetalk MiuiVoip SogouInput SystemAdSolution VoiceAssist XMPass YellowPage Email

local-miui-modified-apps := InCallUI TeleService SecurityCenter

# Config density for co-developers to use the aaps with HDPI or XHDPI resource,
# Default configrations are HDPI for ics branch and XHDPI for jellybean branch
local-density := XHDPI

PORT_PRODUCT := ghost_global

# All apps need to be removed from original ZIP file
local-remove-apps   := 

include phoneapps.mk

# The certificate for release version
local-certificate-dir := security

local-target-bit := 32

# To include the local targets before and after zip the final ZIP file, 
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
local-pre-zip := local-pre-zip-misc
local-after-zip:= local-put-to-phone

# The local targets after the zip file is generated, could include 'zip2sd' to 
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

# To define any local-target
#updater := $(ZIP_DIR)/META-INF/com/google/android/updater-script
#pre_install_data_packages := $(TMP_DIR)/pre_install_apk_pkgname.txt
local-pre-zip-misc:
	$(TOOLS_DIR)/post_process_props.py out/ZIP/system/build.prop other/build.prop
	@echo copying files!
	$(hide) cp -rf other/system/ $(ZIP_DIR)/
	echo "ui_print("Installing GApps");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "run_program("/sbin/busybox", "umount", "/system");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "ui_print("Mounting system");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "run_program("/sbin/busybox", "mount", "/system");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "ui_print("Removing file conflicts and cleaning up");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "delete_recursive("/system/app/BrowserProviderProxy","/system/app/PartnerBookmarksProvider","/system/app/Provision","/system/app/QuickSearchBox","/system/app/Vending");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "delete("/system/app/BrowserProviderProxy.apk","/system/app/PartnerBookmarksProvider.apk","/system/app/Provision.apk","/system/app/QuickSearchBox.apk","/system/app/Vending.apk");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "delete_recursive("/system/priv-app/BrowserProviderProxy","/system/priv-app/PartnerBookmarksProvider","/system/priv-app/Provision","/system/priv-app/QuickSearchBox","/system/priv-app/Vending");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "delete("/system/priv-app/BrowserProviderProxy.apk","/system/priv-app/PartnerBookmarksProvider.apk","/system/priv-app/Provision.apk","/system/priv-app/QuickSearchBox.apk","/system/priv-app/Vending.apk");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "ui_print("Copying files");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "package_extract_dir("system", "/system");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "ui_print("Cleaning up and setting metadata");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_metadata_recursive("/system/addon.d", "uid", 0, "gid", 0, "dmode", 0755, "fmode", 0755, "capabilities", 0x0, "selabel", "u:object_r:system_file:s0");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_metadata_recursive("/system/app", "uid", 0, "gid", 0, "dmode", 0755, "fmode", 0644, "capabilities", 0x0, "selabel", "u:object_r:system_file:s0");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_metadata_recursive("/system/etc/permissions", "uid", 0, "gid", 0, "dmode", 0755, "fmode", 0755, "capabilities", 0x0, "selabel", "u:object_r:system_file:s0");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_metadata_recursive("/system/etc/preferred-apps", "uid", 0, "gid", 0, "dmode", 0755, "fmode", 0755, "capabilities", 0x0, "selabel", "u:object_r:system_file:s0");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_metadata_recursive("/system/framework", "uid", 0, "gid", 0, "dmode", 0755, "fmode", 0644, "capabilities", 0x0, "selabel", "u:object_r:system_file:s0");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_metadata_recursive("/system/lib", "uid", 0, "gid", 0, "dmode", 0755, "fmode", 0644, "capabilities", 0x0, "selabel", "u:object_r:system_file:s0");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_metadata_recursive("/system/priv-app", "uid", 0, "gid", 0, "dmode", 0755, "fmode", 0644, "capabilities", 0x0, "selabel", "u:object_r:system_file:s0");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_metadata_recursive("/system/usr/srec/en-US", "uid", 0, "gid", 0, "dmode", 0755, "fmode", 0644, "capabilities", 0x0, "selabel", "u:object_r:system_file:s0");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "ui_print("Unmounting system");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "run_program("/sbin/busybox", "umount", "/system");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "ui_print("GApps Installation complete");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	@echo goodbye! miui prebuilt binaries!
	$(hide) rm -rf $(ZIP_DIR)/system/bin/app_process32_vendor
	$(hide) cp -rf stockrom/system/bin/app_process32 $(ZIP_DIR)/system/bin/app_process32
	@echo remove unnecessary files!
	$(hide) rm -rf $(ZIP_DIR)/system/bin/app_process64_vendor
	$(hide) rm -rf $(ZIP_DIR)/system/etc/CHANGELOG-CM.txt
	$(hide) rm -rf $(ZIP_DIR)/system/recovery-from-boot.bak
	$(hide) rm -rf $(ZIP_DIR)/system/media/audio/*
	@echo use only miui sounds!
	$(hide) cp -rf $(PORT_ROOT)/miui/system/media/$(local-density)/audio/* $(ZIP_DIR)/system/media/audio
	$(hide) rm -rf $(ZIP_DIR)/system/media/audio/create_symlink_for_audio-timestamp
