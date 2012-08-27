LOCAL_PATH := $(my-dir)
img-sgx.untarred_intermediates := $(call intermediates-dir-for, FAKE, img-sgx.untarred)
img-sgx.untarred_timestamp := $(img-sgx.untarred_intermediates)/stamp
img-sgx.untarred_bin := $(img-sgx.untarred_intermediates)/sgx
img-sgx.tar := $(LOCAL_PATH)/$(TARGET_BOARD_PLATFORM)/sgx.tgz

$(hide $(shell $(LOCAL_PATH)/untar.sh $(LOCAL_PATH)/wl12xx wpan $(LOCAL_PATH)/wl12xx/wpan.tgz))

include $(call all-subdir-makefiles)

$(img-sgx.untarred_timestamp) : $(img-sgx.tar)
	@echo "Unzip $(dir $@) <- $<"
	$(hide) rm -rf $(dir $@) && mkdir -p $(dir $@)
	$(hide) tar -C $(dir $@) -xzf $<
	$(hide) touch $@


# Install Ducati from the TGZ defined in the device-inherited mk file
#############################################
ifneq ($(DUCATI_TGZ),)
ti-ducati.untarred_intermediates := $(call intermediates-dir-for, FAKE, ti-ducati.untarred)
ti-ducati.untarred_timestamp := $(ti-ducati.untarred_intermediates)/stamp

$(ti-ducati.untarred_timestamp) : $(DUCATI_TGZ)
	@echo "Unzip $(dir $@) <- $<)"
	$(hide) rm -rf $(dir $@) && mkdir -p $(dir $@)
	$(hide) tar -C $(dir $@) -zxf $<
	$(hide) touch $@

include $(CLEAR_VARS)
LOCAL_MODULE := ducati-m3.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(ti-ducati.untarred_intermediates)/ducati-m3.bin
$(LOCAL_BUILT_MODULE) : $(ti-ducati.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@
endif
#############################################


###############################################################################
# Install WLAN firmware files
###############################################################################

ifneq ($(WLAN_TGZ),)
wl12xx-wlan.untarred_intermediates := $(call intermediates-dir-for, FAKE, wl12xx-wlan.untarred)
wl12xx-wlan.untarred_timestamp := $(wl12xx-wlan.untarred_intermediates)/stamp

$(wl12xx-wlan.untarred_timestamp) : $(WLAN_TGZ)
	@echo "Unzip $(dir $@) <- $<)"
	$(hide) rm -rf $(dir $@) && mkdir -p $(dir $@)
	$(hide) tar -C $(dir $@) -zxf $<
	$(hide) touch $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl1271-nvs.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl1271-nvs.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl1271-nvs_127x.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl1271-nvs_127x.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl128x-fw-4-sr.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl128x-fw-4-sr.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl128x-fw-4-mr.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl128x-fw-4-mr.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl128x-fw-4-plt.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl128x-fw-4-plt.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl127x-fw-4-sr.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl127x-fw-4-sr.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl127x-fw-4-mr.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl127x-fw-4-mr.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl127x-fw-4-plt.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl127x-fw-4-plt.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl18xx-fw.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl18xx-fw.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl18xx-conf.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(wl12xx-wlan.untarred_intermediates)/wlan/wl18xx-conf.bin
$(LOCAL_BUILT_MODULE) : $(wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

endif

################################################################################
