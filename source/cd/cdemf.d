/** \file
 * \brief EMF driver
 *
 * See Copyright Notice in cd.h
 */

module cd.emf;

import cd.cd: cdContext;

extern (C) @safe nothrow:

cdContext* cdContextEMF();

alias CD_EMF = cdContextEMF;

