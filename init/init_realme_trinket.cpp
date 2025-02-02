/*
   Copyright (c) 2016, The CyanogenMod Project
   Copyright (c) 2019, The LineageOS Project

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <cstdlib>
#include <fstream>
#include <string.h>
#include <sys/sysinfo.h>
#include <unistd.h>
#include <vector>

#include <android-base/properties.h>
#include <android-base/logging.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"
#include "property_service.h"

std::vector<std::string> ro_props_default_source_order = {
    "",
    "odm.",
    "product.",
    "system.",
    "vendor.",
};

void property_override_device(char const prop[], char const value[], bool add = true)
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else if (add)
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void set_device_info(const std::string device, const std::string model, const std::string board_id)
{
    const auto set_ro_build_prop = [](const std::string &source,
            const std::string &prop, const std::string &value) {
        auto prop_name = "ro." + source + "build." + prop;
        property_override_device(prop_name.c_str(), value.c_str(), false);
    };

    const auto set_ro_product_prop = [](const std::string &source,
            const std::string &prop, const std::string &value) {
        auto prop_name = "ro.product." + source + prop;
        property_override_device(prop_name.c_str(), value.c_str(), false);
    };

    for (const auto &source : ro_props_default_source_order) {
        set_ro_build_prop(source, "fingerprint", "realme/" + device + "/" + device + ":10/QKQ1.200209.002/1642670490:user/release-keys");

        set_ro_product_prop(source, "device", device);
        set_ro_product_prop(source, "model", model);
        set_ro_product_prop(source, "name", device);
    }

    property_override_device("ro.separate.soft", board_id.c_str());
}

void vendor_set_dalvik()
{
    char const *heapstartsize;
    char const *heapgrowthlimit;
    char const *heapsize;
    char const *heapminfree;
    char const *heapmaxfree;
    char const *heaptargetutilization;

    struct sysinfo sys;
    sysinfo(&sys);

    if (sys.totalram > 3072ull * 1024 * 1024) {
        // from - phone-xxhdpi-4096-dalvik-heap.mk
        heapstartsize = "8m";
        heapgrowthlimit = "256m";
        heapsize = "512m";
        heaptargetutilization = "0.6";
        heapminfree = "8m";
        heapmaxfree = "16m";
    } else {
        heapstartsize = "8m";
        heapgrowthlimit = "256m";
        heapsize = "512m";
        heaptargetutilization = "0.75";
        heapminfree = "2m";
        heapmaxfree = "8m";
    }

    property_override_device("dalvik.vm.heapstartsize", heapstartsize);
    property_override_device("dalvik.vm.heapgrowthlimit", heapgrowthlimit);
    property_override_device("dalvik.vm.heapsize", heapsize);
    property_override_device("dalvik.vm.heaptargetutilization", heaptargetutilization);
    property_override_device("dalvik.vm.heapminfree", heapminfree);
    property_override_device("dalvik.vm.heapmaxfree", heapmaxfree);
}

void vendor_set_device_info()
{
    std::ifstream prjPath("/proc/oppoVersion/prjVersion");
    std::ifstream opPath("/proc/oppoVersion/operatorName");
    std::string device_project;
    std::string device_operator;

    getline(prjPath, device_project);
    getline(opPath, device_operator);
    if (device_project == "19631") {
        if (device_operator == "1") {
            set_device_info("RMX1925", "realme 5s", "19630");
        } else if (device_operator == "2") {
            set_device_info("RMX1911", "realme 5", "19631");
        } else if (device_operator == "6") {
            set_device_info("RMX1911", "realme 5", "19641");
        } else if (device_operator == "7") {
            set_device_info("RMX1919", "realme 5", "19647");
        } else if (device_operator == "8") {
            set_device_info("RMX1929", "realme 5", "19648");
        } else if (device_operator == "9") {
            set_device_info("RMX1925", "realme 5s", "19642");
        }
    } else if (device_project == "19632") {
        set_device_info("RMX1927", "realme 5", "19632");
        property_override_device("ro.boot.product.hardware.sku", "nfc");
    } else {
        if (device_operator == "31") {
            set_device_info("RMX2030", "realme 5i", "19743");
        } else if (device_operator == "32") {
            set_device_info("RMX2030", "realme 5i", "19744");
        } else if (device_operator == "33") {
            set_device_info("RMX2031", "realme 5i", "19675");
        } else if (device_operator == "34") {
            set_device_info("RMX2032", "realme 5i", "19676");
        }
    }
}

void vendor_set_fingerprint_device()
{
    std::ifstream fpPath("/proc/fp_id");
    std::string fpid;
    std::string fp_device;

    getline(fpPath, fpid);

    if (fpid == "E_520")
        fp_device = "egis";
    else
        fp_device = "fpc";

    property_override_device("vendor.fp.device", fp_device.c_str());
}

void vendor_load_properties()
{
    vendor_set_dalvik();
    vendor_set_device_info();
    vendor_set_fingerprint_device();
}
