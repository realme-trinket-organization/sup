#! /vendor/bin/sh

# Copyright (c) 2010-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of The Linux Foundation nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# This script will load and unload the wifi driver to put the wifi in
# in deep sleep mode so that there won't be voltage leakage.
# Loading/Unloading the driver only incase if the Wifi GUI is not going
# to Turn ON the Wifi. In the Script if the wlan driver status is
# ok(GUI loaded the driver) or loading(GUI is loading the driver) then
# the script won't do anything. Otherwise (GUI is not going to Turn On
# the Wifi) the script will load/unload the driver
# This script will get called after post bootup.

target="$1"
serialno="$2"

btsoc=""
#ifdef VENDOR_EDIT
#qiulei@PSW.CN.Wifi.Hardware, 2018/06/18,
#Add for make bin Rom-update.
if [ -s /vendor/etc/wifi/bin_version ]; then
    system_version=`cat /vendor/etc/wifi/bin_version`
else
    system_version=1
fi

if [ -s /mnt/vendor/persist/bin_version ]; then
    persist_version=`cat /mnt/vendor/persist/bin_version`
else
    persist_version=1
fi

if [ ! -s /mnt/vendor/persist/bdwlan.bin  -o $system_version -gt $persist_version ]; then
    prj_name=`cat /proc/oppoVersion/prjName`
    case $prj_name in
       "19375")
    cp /vendor/etc/wifi/bdwlan_19375_id1.bin /mnt/vendor/persist/bdwlan_19375_id1.bin
    ;;
        "19171")
    cp /vendor/etc/wifi/bdwlan_19171_id1.bin /mnt/vendor/persist/bdwlan_19171_id1.bin
    ;;
     "19175")
    cp /vendor/etc/wifi/bdwlan_19175_id1.bin /mnt/vendor/persist/bdwlan_19175_id1.bin
    ;;
     "19176")
    cp /vendor/etc/wifi/bdwlan_19176_id1.bin /mnt/vendor/persist/bdwlan_19176_id1.bin
    ;;
     "19570")
    cp /vendor/etc/wifi/bdwlan_19570_id1.bin /mnt/vendor/persist/bdwlan_19570_id1.bin
    ;;
     "19575")
    cp /vendor/etc/wifi/bdwlan_19575_id1.bin /mnt/vendor/persist/bdwlan_19575_id1.bin
    ;;
     "19579")
    cp /vendor/etc/wifi/bdwlan_19579_id1.bin /mnt/vendor/persist/bdwlan_19579_id1.bin
    ;;
     "19573")
    cp /vendor/etc/wifi/bdwlan_19573_id1.bin /mnt/vendor/persist/bdwlan_19573_id1.bin
    ;;
     "19572")
    cp /vendor/etc/wifi/bdwlan_19572_id1.bin /mnt/vendor/persist/bdwlan_19572_id1.bin
    ;;
     "19578")
    cp /vendor/etc/wifi/bdwlan_19578_id1.bin /mnt/vendor/persist/bdwlan_19578_id1.bin
    ;;
     "19571")
    cp /vendor/etc/wifi/bdwlan_19571_id1.bin /mnt/vendor/persist/bdwlan_19571_id1.bin
    ;;
     "19576")
    cp /vendor/etc/wifi/bdwlan_19576_id1.bin /mnt/vendor/persist/bdwlan_19576_id1.bin
    ;;
     "19577")
    cp /vendor/etc/wifi/bdwlan_19577_id1.bin /mnt/vendor/persist/bdwlan_19577_id1.bin
    ;;
    "19376")
    cp /vendor/etc/wifi/bdwlan_19376_id1.bin /mnt/vendor/persist/bdwlan_19376_id1.bin
    ;;
     "19021")
    cp /vendor/etc/wifi/bdwlan_19021_id1.bin /mnt/vendor/persist/bdwlan_19021_id1.bin
    ;;
     "19022")
    cp /vendor/etc/wifi/bdwlan_19022_id1.bin /mnt/vendor/persist/bdwlan_19022_id1.bin
    ;;
     "19026")
    cp /vendor/etc/wifi/bdwlan_19026_id1.bin /mnt/vendor/persist/bdwlan_19026_id1.bin
    ;;
     "19027")
    cp /vendor/etc/wifi/bdwlan_19027_id1.bin /mnt/vendor/persist/bdwlan_19027_id1.bin
    ;;
     "19028")
    cp /vendor/etc/wifi/bdwlan_19028_id1.bin /mnt/vendor/persist/bdwlan_19028_id1.bin
    ;;
     "19029")
    cp /vendor/etc/wifi/bdwlan_19029_id1.bin /mnt/vendor/persist/bdwlan_19029_id1.bin
    ;;
     "19023")
    cp /vendor/etc/wifi/bdwlan_19023_id1.bin /mnt/vendor/persist/bdwlan_19023_id1.bin
    ;;
     "19025")
    cp /vendor/etc/wifi/bdwlan_19025_id1.bin /mnt/vendor/persist/bdwlan_19025_id1.bin
    ;;
     "19321")
    cp /vendor/etc/wifi/bdwlan_19321_id1.bin /mnt/vendor/persist/bdwlan_19321_id1.bin
    ;;
     "19322")
    cp /vendor/etc/wifi/bdwlan_19322_id1.bin /mnt/vendor/persist/bdwlan_19322_id1.bin
    ;;
     "19323")
    cp /vendor/etc/wifi/bdwlan_19323_id1.bin /mnt/vendor/persist/bdwlan_19323_id1.bin
    ;;
     "19325")
    cp /vendor/etc/wifi/bdwlan_19325_id1.bin /mnt/vendor/persist/bdwlan_19325_id1.bin
    ;;
     "19326")
    cp /vendor/etc/wifi/bdwlan_19326_id1.bin /mnt/vendor/persist/bdwlan_19326_id1.bin
    ;;
     "19327")
    cp /vendor/etc/wifi/bdwlan_19327_id1.bin /mnt/vendor/persist/bdwlan_19327_id1.bin
    ;;
     "19328")
    cp /vendor/etc/wifi/bdwlan_19328_id1.bin /mnt/vendor/persist/bdwlan_19328_id1.bin
    ;;
     "19329")
    cp /vendor/etc/wifi/bdwlan_19329_id1.bin /mnt/vendor/persist/bdwlan_19329_id1.bin
    ;;
    esac
    echo "$system_version" > /mnt/vendor/persist/bin_version
    sync
