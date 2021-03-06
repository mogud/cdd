/** \file
 * \brief IMAGERGB driver
 *
 * See Copyright Notice in cd.h
 */

module cd.irgb;

import cd.cd: cdContext, cdCanvas;

extern (C) @safe nothrow:

cdContext* cdContextImageRGB();
cdContext* cdContextDBufferRGB();

alias CD_IMAGERGB = cdContextImageRGB;
alias CD_DBUFFERRGB = cdContextDBufferRGB;

/* DEPRECATED functions, use REDIMAGE, GREENIMAGE,
   BLUEIMAGE, and ALPHAIMAGE attributes. */
ubyte* cdRedImage(cdCanvas* cnv);
ubyte* cdGreenImage(cdCanvas* cnv);
ubyte* cdBlueImage(cdCanvas* cnv);
ubyte* cdAlphaImage(cdCanvas* cnv);

