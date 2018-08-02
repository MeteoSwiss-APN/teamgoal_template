##===------------------------------------------------------------------------------*- CMake -*-===##
##                                _           _     _                    _           
##                               (_)         | |   | |                  | |          
##                _ __  _ __ ___  _  ___  ___| |_  | |__   ___  __ _  __| | ___ _ __ 
##               | '_ \| '__/ _ \| |/ _ \/ __| __| | '_ \ / _ \/ _` |/ _` |/ _ \ '__|
##               | |_) | | | (_) | |  __/ (__| |_  | | | |  __/ (_| | (_| |  __/ |   
##               | .__/|_|  \___/| |\___|\___|\__| |_| |_|\___|\__,_|\__,_|\___|_|   
##               | |            _/ |                                                 
##               |_|           |__/                                                  
##              
##  Licence Specification.
##  See LICENSE.txt for details.
##===------------------------------------------------------------------------------------------===##
include(CMakePackageConfigHelpers)


function(templateproject_install_config)
    # Export version
    write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/templateprojectConfigVersion.cmake"
    VERSION ${templateproject_VERSION}
    COMPATIBILITY AnyNewerVersion
    )

    set(CMAKE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/cmake)


    ## Configure the [Project]Config.cmake file we want to export
    configure_package_config_file(
    ${CMAKE_SOURCE_DIR}/cmake/templates/templateprojectConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/cmake/templateprojectConfig.cmake
    INSTALL_DESTINATION ${CMAKE_BINARY_DIR}/install
    PATH_VARS
      CMAKE_INSTALL_DIR
    )

    install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/templateprojectConfigVersion.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/templateprojectConfig.cmake"
    DESTINATION ${CMAKE_INSTALL_DIR}
    )

endfunction()
