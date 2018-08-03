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
if(NOT("${YODA_ROOT}" STREQUAL ""))
  message("Using predefined yoda")
  set(YODA_SOURCE_DIR "${YODA_ROOT}")
else()
  set(branch "master")

  set(source_dir "${CMAKE_SOURCE_DIR}/yoda")

  # Check if repository exists
  if(EXISTS "${source_dir}")
    set(YODA_SOURCE_DIR "${source_dir}")
    message(STATUS "Setting path to yoda in: ${source_dir}")
  else()
    find_program(git_executable "git")
    if(NOT(git_executable))
      message(FATAL_ERROR "ERROR: git not FOUND!")
    endif()
    mark_as_advanced(git_executable)

    macro(run_git)
      unset(result)
      unset(out_var)
      unset(error_var)
      set(cmd "${git_executable}")
      foreach(arg ${ARGN})
        set(cmd ${cmd} "${arg}")
      endforeach()

      execute_process(
        COMMAND ${cmd}
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        RESULT_VARIABLE result
        OUTPUT_VARIABLE out_var
        ERROR_VARIABLE error_var
      )

      if(NOT("${result}" STREQUAL "0"))
        string(REPLACE ";" " " cmd_str "${cmd}")
        message(FATAL_ERROR "${error_var}\n\nERROR: failed to run\n\"${cmd_str}\"\n\n${error_var}")
      endif()
    endmacro()

    # Clone repository
    ## Move to this once we have it in master
    # message(STATUS "Cloning yoda from git: https://github.com/MeteoSwiss-APN/yoda.git ...")
    # run_git("clone" "https://github.com/MeteoSwiss-APN/yoda.git" "--branch=${branch}" ${source_dir})
    message(STATUS "Cloning yoda from git: https://github.com/cosunae/yoda.git ...")
    run_git("clone" "https://github.com/cosunae/yoda.git" "--branch=create_library" ${source_dir})
    message(STATUS "Successfully cloned yoda")

    set(YODA_SOURCE_DIR "${source_dir}")
  endif()
endif()

