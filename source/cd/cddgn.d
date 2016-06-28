/** \file
 * \brief DGN driver
 *
 * See Copyright Notice in cd.h
 */

module cd.dgn;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextDGN();

alias CD_DGN = cdContextDGN;

