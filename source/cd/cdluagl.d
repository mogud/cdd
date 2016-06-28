/** \file
 * \brief OpenGL Canvas Lua Binding
 *
 * See Copyright Notice in cd.h
 */

module cd.luagl;

extern (C) @safe nothrow:

struct lua_State;

int cdluagl_open(lua_State *L);

