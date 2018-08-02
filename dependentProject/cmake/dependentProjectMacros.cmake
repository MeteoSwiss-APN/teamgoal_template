##===------------------------------------------------------------------------------*- CMake -*-===##
##             _                           _            _                     _           _
##            | |                         | |          | |                   (_)         | |
##          __| | ___ _ __   ___ _ __   __| | ___ _ __ | |_   _ __  _ __ ___  _  ___  ___| |_
##         / _` |/ _ \ '_ \ / _ \ '_ \ / _` |/ _ \ '_ \| __| | '_ \| '__/ _ \| |/ _ \/ __| __|
##        | (_| |  __/ |_) |  __/ | | | (_| |  __/ | | | |_  | |_) | | | (_) | |  __/ (__| |_
##         \__,_|\___| .__/ \___|_| |_|\__,_|\___|_| |_|\__| | .__/|_|  \___/| |\___|\___|\__|
##                   | |                                     | |            _/ |
##                   |_|                                     |_|           |__/
##
##  Licence Specification.
##  See LICENSE.txt for details.
##===------------------------------------------------------------------------------------------===##
include(CMakePackageConfigHelpers)

macro(dependentProject_install_config)
    # Export version
    write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/dependentProjectConfigVersion.cmake"
    VERSION ${templateproject_VERSION}
    COMPATIBILITY AnyNewerVersion
    )

  set(CMAKE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/cmake)


  ## Configure the [Project]Config.cmake file we want to export
  configure_package_config_file(
    ${CMAKE_SOURCE_DIR}/cmake/templates/dependentProjectConfig.cmake.in 
    ${CMAKE_CURRENT_BINARY_DIR}/cmake/dependentProjectConfig.cmake
    INSTALL_DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
    PATH_VARS 
      CMAKE_INSTALL_DIR
  )

  install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/dependentProjectConfigVersion.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/dependentProjectConfig.cmake"
    DESTINATION ${CMAKE_INSTALL_DIR}
  )
endmacro()
