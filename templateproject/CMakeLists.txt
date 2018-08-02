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
project(templateproject VERSION 0.1 LANGUAGES CXX)


## ===-------------------------------------------------------------------------------------------===
## We store project-specific cmake files in {project-root}/cmake
## Examples for this are project-option files
## Also the template for the confilg file is in {project-root}/cmake/templates
## ===-------------------------------------------------------------------------------------------===
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

## ===-------------------------------------------------------------------------------------------===
## Setup of Yoda
## ===------------------------------------------------------------------------------------------===
include(initializeYoda)
initialize_yoda(BRANCH "master" SOURCE_DIR TESTPROJECT_YODA_SOURCE_DIR)

## We use the functionality provided in {yoda}/cmake
list(APPEND CMAKE_MODULE_PATH "${TESTPROJECT_YODA_SOURCE_DIR}/cmake")

## load all the funciton calls that we need
include(yodaInit)
include(yodaAddTargetCleanAll)

## Initialize yoda
yoda_init()

# Add custom targets
yoda_add_target_clean_all()




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
## Include the project specific options, definitions and macros
## ===-------------------------------------------------------------------------------------------===
include(templateprojectOptions)
include(templateprojectMacros)

## ===-------------------------------------------------------------------------------------------===
## Finding an External Package, this example requires program_options from boost
## ===-------------------------------------------------------------------------------------------===
find_package(Boost 1.65 REQUIRED COMPONENTS program_options)


# Output summary of the packages
yoda_report_result("Package summary" ${package_info})


## A C++ Specific thing, we need positionally independent code
set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC" )

## Add the actual source where the executables are added and the libraries are created
add_subdirectory(src)


## ===-------------------------------------------------------------------------------------------===
## Create the proper projectConfig.cmake from the template
## ===-------------------------------------------------------------------------------------------===
templateproject_install_config()



