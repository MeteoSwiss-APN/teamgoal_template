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

include(yodaExportOptions)


## Setup of one dummy option
option(DEPENDENT_PROJECT_OPTION "a useful comment" ${TEMPLATEPROJECT_USE_GOOD_CMAKE})


yoda_export_options(dependentProject
        DEPENDENT_PROJECT_OPTION
)
