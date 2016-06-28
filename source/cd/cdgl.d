/** \file
* \brief OpenGL driver
*
* See Copyright Notice in cd.h
*/

module cd.gl;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextGL();

alias CD_GL = cdContextGL;

