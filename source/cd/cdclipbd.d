/** \file
 * \brief Clipboard driver
 *
 * See Copyright Notice in cd.h
 */

module cd.clipbd;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextClipboard();

alias CD_CLIPBOARD = cdContextClipboard;

