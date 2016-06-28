/** \file
 * \brief DXF driver
 *
 * See Copyright Notice in cd.h
 */

module cd.dxf;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextDXF();

alias CD_DXF = cdContextDXF;
