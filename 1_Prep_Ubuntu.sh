#!/bin/bash
#
# Mit diesem Script bereiten Sie ein Ubuntu-System
# für lesslinux-builder vor

if [ ` id -u ` -gt 0 ] ; then
    echo "Fehler: Das Script benötigt root-Rechte."
    echo "Aufruf mit mit sudo $0"
    exit 1
fi

echo "Installiere Pakete"

apt-get install git autoconf lunzip ruby-all-dev ruby-magic ruby-hpricot ruby-sqlite3
apt-get install libmagic-dev texinfo gawk squashfs-tools g++ python python-dev
gem install mahoro

if [ -d /mnt/archiv ] 
then
echo "Ändere Rechte für /mnt/archiv"
chown -R root:root /mnt/archiv
chmod -R 755 /mnt/archiv
fi

if [ ! -d /home/mattias ] 
then
echo "Benutzer mattias anlegen"
adduser --home /home/mattias --shell /bin/bash mattias
fi
