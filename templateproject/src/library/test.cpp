//===--------------------------------------------------------------------------------*- C++ -*-===//
//                                _           _     _                    _
//                               (_)         | |   | |                  | |
//                _ __  _ __ ___  _  ___  ___| |_  | |__   ___  __ _  __| | ___ _ __
//               | '_ \| '__/ _ \| |/ _ \/ __| __| | '_ \ / _ \/ _` |/ _` |/ _ \ '__|
//               | |_) | | | (_) | |  __/ (__| |_  | | | |  __/ (_| | (_| |  __/ |
//               | .__/|_|  \___/| |\___|\___|\__| |_| |_|\___|\__,_|\__,_|\___|_|
//               | |            _/ |
//               |_|           |__/
//
//  Licence Specification.
//  See LICENSE.txt for details.
//===------------------------------------------------------------------------------------------===//
// here we see the absolute path of the libray header from a base set in CMake:
// we find all the headers under under BASE/src/[path]
#include "library/test.h"
#include "boost/program_options.hpp"
#include <iostream>

void print_world() {
  // we use boost's program_options, functionality that requires linking to boost
  boost::program_options::variables_map vm;
  std::cout << "hello world" << std::endl;
}
