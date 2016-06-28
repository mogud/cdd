/** \file
 * \brief Private CD declarations
 *
 * See Copyright Notice in cd.h
 */

module cd.private_;

import cd.cd;
import core.stdc.stdarg;

extern (C) @safe nothrow:

/* All context canvas must have at least the base canvas pointer. */
struct _cdCtxCanvasBase
{
  cdCanvas* canvas;
}
alias cdCtxCanvasBase = _cdCtxCanvasBase;

struct _cdCtxCanvas;
alias cdCtxCanvas = _cdCtxCanvas;
struct _cdCtxImage;
alias cdCtxImage = _cdCtxImage;

struct _cdVectorFont;
alias cdVectorFont = _cdVectorFont;
struct _cdSimulation;
alias cdSimulation = _cdSimulation;

struct _cdPoint
{
  int x, y;
}
alias cdPoint = _cdPoint;

struct _cdfPoint
{
  double x, y;
}
alias cdfPoint = _cdfPoint;

struct _cdRect
{
  int xmin, xmax, ymin, ymax;
}
alias cdRect = _cdRect;

struct _cdfRect
{
  double xmin, xmax, ymin, ymax;
}
alias cdfRect = _cdfRect;

struct _cdAttribute
{
  const(char) *name;

  /* can be NULL one of them */
  void  function(cdCtxCanvas* ctxcanvas, char* data) set;
  char*  function(cdCtxCanvas* ctxcanvas) get;
}
alias cdAttribute = _cdAttribute;

struct _cdImage
{
  int w, h;
  cdCtxImage* ctximage;

  /* can NOT be NULL */
  void    function(cdCtxCanvas* ctxcanvas, cdCtxImage* ctximage, int x, int y) cxGetImage;
  void    function(cdCtxCanvas* ctxcanvas, cdCtxImage* ctximage, int x, int y, int xmin, int xmax, int ymin, int ymax) cxPutImageRect;
  void    function(cdCtxImage* ctximage) cxKillImage;
};

struct _cdContext
{
  ulong caps;  /* canvas capabilities, combination of CD_CAP_*  */
  int type; /* context type WINDOW, DEVICE, IMAGE or FILE, combined with PLUS */

  /* can NOT be NULL */
  void   function(cdCanvas* canvas, void *data) cxCreateCanvas;
  void   function(cdCanvas* canvas) cxInitTable;

  /* can be NULL */
  int    function(cdCanvas* canvas, int xmin, int xmax, int ymin, int ymax, void *data) cxPlay;
  int    function(int cb, cdCallback func) cxRegisterCallback;
};

struct _cdCanvas
{
  char[2] signature;  /* must be "CD" */

  /* can NOT be NULL */
  void    function(cdCtxCanvas* ctxcanvas, int x, int y, long color) cxPixel;
  void    function(cdCtxCanvas* ctxcanvas, int x1, int y1, int x2, int y2) cxLine;
  void    function(cdCtxCanvas* ctxcanvas, int mode, cdPoint* points, int n) cxPoly;
  void    function(cdCtxCanvas* ctxcanvas, int xmin, int xmax, int ymin, int ymax) cxRect;
  void    function(cdCtxCanvas* ctxcanvas, int xmin, int xmax, int ymin, int ymax) cxBox;
  void    function(cdCtxCanvas* ctxcanvas, int xc, int yc, int w, int h, double angle1, double angle2) cxArc;
  void    function(cdCtxCanvas* ctxcanvas, int xc, int yc, int w, int h, double angle1, double angle2) cxSector;
  void    function(cdCtxCanvas* ctxcanvas, int xc, int yc, int w, int h, double angle1, double angle2) cxChord;
  void    function(cdCtxCanvas* ctxcanvas, int x, int y, const(char) *s, int len) cxText;
  void    function(cdCtxCanvas* ctxcanvas) cxKillCanvas;
  int     function(cdCtxCanvas* ctxcanvas, const(char) *type_face, int style, int size) cxFont;
  void    function(cdCtxCanvas* ctxcanvas, int iw, int ih, const(ubyte) *index, const(long) *colors, int x, int y, int w, int h, int xmin, int xmax, int ymin, int ymax) cxPutImageRectMap;

