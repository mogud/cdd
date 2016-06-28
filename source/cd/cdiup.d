/** \file
 * \brief IUP driver
 *
 * See Copyright Notice in cd.h
 */

module cd.iup;

import cd.cd: cdContext;

extern (C) @safe nothrow:

/* NOTICE: implemented done in IUP at the IUPCD library.
   Only this files is at the CD files. */

cdContext* cdContextIup();
cdContext* cdContextIupDBuffer();
cdContext* cdContextIupDBufferRGB();

alias CD_IUP           = cdContextIup;
alias CD_IUPDBUFFER    = cdContextIupDBuffer;
alias CD_IUPDBUFFERRGB = cdContextIupDBufferRGB;