fi

#Min.Yi@PSW.CN.Wifi.Hardware.1065227, 2017/11/21,
#Add for : bin for according project
pcb_version=`cat /proc/oppoVersion/pcbVersion`
prj_name=`cat /proc/oppoVersion/prjName`
case $prj_name in
       "19375" )
        cp /mnt/vendor/persist/bdwlan_19375_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19171" )
        cp /mnt/vendor/persist/bdwlan_19171_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19175" )
        cp /mnt/vendor/persist/bdwlan_19175_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19176" )
        cp /mnt/vendor/persist/bdwlan_19176_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19570" )
        cp /mnt/vendor/persist/bdwlan_19570_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19575" )
        cp /mnt/vendor/persist/bdwlan_19575_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19579" )
        cp /mnt/vendor/persist/bdwlan_19579_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19573" )
        cp /mnt/vendor/persist/bdwlan_19573_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19572" )
        cp /mnt/vendor/persist/bdwlan_19572_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19578" )
        cp /mnt/vendor/persist/bdwlan_19578_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19571" )
        cp /mnt/vendor/persist/bdwlan_19571_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19576" )
        cp /mnt/vendor/persist/bdwlan_19576_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19577" )
        cp /mnt/vendor/persist/bdwlan_19577_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;   
       "19376" )
        cp /mnt/vendor/persist/bdwlan_19376_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;  
       "19021" )
        cp /mnt/vendor/persist/bdwlan_19021_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19022")
        cp /mnt/vendor/persist/bdwlan_19022_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19026")
        cp /mnt/vendor/persist/bdwlan_19026_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19027")
        cp /mnt/vendor/persist/bdwlan_19027_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
	"19028")
        cp /mnt/vendor/persist/bdwlan_19028_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
	"19029")
        cp /mnt/vendor/persist/bdwlan_19029_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19023")
        cp /mnt/vendor/persist/bdwlan_19023_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19025")
        cp /mnt/vendor/persist/bdwlan_19025_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19321")
        cp /mnt/vendor/persist/bdwlan_19321_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19322")
        cp /mnt/vendor/persist/bdwlan_19322_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19323")
        cp /mnt/vendor/persist/bdwlan_19323_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19325")
        cp /mnt/vendor/persist/bdwlan_19325_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19326")
        cp /mnt/vendor/persist/bdwlan_19326_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19327")
        cp /mnt/vendor/persist/bdwlan_19327_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19328")
        cp /mnt/vendor/persist/bdwlan_19328_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
        "19329")
        cp /mnt/vendor/persist/bdwlan_19329_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;	   
