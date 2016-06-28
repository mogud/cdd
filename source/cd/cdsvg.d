/** \file
 * \brief SVG driver
 *
 * See Copyright Notice in cd.h
 */

module cd.svg;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextSVG();

alias CD_SVG = cdContextSVG;

