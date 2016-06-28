/** \file
 * \brief CD Metafile driver private declarations
 *
 * See Copyright Notice in cd.h
 */

module cd.mf_private;

import cd.cd: cdCanvas;

extern (C) @safe nothrow:

/* public part of the internal cdCtxCanvas */
struct cdCanvasMF
{
  cdCanvas* canvas;
  char* filename;
  void* data;
}

void cdcreatecanvasMF(cdCanvas *canvas, void *data);
void cdinittableMF(cdCanvas* canvas);
void cdkillcanvasMF(cdCanvasMF *mfcanvas);


