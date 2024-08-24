#!/bin/bash -e

# Clone the Git repository
export CLONE_DIR="/tmp/RasQberry-Two"

if [ ! -d "${CLONE_DIR}" ]; then
    git clone --branch $GIT_BRANCH $GIT_REPO $CLONE_DIR
fi

wget ${RASP_WGET} -O raspi-config
# Copy the raspi-config file to the desired locations
 cp  raspi-config  ${ROOTFS_DIR}/usr/bin/raspi-config
 cp  raspi-config  ${ROOTFS_DIR}/etc/init.d/raspi-config

cp $CLONE_DIR/bin/*   ${ROOTFS_DIR}/usr/bin/
mkdir -p  ${ROOTFS_DIR}/usr/config && cp $CLONE_DIR/config/*   ${ROOTFS_DIR}/usr/config
chmod +x  ${ROOTFS_DIR}/usr/bin/
chmod +x  ${ROOTFS_DIR}/usr/config 
# Clean up the temporary clone directory if needed
# Install Qiskit using pip
echo "install qiskit for ${FIRST_USER_NAME} user"
mkdir -p /home/${FIRST_USER_NAME}/qiskit_env

python3 -m venv /home/${FIRST_USER_NAME}/qiskit_env

source /home/${FIRST_USER_NAME}/qiskit_env/bin/activate

pip install --upgrade pip

pip install qiskit

deactivate
cp -r /home/rasqberry/qiskit_env ${ROOTFS_DIR}/home/rasqberry/
echo "source /home/${FIRST_USER_NAME}/qiskit_env/bin/activate" >> ${ROOTFS_DIR}/etc/skel/.bashrc
echo "install qiskit end for ${FIRST_USER_NAME}"
rm -rf $CLONE_DIR
