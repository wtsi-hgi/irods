# TODO  f 644 root root /usr/share/man/man1 ./man/*.gz

install(
  TARGETS
  irodsAgent
  irodsServer
  irodsReServer
  irodsXmsgServer
  hostname_resolves_to_local_address
  RUNTIME
  DESTINATION usr/sbin
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES ${CMAKE_BINARY_DIR}/VERSION.json.dist
  DESTINATION ${IRODS_HOME_DIRECTORY}
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/log
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION etc/irods
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/packaging/connectControl.config.template
  ${CMAKE_SOURCE_DIR}/packaging/core.dvm.template
  ${CMAKE_SOURCE_DIR}/packaging/core.fnm.template
  ${CMAKE_SOURCE_DIR}/packaging/core.re.template
  ${CMAKE_SOURCE_DIR}/packaging/database_config.json.template
  ${CMAKE_SOURCE_DIR}/packaging/host_access_control_config.json.template
  ${CMAKE_SOURCE_DIR}/packaging/hosts_config.json.template
  ${CMAKE_SOURCE_DIR}/packaging/irodsMonPerf.config.in
  ${CMAKE_SOURCE_DIR}/packaging/server_config.json.template
  ${CMAKE_SOURCE_DIR}/packaging/server_setup_instructions.txt
  DESTINATION ${IRODS_HOME_DIRECTORY}/packaging
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/packaging/find_os.sh
  ${CMAKE_SOURCE_DIR}/packaging/postinstall.sh
  ${CMAKE_SOURCE_DIR}/packaging/preremove.sh
  DESTINATION ${IRODS_HOME_DIRECTORY}/packaging
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ WORLD_READ
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/packaging/irods
  DESTINATION etc/init.d
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
  )

set(IRODS_DOC_DIR usr/share/doc/irods)

install(
  FILES
  ${CMAKE_SOURCE_DIR}/docs/release_notes.md
  DESTINATION ${IRODS_DOC_DIR}
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  RENAME RELEASE_NOTES
  )

if (CPACK_GENERATOR STREQUAL DEB)
  install(
    FILES
    ${CMAKE_SOURCE_DIR}/LICENSE
    DESTINATION ${IRODS_DOC_DIR}
    COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
    RENAME copyright
    )
else()
  install(
    FILES
    ${CMAKE_SOURCE_DIR}/LICENSE
    DESTINATION ${IRODS_DOC_DIR}
    COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
    )
endif()

install(
  DIRECTORY ${CMAKE_SOURCE_DIR}/scripts
  DESTINATION ${IRODS_HOME_DIRECTORY}
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/server/config/lockFileDir
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/server/config/reConfigs
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/server/config/packedRei
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/server/bin/cmd/irodsServerMonPerf
  ${CMAKE_SOURCE_DIR}/server/bin/cmd/test_execstream.py
  ${CMAKE_SOURCE_DIR}/server/bin/cmd/hello
  ${CMAKE_SOURCE_DIR}/server/bin/cmd/univMSSInterface.sh
  DESTINATION ${IRODS_HOME_DIRECTORY}/server/bin/cmd
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ WORLD_READ
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/test/test_framework_configuration.json
  DESTINATION ${IRODS_HOME_DIRECTORY}/test
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY ${CMAKE_SOURCE_DIR}/test/filesystem
  DESTINATION ${IRODS_HOME_DIRECTORY}/test
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  TARGETS
  irodsPamAuthCheck
  RUNTIME
  DESTINATION ${IRODS_HOME_DIRECTORY}/server/bin
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  PERMISSIONS SETUID OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
  )

install(
  TARGETS
  test_chl
  RUNTIME
  DESTINATION ${IRODS_HOME_DIRECTORY}/test/bin
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/irodsctl
  DESTINATION ${IRODS_HOME_DIRECTORY}
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ WORLD_READ
  )


set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME_UPPERCASE}_PACKAGE_NAME "irods-server")
set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME_UPPERCASE}_PACKAGE_DEPENDS "${IRODS_PACKAGE_DEPENDENCIES_STRING}, irods-runtime (= ${IRODS_VERSION}), irods-icommands (= ${IRODS_VERSION}), libc6, sudo, libssl1.0.0, libfuse2, libjson-perl, perl, python, openssl, python-psutil, python-requests, lsof")
set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME_UPPERCASE}_PACKAGE_PROVIDES "irods")
set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME_UPPERCASE}_PACKAGE_CONFLICTS "eirods")
set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME_UPPERCASE}_PACKAGE_REPLACES "irods-icat, irods-resource")
set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME_UPPERCASE}_PACKAGE_CONTROL_EXTRA "${CMAKE_SOURCE_DIR}/preinst;${CMAKE_SOURCE_DIR}/postinst;${CMAKE_SOURCE_DIR}/prerm;")

if (IRODS_LINUX_DISTRIBUTION_NAME STREQUAL "ubuntu" AND IRODS_LINUX_DISTRIBUTION_VERSION_MAJOR STREQUAL "12")
else()
  set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME_UPPERCASE}_PACKAGE_DEPENDS "${CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME_UPPERCASE}_PACKAGE_DEPENDS}, python-jsonschema")
endif()


set(CPACK_RPM_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_NAME "irods-server")
if (IRODS_LINUX_DISTRIBUTION_NAME STREQUAL "centos")
  set(CPACK_RPM_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_REQUIRES "${IRODS_PACKAGE_DEPENDENCIES_STRING}, irods-runtime = ${IRODS_VERSION}, irods-icommands = ${IRODS_VERSION}, openssl, python, python-psutil, python-requests, python-jsonschema")
elseif (IRODS_LINUX_DISTRIBUTION_NAME STREQUAL "opensuse")
  set(CPACK_RPM_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_REQUIRES "${IRODS_PACKAGE_DEPENDENCIES_STRING}, irods-runtime = ${IRODS_VERSION}, irods-icommands = ${IRODS_VERSION}, libopenssl1_0_0, python, openssl, python-psutil, python-requests, python-jsonschema")
endif()
set(CPACK_RPM_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PRE_INSTALL_SCRIPT_FILE "${CMAKE_SOURCE_DIR}/preinst")
set(CPACK_RPM_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_POST_INSTALL_SCRIPT_FILE "${CMAKE_SOURCE_DIR}/postinst")
set(CPACK_RPM_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PRE_UNINSTALL_SCRIPT_FILE "${CMAKE_SOURCE_DIR}/prerm")
set(CPACK_RPM_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_PROVIDES "irods")
set(CPACK_RPM_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_CONFLICTS "eirods")
set(CPACK_RPM_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_OBSOLETES "irods-icat, irods-resource")
