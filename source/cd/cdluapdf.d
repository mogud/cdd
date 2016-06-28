/** \file
 * \brief PDF Canvas Lua Binding
 *
 * See Copyright Notice in cd.h
 */

module cd.luapdf;

extern (C) @safe nothrow:

struct lua_State;

int cdluapdf_open(lua_State *L);

