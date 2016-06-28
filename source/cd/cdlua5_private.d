/** \file
* \brief Private Lua 5 Binding Functions
*
* See Copyright Notice in cd.h
*/

module cd.lua5_private;

import cd.cd;

extern (C) @safe nothrow:

struct lua_State;
struct luaL_Reg;

/* context management */

struct _cdluaCallback {
  int lock;
  const(char) * name;
  cdCallback func;
}
alias cdluaCallback = _cdluaCallback;

struct _cdluaContext {
  int id;
  const(char) * name;
  cdContext*  function() ctx;
  void*  function(lua_State* L,int param) checkdata;
  cdluaCallback* cb_list;
  int cb_n;
}
alias cdluaContext = _cdluaContext;

struct _cdluaLuaState {
  cdCanvas* void_canvas;            /* the VOID canvas to avoid a NULL active canvas */
  cdluaContext*[50] drivers;  /* store the registered drivers, map integer values to cdContext */
  int numdrivers;
}
alias cdluaLuaState = _cdluaLuaState;

/* metatables */

struct _cdluaStipple {
  ubyte* stipple;
  int width;
  int height;
  long size;
}
alias cdluaStipple = _cdluaStipple;

struct _cdluaPattern {
  long* pattern;
  int width;
  int height;
  long size;
}
alias cdluaPattern = _cdluaPattern;

/* this is the same declaration used in the IM toolkit for imPalette in Lua */
struct _cdluaPalette {
  long* color;
  int count;
}
alias cdluaPalette = _cdluaPalette;

struct _cdluaImageRGB {
  ubyte* red;
  ubyte* green;
  ubyte* blue;
  int width;
  int height;
  long size;
  int free;
}
alias cdluaImageRGB = _cdluaImageRGB;

struct _cdluaImageRGBA {
  ubyte* red;
  ubyte* green;
  ubyte* blue;
  ubyte* alpha;
  int width;
  int height;
  long size;
  int free;
}
alias cdluaImageRGBA = _cdluaImageRGBA;

struct _cdluaImageMap {
  ubyte* index;
  int width;
  int height;
  long size;
}
alias cdluaImageMap = _cdluaImageMap;

struct _cdluaImageChannel {
  ubyte* channel;
  long size;
}
alias cdluaImageChannel = _cdluaImageChannel;


cdluaLuaState* cdlua_getstate(lua_State* L);
cdluaContext* cdlua_getcontext(lua_State* L, int param);

lua_State* cdlua_getplaystate();
void cdlua_setplaystate(lua_State* L);

void cdlua_register_lib(lua_State *L, const(luaL_Reg) * funcs);
void cdlua_register_funcs(lua_State *L, const(luaL_Reg) * funcs);

void cdlua_kill_active(lua_State* L, cdCanvas* canvas);
void cdlua_open_active(lua_State* L, cdluaLuaState* cdL);

void cdlua_open_canvas(lua_State* L);

void cdlua_addcontext(lua_State* L, cdluaLuaState* cdL, cdluaContext* luactx);
void cdlua_initdrivers(lua_State* L, cdluaLuaState* cdL);

cdluaPalette* cdlua_checkpalette(lua_State* L, int param);
cdluaStipple* cdlua_checkstipple(lua_State* L, int param);
cdluaPattern* cdlua_checkpattern(lua_State* L, int param);
cdluaImageRGB* cdlua_checkimagergb(lua_State* L, int param);
cdluaImageRGBA* cdlua_checkimagergba(lua_State* L, int param);
cdluaImageMap* cdlua_checkimagemap(lua_State* L, int param);
cdluaImageChannel* cdlua_checkchannel(lua_State* L, int param);

long cdlua_checkcolor(lua_State* L, int param);
cdImage* cdlua_checkimage(lua_State* L, int param);
cdState* cdlua_checkstate(lua_State* L, int param);
cdBitmap* cdlua_checkbitmap(lua_State* L, int param);

void cdlua_pushcolor(lua_State* L, long color);
void cdlua_pushpalette(lua_State* L, long* palette, int size);
void cdlua_pushstipple(lua_State* L, ubyte* stipple, int width, int height);
void cdlua_pushpattern(lua_State* L, long* pattern, int width, int height);
void cdlua_pushimagergb(lua_State* L, ubyte* red, ubyte* green, ubyte* blue, int width, int height);
void cdlua_pushimagergba(lua_State* L, ubyte* red, ubyte* green, ubyte* blue, ubyte* alpha, int width, int height);
void cdlua_pushimagemap(lua_State* L, ubyte* index, int width, int height);
void cdlua_pushchannel(lua_State* L, ubyte* channel, int size);

void cdlua_pushimage(lua_State* L, cdImage* image);
void cdlua_pushstate(lua_State* L, cdState* state);
void cdlua_pushbitmap(lua_State* L, cdBitmap* bitmap);

void cdlua_pushimagergb_ex(lua_State* L, ubyte* red, ubyte* green, ubyte* blue, int width, int height);
void cdlua_pushimagergba_ex(lua_State* L, ubyte* red, ubyte* green, ubyte* blue, ubyte* alpha, int width, int height);
