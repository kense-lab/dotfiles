#!/bin/bash

# 如果检测到有外接USB键盘鼠标则禁用笔记本键盘触摸板

SLEEP_TIME=5

# 自带的键盘触摸板名字 这里要用xinput list命令查看你的电脑自带键盘触摸板的名字
KEYBOARD_IN='AT Translated Set 2 keyboard'
MOUSE_IN='ETPS/2 Elantech Touchpad'

# 外接的键盘触摸板名字，同上插拔外接键鼠，并用xinput list命令确定你的外接键鼠的名字
USB_KEYBOARD_OUT=('SONiX USB DEVICE Keyboard' 'RK-Bluetooth keyboard')
USB_MOUSE_OUT='Rapoo Rapoo Gaming Mouse'

while true
do
    # 处理键盘的逻辑
    HAVE_USB_KEYBOARD=`xinput list | grep "${USB_KEYBOARD_OUT[0]}" || xinput list | grep "${USB_KEYBOARD_OUT[1]}"`
    if [ "" != "$HAVE_USB_KEYBOARD" ]; then
        if [ `xinput list-props "$KEYBOARD_IN" | grep "Device Enabled" | awk  -F ':' '{print $2}'` == 1 ]; then
            xinput set-prop "$KEYBOARD_IN" 'Device Enabled' 0
			# 按键重复率
			xset r rate 250 30
            # echo Disable keyboard
        fi
    else
        if [ `xinput list-props "$KEYBOARD_IN" | grep "Device Enabled" | awk  -F ':' '{print $2}'` == 0 ]; then
            xinput set-prop "$KEYBOARD_IN" 'Device Enabled' 1
            # echo Enable keyboard
        fi
    fi

    # 处理键鼠标的逻辑
    # HAVE_USB_MOUSE=`xinput list | grep "$USB_MOUSE_OUT"`
    # if [ "" != "$HAVE_USB_MOUSE" ]; then
    #     if [ `xinput list-props "$MOUSE_IN" | grep "Device Enabled" | awk  -F ':' '{print $2}'` == 1 ]; then
    #         xinput set-prop "$MOUSE_IN" 'Device Enabled' 0
    #         # echo Disable Touchpad
    #     fi
    # else
    #     if [ `xinput list-props "$MOUSE_IN" | grep "Device Enabled" | awk  -F ':' '{print $2}'` == 0 ]; then
    #         xinput set-prop "$MOUSE_IN" 'Device Enabled' 1
    #         # echo Enable Touchpad
    #     fi
    # fi

    sleep $SLEEP_TIME
done
