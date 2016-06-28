/** \file
 * \brief CD Metafile driver
 *
 * See Copyright Notice in cd.h
 */

module cd.mf;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextMetafile();

alias CD_METAFILE = cdContextMetafile;