  /* default implementation uses the simulation driver */
  void    function(cdCtxCanvas* ctxcanvas, int *max_width, int *height, int *ascent, int *descent) cxGetFontDim;
  void    function(cdCtxCanvas* ctxcanvas, const(char) *s, int len, int *width, int *height) cxGetTextSize;

  /* all the following function pointers can be NULL */

  void    function(cdCtxCanvas* ctxcanvas) cxFlush;
  void    function(cdCtxCanvas* ctxcanvas) cxClear;

  void    function(cdCtxCanvas* ctxcanvas, double x, double y, long color) cxFPixel;
  void    function(cdCtxCanvas* ctxcanvas, double x1, double y1, double x2, double y2) cxFLine;
  void    function(cdCtxCanvas* ctxcanvas, int mode, cdfPoint* points, int n) cxFPoly;
  void    function(cdCtxCanvas* ctxcanvas, double xmin, double xmax, double ymin, double ymax) cxFRect;
  void    function(cdCtxCanvas* ctxcanvas, double xmin, double xmax, double ymin, double ymax) cxFBox;
  void    function(cdCtxCanvas* ctxcanvas, double xc, double yc, double w, double h, double angle1, double angle2) cxFArc;
  void    function(cdCtxCanvas* ctxcanvas, double xc, double yc, double w, double h, double angle1, double angle2) cxFSector;
  void    function(cdCtxCanvas* ctxcanvas, double xc, double yc, double w, double h, double angle1, double angle2) cxFChord;
  void    function(cdCtxCanvas* ctxcanvas, double x, double y, const(char) *s, int len) cxFText;

  int     function(cdCtxCanvas* ctxcanvas, int mode) cxClip;
  void    function(cdCtxCanvas* ctxcanvas, int xmin, int xmax, int ymin, int ymax) cxClipArea;
  void    function(cdCtxCanvas* ctxcanvas, double xmin, double xmax, double ymin, double ymax) cxFClipArea;
  int     function(cdCtxCanvas* ctxcanvas, int opacity) cxBackOpacity;
  int     function(cdCtxCanvas* ctxcanvas, int mode) cxWriteMode;
  int     function(cdCtxCanvas* ctxcanvas, int style) cxLineStyle;
  int     function(cdCtxCanvas* ctxcanvas, int width) cxLineWidth;
  int     function(cdCtxCanvas* ctxcanvas, int join) cxLineJoin;
  int     function(cdCtxCanvas* ctxcanvas, int cap) cxLineCap;
  int     function(cdCtxCanvas* ctxcanvas, int style) cxInteriorStyle;
  int     function(cdCtxCanvas* ctxcanvas, int style) cxHatch;
  void    function(cdCtxCanvas* ctxcanvas, int w, int h, const(ubyte) *stipple) cxStipple;
  void    function(cdCtxCanvas* ctxcanvas, int w, int h, const(long) *pattern) cxPattern;
  int     function(cdCtxCanvas* ctxcanvas, const(char) * font) cxNativeFont;
  int     function(cdCtxCanvas* ctxcanvas, int alignment) cxTextAlignment;
  double  function(cdCtxCanvas* ctxcanvas, double angle) cxTextOrientation;
  void    function(cdCtxCanvas* ctxcanvas, int n, const(long) *palette, int mode) cxPalette;
  long    function(cdCtxCanvas* ctxcanvas, long color) cxBackground;
  long    function(cdCtxCanvas* ctxcanvas, long color) cxForeground;
  void    function(cdCtxCanvas* ctxcanvas, const(double) * matrix) cxTransform;

  void    function(cdCtxCanvas* ctxcanvas, ubyte *r, ubyte *g, ubyte *b, int x, int y, int w, int h) cxGetImageRGB;
  void    function(cdCtxCanvas* ctxcanvas, int iw, int ih, const(ubyte) *r, const(ubyte) *g, const(ubyte) *b, int x, int y, int w, int h, int xmin, int xmax, int ymin, int ymax) cxPutImageRectRGB;
  void    function(cdCtxCanvas* ctxcanvas, int iw, int ih, const(ubyte) *r, const(ubyte) *g, const(ubyte) *b, const(ubyte) *a, int x, int y, int w, int h, int xmin, int xmax, int ymin, int ymax) cxPutImageRectRGBA;

