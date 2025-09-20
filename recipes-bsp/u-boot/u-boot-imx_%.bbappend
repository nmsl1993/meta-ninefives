# U-Boot customizations for Nine Fives
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Add custom configuration files
SRC_URI += " \
    file://ninefives.cfg \
"

# Force the correct machine name for artifacts
UBOOT_MACHINE:imx6ul-ninefives-evk = "mx6ul_14x14_evk_config"

# Custom configuration for Nine Fives project
do_configure:append() {
    # Merge custom configuration if file exists
    if [ -f ${WORKDIR}/ninefives.cfg ]; then
        cat ${WORKDIR}/ninefives.cfg >> ${S}/.config
    else
        bberror "ninefives.cfg not found in ${WORKDIR}"
    fi
}

# Alternative: Use defconfig approach
# SRC_URI += "file://mx6ul_14x14_evk_ninefives_defconfig"
#
# do_configure:prepend() {
#     cp ${WORKDIR}/mx6ul_14x14_evk_ninefives_defconfig ${S}/configs/
# }