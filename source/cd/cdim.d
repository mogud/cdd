/** \file
 * \brief imImage driver
 *
 * See Copyright Notice in cd.h
 */

module cd.im;

import cd.cd: cdContext, cdCanvas;

extern (C) @safe nothrow:

cdContext* cdContextImImage();

alias CD_IMIMAGE = cdContextImImage;

struct imImage;

void cdCanvasPatternImImage(cdCanvas* canvas, const(imImage) * image);
void cdCanvasStippleImImage(cdCanvas* canvas, const(imImage) * image);
void cdCanvasPutImImage(cdCanvas* canvas, const(imImage) * image, int x, int y, int w, int h);
void cdCanvasGetImImage(cdCanvas* canvas, imImage* image, int x, int y);
void cdfCanvasPutImImage(cdCanvas* canvas, const(imImage) * image, double x, double y, double w, double h);
void wdCanvasPutImImage(cdCanvas* canvas, const(imImage) * image, double x, double y, double w, double h);
void wdCanvasGetImImage(cdCanvas* canvas, imImage* image, double x, double y);

