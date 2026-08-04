extern Txt KNewCase__ID;
extern Txt Kdpi;
extern Txt Kformat;
extern Txt Kimage;
extern Txt Klevel;
extern Txt Kmargin;
extern Txt Kmode;
extern Txt Ksize;
extern Txt Kversion;
extern Txt keWUx1bw9RaA;
extern unsigned char D_proc_Table__1Entity_2EgetCaseQRCode[];
void proc_Table__1Entity_2EgetCaseQRCode( Asm4d_globals *glob, tProcessGlobals *ctx, int32_t inNbExplicitParam, int32_t inNbParam, PCV inParams[], CV *outResult)
{
	CallChain c(ctx,D_proc_Table__1Entity_2EgetCaseQRCode);
	if (!ctx->doingAbort && c.f.fLine==0) {
		Pic limage;
		Obj lparams;
		Obj lbarcode;
		Long ldpi;
		Long lmargin;
		Long lsize;
		Long lversion;
		new ( outResult) Pic();
		if (!(Bool(0).get())) goto _2;
		c.f.fLine=3;
		if (g->Call(ctx,(PCV[]){nullptr,keWUx1bw9RaA.cv()},1,523)) goto _0;
		g->Check(ctx);
_2:
		lversion=2;
		lsize=64;
		lmargin=1;
		ldpi=96;
		{
			Obj t0;
			c.f.fLine=19;
			if (g->Call(ctx,(PCV[]){t0.cv()},0,1471)) goto _0;
			g->Check(ctx);
			lbarcode=t0.get();
		}
		{
			Obj t1;
			c.f.fLine=20;
			if (g->Call(ctx,(PCV[]){t1.cv()},0,1471)) goto _0;
			g->Check(ctx);
			lparams=t1.get();
		}
		c.f.fLine=21;
		if (g->SetMember(ctx,lparams.cv(),Kdpi.cv(),ldpi.cv())) goto _0;
		c.f.fLine=22;
		if (g->SetMember(ctx,lparams.cv(),Kmargin.cv(),lmargin.cv())) goto _0;
		c.f.fLine=23;
		if (g->SetMember(ctx,lparams.cv(),Ksize.cv(),lsize.cv())) goto _0;
		c.f.fLine=24;
		if (g->SetMember(ctx,lparams.cv(),Kversion.cv(),lversion.cv())) goto _0;
		c.f.fLine=25;
		if (g->SetMember(ctx,lparams.cv(),Kformat.cv(),Long(1).cv())) goto _0;
		c.f.fLine=26;
		if (g->SetMember(ctx,lparams.cv(),Kmode.cv(),Long(0).cv())) goto _0;
		c.f.fLine=27;
		if (g->SetMember(ctx,lparams.cv(),Klevel.cv(),Long(3).cv())) goto _0;
		{
			Obj t2;
			c.f.fLine=29;
			if (g->Call(ctx,(PCV[]){t2.cv()},0,1470)) goto _0;
			Variant t3;
			if (g->GetMember(ctx,t2.cv(),KNewCase__ID.cv(),t3.cv())) goto _0;
			Obj t4;
			t4=lparams.get();
			Txt t5;
			if (!g->GetValue(ctx,(PCV[]){t5.cv(),t3.cv(),nullptr})) goto _0;
			Obj t6;
			if (g->CallPlugin(ctx,(PCV[]){Ref(1,1).cv(),t6.cv(),t5.cv(),nullptr,(CV*)33,t4.cv(),lparams.cv(),(CV*)38},2)) goto _0;
			g->Check(ctx);
			lbarcode=t6.get();
		}
		{
			Variant t7;
			c.f.fLine=30;
			if (g->GetMember(ctx,lbarcode.cv(),Kimage.cv(),t7.cv())) goto _0;
			Pic t8;
			if (!g->GetValue(ctx,(PCV[]){t8.cv(),t7.cv(),nullptr})) goto _0;
			Res<Pic>(outResult)=t8.get();
		}
_0:
_1:
;
	}

}
extern Txt KNewCase__ID;
extern unsigned char D_proc_Table__1Entity_3Aconstructor[];
void proc_Table__1Entity_3Aconstructor( Asm4d_globals *glob, tProcessGlobals *ctx, int32_t inNbExplicitParam, int32_t inNbParam, PCV inParams[], CV *outResult)
{
	CallChain c(ctx,D_proc_Table__1Entity_3Aconstructor);
	if (!ctx->doingAbort && c.f.fLine==0) {
		{
			Obj t0;
			c.f.fLine=2;
			if (g->Call(ctx,(PCV[]){t0.cv()},0,1470)) goto _0;
			Txt t1;
			if (g->Call(ctx,(PCV[]){t1.cv()},0,1066)) goto _0;
			g->Check(ctx);
			if (g->SetMember(ctx,t0.cv(),KNewCase__ID.cv(),t1.cv())) goto _0;
		}
_0:
_1:
;
	}

}
