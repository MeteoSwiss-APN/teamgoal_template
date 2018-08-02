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

int main(int argc, char const* argv[]) {

  // use the static library we built
  print_world();

  return 0;
}