  void    function(cdCtxCanvas* ctxcanvas, int iw, int ih, const(ubyte) * r, const(ubyte) * g, const(ubyte) * b, double x, double y, double w, double h, int xmin, int xmax, int ymin, int ymax) cxFPutImageRectRGB;
  void    function(cdCtxCanvas* ctxcanvas, int iw, int ih, const(ubyte) * r, const(ubyte) * g, const(ubyte) * b, const(ubyte) * a, double x, double y, double w, double h, int xmin, int xmax, int ymin, int ymax) cxFPutImageRectRGBA;
  void    function(cdCtxCanvas* ctxcanvas, int iw, int ih, const(ubyte) * index, const(long) * colors, double x, double y, double w, double h, int xmin, int xmax, int ymin, int ymax) cxFPutImageRectMap;

  void    function(cdCtxCanvas* ctxcanvas, int xmin, int xmax, int ymin, int ymax, int dx, int dy) cxScrollArea;

  cdCtxImage*  function(cdCtxCanvas* ctxcanvas, int w, int h) cxCreateImage;
  void    function(cdCtxImage* ctximage) cxKillImage;
  void    function(cdCtxCanvas* ctxcanvas, cdCtxImage* ctximage, int x, int y) cxGetImage;
  void    function(cdCtxCanvas* ctxcanvas, cdCtxImage* ctximage, int x, int y, int xmin, int xmax, int ymin, int ymax) cxPutImageRect;

  void    function(cdCtxCanvas* ctxcanvas) cxNewRegion;
  int     function(cdCtxCanvas* ctxcanvas, int x, int y) cxIsPointInRegion;
  void    function(cdCtxCanvas* ctxcanvas, int x, int y) cxOffsetRegion;
  void    function(cdCtxCanvas* ctxcanvas, int *xmin, int *xmax, int *ymin, int *ymax) cxGetRegionBox;

  int     function(cdCtxCanvas* ctxcanvas) cxActivate;
  void    function(cdCtxCanvas* ctxcanvas) cxDeactivate;

  /* the driver must update these, when the canvas is created and
     whenever the canvas change its size or bpp. */
  int w,h;            /* size in pixels */              /****  pixel =   mm   * res  ****/
  double w_mm, h_mm;  /* size in mm */                  /****   mm   =  pixel / res  ****/
  double xres, yres;  /* resolution in pixels/mm */     /****   res  =  pixel / mm   ****/
  int bpp;            /* number of bits per pixel */
  int invert_yaxis;   /* invert Y coordinates before calling the driver,
                         used only when the native Y axis orientation is top-bottom "!(cap&CD_CAP_YAXIS)".
                         It is turned off by the driver if native transformation matrix is used. */
  double[6] matrix;
  int use_matrix;

  /* clipping attributes */
  int clip_mode;
  cdRect clip_rect;
  cdfRect clip_frect;
  int clip_poly_n;
  cdPoint* clip_poly;    /* only defined if integer polygon created, if exist clip_fpoly is NULL, and ->Poly exists */
  cdfPoint* clip_fpoly;  /* only defined if real polygon created, if exist clip_poly is NULL, and ->fPoly exists  */

  /* clipping region attributes */
  int new_region;
  int combine_mode;

  /* color attributes */
  long foreground, background;
  int back_opacity, write_mode;

  /* primitive attributes */
  int mark_type, mark_size;

  int line_style, line_width;
  int line_cap, line_join;
  int* line_dashes;
  int line_dashes_count;

  int interior_style, hatch_style;
  int fill_mode;

  char[1024] font_type_face;
  int font_style, font_size;
  int text_alignment;
  double text_orientation;
  char[1024] native_font;

  int pattern_w, pattern_h, pattern_size;
  long* pattern;
  int stipple_w, stipple_h, stipple_size;
  ubyte* stipple;

  /* origin */
  int use_origin;
  cdPoint origin;            /* both points contains the same coordinate always */
  cdfPoint forigin;

  /* last polygon */
  int poly_mode,
      poly_n,                /* current number of vertices */
      poly_size, fpoly_size; /* allocated number of vertices, only increases */
  cdPoint* poly;             /* used during an integer polygon creation */
  cdfPoint* fpoly;           /* used during an real polygon creation, only if ->cxFPoly exists */
  int use_fpoly;

  /* last path */
  int path_n,                /* current number of actions */
      path_size;             /* allocated number of actions, only increases */
  int* path;                 /* used during path creation */
  int path_arc_index;        /* used for arc */

