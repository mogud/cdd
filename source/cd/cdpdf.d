/** \file
 * \brief PDF driver
 *
 * See Copyright Notice in cd.h
 */

module cd.pdf;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextPDF();

alias CD_PDF = cdContextPDF;

