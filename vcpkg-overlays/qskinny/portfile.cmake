vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REF 319abafb0dd4c0e9e3966e87a87c79bc5b07d224
    #SHA512 0 --- SET THIS TO 0 TO GET THE SHA512 HASH IF YOU CHANGE THE REF
    SHA512 585fd1dafffef8d715507c5e72334d6ace5683c7082ab36a8c6c0499b491f589d049a45451a8b1f3c8df439c0e5367c28349fd39188cea37f31d28278021aa8c
    REPO uwerat/qskinny
    HEAD_REF master # use install --head to install latest revision
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/"
    OPTIONS
    -DBUILD_EXAMPLES=OFF
   # -DBUILD_PLAYGROUND=OFF
)

vcpkg_cmake_install()

file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/share/QSkinny)
file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/share/QSkinny)

vcpkg_cmake_config_fixup(PACKAGE_NAME QSkinny)
vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSES")