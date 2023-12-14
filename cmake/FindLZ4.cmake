# Copyright (c) 2023, ETH Zurich and UNC Chapel Hill.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#
#     * Neither the name of ETH Zurich and UNC Chapel Hill nor the names of
#       its contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.


# Find package module for LZ4 library.
#
# The following variables are set by this module:
#
#   LZ4_FOUND: TRUE if LZ4 is found.
#   LZ4_INCLUDE_DIRS: Include directories for LZ4.
#   LZ4_LIBRARIES: Libraries required to link LZ4.
#
# The following variables control the behavior of this module:
#
# LZ4_INCLUDE_DIR_HINTS: List of additional directories in which to
#                              search for LZ4 includes.
# LZ4_LIBRARY_DIR_HINTS: List of additional directories in which to
#                              search for LZ4 libraries.
find_path(LZ4_INCLUDE_DIR
  NAMES lz4.h
  DOC "lz4 include directory")
mark_as_advanced(LZ4_INCLUDE_DIR)
find_library(LZ4_LIBRARY
  NAMES lz4 liblz4
  DOC "lz4 library")
mark_as_advanced(LZ4_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LZ4
  REQUIRED_VARS LZ4_LIBRARY LZ4_INCLUDE_DIR)

if(LZ4_FOUND)
    set(LZ4_INCLUDE_DIRS "${LZ4_INCLUDE_DIR}")
    set(LZ4_LIBRARIES "${LZ4_LIBRARY}")
    message(STATUS "Found LZ4")
    message(STATUS "  Includes : ${LZ4_INCLUDE_DIRS}")
    message(STATUS "  Libraries : ${LZ4_LIBRARIES}")
else()
    if(LZ4_FIND_REQUIRED)
        message(FATAL_ERROR "Could not find LZ4")
    endif()
endif()

add_library(lz4 INTERFACE IMPORTED)
target_include_directories(
    lz4 INTERFACE ${LZ4_INCLUDE_DIRS})
target_link_libraries(
    lz4 INTERFACE ${LZ4_LIBRARIES})
