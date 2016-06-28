/** \file
 * \brief WMF driver
 *
 * See Copyright Notice in cd.h
 */

module cd.wmf;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextWMF();

alias CD_WMF = cdContextWMF;
