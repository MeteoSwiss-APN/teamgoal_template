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

include(yodaExportPackage)

find_package(templateproject NO_MODULE REQUIRED)

yoda_export_package(
  NAME templateproject
  FOUND ${templateproject_FOUND}
  VERSION "${templateproject_VERSION}" 
  LIBRARIES ${templateproject_STATIC_LIBRARY}
  INCLUDE_DIRS ${templateproject_INCLUDE_DIRS}
)
