/** \file
 * \brief CD Picture driver
 *
 * See Copyright Notice in cd.h
 */

module cd.picture;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextPicture();

alias CD_PICTURE = cdContextPicture;
