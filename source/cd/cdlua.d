/** \file
 * \brief Lua Binding Control
 *
 * See Copyright Notice in cd.h
 */

module cd.lua;

import cd.cd: cdCanvas;

extern (C) @safe nothrow:

struct lua_State;

/* utilities */
cdCanvas* cdlua_getcanvas();        /* pos=1, deprecated use cdlua_checkcanvas */
cdCanvas* cdlua_checkcanvas(int pos);
void cdlua_pushcanvas(cdCanvas* canvas);

int cdlua_open(lua_State *L);
int cdlua_close(lua_State *L);

/* utilities */
cdCanvas* cdlua_getcanvas(lua_State * L); /* pos=1, deprecated use cdlua_checkcanvas */
cdCanvas* cdlua_checkcanvas(lua_State * L, int pos);
void cdlua_pushcanvas(lua_State * L, cdCanvas* canvas);

