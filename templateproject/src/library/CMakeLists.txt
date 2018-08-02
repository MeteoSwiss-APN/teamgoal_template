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

## ===-------------------------------------------------------------------------------------------===
## Create the library:
## Give it a name and pass the sources
## the library version is fetched form the project version
##
## PUBLIC_BUILD_INCLUDES should point to ${CMAKE_SOURCE_DIR}/src since we want includes
## to have absolute path's where the root in build should be 'src' and in the include 'include'
## Additionaly we need to pass other include_directories that we depend on
##
## PUBLIC_INSTALL_INCLUDES should therefore point to 'include' and all the include-directories that
## we need additionally
##
## The install destination is just the directory where the library is installed into
##
## the namespace helps to not pollute the global namespace with variables but is optional
##
## The libraries argument gets a list of libaries that need to be linked against. This is
## dependent on what you find, but find_package(boost) stores the in this specific variable
## ===-------------------------------------------------------------------------------------------===

yoda_create_library(
        TARGET PrintLib
        SOURCES test.h
                test.cpp
        VERSION ${PROJECT_VERSION}
        PUBLIC_BUILD_INCLUDES ${CMAKE_SOURCE_DIR}/src SYSTEM ${Boost_INCLUDE_DIR}
       PUBLIC_INSTALL_INCLUDES include ${Boost_INCLUDE_DIR}
        INSTALL_DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
        TARGET_NAMESPACE tp::
        LIBRARIES ${Boost_LIBRARIES}
)


## ===-------------------------------------------------------------------------------------------===
## Installing the library headers
## we need to install all the headers we find. In order for this to work properly, we need to uphold
## the convention mentioned above. we want them all to be in 'include' such that the absolute paths
## that we use find them.
## ===-------------------------------------------------------------------------------------------===
install(
  DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  DESTINATION ${CMAKE_INSTALL_PREFIX}/include
  FILES_MATCHING PATTERN "*.h" PATTERN "*.inc" PATTERN "*.hpp"
)
