/** \file
 * \brief PS driver
 *
 * See Copyright Notice in cd.h
 */

module cd.ps;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextPS();

alias CD_PS = cdContextPS;

