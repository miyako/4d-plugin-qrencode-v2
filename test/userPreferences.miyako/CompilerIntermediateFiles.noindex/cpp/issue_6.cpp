extern Txt KTable__1;
extern Txt KgetCaseQRCode;
extern Txt Knew;
extern Txt KshowClipboard;
extern unsigned char D_proc_ISSUE__6[];
void proc_ISSUE__6( Asm4d_globals *glob, tProcessGlobals *ctx, int32_t inNbExplicitParam, int32_t inNbParam, PCV inParams[], CV *outResult)
{
	CallChain c(ctx,D_proc_ISSUE__6);
	if (!ctx->doingAbort && c.f.fLine==0) {
		Pic lqrcode;
		Obj lTEST;
		{
			Obj t0;
			c.f.fLine=2;
			if (g->Call(ctx,(PCV[]){t0.cv()},0,1482)) goto _0;
			Variant t1;
			if (g->Call(ctx,(PCV[]){t1.cv(),t0.cv(),KTable__1.cv(),Long(56).cv()},3,1496)) goto _0;
			g->Check(ctx);
			Variant t2;
			if (g->Call(ctx,(PCV[]){t2.cv(),t1.cv(),Knew.cv()},2,1498)) goto _0;
			Obj t3;
			if (!g->GetValue(ctx,(PCV[]){t3.cv(),t2.cv(),nullptr})) goto _0;
			lTEST=t3.get();
		}
		{
			Variant t4;
			c.f.fLine=5;
			if (g->Call(ctx,(PCV[]){t4.cv(),lTEST.cv(),KgetCaseQRCode.cv()},2,1498)) goto _0;
			g->Check(ctx);
			Pic t5;
			if (!g->GetValue(ctx,(PCV[]){t5.cv(),t4.cv(),nullptr})) goto _0;
			lqrcode=t5.get();
		}
		c.f.fLine=7;
		if (g->Call(ctx,(PCV[]){nullptr,KshowClipboard.cv()},1,1439)) goto _0;
		g->Check(ctx);
		{
			Ref t6;
			t6.setLocalRef(ctx,lqrcode.cv());
			c.f.fLine=8;
			if (g->Call(ctx,(PCV[]){nullptr,t6.cv()},1,521)) goto _0;
			g->Check(ctx);
		}
_0:
_1:
;
	}

}