esac

if [ $system_version -eq $persist_version ] ; then
    persistbdf=`md5sum /mnt/vendor/persist/bdwlan.bin |cut -d" " -f1`
    case $prj_name in
       "19375")
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19375_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19375_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19171")
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19171_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19171_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19175" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19175_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19175_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19570" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19570_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19570_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19575" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19575_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19575_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19579" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19579_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19579_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19573" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19573_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19573_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19572" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19572_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19572_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19578" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19578_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19578_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19571" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19571_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19571_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19576" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19576_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19576_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
       "19577" )
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19577_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19577_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
        "19376")
    vendorbdf=`md5sum /vendor/etc/wifi/bdwlan_19376_id1.bin |cut -d" " -f1`
    if [ x"$vendorbdf" != x"$persistbdf" ]; then
        cp /vendor/etc/wifi/bdwlan_19376_id1.bin /mnt/vendor/persist/bdwlan.bin
        sync
        echo "bdf check"
    fi
    ;;
    esac
fi

#ifdef ODM_WT_EDIT
##Changli.Chen@ODM_WT.Conn.Wifi.Basic.Bugid,2020/03/10,Add SM6125 Q bdf
##Add for make realme bin Rom-update.
getcmdline=`cat /proc/cmdline`
echo $getcmdline |grep V1.7-PA
monetsPCBV17=$?

if [ -s /vendor/etc/wifi/bin_version_realme ]; then
    system_version=`cat /vendor/etc/wifi/bin_version_realme`
else
    system_version=1
fi

if [ -s /mnt/vendor/persist/bin_version_realme ]; then
    persist_version=`cat /mnt/vendor/persist/bin_version_realme`
else
    persist_version=0
fi

if [ ! -s /mnt/vendor/persist/bdwlan.bin  -o $system_version -gt $persist_version ]; then
    prj_name=`cat /proc/oppoVersion/prjVersion`
    operatorName=`cat /proc/oppoVersion/operatorName`
    case $prj_name in
        "19631")
        case $operatorName in
            "1" | "5" | "6" | "7" | "8" | "9" | "11")
            ##19630 19634 19641 19647 19648 19642 19645
            cp /vendor/etc/wifi/bdwlan_19641.bin /mnt/vendor/persist/bdwlan_19641.bin
            ;;
            "2")
            ##19631
            cp /vendor/etc/wifi/bdwlan_19631.bin /mnt/vendor/persist/bdwlan_19631.bin
            ;;
        esac
        ;;
        "19632")
        cp /vendor/etc/wifi/bdwlan_19632.bin /mnt/vendor/persist/bdwlan_19632.bin
        ;;
        "19743")
        ##MonetS
        case $operatorName in
            "31" | "33" | "34")
            ##19743 19675 19676
            if [ $monetsPCBV17 -eq "0" ]; then
                cp /vendor/etc/wifi/bdwlan_19743_v17.bin /mnt/vendor/persist/bdwlan_19743_v17.bin
            else
                cp /vendor/etc/wifi/bdwlan_19743.bin /mnt/vendor/persist/bdwlan_19743.bin
            fi
            ;;
            "32")
            ##19744
            if [ $monetsPCBV17 -eq "0" ]; then
                cp /vendor/etc/wifi/bdwlan_19744_v17.bin /mnt/vendor/persist/bdwlan_19744_v17.bin
            else
                cp /vendor/etc/wifi/bdwlan_19744.bin /mnt/vendor/persist/bdwlan_19744.bin
            fi
            ;;
        esac
        ;;
        "19745")
        cp /vendor/etc/wifi/bdwlan_19745.bin /mnt/vendor/persist/bdwlan_19745.bin
        ;;
    esac
    echo "$system_version" > /mnt/vendor/persist/bin_version_realme
fi

