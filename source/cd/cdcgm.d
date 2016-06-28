/** \file
 * \brief CGM driver
 *
 * See Copyright Notice in cd.h
 */

module cd.cgm;

import cd.cd;

extern (C) @safe nothrow:

cdContext* cdContextCGM();
alias CD_CGM = cdContextCGM;

enum CD_CGMCOUNTERCB = 1;
enum CD_CGMSCLMDECB = 2;
enum CD_CGMVDCEXTCB = 3;
enum CD_CGMBEGPICTCB = 4;
enum CD_CGMBEGPICTBCB = 5;
enum CD_CGMBEGMTFCB = 6;

/* OLD definitions, defined for backward compatibility */
enum CDPLAY_ABORT = CD_ABORT;
enum CDPLAY_GO = CD_CONTINUE;


