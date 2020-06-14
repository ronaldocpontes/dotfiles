#!/bin/sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PATH="/usr/local/opt/ant@1.9/bin:$PATH"

# fix OpenJDK font issue
# if [ ! -f $JAVA_HOME/jre/lib/libfreetype.6.dylib ]; then
#     ln -s $JAVA_HOME/jre/lib/libfreetype.dylib.6 $JAVA_HOME/jre/lib/libfreetype.6.dylib
# fi


# export UNISONLOCALHOSTNAME=local.macpro

# #ESP32
# export PATH="\$PATH:$HOME/esp/xtensa-esp32-elf/bin:.mos/bin
# export IDF_PATH=~/esp/esp-idf
# export MOS_PORT=/dev/cu.SLAB_USBtoUART
# export MOS_ARCH=esp32


# #ANDROID
# export ANDROID_HOME="$HOME/Library/Android/sdk"
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
