/** \file
 * \brief Server Image driver
 *
 * See Copyright Notice in cd.h
 */

module cd.image;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextImage();

alias CD_IMAGE = cdContextImage;

