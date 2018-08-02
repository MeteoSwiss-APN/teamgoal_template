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

## ===-------------------------------------------------------------------------------------------===
## Specification of the Build Type
## ===-------------------------------------------------------------------------------------------===
cmake_minimum_required(VERSION 3.3)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING 
      "Choose the type of build, options are: Debug Release RelWithDebInfo." FORCE)
endif()

if(NOT CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/install" CACHE STRING
      "Install path prefix, prepended onto install directories." FORCE)
endif()


## ===-------------------------------------------------------------------------------------------===
## Project initialization
## ===-------------------------------------------------------------------------------------------===
project(dependentProject VERSION 0.1 LANGUAGES CXX)


## ===-------------------------------------------------------------------------------------------===
## We store project-specific cmake files in {project-root}/cmake
## Examples for this are project-option files
## Also the template for the confilg file is in {project-root}/cmake/templates
## ===-------------------------------------------------------------------------------------------===
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

## ===-------------------------------------------------------------------------------------------===
## Setup of Yoda
## ===-------------------------------------------------------------------------------------------===
if(NOT(DEFINED YODA_ROOT))
  message(FATAL_ERROR "YODA_ROOT not found! Try specifying it in the environment via -DYODA_ROOT=<>")
endif()

## We use the functionality provided in {yoda}/cmake
list(APPEND CMAKE_MODULE_PATH "${YODA_ROOT}/cmake")

## load all the funciton calls that we need
include(yodaAddTargetCleanAll)
include(yodaInit)
include(yodaCreatePackageString)



## Initialize yoda
yoda_init()

# Add custom targets
yoda_add_target_clean_all()

## ===-------------------------------------------------------------------------------------------===
## Include the project specific options, definitions and macros
## ===-------------------------------------------------------------------------------------------===
include(dependentProjectOptions)
include(dependentProjectMacros)

## ===-------------------------------------------------------------------------------------------===
## Report the configuration
## ===-------------------------------------------------------------------------------------------===
macro(make_config_string FIRST SECOND)
  yoda_make_string_pair(${FIRST} ": ${SECOND}" 20 out)
  list(APPEND config_info ${out})
endmacro()

make_config_string("Platform" ${YODA_PLATFORM_STRING})
make_config_string("Architecture" ${YODA_ARCHITECTURE_STRING})
make_config_string("Compiler" ${YODA_COMPILER_STRING})
make_config_string("Build type" ${CMAKE_BUILD_TYPE})

yoda_report_result("Configuration summary" ${config_info})

## ===-------------------------------------------------------------------------------------------===
## Finding an External Package within the yoda-space
## ===-------------------------------------------------------------------------------------------===
include(Addtemplateproject)

## This is for debugging: if this is turned on, we see the details about the library found
#yoda_print_target_properties(tp::PrintLibShared)


## Add the actual source where the executables are added and the libraries are created
add_subdirectory(src)

## ===-------------------------------------------------------------------------------------------===
## Create the proper projectConfig.cmake 
## ===-------------------------------------------------------------------------------------------===
dependentProject_install_config()