prj_name=`cat /proc/oppoVersion/prjVersion`
operatorName=`cat /proc/oppoVersion/operatorName`
case $prj_name in
    "19631")
    case $operatorName in
        "1" | "5" | "6" | "7" | "8" | "9" | "11")
        ##19630 19634 19641 19647 19648 19642 19645
        cp /mnt/vendor/persist/bdwlan_19641.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "2")
        ##19631
        cp /mnt/vendor/persist/bdwlan_19631.bin /mnt/vendor/persist/bdwlan.bin
        ;;
    esac
    ;;
    "19632")
    cp /mnt/vendor/persist/bdwlan_19632.bin /mnt/vendor/persist/bdwlan.bin
    ;;
    "19743")
    ##MonetS
    case $operatorName in
        "31" | "33" | "34")
        ##19743 19675 19676
        if [ $monetsPCBV17 -eq "0" ]; then
            cp /mnt/vendor/persist/bdwlan_19743_v17.bin /mnt/vendor/persist/bdwlan.bin
        else
            cp /mnt/vendor/persist/bdwlan_19743.bin /mnt/vendor/persist/bdwlan.bin
        fi
        ;;
        "32")
        ##19744
        if [ $monetsPCBV17 -eq "0" ]; then
            cp /mnt/vendor/persist/bdwlan_19744_v17.bin /mnt/vendor/persist/bdwlan.bin
        else
            cp /mnt/vendor/persist/bdwlan_19744.bin /mnt/vendor/persist/bdwlan.bin
        fi
        ;;
    esac
    ;;
    "19745")
    cp /mnt/vendor/persist/bdwlan_19745.bin /mnt/vendor/persist/bdwlan.bin
    ;;
esac
#endif /* ODM_WT_EDIT */

sync
chmod 666 /mnt/vendor/persist/bdwlan.bin
chown system:wifi /mnt/vendor/persist/bdwlan.bin

#ifdef ODM_WT_EDIT
##Changli.Chen@ODM_WT.Conn.Wifi.Basic.Bugid,2020/05/06,Add for SM6125 Q shareware
##Add for make realme bin Rom-update.
prj_name=`cat /proc/oppoVersion/prjVersion`
#endif /* ODM_WT_EDIT */

#Yuan.Huang@PSW.CN.Wifi.Network.internet.1074197, 2016/11/09,
#Add for make WCNSS_qcom_cfg.ini Rom-update.
if [ -s /vendor/etc/wifi/WCNSS_qcom_cfg.ini ]; then
#ifdef ODM_WT_EDIT
##Changli.Chen@ODM_WT.Conn.Wifi.Basic.Bugid,2020/05/06,Change for SM6125 Q shareware
##Add for make realme bin Rom-update.
	if [ $prj_name -ne "19743" -a $prj_name -ne "19745" ]; then
		system_version=`head -1 /vendor/etc/wifi/WCNSS_qcom_cfg.ini | grep OppoVersion | cut -d= -f2`
	else
		system_version=`head -1 /vendor/etc/wifi/WCNSS_qcom_cfg_monets.ini | grep OppoVersion | cut -d= -f2`
	fi
#endif /* ODM_WT_EDIT */
	if [ "${system_version}x" = "x" ]; then
		system_version=1
	fi
else
	system_version=1
fi

#if WCNSS_qcom_cfg_version exists, dut upgrades from android 7.0
if [ -s /mnt/vendor/persist/WCNSS_qcom_cfg_version ]; then
	persist_version=0
	rm /mnt/vendor/persist/WCNSS_qcom_cfg_version
else
	if [ -s /mnt/vendor/persist/WCNSS_qcom_cfg.ini ]; then
		persist_version=`head -1 /mnt/vendor/persist/WCNSS_qcom_cfg.ini | grep OppoVersion | cut -d= -f2`
		if [ "${persist_version}x" = "x" ]; then
			persist_version=0
		fi
	else
		persist_version=0
	fi
fi

if [ ! -s /mnt/vendor/persist/WCNSS_qcom_cfg.ini -o $system_version -gt $persist_version ]; then
#ifdef ODM_WT_EDIT
##Changli.Chen@ODM_WT.Conn.Wifi.Basic.Bugid,2020/05/06,Change for SM6125 Q shareware
##Add for make realme bin Rom-update.
	if [ $prj_name -ne "19743" -a $prj_name -ne "19745" ]; then
	    cp /vendor/etc/wifi/WCNSS_qcom_cfg.ini \
	            /mnt/vendor/persist/WCNSS_qcom_cfg.ini
	else
            cp /vendor/etc/wifi/WCNSS_qcom_cfg_monets.ini \
                    /mnt/vendor/persist/WCNSS_qcom_cfg.ini
	fi
#endif /* ODM_WT_EDIT */
    sync
    chown system:wifi /mnt/vendor/persist/WCNSS_qcom_cfg.ini
    chmod 666 /mnt/vendor/persist/WCNSS_qcom_cfg.ini
