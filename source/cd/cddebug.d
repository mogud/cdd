/** \file
 * \brief CD Debug driver
 *
 * See Copyright Notice in cd.h
 */

module cd.debug_;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextDebug();

alias CD_DEBUG = cdContextDebug;

