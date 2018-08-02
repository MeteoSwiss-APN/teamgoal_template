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
include(CMakeParseArguments)

# initialize_yoda
# ----------------------------
# 
# This will make sure that yoda exists and, if not, will clone the branch BRANCH
# from the git repository. It sets SOURCE_DUR to where yoda is.
# If YODA_ROOT is set, it uses the exisiting one
# 
#    BRANCH:STRING=<>      - Do we use the system version of the package?
#    VAR_SOURCE_DIR:STRING - Output variable that will be set to the path where repository was cloned
# 
function(initialize_yoda)
  set(options)
  set(one_value_args BRANCH SOURCE_DIR)
  set(multi_value_args)
  cmake_parse_arguments(ARG "${options}" "${one_value_args}" "${multi_value_args}" ${ARGN})

    if(NOT(${YODA_ROOT} STREQUAL ""))
      message("Using predefined yoda")
      set("${ARG_SOURCE_DIR}" "${YODA_ROOT}" PARENT_SCOPE)
    else()

      if(NOT("${ARG_UNPARSED_ARGUMENTS}" STREQUAL ""))
        message(FATAL_ERROR "invalid argument ${ARG_UNPARSED_ARGUMENTS}")
      endif()

      if(NOT(DEFINED ARG_SOURCE_DIR))
        message(FATAL_ERROR "SOURCE_DIR not specified")
      endif()


      set(upper_name YODA)
      set(source_dir "${CMAKE_SOURCE_DIR}/yoda")

      # Check if repository exists
      if(EXISTS "${source_dir}")
        set("${ARG_SOURCE_DIR}" "${source_dir}" PARENT_SCOPE)
        message(STATUS "Setting path to yoda in: ${source_dir}}")
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
        message(STATUS "Cloning yoda from git: https:///github.com/Meteoswiss-APN/yoda.git ...")
        run_git("clone" "https:///github.com/Meteoswiss-APN/yoda.git" "--branch=${ARG_BRANCH}" ${source_dir})
        message(STATUS "Successfully cloned yoda")

        set("${ARG_SOURCE_DIR}" "${source_dir}" PARENT_SCOPE)
      endif()
    endif()
endfunction()


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