fi

persistini=`cat /mnt/vendor/persist/WCNSS_qcom_cfg.ini | grep -v "#" | grep -wc "END"`
if [ x"$persistini" = x"0" ]; then
#ifdef ODM_WT_EDIT
##Changli.Chen@ODM_WT.Conn.Wifi.Basic.Bugid,2020/05/06,Change for SM6125 Q shareware
##Add for make realme bin Rom-update.
    if [ $prj_name -ne "19743" -a $prj_name -ne "19745" ]; then
        cp /vendor/etc/wifi/WCNSS_qcom_cfg.ini \
                /mnt/vendor/persist/WCNSS_qcom_cfg.ini
    else
        cp /vendor/etc/wifi/WCNSS_qcom_cfg_monets.ini \
                 /mnt/vendor/persist/WCNSS_qcom_cfg.ini
    fi
#endif /* ODM_WT_EDIT */
    sync
    chown system:wifi /mnt/vendor/persist/WCNSS_qcom_cfg.ini
    chmod 666 /mnt/vendor/persist/WCNSS_qcom_cfg.ini
    echo "ini check"
fi

#else /* VENDOR_EDIT */
if false; then
# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

# Trigger WCNSS platform driver
trigger_wcnss()
{
    # We need to trigger WCNSS platform driver, WCNSS driver
    # will export a file which we must touch so that the
    # driver knows that userspace is ready to handle firmware
    # download requests.

    # See if an appropriately named device file is present
    wcnssnode=`ls /dev/wcnss*`
    case "$wcnssnode" in
        *wcnss*)
            # Before triggering wcnss, let it know that
            # caldata is available at userspace.
            if [ -e /data/misc/wifi/WCNSS_qcom_wlan_cal.bin ]; then
                calparm=`ls /sys/module/wcnsscore/parameters/has_calibrated_data`
                if [ -e $calparm ] && [ ! -e /data/misc/wifi/WCN_FACTORY ]; then
                    echo 1 > $calparm
                fi
            fi
            # There is a device file.  Write to the file
            # so that the driver knows userspace is
            # available for firmware download requests
            echo 1 > $wcnssnode
            ;;

        *)
            # There is not a device file present, so
            # the driver must not be available
            echo "No WCNSS device node detected"
            ;;
    esac

    # Plumb down the device serial number
    if [ -f /sys/devices/*wcnss-wlan/serial_number ]; then
        cd /sys/devices/*wcnss-wlan
        echo $serialno > serial_number
        cd /
    elif [ -f /sys/devices/platform/wcnss_wlan.0/serial_number ]; then
        echo $serialno > /sys/devices/platform/wcnss_wlan.0/serial_number
    fi
}


case "$target" in
    msm8974* | msm8226* | msm8610*)

# Check whether device is plugged on the HSIC bus
# Currently HSIC bus will be the first index

    if [ -e /sys/bus/platform/drivers/msm_hsic_host ]; then
       if [ ! -L /sys/bus/usb/devices/1-1 ]; then
           echo msm_hsic_host > /sys/bus/platform/drivers/msm_hsic_host/unbind
       fi

       chown -h system.system /sys/bus/platform/drivers/msm_hsic_host/bind
       chown -h system.system /sys/bus/platform/drivers/msm_hsic_host/unbind
       chmod -h 0200 /sys/bus/platform/drivers/msm_hsic_host/bind
       chmod -h 0200 /sys/bus/platform/drivers/msm_hsic_host/unbind
    fi

    wlanchip=""

# force ar6004 is ar6004_wlan.conf existed.
    if [ -f /system/etc/firmware/ath6k/AR6004/ar6004_wlan.conf ]; then
        wlanchip=`cat /system/etc/firmware/ath6k/AR6004/ar6004_wlan.conf`
    fi

# auto detect ar6004-sdio card
# for ar6004-sdio card, the vendor id and device id is as the following
# vendor id  device id
#    0x0271     0x0400
#    0x0271     0x0401
    if [ "$wlanchip" == "" ]; then
        sdio_vendors=`echo \`cat /sys/bus/mmc/devices/*/*/vendor\``
        sdio_devices=`echo \`cat /sys/bus/mmc/devices/*/*/device\``
        ven_idx=0

        for vendor in $sdio_vendors; do
            case "$vendor" in
            "0x0271")
                dev_idx=0
                for device in $sdio_devices; do
                    if [ $ven_idx -eq $dev_idx ]; then
                        case "$device" in
                        "0x0400" | "0x0401" | "0x0402")
                            wlanchip="AR6004-SDIO"
                            ;;
                        *)
                            ;;
                        esac
                    fi
                    dev_idx=$(( $dev_idx + 1))
                done
                ;;
            *)
                ;;
            esac
            ven_idx=$(( $ven_idx + 1))
        done
    # auto detect ar6004-sdio card end
    fi

