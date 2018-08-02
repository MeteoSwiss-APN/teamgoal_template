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
add_subdirectory(library)

## in the same project, our driver depends on the library
yoda_add_executable(
	NAME driver
	SOURCES driver.cpp
	DEPENDS PrintLibStatic
	OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin
)
