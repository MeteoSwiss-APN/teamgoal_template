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

include(yodaExportOptions)


## Setup of one dummy option
option(TEMPLATEPROJECT_USE_GOOD_CMAKE_WITH_YODA "a useful comment" ON)


## The option we set is passed to the dependent project
yoda_export_options(templateproject
	TEMPLATEPROJECT_USE_GOOD_CMAKE_WITH_YODA
)