# for ar6004-usb card, the vendor id and device id is as the following
# vendor id  product id
#    0x0cf3     0x9374
#    0x0cf3     0x9372
    if [ "$wlanchip" == "" ]; then
        usb_vendors=`echo \`cat /sys/bus/usb/devices/*/*/idVendor\``
        usb_products=`echo \`cat /sys/bus/usb/devices/*/*/idProduct\``
        ven_idx=0

        for vendor in $usb_vendors; do
            case "$vendor" in
            "0cf3")
                dev_idx=0
                for product in $usb_products; do
                    if [ $ven_idx -eq $dev_idx ]; then
                        case "$product" in
                        "9374" | "9372")
                            wlanchip="AR6004-USB"
                            ;;
                        *)
                            ;;
                        esac
                    fi
                    dev_idx=$(( $dev_idx + 1))
                done
                ;;
            *)
                ;;
            esac
            ven_idx=$(( $ven_idx + 1))
        done
    # auto detect ar6004-usb card end
    fi

      echo "The WLAN Chip ID is $wlanchip"
      case "$wlanchip" in
      "AR6004-USB")
      echo msm_hsic_host > /sys/bus/platform/drivers/msm_hsic_host/unbind
      setprop wlan.driver.ath 2
      setprop vendor.bluetooth.soc ath3k
      btsoc="ath3k"
      rm  /system/lib/modules/wlan.ko
      ln -s /system/lib/modules/ath6kl-3.5/ath6kl_usb.ko \
		/system/lib/modules/wlan.ko
      rm /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
      rm /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin_usb \
		/system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin_usb \
		/system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
      rm /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin_usb \
                /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin

      # Use different wpa_supplicant.conf template between wcn driver
      # and ath6kl driver
      rm /system/etc/wifi/wpa_supplicant.conf
      ln -s /system/etc/wifi/wpa_supplicant_ath6kl.conf \
                /system/etc/wifi/wpa_supplicant.conf
      ;;

      "AR6004-SDIO")
      setprop wlan.driver.ath 2
      setprop vendor.bluetooth.soc ath3k
      btsoc="ath3k"
      # Chown polling nodes as needed from UI running on system server
      chmod -h 0200 /sys/devices/msm_sdcc.1/polling
      chmod -h 0200 /sys/devices/msm_sdcc.2/polling
      chmod -h 0200 /sys/devices/msm_sdcc.3/polling
      chmod -h 0200 /sys/devices/msm_sdcc.4/polling

      chown -h system.system /sys/devices/msm_sdcc.1/polling
      chown -h system.system /sys/devices/msm_sdcc.2/polling
      chown -h system.system /sys/devices/msm_sdcc.3/polling
      chown -h system.system /sys/devices/msm_sdcc.4/polling

      rm  /system/lib/modules/wlan.ko
      ln -s /system/lib/modules/ath6kl-3.5/ath6kl_sdio.ko \
		/system/lib/modules/wlan.ko
      rm /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
      rm /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin_sdio \
		/system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin_sdio \
		/system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
      rm /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin_sdio \
                /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin

      # Use different wpa_supplicant.conf template between wcn driver
      # and ath6kl driver
      rm /system/etc/wifi/wpa_supplicant.conf
      ln -s /system/etc/wifi/wpa_supplicant_ath6kl.conf \
                /system/etc/wifi/wpa_supplicant.conf
      ;;

      *)
      echo "*** WI-FI chip ID is not specified in /persist/wlan_chip_id **"
      echo "*** Use the default WCN driver.                             **"
      setprop wlan.driver.ath 0
      rm  /system/lib/modules/wlan.ko
      ln -s /system/lib/modules/pronto/pronto_wlan.ko \
		/system/lib/modules/wlan.ko
      # Populate the writable driver configuration file
      if [ ! -s /data/misc/wifi/WCNSS_qcom_cfg.ini ]; then
          cp /system/etc/wifi/WCNSS_qcom_cfg.ini \
		/data/misc/wifi/WCNSS_qcom_cfg.ini
          chown -h system:wifi /data/misc/wifi/WCNSS_qcom_cfg.ini
          chmod -h 660 /data/misc/wifi/WCNSS_qcom_cfg.ini
      fi

      # The property below is used in Qcom SDK for softap to determine
      # the wifi driver config file
      setprop wlan.driver.config /data/misc/wifi/WCNSS_qcom_cfg.ini

      # Use different wpa_supplicant.conf template between wcn driver
      # and ath6kl driver
      rm /system/etc/wifi/wpa_supplicant.conf
      ln -s /system/etc/wifi/wpa_supplicant_wcn.conf \
                /system/etc/wifi/wpa_supplicant.conf

      # Trigger WCNSS platform driver
      trigger_wcnss &
      ;;
      esac
      ;;

    apq8084*)
      echo "*** Use the CNSS CLD driver.**"
      setprop wlan.driver.ath 0

      # Use different wpa_supplicant.conf template between wcn driver
      # and ath6kl driver
      rm /system/etc/wifi/wpa_supplicant.conf
      ln -s /system/etc/wifi/wpa_supplicant_wcn.conf \
                /system/etc/wifi/wpa_supplicant.conf
    ;;

    msm8960*)

      # Move cfg80211.ko to prima directory, the default cfg80211.ko is
      # for wcnss solution
      if [ ! -L /system/lib/modules/cfg80211.ko ]; then
          mv /system/lib/modules/cfg80211.ko /system/lib/modules/prima/
      fi

      wlanchip=""

      if [ -f /system/etc/firmware/ath6k/AR6004/ar6004_wlan.conf ]; then
          wlanchip=`cat /system/etc/firmware/ath6k/AR6004/ar6004_wlan.conf`
      fi

      if [ "$wlanchip" == "" ]; then
          # auto detect ar6004-usb card
          # for ar6004-usb card, the vendor id and device id is as the following
          # vendor id  product id
          #    0x0cf3     0x9374
          #    0x0cf3     0x9372
          usb_vendors=`echo \`cat /sys/bus/usb/devices/*/*/idVendor\``
          usb_products=`echo \`cat /sys/bus/usb/devices/*/*/idProduct\``
          ven_idx=0

          for vendor in $usb_vendors; do
              case "$vendor" in
              "0cf3")
                  dev_idx=0
                  for product in $usb_products; do
                      if [ $ven_idx -eq $dev_idx ]; then
                          case "$product" in
                          "9374" | "9372")
                              wlanchip="AR6004-USB"
                              ;;
                          *)
                              ;;
                          esac
                      fi
                      dev_idx=$(( $dev_idx + 1))
                  done
                  ;;
              *)
                  ;;
              esac
              ven_idx=$(( $ven_idx + 1))
          done
          # auto detect ar6004-usb card end
      fi

      if [ "$wlanchip" == "" ]; then
          # auto detect ar6004-sdio card
          # for ar6004-sdio card, the vendor id and device id is
          # as the following
          # vendor id  device id
          #    0x0271     0x0400
          #    0x0271     0x0401
          sdio_vendors=`echo \`cat /sys/bus/mmc/devices/*/*/vendor\``
          sdio_devices=`echo \`cat /sys/bus/mmc/devices/*/*/device\``
          ven_idx=0

          for vendor in $sdio_vendors; do
              case "$vendor" in
              "0x0271")
                  dev_idx=0
                  for device in $sdio_devices; do
                      if [ $ven_idx -eq $dev_idx ]; then
                          case "$device" in
                          "0x0400" | "0x0401")
                              wlanchip="AR6004-SDIO"
                              ;;
                          *)
                              ;;
                          esac
                      fi
                      dev_idx=$(( $dev_idx + 1))
                  done
                  ;;
              *)
                  ;;
              esac
              ven_idx=$(( $ven_idx + 1))
          done
          # auto detect ar6004-sdio card end
      fi

      echo "The WLAN Chip ID is $wlanchip"
      case "$wlanchip" in
      "AR6004-USB")
        setprop wlan.driver.ath 2
        rm  /system/lib/modules/wlan.ko
        rm  /system/lib/modules/cfg80211.ko
        ln -s /system/lib/modules/ath6kl-3.5/ath6kl_usb.ko \
		/system/lib/modules/wlan.ko
        ln -s /system/lib/modules/ath6kl-3.5/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
        rm /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
        rm /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
        ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin_usb \
		/system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
        ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin_usb \
		/system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin

        # Use different wpa_supplicant.conf template between wcn driver
        # and ath6kl driver
        rm /system/etc/wifi/wpa_supplicant.conf
        ln -s /system/etc/wifi/wpa_supplicant_ath6kl.conf \
                /system/etc/wifi/wpa_supplicant.conf
        ;;
      "AR6004-SDIO")
        setprop wlan.driver.ath 2
        setprop qcom.bluetooth.soc ath3k
        btsoc="ath3k"
        rm  /system/lib/modules/wlan.ko
        rm  /system/lib/modules/cfg80211.ko
        ln -s /system/lib/modules/ath6kl-3.5/ath6kl_sdio.ko \
		/system/lib/modules/wlan.ko
        ln -s /system/lib/modules/ath6kl-3.5/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
        rm /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
        rm /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
        ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin_sdio \
		/system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
        ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin_sdio \
		/system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin

        # Use different wpa_supplicant.conf template between wcn driver
        # and ath6kl driver
        rm /system/etc/wifi/wpa_supplicant.conf
        ln -s /system/etc/wifi/wpa_supplicant_ath6kl.conf \
                  /system/etc/wifi/wpa_supplicant.conf
        ;;
      *)
        echo "*** WI-FI chip ID is not specified in /persist/wlan_chip_id **"
        echo "*** Use the default WCN driver.                             **"
        setprop wlan.driver.ath 0
        rm  /system/lib/modules/wlan.ko
        rm  /system/lib/modules/cfg80211.ko
        ln -s /system/lib/modules/prima/prima_wlan.ko \
		/system/lib/modules/wlan.ko
        ln -s /system/lib/modules/prima/cfg80211.ko \
		/system/lib/modules/cfg80211.ko

        # The property below is used in Qcom SDK for softap to determine
        # the wifi driver config file
        setprop wlan.driver.config /data/misc/wifi/WCNSS_qcom_cfg.ini

        # Use different wpa_supplicant.conf template between wcn driver
        # and ath6kl driver
        rm /system/etc/wifi/wpa_supplicant.conf
        ln -s /system/etc/wifi/wpa_supplicant_wcn.conf \
                  /system/etc/wifi/wpa_supplicant.conf

        # Trigger WCNSS platform driver
        trigger_wcnss &
        ;;
      esac
      ;;

    msm7627a*)

        # The default cfg80211 module is for volans
        if [ ! -L /system/lib/modules/cfg80211.ko ]; then
            mv /system/lib/modules/cfg80211.ko /system/lib/modules/volans/
        fi

        wlanchip=`cat /persist/wlan_chip_id`
        echo "The WLAN Chip ID is $wlanchip"
        case "$wlanchip" in
            "ATH6KL")
             setprop wlan.driver.ath 1
             rm  /system/lib/modules/wlan.ko
             rm  /system/lib/modules/cfg80211.ko
             ln -s /system/lib/modules/ath6kl/ath6kl_sdio.ko \
		/system/lib/modules/wlan.ko
             ln -s /system/lib/modules/ath6kl/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
             ;;
            "WCN1314")
             setprop wlan.driver.ath 0
             rm  /system/lib/modules/wlan.ko
             rm  /system/lib/modules/cfg80211.ko
             ln -s /system/lib/modules/volans/WCN1314_rf.ko \
		/system/lib/modules/wlan.ko
             ln -s /system/lib/modules/volans/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
             ;;
            *)
             setprop wlan.driver.ath 1
             rm  /system/lib/modules/wlan.ko
             rm  /system/lib/modules/cfg80211.ko
             ln -s /system/lib/modules/ath6kl/ath6kl_sdio.ko \
		/system/lib/modules/wlan.ko
             ln -s /system/lib/modules/ath6kl/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
             echo "************************************************************"
             echo "*** Error:WI-FI chip ID is not specified in"
             echo "/persist/wlan_chip_id"
             echo "*******    WI-FI may not work    ***************************"
             ;;
        esac
    ;;

    msm7627*)
        ln -s /data/hostapd/qcom_cfg.ini /etc/firmware/wlan/qcom_cfg.ini
        ln -s /persist/qcom_wlan_nv.bin /etc/firmware/wlan/qcom_wlan_nv.bin
    ;;

    msm8660*)
    ;;

    msm7630*)
    ;;

    *)
      ;;
esac
fi
#endif /* VENDOR_EDIT */
