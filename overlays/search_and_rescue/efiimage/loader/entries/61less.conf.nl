title LL Search and Rescue (Unsafe remote VNC + local GUI)
linux    /LINUX.EFI
initrd   /idefsf.gz
options  ultraquiet=2 security=none zswap.enabled=1 skipcheck=1 quiet lang=nl ejectonumass=1 skipservices=|installer|xconfgui|roothash|firewall|ssh|mountdrives| hwid=unknown laxsudo=1 toram=1000000 optram=1 swap=none swapsize=0000 blobsize=0000 uuid=all crypt=all homecont=0000-00000 console=tty2 loop.max_loop=32  x11vnc=|remote|
 

