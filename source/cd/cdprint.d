/** \file
 * \brief Printer driver
 *
 * See Copyright Notice in cd.h
 */

module cd.print;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextPrinter();

alias CD_PRINTER = cdContextPrinter;

