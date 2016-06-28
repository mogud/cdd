/** \file
 * \brief NativeWindow driver
 *
 * See Copyright Notice in cd.h
 */

module cd.native;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextNativeWindow();

alias CD_NATIVEWINDOW = cdContextNativeWindow;

void cdGetScreenSize(int *width, int *height, double *width_mm, double *height_mm);
int cdGetScreenColorPlanes();