  /* simulation flags */
  int sim_mode;

  /* WC */
  double s, sx, tx, sy, ty;   /* Transform Window -> Viewport (scale+translation)*/
  cdfRect window;             /* Window in WC */
  cdRect viewport;            /* Viewport in pixels */

  cdAttribute*[50] attrib_list;
  int attrib_n;

  cdVectorFont* vector_font;
  cdSimulation* simulation;
  cdCtxCanvas* ctxcanvas;
  cdContext* context;

  void* userdata;
};

enum{CD_BASE_WIN, CD_BASE_X, CD_BASE_GDK, CD_BASE_HAIKU};
int cdBaseDriver();

/***************/
/* attributes  */
/***************/
void cdRegisterAttribute(cdCanvas* canvas, cdAttribute* attrib);
void cdUpdateAttributes(cdCanvas* canvas);

/***************/
/* vector font */
/***************/
cdVectorFont* cdCreateVectorFont(cdCanvas* canvas);
void cdKillVectorFont(cdVectorFont* vector_font_data);

/**********/
/*   WC   */
/**********/
void wdSetDefaults(cdCanvas* canvas);

/********************/
/*   Context Plus   */
/********************/
void cdInitContextPlusList(cdContext** ctx_list);
cdContext* cdGetContextPlus(int ctx);
enum{CD_CTXPLUS_NATIVEWINDOW, CD_CTXPLUS_IMAGE, CD_CTXPLUS_DBUFFER, CD_CTXPLUS_PRINTER, CD_CTXPLUS_EMF, CD_CTXPLUS_CLIPBOARD};
enum CD_CTXPLUS_COUNT = 6;
enum CD_CTX_PLUS = 0xFF00;  /* to combine with context type */

/*************/
/* utilities */
/*************/
int cdRound(double x);
int cdCheckBoxSize(int *xmin, int *xmax, int *ymin, int *ymax);
int cdfCheckBoxSize(double *xmin, double *xmax, double *ymin, double *ymax);
void cdNormalizeLimits(int w, int h, int *xmin, int *xmax, int *ymin, int *ymax);
int cdGetFileName(const(char) * strdata, char* filename);
int cdStrEqualNoCase(const(char) * str1, const(char) * str2);
int cdStrEqualNoCasePartial(const(char) * str1, const(char) * str2);
int cdStrLineCount(const(char) * str);
char* cdStrDup(const(char) * str);
char* cdStrDupN(const(char) * str, int len);
int cdStrIsAscii(const(char) * str);
void cdSetPaperSize(int size, double *w_pt, double *h_pt);
int cdGetFontFileName(const(char) * type_face, char* filename);
int cdGetFontFileNameDefault(const(char) *type_face, int style, char* filename);
int cdGetFontFileNameSystem(const(char) *type_face, int style, char* filename);
int cdStrTmpFileName(char* filename);

void cdPoly(cdCanvas* canvas, int mode, cdPoint* points, int n);

void cdGetArcBox(int xc, int yc, int w, int h, double a1, double a2, int *xmin, int *xmax, int *ymin, int *ymax);
int cdGetArcPathF(const(cdPoint) * poly, double *xc, double *yc, double *w, double *h, double *a1, double *a2);
int cdfGetArcPath(const(cdfPoint) * poly, double *xc, double *yc, double *w, double *h, double *a1, double *a2);
int cdGetArcPath(const(cdPoint) * poly, int *xc, int *yc, int *w, int *h, double *a1, double *a2);
void cdGetArcStartEnd(int xc, int yc, int w, int h, double a1, double a2, int *x1, int *y1, int *x2, int *y2);
void cdfGetArcStartEnd(double xc, double yc, double w, double h, double a1, double a2, double *x1, double *y1, double *x2, double *y2);

pragma(inline, true) {

bool _cdCheckCanvas(T)(T _canvas) {
    return (_canvas!=NULL && (cast(ubyte*)_canvas)[0] == 'C' && (cast(ubyte*)_canvas)[1] == 'D');
}

void _cdSwapInt(T, U)(T _a, U _b) {
    int _c=_a;_a=_b;_b=_c;
}

void _cdSwapDouble(T, U)(T _a, U _b) {
    double _c=_a;_a=_b;_b=_c;
}

int _cdRound(T)(T _x) {
    return (cast(int)(_x < 0? (_x-0.5): (_x+0.5)));
}

auto _cdRotateHatch(T)(T _x) {
    return ((_x) = ((_x)<< 1) | ((_x)>>7));
}

auto _cdInvertYAxis(T, U)(T _canvas, U _y) {
    return (_canvas.h - (_y) - 1);
}

}


