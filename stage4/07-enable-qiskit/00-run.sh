#./work/stage4/rootfs/usr/lib/raspi-config
#./work/stage4/rootfs/usr/bin/raspi-config
#./work/stage4/rootfs/usr/share/raspi-config
#./work/stage4/rootfs/usr/share/doc/raspi-config
#./work/stage4/rootfs/etc/init.d/raspi-config


on_chroot << EOF
    echo "starting qiskit setup"
    # Copy the raspi-config file to the desired locations
	cp ./config/raspi-config ../../work/stage4/rootfs/usr/lib/raspi-config
    cp ./config/raspi-config ../../work/stage4/rootfs/usr/bin/raspi-config
    cp ./config/raspi-config ../../work/stage4/rootfs/usr/share/raspi-config
    cp ./config/raspi-config ../../work/stage4/rootfs/usr/share/doc/raspi-config
    cp ./config/raspi-config ../../work/stage4/rootfs/etc/init.d/raspi-config

    SUDO_USER="${FIRST_USER_NAME}" cp ./bin/*  ../../work/stage4/rootfs/usr/bin/
    SUDO_USER="${FIRST_USER_NAME}" mkdir -p ../../work/stage4/rootfs/usr/config && cp./config/config-env/*  ../../work/stage4/rootfs/usr/config
    echo "end qiskit setup"
EOF