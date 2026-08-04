extern Txt KNewCase__ID;
extern Txt Kdpi;
extern Txt Kformat;
extern Txt Kimage;
extern Txt Klevel;
extern Txt Kmargin;
extern Txt Kmode;
extern Txt Ksize;
extern Txt Kversion;
extern Txt kpyuy1gHV1Hs;
extern unsigned char D_proc_TEST_2EgetCaseQRCode[];
void proc_TEST_2EgetCaseQRCode( Asm4d_globals *glob, tProcessGlobals *ctx, int32_t inNbExplicitParam, int32_t inNbParam, PCV inParams[], CV *outResult)
{
	CallChain c(ctx,D_proc_TEST_2EgetCaseQRCode);
	if (!ctx->doingAbort && c.f.fLine==0) {
		Obj lbarcode;
		Long lmargin;
		Obj lparams;
		Pic limage;
		Long ldpi;
		Long lsize;
		Long lversion;
		new ( outResult) Pic();
		lversion=2;
		lsize=64;
		lmargin=1;
		ldpi=96;
		{
			Obj t0;
			c.f.fLine=15;
			if (g->Call(ctx,(PCV[]){t0.cv()},0,1471)) goto _0;
			g->Check(ctx);
			lbarcode=t0.get();
		}
		{
			Obj t1;
			c.f.fLine=16;
			if (g->Call(ctx,(PCV[]){t1.cv()},0,1471)) goto _0;
			g->Check(ctx);
			lparams=t1.get();
		}
		c.f.fLine=17;
		if (g->SetMember(ctx,lparams.cv(),Kdpi.cv(),ldpi.cv())) goto _0;
		c.f.fLine=18;
		if (g->SetMember(ctx,lparams.cv(),Kmargin.cv(),lmargin.cv())) goto _0;
		c.f.fLine=19;
		if (g->SetMember(ctx,lparams.cv(),Ksize.cv(),lsize.cv())) goto _0;
		c.f.fLine=20;
		if (g->SetMember(ctx,lparams.cv(),Kversion.cv(),lversion.cv())) goto _0;
		c.f.fLine=21;
		if (g->SetMember(ctx,lparams.cv(),Kformat.cv(),Long(1).cv())) goto _0;
		c.f.fLine=22;
		if (g->SetMember(ctx,lparams.cv(),Kmode.cv(),Long(0).cv())) goto _0;
		c.f.fLine=23;
		if (g->SetMember(ctx,lparams.cv(),Klevel.cv(),Long(3).cv())) goto _0;
		{
			Bool t2;
			t2=ctx->withAssert;
			if (!(t2.get())) goto _2;
		}
		{
			Obj t3;
			c.f.fLine=25;
			if (g->Call(ctx,(PCV[]){t3.cv()},0,1470)) goto _0;
			Bool t4;
			t4=!t3.isNull();
			Bool t5;
			t5=t4.get();
			if (g->Call(ctx,(PCV[]){nullptr,t5.cv(),kpyuy1gHV1Hs.cv()},2,1129)) goto _0;
			g->Check(ctx);
		}
_2:
		{
			Obj t6;
			c.f.fLine=26;
			if (g->Call(ctx,(PCV[]){t6.cv()},0,1470)) goto _0;
			Variant t7;
			if (g->Call(ctx,(PCV[]){t7.cv(),t6.cv(),KNewCase__ID.cv(),Long(11).cv()},3,1496)) goto _0;
			g->Check(ctx);
			Obj t8;
			t8=lparams.get();
			Txt t9;
			if (!g->GetValue(ctx,(PCV[]){t9.cv(),t7.cv(),nullptr})) goto _0;
			Obj t10;
			if (g->CallPlugin(ctx,(PCV[]){Ref(1,1).cv(),t10.cv(),t9.cv(),nullptr,(CV*)33,t8.cv(),lparams.cv(),(CV*)38},2)) goto _0;
			lbarcode=t10.get();
		}
		{
			Variant t11;
			c.f.fLine=28;
			if (g->GetMember(ctx,lbarcode.cv(),Kimage.cv(),t11.cv())) goto _0;
			Pic t12;
			if (!g->GetValue(ctx,(PCV[]){t12.cv(),t11.cv(),nullptr})) goto _0;
			Res<Pic>(outResult)=t12.get();
		}
_0:
_1:
;
	}

}
extern Txt KNewCase__ID;
extern unsigned char D_proc_TEST_3Aconstructor[];
void proc_TEST_3Aconstructor( Asm4d_globals *glob, tProcessGlobals *ctx, int32_t inNbExplicitParam, int32_t inNbParam, PCV inParams[], CV *outResult)
{
	CallChain c(ctx,D_proc_TEST_3Aconstructor);
	if (!ctx->doingAbort && c.f.fLine==0) {
		{
			Obj t0;
			c.f.fLine=2;
			if (g->Call(ctx,(PCV[]){t0.cv()},0,1470)) goto _0;
			Txt t1;
			if (g->Call(ctx,(PCV[]){t1.cv()},0,1066)) goto _0;
			g->Check(ctx);
			if (g->Call(ctx,(PCV[]){nullptr,t0.cv(),KNewCase__ID.cv(),t1.cv(),Long(11).cv()},4,1497)) goto _0;
		}
_0:
_1:
;
	}

}