/******************/
/* Transformation */
/******************/
void cdMatrixTransformPoint(double* matrix, int x, int y, int *rx, int *ry);
void cdfMatrixTransformPoint(double* matrix, double x, double y, double *rx, double *ry);
void cdMatrixMultiply(const(double) * matrix, double* mul_matrix);
void cdMatrixInverse(const(double) * matrix, double* inv_matrix);
void cdfRotatePoint(cdCanvas* canvas, double x, double y, double cx, double cy, double *rx, double *ry, double sin_theta, double cos_theta);
void cdRotatePoint(cdCanvas* canvas, int x, int y, int cx, int cy, int *rx, int *ry, double sin_teta, double cos_teta);
void cdRotatePointY(cdCanvas* canvas, int x, int y, int cx, int cy, int *ry, double sin_theta, double cos_theta);
void cdfRotatePointY(cdCanvas* canvas, double x, double y, double cx, double cy, double *ry, double sin_theta, double cos_theta);
void cdTextTranslatePoint(cdCanvas* canvas, int x, int y, int w, int h, int baseline, int *rx, int *ry);
void cdfTextTranslatePoint(cdCanvas* canvas, double x, double y, int w, int h, int baseline, double *rx, double *ry);
void cdMovePoint(int *x, int *y, double dx, double dy, double sin_theta, double cos_theta);
void cdfMovePoint(double *x, double *y, double dx, double dy, double sin_theta, double cos_theta);

/*************/
/*   Fonts   */
/*************/
int cdParsePangoFont(const(char) *nativefont, char *type_face, int *style, int *size);
int cdParseIupWinFont(const(char) *nativefont, char *type_face, int *style, int *size);
int cdParseXWinFont(const(char) *nativefont, char *type_face, int *style, int *size);
int cdGetFontSizePixels(cdCanvas* canvas, int size);
int cdGetFontSizePoints(cdCanvas* canvas, int size);

/* Replacements for Font using estimation */
/* cdfontex.c */
void cdgetfontdimEX(cdCtxCanvas* ctxcanvas, int *max_width, int *height, int *ascent, int *descent);
void cdgettextsizeEX(cdCtxCanvas* ctxcanvas, const(char) *s, int len, int *width, int *height);

/****************/
/*  For Images  */
/****************/
ubyte cdZeroOrderInterpolation(int width, int height, const(ubyte) *map, double xl, double yl);
ubyte cdBilinearInterpolation(int width, int height, const(ubyte) *map, double xl, double yl);
void cdImageRGBInitInverseTransform(int w, int h, int xmin, int xmax, int ymin, int ymax, double *xfactor, double *yfactor, const(double) * matrix, double* inv_matrix);
void cdImageRGBInverseTransform(int t_x, int t_y, double *i_x, double *i_y, double xfactor, double yfactor, int xmin, int ymin, int x, int y, double *inv_matrix);
void cdImageRGBCalcDstLimits(cdCanvas* canvas, int x, int y, int w, int h, int *xmin, int *xmax, int *ymin, int *ymax, int* rect);
void cdRGB2Gray(int width, int height, const(ubyte) * red, const(ubyte) * green, const(ubyte) * blue, ubyte* index, long *color);

pragma(inline, true) {
    ubyte CD_ALPHA_BLEND(T, U, V)(T _src, U _dst, V _alpha) {
        return cast(ubyte)(((_src) * (_alpha) + (_dst) * (255 - (_alpha))) / 255);
    }
}

int* cdGetZoomTable(int w, int rw, int xmin);
int cdCalcZoom(int canvas_size, int cnv_rect_pos, int cnv_rect_size,
               int *new_cnv_rect_pos, int *new_cnv_rect_size,
               int img_rect_pos, int img_rect_size,
               int *new_img_rect_pos, int *new_img_rect_size, int is_horizontal);

/**************/
/* simulation */
/**************/

