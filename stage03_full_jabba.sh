#!/bin/bash
if [ ` id -u ` -gt 0 ] ; then
	echo "Please run this script as root!"
	exit 1
fi
arch=` uname -m` 

if [ -d /mnt/archiv/LessLinux/llbuild/stage03 ]; then
echo "Please delete or rename /mnt/archiv/LessLinux/llbuild/stage03"
exit 1
fi
Terminal=""

Terminal=`which Terminal`

if [ "$Terminal" = "" ]; then
Terminal=`which lxterminal`
fi

if [ "$Terminal" = "" ]; then
Terminal=`which gnome-terminal`
fi

params=""
if [ "$Terminal" = "/usr/bin/lxterminal" ]; then
params="--title="
else
params="--hide-menubar --title="
fi
echo $params
echo $Terminal

echo "Building stage03 - please be patient."
touch /mnt/archiv/LessLinux/llbuild/stage03.log
$Terminal $params"LOG: stage02" -e "tail -f /mnt/archiv/LessLinux/llbuild/stage03.log" 2> /dev/null &

if [ "$arch" = x86_64 ] ; then
linux32 ruby -I. builder.rb -u -f -n -s 1,2,bootconf \
-p config/pkglist_neutral_rescue_GTK3.txt \
-c config/general_neutral_fulliso.xml \
-b config/branding_neutral_fulliso.xml \
-k config/kernels_rescue_experimental.xml > /mnt/archiv/LessLinux/llbuild/stage03.log 2>&1
else
ruby -I. builder.rb -u -f -n -s 1,2,bootconf \
-p config/pkglist_neutral_rescue_GTK3.txt \
-c config/general_neutral_fulliso.xml \
-b config/branding_neutral_fulliso.xml \
-k config/kernels_rescue_experimental.xml > /mnt/archiv/LessLinux/llbuild/stage03.log 2>&1

fi

echo "Stage03 seems to be ready."




