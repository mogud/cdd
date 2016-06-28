/** \file
 * \brief IUP Canvas Lua Binding
 *
 * See Copyright Notice in cd.h
 */

module cd.luaiup;

extern (C) @safe nothrow:

struct lua_State;

int cdluaiup_open(lua_State *L);


