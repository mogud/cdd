/** \file
 * \brief CD+IM Lua Binding
 *
 * See Copyright Notice in cd.h
 */

module cd.luaim;

extern (C) @safe nothrow:

struct lua_State;

int cdluaim_open(lua_State *L);

