#include "$asm4d.h"
#include "cp4drt_shared.h"
#include "legacy_language_types.h"
Txt KNewCase__ID;
Txt KTable__1;
Txt Kdpi;
Txt Kformat;
Txt KgetCaseQRCode;
Txt Kimage;
Txt Klevel;
Txt Kmargin;
Txt Kmode;
Txt Knew;
Txt KshowClipboard;
Txt Ksize;
Txt Kversion;
Txt keWUx1bw9RaA;
Txt kpyuy1gHV1Hs;

struct Txt_info { Txt *t; const char16_t *s; size_t n;};
static const Txt_info constants[]=
{
	{&KNewCase__ID,u"NewCase_ID",10},
	{&KTable__1,u"Table_1",7},
	{&Kdpi,u"dpi",3},
	{&Kformat,u"format",6},
	{&KgetCaseQRCode,u"getCaseQRCode",13},
	{&Kimage,u"image",5},
	{&Klevel,u"level",5},
	{&Kmargin,u"margin",6},
	{&Kmode,u"mode",4},
	{&Knew,u"new",3},
	{&KshowClipboard,u"showClipboard",13},
	{&Ksize,u"size",4},
	{&Kversion,u"version",7},
	{&keWUx1bw9RaA,u"just to make this function cooperative",38},
	{&kpyuy1gHV1Hs,u"The passed case cannot be null: getCaseQRCode()",47},
	{nullptr,nullptr,0}
};

void InitConstants()
{
	for( const Txt_info *i = constants ; i->t != nullptr; ++i)
		g->AssignUniChars(i->t->cv(),i->s,i->n);
}

void DeInitConstants()
{
	for( const Txt_info *i = constants ; i->t != nullptr; ++i)
		i->t->setNull();
}