/* sim.c */
/* simulation base driver. */
cdSimulation* cdCreateSimulation(cdCanvas* canvas);
void cdKillSimulation(cdSimulation* simulation);
void cdSimulationInitText(cdSimulation* simulation);

/* sim_text.c */
/* Replacements for Text and Font using FreeType library */
void cdSimulationText(cdCtxCanvas* ctxcanvas, int x, int y, const(char) *s, int len);
int  cdSimulationFont(cdCtxCanvas* ctxcanvas, const(char) *type_face, int style, int size);
void cdSimulationGetFontDim(cdCtxCanvas* ctxcanvas, int *max_width, int *height, int *ascent, int *descent);
void cdSimulationGetTextSize(cdCtxCanvas* ctxcanvas, const(char) *s, int len, int *width, int *height);

/* sim_linepolyfill.c */
void cdfSimulationPoly(cdCtxCanvas* ctxcanvas, int mode, cdfPoint* fpoly, int n);
void cdSimulationPoly(cdCtxCanvas* ctxcanvas, int mode, cdPoint* poly, int n);

/* sim_primitives.c */
/* Simulation functions that are >> independent << of the simulation base driver. */

void cdSimMark(cdCanvas* canvas, int x, int y);
void cdfSimMark(cdCanvas* canvas, double x, double y);
void cdSimPutImageRectRGBA(cdCanvas* canvas, int iw, int ih, const(ubyte) *r, const(ubyte) *g, const(ubyte) *b, const(ubyte) *a, int x, int y, int w, int h, int xmin, int xmax, int ymin, int ymax);
void cdSimPutImageRectRGB(cdCanvas* canvas, int iw, int ih, const(ubyte) *r, const(ubyte) *g, const(ubyte) *b, int x, int y, int w, int h, int xmin, int xmax, int ymin, int ymax);
void cdfSimPutImageRectRGB(cdCanvas* canvas, int iw, int ih, const(ubyte) *r, const(ubyte) *g, const(ubyte) *b, double x, double y, double w, double h, int xmin, int xmax, int ymin, int ymax);
void cdfSimPutImageRectRGBA(cdCanvas* canvas, int iw, int ih, const(ubyte) *r, const(ubyte) *g, const(ubyte) *b, const(ubyte) *a, double x, double y, double w, double h, int xmin, int xmax, int ymin, int ymax);

/* All these use cdPoly. */
void cdSimLine(cdCtxCanvas* ctxcanvas, int x1, int y1, int x2, int y2);
void cdSimRect(cdCtxCanvas* ctxcanvas, int xmin, int xmax, int ymin, int ymax);
void cdSimBox(cdCtxCanvas* ctxcanvas, int xmin, int xmax, int ymin, int ymax);
void cdSimArc(cdCtxCanvas* ctxcanvas, int xc, int yc, int width, int height, double angle1, double angle2);
void cdSimSector(cdCtxCanvas* ctxcanvas, int xc, int yc, int width, int height, double angle1, double angle2);
void cdSimChord(cdCtxCanvas* ctxcanvas, int xc, int yc, int width, int height, double angle1, double angle2);
void cdSimPolyBezier(cdCanvas* canvas, const(cdPoint) * points, int n);
void cdSimPolyPath(cdCanvas* canvas, const(cdPoint) * points, int n);

/* All these use the polygon method ->cxFPoly only. */
/* can be used only by drivers that implement cxFPoly */
void cdfSimLine(cdCtxCanvas* ctxcanvas, double x1, double y1, double x2, double y2);
void cdfSimRect(cdCtxCanvas *ctxcanvas, double xmin, double xmax, double ymin, double ymax);
void cdfSimBox(cdCtxCanvas *ctxcanvas, double xmin, double xmax, double ymin, double ymax);
void cdfSimArc(cdCtxCanvas *ctxcanvas, double xc, double yc, double width, double height, double angle1, double angle2);
void cdfSimSector(cdCtxCanvas *ctxcanvas, double xc, double yc, double width, double height, double angle1, double angle2);
void cdfSimChord(cdCtxCanvas *ctxcanvas, double xc, double yc, double width, double height, double angle1, double angle2);
void cdfSimPolyBezier(cdCanvas* canvas, const(cdfPoint) * points, int n);
void cdfSimPolyPath(cdCanvas* canvas, const(cdfPoint) * points, int n);

