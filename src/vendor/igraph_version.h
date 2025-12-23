/*
   igraph library.
   Copyright (C) 2010-2025  The igraph development team <igraph@igraph.org>

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

#ifndef IGRAPH_VERSION_H
#define IGRAPH_VERSION_H

#include "igraph_decls.h"

IGRAPH_BEGIN_C_DECLS

#define IGRAPH_VERSION "1.0.0-50-g0cbd25a2e"
#define IGRAPH_VERSION_MAJOR 1
#define IGRAPH_VERSION_MINOR 0
#define IGRAPH_VERSION_PATCH 0
#define IGRAPH_VERSION_PRERELEASE "50-g0cbd25a2e"

IGRAPH_EXPORT void igraph_version(const char **version_string,
                                  int *major,
                                  int *minor,
                                  int *patch);

IGRAPH_END_C_DECLS

#endif
