/** \file
 * \brief Double Buffer driver
 *
 * See Copyright Notice in cd.h
 */

module cd.dbuf;

import cd.cd;

extern (C) @safe nothrow:

cdContext* cdContextDBuffer();

alias CD_DBUFFER = cdContextDBuffer;

