open Prims
exception Un_extractable 
let (uu___is_Un_extractable : Prims.exn -> Prims.bool) =
  fun projectee  ->
    match projectee with | Un_extractable  -> true | uu____8 -> false
  
let (type_leq :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlty ->
      FStar_Extraction_ML_Syntax.mlty -> Prims.bool)
  =
  fun g  ->
    fun t1  ->
      fun t2  ->
        FStar_Extraction_ML_Util.type_leq
          (FStar_Extraction_ML_Util.udelta_unfold g) t1 t2
  
let (type_leq_c :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlexpr FStar_Pervasives_Native.option ->
      FStar_Extraction_ML_Syntax.mlty ->
        FStar_Extraction_ML_Syntax.mlty ->
          (Prims.bool * FStar_Extraction_ML_Syntax.mlexpr
            FStar_Pervasives_Native.option))
  =
  fun g  ->
    fun t1  ->
      fun t2  ->
        FStar_Extraction_ML_Util.type_leq_c
          (FStar_Extraction_ML_Util.udelta_unfold g) t1 t2
  
let (eraseTypeDeep :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlty)
  =
  fun g  ->
    fun t  ->
      FStar_Extraction_ML_Util.eraseTypeDeep
        (FStar_Extraction_ML_Util.udelta_unfold g) t
  
let record_fields :
  'Auu____77 .
    FStar_Ident.ident Prims.list ->
      'Auu____77 Prims.list -> (Prims.string * 'Auu____77) Prims.list
  =
  fun fs  ->
    fun vs  ->
      FStar_List.map2 (fun f  -> fun e  -> ((f.FStar_Ident.idText), e)) fs vs
  
let fail :
  'Auu____120 .
    FStar_Range.range ->
      (FStar_Errors.raw_error * Prims.string) -> 'Auu____120
  = fun r  -> fun err  -> FStar_Errors.raise_error err r 
let err_ill_typed_application :
  'Auu____156 'Auu____157 .
    FStar_Extraction_ML_UEnv.uenv ->
      FStar_Syntax_Syntax.term ->
        FStar_Extraction_ML_Syntax.mlexpr ->
          (FStar_Syntax_Syntax.term * 'Auu____156) Prims.list ->
            FStar_Extraction_ML_Syntax.mlty -> 'Auu____157
  =
  fun env  ->
    fun t  ->
      fun mlhead  ->
        fun args  ->
          fun ty  ->
            let uu____195 =
              let uu____201 =
                let uu____203 = FStar_Syntax_Print.term_to_string t  in
                let uu____205 =
                  FStar_Extraction_ML_Code.string_of_mlexpr
                    env.FStar_Extraction_ML_UEnv.currentModule mlhead
                   in
                let uu____207 =
                  FStar_Extraction_ML_Code.string_of_mlty
                    env.FStar_Extraction_ML_UEnv.currentModule ty
                   in
                let uu____209 =
                  let uu____211 =
                    FStar_All.pipe_right args
                      (FStar_List.map
                         (fun uu____232  ->
                            match uu____232 with
                            | (x,uu____239) ->
                                FStar_Syntax_Print.term_to_string x))
                     in
                  FStar_All.pipe_right uu____211 (FStar_String.concat " ")
                   in
                FStar_Util.format4
                  "Ill-typed application: source application is %s \n translated prefix to %s at type %s\n remaining args are %s\n"
                  uu____203 uu____205 uu____207 uu____209
                 in
              (FStar_Errors.Fatal_IllTyped, uu____201)  in
            fail t.FStar_Syntax_Syntax.pos uu____195
  
let err_ill_typed_erasure :
  'Auu____256 .
    FStar_Extraction_ML_UEnv.uenv ->
      FStar_Range.range -> FStar_Extraction_ML_Syntax.mlty -> 'Auu____256
  =
  fun env  ->
    fun pos  ->
      fun ty  ->
        let uu____272 =
          let uu____278 =
            let uu____280 =
              FStar_Extraction_ML_Code.string_of_mlty
                env.FStar_Extraction_ML_UEnv.currentModule ty
               in
            FStar_Util.format1
              "Erased value found where a value of type %s was expected"
              uu____280
             in
          (FStar_Errors.Fatal_IllTyped, uu____278)  in
        fail pos uu____272
  
let err_value_restriction :
  'Auu____289 .
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax -> 'Auu____289
  =
  fun t  ->
    let uu____299 =
      let uu____305 =
        let uu____307 = FStar_Syntax_Print.tag_of_term t  in
        let uu____309 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format2
          "Refusing to generalize because of the value restriction: (%s) %s"
          uu____307 uu____309
         in
      (FStar_Errors.Fatal_ValueRestriction, uu____305)  in
    fail t.FStar_Syntax_Syntax.pos uu____299
  
let (err_unexpected_eff :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Extraction_ML_Syntax.mlty ->
        FStar_Extraction_ML_Syntax.e_tag ->
          FStar_Extraction_ML_Syntax.e_tag -> unit)
  =
  fun env  ->
    fun t  ->
      fun ty  ->
        fun f0  ->
          fun f1  ->
            let uu____343 =
              let uu____349 =
                let uu____351 = FStar_Syntax_Print.term_to_string t  in
                let uu____353 =
                  FStar_Extraction_ML_Code.string_of_mlty
                    env.FStar_Extraction_ML_UEnv.currentModule ty
                   in
                let uu____355 = FStar_Extraction_ML_Util.eff_to_string f0  in
                let uu____357 = FStar_Extraction_ML_Util.eff_to_string f1  in
                FStar_Util.format4
                  "for expression %s of type %s, Expected effect %s; got effect %s"
                  uu____351 uu____353 uu____355 uu____357
                 in
              (FStar_Errors.Warning_ExtractionUnexpectedEffect, uu____349)
               in
            FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos uu____343
  
let (effect_as_etag :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Ident.lident -> FStar_Extraction_ML_Syntax.e_tag)
  =
  let cache = FStar_Util.smap_create (Prims.of_int (20))  in
  let rec delta_norm_eff g l =
    let uu____385 = FStar_Util.smap_try_find cache l.FStar_Ident.str  in
    match uu____385 with
    | FStar_Pervasives_Native.Some l1 -> l1
    | FStar_Pervasives_Native.None  ->
        let res =
          let uu____390 =
            FStar_TypeChecker_Env.lookup_effect_abbrev
              g.FStar_Extraction_ML_UEnv.env_tcenv
              [FStar_Syntax_Syntax.U_zero] l
             in
          match uu____390 with
          | FStar_Pervasives_Native.None  -> l
          | FStar_Pervasives_Native.Some (uu____401,c) ->
              delta_norm_eff g (FStar_Syntax_Util.comp_effect_name c)
           in
        (FStar_Util.smap_add cache l.FStar_Ident.str res; res)
     in
  fun g  ->
    fun l  ->
      let l1 = delta_norm_eff g l  in
      let uu____411 =
        FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid  in
      if uu____411
      then FStar_Extraction_ML_Syntax.E_PURE
      else
        (let uu____416 =
           FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GHOST_lid  in
         if uu____416
         then FStar_Extraction_ML_Syntax.E_GHOST
         else
           (let ed_opt =
              FStar_TypeChecker_Env.effect_decl_opt
                g.FStar_Extraction_ML_UEnv.env_tcenv l1
               in
            match ed_opt with
            | FStar_Pervasives_Native.Some (ed,qualifiers) ->
                let uu____442 =
                  FStar_TypeChecker_Env.is_reifiable_effect
                    g.FStar_Extraction_ML_UEnv.env_tcenv
                    ed.FStar_Syntax_Syntax.mname
                   in
                if uu____442
                then FStar_Extraction_ML_Syntax.E_PURE
                else FStar_Extraction_ML_Syntax.E_IMPURE
            | FStar_Pervasives_Native.None  ->
                FStar_Extraction_ML_Syntax.E_IMPURE))
  
let rec (is_arity :
  FStar_Extraction_ML_UEnv.uenv -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env  ->
    fun t  ->
      let t1 = FStar_Syntax_Util.unmeta t  in
      let uu____466 =
        let uu____467 = FStar_Syntax_Subst.compress t1  in
        uu____467.FStar_Syntax_Syntax.n  in
      match uu____466 with
      | FStar_Syntax_Syntax.Tm_unknown  -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_delayed uu____473 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_ascribed uu____498 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_meta uu____527 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_lazy i ->
          let uu____537 = FStar_Syntax_Util.unfold_lazy i  in
          is_arity env uu____537
      | FStar_Syntax_Syntax.Tm_uvar uu____538 -> false
      | FStar_Syntax_Syntax.Tm_constant uu____552 -> false
      | FStar_Syntax_Syntax.Tm_name uu____554 -> false
      | FStar_Syntax_Syntax.Tm_quoted uu____556 -> false
      | FStar_Syntax_Syntax.Tm_bvar uu____564 -> false
      | FStar_Syntax_Syntax.Tm_type uu____566 -> true
      | FStar_Syntax_Syntax.Tm_arrow (uu____568,c) ->
          is_arity env (FStar_Syntax_Util.comp_result c)
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let topt =
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Unfold
                 FStar_Syntax_Syntax.delta_constant]
              env.FStar_Extraction_ML_UEnv.env_tcenv
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          (match topt with
           | FStar_Pervasives_Native.None  -> false
           | FStar_Pervasives_Native.Some (uu____604,t2) -> is_arity env t2)
      | FStar_Syntax_Syntax.Tm_app uu____610 ->
          let uu____627 = FStar_Syntax_Util.head_and_args t1  in
          (match uu____627 with | (head1,uu____646) -> is_arity env head1)
      | FStar_Syntax_Syntax.Tm_uinst (head1,uu____672) -> is_arity env head1
      | FStar_Syntax_Syntax.Tm_refine (x,uu____678) ->
          is_arity env x.FStar_Syntax_Syntax.sort
      | FStar_Syntax_Syntax.Tm_abs (uu____683,body,uu____685) ->
          is_arity env body
      | FStar_Syntax_Syntax.Tm_let (uu____710,body) -> is_arity env body
      | FStar_Syntax_Syntax.Tm_match (uu____730,branches) ->
          (match branches with
           | (uu____769,uu____770,e)::uu____772 -> is_arity env e
           | uu____819 -> false)
  
let rec (is_type_aux :
  FStar_Extraction_ML_UEnv.uenv -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env  ->
    fun t  ->
      let t1 = FStar_Syntax_Subst.compress t  in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_delayed uu____851 ->
          let uu____874 =
            let uu____876 = FStar_Syntax_Print.tag_of_term t1  in
            FStar_Util.format1 "Impossible: %s" uu____876  in
          failwith uu____874
      | FStar_Syntax_Syntax.Tm_unknown  ->
          let uu____880 =
            let uu____882 = FStar_Syntax_Print.tag_of_term t1  in
            FStar_Util.format1 "Impossible: %s" uu____882  in
          failwith uu____880
      | FStar_Syntax_Syntax.Tm_lazy i ->
          let uu____887 = FStar_Syntax_Util.unfold_lazy i  in
          is_type_aux env uu____887
      | FStar_Syntax_Syntax.Tm_constant uu____888 -> false
      | FStar_Syntax_Syntax.Tm_type uu____890 -> true
      | FStar_Syntax_Syntax.Tm_refine uu____892 -> true
      | FStar_Syntax_Syntax.Tm_arrow uu____900 -> true
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.failwith_lid ->
          false
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          FStar_Extraction_ML_UEnv.is_type_name env fv
      | FStar_Syntax_Syntax.Tm_uvar
          ({ FStar_Syntax_Syntax.ctx_uvar_head = uu____919;
             FStar_Syntax_Syntax.ctx_uvar_gamma = uu____920;
             FStar_Syntax_Syntax.ctx_uvar_binders = uu____921;
             FStar_Syntax_Syntax.ctx_uvar_typ = t2;
             FStar_Syntax_Syntax.ctx_uvar_reason = uu____923;
             FStar_Syntax_Syntax.ctx_uvar_should_check = uu____924;
             FStar_Syntax_Syntax.ctx_uvar_range = uu____925;
             FStar_Syntax_Syntax.ctx_uvar_meta = uu____926;_},s)
          ->
          let uu____975 = FStar_Syntax_Subst.subst' s t2  in
          is_arity env uu____975
      | FStar_Syntax_Syntax.Tm_bvar
          { FStar_Syntax_Syntax.ppname = uu____976;
            FStar_Syntax_Syntax.index = uu____977;
            FStar_Syntax_Syntax.sort = t2;_}
          -> is_arity env t2
      | FStar_Syntax_Syntax.Tm_name
          { FStar_Syntax_Syntax.ppname = uu____982;
            FStar_Syntax_Syntax.index = uu____983;
            FStar_Syntax_Syntax.sort = t2;_}
          -> is_arity env t2
      | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____989,uu____990) ->
          is_type_aux env t2
      | FStar_Syntax_Syntax.Tm_uinst (t2,uu____1032) -> is_type_aux env t2
      | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____1039) ->
          let uu____1064 = FStar_Syntax_Subst.open_term bs body  in
          (match uu____1064 with
           | (uu____1070,body1) -> is_type_aux env body1)
      | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
          let x = FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
          let uu____1090 =
            let uu____1095 =
              let uu____1096 = FStar_Syntax_Syntax.mk_binder x  in
              [uu____1096]  in
            FStar_Syntax_Subst.open_term uu____1095 body  in
          (match uu____1090 with
           | (uu____1116,body1) -> is_type_aux env body1)
      | FStar_Syntax_Syntax.Tm_let ((uu____1118,lbs),body) ->
          let uu____1138 = FStar_Syntax_Subst.open_let_rec lbs body  in
          (match uu____1138 with
           | (uu____1146,body1) -> is_type_aux env body1)
      | FStar_Syntax_Syntax.Tm_match (uu____1152,branches) ->
          (match branches with
           | b::uu____1192 ->
               let uu____1237 = FStar_Syntax_Subst.open_branch b  in
               (match uu____1237 with
                | (uu____1239,uu____1240,e) -> is_type_aux env e)
           | uu____1258 -> false)
      | FStar_Syntax_Syntax.Tm_quoted uu____1276 -> false
      | FStar_Syntax_Syntax.Tm_meta (t2,uu____1285) -> is_type_aux env t2
      | FStar_Syntax_Syntax.Tm_app (head1,uu____1291) ->
          is_type_aux env head1
  
let (is_type :
  FStar_Extraction_ML_UEnv.uenv -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env  ->
    fun t  ->
      FStar_Extraction_ML_UEnv.debug env
        (fun uu____1332  ->
           let uu____1333 = FStar_Syntax_Print.tag_of_term t  in
           let uu____1335 = FStar_Syntax_Print.term_to_string t  in
           FStar_Util.print2 "checking is_type (%s) %s\n" uu____1333
             uu____1335);
      (let b = is_type_aux env t  in
       FStar_Extraction_ML_UEnv.debug env
         (fun uu____1344  ->
            if b
            then
              let uu____1346 = FStar_Syntax_Print.term_to_string t  in
              let uu____1348 = FStar_Syntax_Print.tag_of_term t  in
              FStar_Util.print2 "yes, is_type %s (%s)\n" uu____1346
                uu____1348
            else
              (let uu____1353 = FStar_Syntax_Print.term_to_string t  in
               let uu____1355 = FStar_Syntax_Print.tag_of_term t  in
               FStar_Util.print2 "not a type %s (%s)\n" uu____1353 uu____1355));
       b)
  
let is_type_binder :
  'Auu____1365 .
    FStar_Extraction_ML_UEnv.uenv ->
      (FStar_Syntax_Syntax.bv * 'Auu____1365) -> Prims.bool
  =
  fun env  ->
    fun x  ->
      is_arity env (FStar_Pervasives_Native.fst x).FStar_Syntax_Syntax.sort
  
let (is_constructor : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t  ->
    let uu____1392 =
      let uu____1393 = FStar_Syntax_Subst.compress t  in
      uu____1393.FStar_Syntax_Syntax.n  in
    match uu____1392 with
    | FStar_Syntax_Syntax.Tm_fvar
        { FStar_Syntax_Syntax.fv_name = uu____1397;
          FStar_Syntax_Syntax.fv_delta = uu____1398;
          FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
            (FStar_Syntax_Syntax.Data_ctor );_}
        -> true
    | FStar_Syntax_Syntax.Tm_fvar
        { FStar_Syntax_Syntax.fv_name = uu____1400;
          FStar_Syntax_Syntax.fv_delta = uu____1401;
          FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
            (FStar_Syntax_Syntax.Record_ctor uu____1402);_}
        -> true
    | uu____1410 -> false
  
let rec (is_fstar_value : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t  ->
    let uu____1419 =
      let uu____1420 = FStar_Syntax_Subst.compress t  in
      uu____1420.FStar_Syntax_Syntax.n  in
    match uu____1419 with
    | FStar_Syntax_Syntax.Tm_constant uu____1424 -> true
    | FStar_Syntax_Syntax.Tm_bvar uu____1426 -> true
    | FStar_Syntax_Syntax.Tm_fvar uu____1428 -> true
    | FStar_Syntax_Syntax.Tm_abs uu____1430 -> true
    | FStar_Syntax_Syntax.Tm_app (head1,args) ->
        let uu____1476 = is_constructor head1  in
        if uu____1476
        then
          FStar_All.pipe_right args
            (FStar_List.for_all
               (fun uu____1498  ->
                  match uu____1498 with
                  | (te,uu____1507) -> is_fstar_value te))
        else false
    | FStar_Syntax_Syntax.Tm_meta (t1,uu____1516) -> is_fstar_value t1
    | FStar_Syntax_Syntax.Tm_ascribed (t1,uu____1522,uu____1523) ->
        is_fstar_value t1
    | uu____1564 -> false
  
let rec (is_ml_value : FStar_Extraction_ML_Syntax.mlexpr -> Prims.bool) =
  fun e  ->
    match e.FStar_Extraction_ML_Syntax.expr with
    | FStar_Extraction_ML_Syntax.MLE_Const uu____1574 -> true
    | FStar_Extraction_ML_Syntax.MLE_Var uu____1576 -> true
    | FStar_Extraction_ML_Syntax.MLE_Name uu____1579 -> true
    | FStar_Extraction_ML_Syntax.MLE_Fun uu____1581 -> true
    | FStar_Extraction_ML_Syntax.MLE_CTor (uu____1594,exps) ->
        FStar_Util.for_all is_ml_value exps
    | FStar_Extraction_ML_Syntax.MLE_Tuple exps ->
        FStar_Util.for_all is_ml_value exps
    | FStar_Extraction_ML_Syntax.MLE_Record (uu____1603,fields) ->
        FStar_Util.for_all
          (fun uu____1633  ->
             match uu____1633 with | (uu____1640,e1) -> is_ml_value e1)
          fields
    | FStar_Extraction_ML_Syntax.MLE_TApp (h,uu____1645) -> is_ml_value h
    | uu____1650 -> false
  
let (fresh : Prims.string -> Prims.string) =
  let c = FStar_Util.mk_ref Prims.int_zero  in
  fun x  ->
    FStar_Util.incr c;
    (let uu____1668 =
       let uu____1670 = FStar_ST.op_Bang c  in
       FStar_Util.string_of_int uu____1670  in
     Prims.op_Hat x uu____1668)
  
let (normalize_abs : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t0  ->
    let rec aux bs t copt =
      let t1 = FStar_Syntax_Subst.compress t  in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_abs (bs',body,copt1) ->
          aux (FStar_List.append bs bs') body copt1
      | uu____1773 ->
          let e' = FStar_Syntax_Util.unascribe t1  in
          let uu____1775 = FStar_Syntax_Util.is_fun e'  in
          if uu____1775
          then aux bs e' copt
          else FStar_Syntax_Util.abs bs e' copt
       in
    aux [] t0 FStar_Pervasives_Native.None
  
let (unit_binder : FStar_Syntax_Syntax.binder) =
  let uu____1789 =
    FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
      FStar_Syntax_Syntax.t_unit
     in
  FStar_All.pipe_left FStar_Syntax_Syntax.mk_binder uu____1789 
let (check_pats_for_ite :
  (FStar_Syntax_Syntax.pat * FStar_Syntax_Syntax.term
    FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term) Prims.list ->
    (Prims.bool * FStar_Syntax_Syntax.term FStar_Pervasives_Native.option *
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option))
  =
  fun l  ->
    let def =
      (false, FStar_Pervasives_Native.None, FStar_Pervasives_Native.None)  in
    if (FStar_List.length l) <> (Prims.of_int (2))
    then def
    else
      (let uu____1880 = FStar_List.hd l  in
       match uu____1880 with
       | (p1,w1,e1) ->
           let uu____1915 =
             let uu____1924 = FStar_List.tl l  in FStar_List.hd uu____1924
              in
           (match uu____1915 with
            | (p2,w2,e2) ->
                (match (w1, w2, (p1.FStar_Syntax_Syntax.v),
                         (p2.FStar_Syntax_Syntax.v))
                 with
                 | (FStar_Pervasives_Native.None
                    ,FStar_Pervasives_Native.None
                    ,FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool
                    (true )),FStar_Syntax_Syntax.Pat_constant
                    (FStar_Const.Const_bool (false ))) ->
                     (true, (FStar_Pervasives_Native.Some e1),
                       (FStar_Pervasives_Native.Some e2))
                 | (FStar_Pervasives_Native.None
                    ,FStar_Pervasives_Native.None
                    ,FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool
                    (false )),FStar_Syntax_Syntax.Pat_constant
                    (FStar_Const.Const_bool (true ))) ->
                     (true, (FStar_Pervasives_Native.Some e2),
                       (FStar_Pervasives_Native.Some e1))
                 | uu____2008 -> def)))
  
let (instantiate_tyscheme :
  FStar_Extraction_ML_Syntax.mltyscheme ->
    FStar_Extraction_ML_Syntax.mlty Prims.list ->
      FStar_Extraction_ML_Syntax.mlty)
  = fun s  -> fun args  -> FStar_Extraction_ML_Util.subst s args 
let (instantiate_maybe_partial :
  FStar_Extraction_ML_Syntax.mlexpr ->
    FStar_Extraction_ML_Syntax.mltyscheme ->
      FStar_Extraction_ML_Syntax.mlty Prims.list ->
        (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag
          * FStar_Extraction_ML_Syntax.mlty))
  =
  fun e  ->
    fun s  ->
      fun tyargs  ->
        let uu____2068 = s  in
        match uu____2068 with
        | (vars,t) ->
            let n_vars = FStar_List.length vars  in
            let n_args = FStar_List.length tyargs  in
            if n_args = n_vars
            then
              (if n_args = Prims.int_zero
               then (e, FStar_Extraction_ML_Syntax.E_PURE, t)
               else
                 (let ts = instantiate_tyscheme (vars, t) tyargs  in
                  let tapp =
                    let uu___365_2100 = e  in
                    {
                      FStar_Extraction_ML_Syntax.expr =
                        (FStar_Extraction_ML_Syntax.MLE_TApp (e, tyargs));
                      FStar_Extraction_ML_Syntax.mlty = ts;
                      FStar_Extraction_ML_Syntax.loc =
                        (uu___365_2100.FStar_Extraction_ML_Syntax.loc)
                    }  in
                  (tapp, FStar_Extraction_ML_Syntax.E_PURE, ts)))
            else
              if n_args < n_vars
              then
                (let extra_tyargs =
                   let uu____2115 = FStar_Util.first_N n_args vars  in
                   match uu____2115 with
                   | (uu____2129,rest_vars) ->
                       FStar_All.pipe_right rest_vars
                         (FStar_List.map
                            (fun uu____2150  ->
                               FStar_Extraction_ML_Syntax.MLTY_Erased))
                    in
                 let tyargs1 = FStar_List.append tyargs extra_tyargs  in
                 let ts = instantiate_tyscheme (vars, t) tyargs1  in
                 let tapp =
                   let uu___376_2157 = e  in
                   {
                     FStar_Extraction_ML_Syntax.expr =
                       (FStar_Extraction_ML_Syntax.MLE_TApp (e, tyargs1));
                     FStar_Extraction_ML_Syntax.mlty = ts;
                     FStar_Extraction_ML_Syntax.loc =
                       (uu___376_2157.FStar_Extraction_ML_Syntax.loc)
                   }  in
                 let t1 =
                   FStar_List.fold_left
                     (fun out  ->
                        fun t1  ->
                          FStar_Extraction_ML_Syntax.MLTY_Fun
                            (t1, FStar_Extraction_ML_Syntax.E_PURE, out)) ts
                     extra_tyargs
                    in
                 let f =
                   let vs_ts =
                     FStar_List.map
                       (fun t2  ->
                          let uu____2182 = fresh "t"  in (uu____2182, t2))
                       extra_tyargs
                      in
                   FStar_All.pipe_left
                     (FStar_Extraction_ML_Syntax.with_ty t1)
                     (FStar_Extraction_ML_Syntax.MLE_Fun (vs_ts, tapp))
                    in
                 (f, FStar_Extraction_ML_Syntax.E_PURE, t1))
              else
                failwith
                  "Impossible: instantiate_maybe_partial called with too many arguments"
  
let (eta_expand :
  FStar_Extraction_ML_Syntax.mlty ->
    FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun t  ->
    fun e  ->
      let uu____2213 = FStar_Extraction_ML_Util.doms_and_cod t  in
      match uu____2213 with
      | (ts,r) ->
          if ts = []
          then e
          else
            (let vs = FStar_List.map (fun uu____2237  -> fresh "a") ts  in
             let vs_ts = FStar_List.zip vs ts  in
             let vs_es =
               let uu____2251 = FStar_List.zip vs ts  in
               FStar_List.map
                 (fun uu____2268  ->
                    match uu____2268 with
                    | (v1,t1) ->
                        FStar_Extraction_ML_Syntax.with_ty t1
                          (FStar_Extraction_ML_Syntax.MLE_Var v1)) uu____2251
                in
             let body =
               FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty r)
                 (FStar_Extraction_ML_Syntax.MLE_App (e, vs_es))
                in
             FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t)
               (FStar_Extraction_ML_Syntax.MLE_Fun (vs_ts, body)))
  
let (default_value_for_ty :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun g  ->
    fun t  ->
      let uu____2299 = FStar_Extraction_ML_Util.doms_and_cod t  in
      match uu____2299 with
      | (ts,r) ->
          let body r1 =
            let r2 =
              let uu____2319 = FStar_Extraction_ML_Util.udelta_unfold g r1
                 in
              match uu____2319 with
              | FStar_Pervasives_Native.None  -> r1
              | FStar_Pervasives_Native.Some r2 -> r2  in
            match r2 with
            | FStar_Extraction_ML_Syntax.MLTY_Erased  ->
                FStar_Extraction_ML_Syntax.ml_unit
            | FStar_Extraction_ML_Syntax.MLTY_Top  ->
                FStar_Extraction_ML_Syntax.apply_obj_repr
                  FStar_Extraction_ML_Syntax.ml_unit
                  FStar_Extraction_ML_Syntax.MLTY_Erased
            | uu____2323 ->
                FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty r2)
                  (FStar_Extraction_ML_Syntax.MLE_Coerce
                     (FStar_Extraction_ML_Syntax.ml_unit,
                       FStar_Extraction_ML_Syntax.MLTY_Erased, r2))
             in
          if ts = []
          then body r
          else
            (let vs = FStar_List.map (fun uu____2335  -> fresh "a") ts  in
             let vs_ts = FStar_List.zip vs ts  in
             let uu____2346 =
               let uu____2347 =
                 let uu____2359 = body r  in (vs_ts, uu____2359)  in
               FStar_Extraction_ML_Syntax.MLE_Fun uu____2347  in
             FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t)
               uu____2346)
  
let (maybe_eta_expand :
  FStar_Extraction_ML_Syntax.mlty ->
    FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun expect  ->
    fun e  ->
      let uu____2378 =
        (FStar_Options.ml_no_eta_expand_coertions ()) ||
          (let uu____2381 = FStar_Options.codegen ()  in
           uu____2381 = (FStar_Pervasives_Native.Some FStar_Options.Kremlin))
         in
      if uu____2378 then e else eta_expand expect e
  
let (apply_coercion :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlexpr ->
      FStar_Extraction_ML_Syntax.mlty ->
        FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun g  ->
    fun e  ->
      fun ty  ->
        fun expect  ->
          let mk_fun binder body =
            match body.FStar_Extraction_ML_Syntax.expr with
            | FStar_Extraction_ML_Syntax.MLE_Fun (binders,body1) ->
                FStar_Extraction_ML_Syntax.MLE_Fun
                  ((binder :: binders), body1)
            | uu____2459 ->
                FStar_Extraction_ML_Syntax.MLE_Fun ([binder], body)
             in
          let rec aux e1 ty1 expect1 =
            let coerce_branch uu____2514 =
              match uu____2514 with
              | (pat,w,b) ->
                  let uu____2538 = aux b ty1 expect1  in (pat, w, uu____2538)
               in
            match ((e1.FStar_Extraction_ML_Syntax.expr), ty1, expect1) with
            | (FStar_Extraction_ML_Syntax.MLE_Fun
               (arg::rest,body),FStar_Extraction_ML_Syntax.MLTY_Fun
               (t0,uu____2545,t1),FStar_Extraction_ML_Syntax.MLTY_Fun
               (s0,uu____2548,s1)) ->
                let body1 =
                  match rest with
                  | [] -> body
                  | uu____2580 ->
                      FStar_Extraction_ML_Syntax.with_ty t1
                        (FStar_Extraction_ML_Syntax.MLE_Fun (rest, body))
                   in
                let body2 = aux body1 t1 s1  in
                let uu____2596 = type_leq g s0 t0  in
                if uu____2596
                then
                  FStar_Extraction_ML_Syntax.with_ty expect1
                    (mk_fun arg body2)
                else
                  (let lb =
                     let uu____2602 =
                       let uu____2603 =
                         let uu____2604 =
                           let uu____2611 =
                             FStar_All.pipe_left
                               (FStar_Extraction_ML_Syntax.with_ty s0)
                               (FStar_Extraction_ML_Syntax.MLE_Var
                                  (FStar_Pervasives_Native.fst arg))
                              in
                           (uu____2611, s0, t0)  in
                         FStar_Extraction_ML_Syntax.MLE_Coerce uu____2604  in
                       FStar_Extraction_ML_Syntax.with_ty t0 uu____2603  in
                     {
                       FStar_Extraction_ML_Syntax.mllb_name =
                         (FStar_Pervasives_Native.fst arg);
                       FStar_Extraction_ML_Syntax.mllb_tysc =
                         (FStar_Pervasives_Native.Some ([], t0));
                       FStar_Extraction_ML_Syntax.mllb_add_unit = false;
                       FStar_Extraction_ML_Syntax.mllb_def = uu____2602;
                       FStar_Extraction_ML_Syntax.mllb_meta = [];
                       FStar_Extraction_ML_Syntax.print_typ = false
                     }  in
                   let body3 =
                     FStar_All.pipe_left
                       (FStar_Extraction_ML_Syntax.with_ty s1)
                       (FStar_Extraction_ML_Syntax.MLE_Let
                          ((FStar_Extraction_ML_Syntax.NonRec, [lb]), body2))
                      in
                   FStar_Extraction_ML_Syntax.with_ty expect1
                     (mk_fun ((FStar_Pervasives_Native.fst arg), s0) body3))
            | (FStar_Extraction_ML_Syntax.MLE_Let
               (lbs,body),uu____2630,uu____2631) ->
                let uu____2644 =
                  let uu____2645 =
                    let uu____2656 = aux body ty1 expect1  in
                    (lbs, uu____2656)  in
                  FStar_Extraction_ML_Syntax.MLE_Let uu____2645  in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty expect1) uu____2644
            | (FStar_Extraction_ML_Syntax.MLE_Match
               (s,branches),uu____2665,uu____2666) ->
                let uu____2687 =
                  let uu____2688 =
                    let uu____2703 = FStar_List.map coerce_branch branches
                       in
                    (s, uu____2703)  in
                  FStar_Extraction_ML_Syntax.MLE_Match uu____2688  in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty expect1) uu____2687
            | (FStar_Extraction_ML_Syntax.MLE_If
               (s,b1,b2_opt),uu____2743,uu____2744) ->
                let uu____2749 =
                  let uu____2750 =
                    let uu____2759 = aux b1 ty1 expect1  in
                    let uu____2760 =
                      FStar_Util.map_opt b2_opt
                        (fun b2  -> aux b2 ty1 expect1)
                       in
                    (s, uu____2759, uu____2760)  in
                  FStar_Extraction_ML_Syntax.MLE_If uu____2750  in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty expect1) uu____2749
            | (FStar_Extraction_ML_Syntax.MLE_Seq es,uu____2768,uu____2769)
                ->
                let uu____2772 = FStar_Util.prefix es  in
                (match uu____2772 with
                 | (prefix1,last1) ->
                     let uu____2785 =
                       let uu____2786 =
                         let uu____2789 =
                           let uu____2792 = aux last1 ty1 expect1  in
                           [uu____2792]  in
                         FStar_List.append prefix1 uu____2789  in
                       FStar_Extraction_ML_Syntax.MLE_Seq uu____2786  in
                     FStar_All.pipe_left
                       (FStar_Extraction_ML_Syntax.with_ty expect1)
                       uu____2785)
            | (FStar_Extraction_ML_Syntax.MLE_Try
               (s,branches),uu____2795,uu____2796) ->
                let uu____2817 =
                  let uu____2818 =
                    let uu____2833 = FStar_List.map coerce_branch branches
                       in
                    (s, uu____2833)  in
                  FStar_Extraction_ML_Syntax.MLE_Try uu____2818  in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty expect1) uu____2817
            | uu____2870 ->
                FStar_Extraction_ML_Syntax.with_ty expect1
                  (FStar_Extraction_ML_Syntax.MLE_Coerce (e1, ty1, expect1))
             in
          aux e ty expect
  
let maybe_coerce :
  'Auu____2890 .
    'Auu____2890 ->
      FStar_Extraction_ML_UEnv.uenv ->
        FStar_Extraction_ML_Syntax.mlexpr ->
          FStar_Extraction_ML_Syntax.mlty ->
            FStar_Extraction_ML_Syntax.mlty ->
              FStar_Extraction_ML_Syntax.mlexpr
  =
  fun pos  ->
    fun g  ->
      fun e  ->
        fun ty  ->
          fun expect  ->
            let ty1 = eraseTypeDeep g ty  in
            let uu____2917 =
              type_leq_c g (FStar_Pervasives_Native.Some e) ty1 expect  in
            match uu____2917 with
            | (true ,FStar_Pervasives_Native.Some e') -> e'
            | uu____2930 ->
                (match ty1 with
                 | FStar_Extraction_ML_Syntax.MLTY_Erased  ->
                     default_value_for_ty g expect
                 | uu____2938 ->
                     let uu____2939 =
                       let uu____2941 =
                         FStar_Extraction_ML_Util.erase_effect_annotations
                           ty1
                          in
                       let uu____2942 =
                         FStar_Extraction_ML_Util.erase_effect_annotations
                           expect
                          in
                       type_leq g uu____2941 uu____2942  in
                     if uu____2939
                     then
                       (FStar_Extraction_ML_UEnv.debug g
                          (fun uu____2948  ->
                             let uu____2949 =
                               FStar_Extraction_ML_Code.string_of_mlexpr
                                 g.FStar_Extraction_ML_UEnv.currentModule e
                                in
                             let uu____2951 =
                               FStar_Extraction_ML_Code.string_of_mlty
                                 g.FStar_Extraction_ML_UEnv.currentModule ty1
                                in
                             FStar_Util.print2
                               "\n Effect mismatch on type of %s : %s\n"
                               uu____2949 uu____2951);
                        e)
                     else
                       (FStar_Extraction_ML_UEnv.debug g
                          (fun uu____2961  ->
                             let uu____2962 =
                               FStar_Extraction_ML_Code.string_of_mlexpr
                                 g.FStar_Extraction_ML_UEnv.currentModule e
                                in
                             let uu____2964 =
                               FStar_Extraction_ML_Code.string_of_mlty
                                 g.FStar_Extraction_ML_UEnv.currentModule ty1
                                in
                             let uu____2966 =
                               FStar_Extraction_ML_Code.string_of_mlty
                                 g.FStar_Extraction_ML_UEnv.currentModule
                                 expect
                                in
                             FStar_Util.print3
                               "\n (*needed to coerce expression \n %s \n of type \n %s \n to type \n %s *) \n"
                               uu____2962 uu____2964 uu____2966);
                        (let uu____2969 = apply_coercion g e ty1 expect  in
                         maybe_eta_expand expect uu____2969)))
  
let (bv_as_mlty :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.bv -> FStar_Extraction_ML_Syntax.mlty)
  =
  fun g  ->
    fun bv  ->
      let uu____2981 = FStar_Extraction_ML_UEnv.lookup_bv g bv  in
      match uu____2981 with
      | FStar_Util.Inl ty_b -> ty_b.FStar_Extraction_ML_UEnv.ty_b_ty
      | uu____2983 -> FStar_Extraction_ML_Syntax.MLTY_Top
  
let (extraction_norm_steps_core : FStar_TypeChecker_Env.step Prims.list) =
  [FStar_TypeChecker_Env.AllowUnboundUniverses;
  FStar_TypeChecker_Env.EraseUniverses;
  FStar_TypeChecker_Env.Inlining;
  FStar_TypeChecker_Env.Eager_unfolding;
  FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
  FStar_TypeChecker_Env.Primops;
  FStar_TypeChecker_Env.Unascribe;
  FStar_TypeChecker_Env.ForExtraction] 
let (extraction_norm_steps_nbe : FStar_TypeChecker_Env.step Prims.list) =
  FStar_TypeChecker_Env.NBE :: extraction_norm_steps_core 
let (extraction_norm_steps : unit -> FStar_TypeChecker_Env.step Prims.list) =
  fun uu____2997  ->
    let uu____2998 = FStar_Options.use_nbe_for_extraction ()  in
    if uu____2998
    then extraction_norm_steps_nbe
    else extraction_norm_steps_core
  
let (comp_no_args :
  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax)
  =
  fun c  ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total uu____3019 -> c
    | FStar_Syntax_Syntax.GTotal uu____3028 -> c
    | FStar_Syntax_Syntax.Comp ct ->
        let effect_args =
          FStar_List.map
            (fun uu____3064  ->
               match uu____3064 with
               | (uu____3079,aq) -> (FStar_Syntax_Syntax.t_unit, aq))
            ct.FStar_Syntax_Syntax.effect_args
           in
        let ct1 =
          let uu___540_3092 = ct  in
          {
            FStar_Syntax_Syntax.comp_univs =
              (uu___540_3092.FStar_Syntax_Syntax.comp_univs);
            FStar_Syntax_Syntax.effect_name =
              (uu___540_3092.FStar_Syntax_Syntax.effect_name);
            FStar_Syntax_Syntax.result_typ =
              (uu___540_3092.FStar_Syntax_Syntax.result_typ);
            FStar_Syntax_Syntax.effect_args = effect_args;
            FStar_Syntax_Syntax.flags =
              (uu___540_3092.FStar_Syntax_Syntax.flags)
          }  in
        let c1 =
          let uu___543_3096 = c  in
          {
            FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Comp ct1);
            FStar_Syntax_Syntax.pos = (uu___543_3096.FStar_Syntax_Syntax.pos);
            FStar_Syntax_Syntax.vars =
              (uu___543_3096.FStar_Syntax_Syntax.vars)
          }  in
        c1
  
let maybe_reify_comp :
  'Auu____3108 .
    'Auu____3108 ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.term
  =
  fun g  ->
    fun env  ->
      fun c  ->
        let c1 = comp_no_args c  in
        let uu____3127 =
          let uu____3129 =
            let uu____3130 =
              FStar_All.pipe_right c1 FStar_Syntax_Util.comp_effect_name  in
            FStar_All.pipe_right uu____3130
              (FStar_TypeChecker_Env.norm_eff_name env)
             in
          FStar_All.pipe_right uu____3129
            (FStar_TypeChecker_Env.is_reifiable_effect env)
           in
        if uu____3127
        then
          FStar_TypeChecker_Env.reify_comp env c1
            FStar_Syntax_Syntax.U_unknown
        else FStar_Syntax_Util.comp_result c1
  
let rec (translate_term_to_mlty :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term -> FStar_Extraction_ML_Syntax.mlty)
  =
  fun g  ->
    fun t0  ->
      let arg_as_mlty g1 uu____3183 =
        match uu____3183 with
        | (a,uu____3191) ->
            let uu____3196 = is_type g1 a  in
            if uu____3196
            then translate_term_to_mlty g1 a
            else FStar_Extraction_ML_UEnv.erasedContent
         in
      let fv_app_as_mlty g1 fv args =
        let uu____3217 =
          let uu____3219 = FStar_Extraction_ML_UEnv.is_fv_type g1 fv  in
          Prims.op_Negation uu____3219  in
        if uu____3217
        then FStar_Extraction_ML_Syntax.MLTY_Top
        else
          (let uu____3224 =
             let uu____3239 =
               FStar_TypeChecker_Env.lookup_lid
                 g1.FStar_Extraction_ML_UEnv.env_tcenv
                 (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                in
             match uu____3239 with
             | ((uu____3262,fvty),uu____3264) ->
                 let fvty1 =
                   FStar_TypeChecker_Normalize.normalize
                     [FStar_TypeChecker_Env.UnfoldUntil
                        FStar_Syntax_Syntax.delta_constant]
                     g1.FStar_Extraction_ML_UEnv.env_tcenv fvty
                    in
                 FStar_Syntax_Util.arrow_formals fvty1
              in
           match uu____3224 with
           | (formals,uu____3271) ->
               let mlargs = FStar_List.map (arg_as_mlty g1) args  in
               let mlargs1 =
                 let n_args = FStar_List.length args  in
                 if (FStar_List.length formals) > n_args
                 then
                   let uu____3324 = FStar_Util.first_N n_args formals  in
                   match uu____3324 with
                   | (uu____3353,rest) ->
                       let uu____3387 =
                         FStar_List.map
                           (fun uu____3397  ->
                              FStar_Extraction_ML_UEnv.erasedContent) rest
                          in
                       FStar_List.append mlargs uu____3387
                 else mlargs  in
               let nm =
                 let uu____3407 =
                   FStar_Extraction_ML_UEnv.maybe_mangle_type_projector g1 fv
                    in
                 match uu____3407 with
                 | FStar_Pervasives_Native.Some p -> p
                 | FStar_Pervasives_Native.None  ->
                     FStar_Extraction_ML_Syntax.mlpath_of_lident
                       (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                  in
               FStar_Extraction_ML_Syntax.MLTY_Named (mlargs1, nm))
         in
      let aux env t =
        let t1 = FStar_Syntax_Subst.compress t  in
        match t1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_type uu____3425 ->
            FStar_Extraction_ML_Syntax.MLTY_Erased
        | FStar_Syntax_Syntax.Tm_bvar uu____3426 ->
            let uu____3427 =
              let uu____3429 = FStar_Syntax_Print.term_to_string t1  in
              FStar_Util.format1 "Impossible: Unexpected term %s" uu____3429
               in
            failwith uu____3427
        | FStar_Syntax_Syntax.Tm_delayed uu____3432 ->
            let uu____3455 =
              let uu____3457 = FStar_Syntax_Print.term_to_string t1  in
              FStar_Util.format1 "Impossible: Unexpected term %s" uu____3457
               in
            failwith uu____3455
        | FStar_Syntax_Syntax.Tm_unknown  ->
            let uu____3460 =
              let uu____3462 = FStar_Syntax_Print.term_to_string t1  in
              FStar_Util.format1 "Impossible: Unexpected term %s" uu____3462
               in
            failwith uu____3460
        | FStar_Syntax_Syntax.Tm_lazy i ->
            let uu____3466 = FStar_Syntax_Util.unfold_lazy i  in
            translate_term_to_mlty env uu____3466
        | FStar_Syntax_Syntax.Tm_constant uu____3467 ->
            FStar_Extraction_ML_UEnv.unknownType
        | FStar_Syntax_Syntax.Tm_quoted uu____3468 ->
            FStar_Extraction_ML_UEnv.unknownType
        | FStar_Syntax_Syntax.Tm_uvar uu____3475 ->
            FStar_Extraction_ML_UEnv.unknownType
        | FStar_Syntax_Syntax.Tm_meta (t2,uu____3489) ->
            translate_term_to_mlty env t2
        | FStar_Syntax_Syntax.Tm_refine
            ({ FStar_Syntax_Syntax.ppname = uu____3494;
               FStar_Syntax_Syntax.index = uu____3495;
               FStar_Syntax_Syntax.sort = t2;_},uu____3497)
            -> translate_term_to_mlty env t2
        | FStar_Syntax_Syntax.Tm_uinst (t2,uu____3506) ->
            translate_term_to_mlty env t2
        | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____3512,uu____3513) ->
            translate_term_to_mlty env t2
        | FStar_Syntax_Syntax.Tm_name bv -> bv_as_mlty env bv
        | FStar_Syntax_Syntax.Tm_fvar fv -> fv_app_as_mlty env fv []
        | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
            let uu____3586 = FStar_Syntax_Subst.open_comp bs c  in
            (match uu____3586 with
             | (bs1,c1) ->
                 let uu____3593 = binders_as_ml_binders env bs1  in
                 (match uu____3593 with
                  | (mlbs,env1) ->
                      let t_ret =
                        let uu____3622 =
                          maybe_reify_comp env1
                            env1.FStar_Extraction_ML_UEnv.env_tcenv c1
                           in
                        translate_term_to_mlty env1 uu____3622  in
                      let erase =
                        effect_as_etag env1
                          (FStar_Syntax_Util.comp_effect_name c1)
                         in
                      let uu____3624 =
                        FStar_List.fold_right
                          (fun uu____3644  ->
                             fun uu____3645  ->
                               match (uu____3644, uu____3645) with
                               | ((uu____3668,t2),(tag,t')) ->
                                   (FStar_Extraction_ML_Syntax.E_PURE,
                                     (FStar_Extraction_ML_Syntax.MLTY_Fun
                                        (t2, tag, t')))) mlbs (erase, t_ret)
                         in
                      (match uu____3624 with | (uu____3683,t2) -> t2)))
        | FStar_Syntax_Syntax.Tm_app (head1,args) ->
            let res =
              let uu____3712 =
                let uu____3713 = FStar_Syntax_Util.un_uinst head1  in
                uu____3713.FStar_Syntax_Syntax.n  in
              match uu____3712 with
              | FStar_Syntax_Syntax.Tm_name bv -> bv_as_mlty env bv
              | FStar_Syntax_Syntax.Tm_fvar fv -> fv_app_as_mlty env fv args
              | FStar_Syntax_Syntax.Tm_app (head2,args') ->
                  let uu____3744 =
                    FStar_Syntax_Syntax.mk
                      (FStar_Syntax_Syntax.Tm_app
                         (head2, (FStar_List.append args' args)))
                      FStar_Pervasives_Native.None t1.FStar_Syntax_Syntax.pos
                     in
                  translate_term_to_mlty env uu____3744
              | uu____3765 -> FStar_Extraction_ML_UEnv.unknownType  in
            res
        | FStar_Syntax_Syntax.Tm_abs (bs,ty,uu____3768) ->
            let uu____3793 = FStar_Syntax_Subst.open_term bs ty  in
            (match uu____3793 with
             | (bs1,ty1) ->
                 let uu____3800 = binders_as_ml_binders env bs1  in
                 (match uu____3800 with
                  | (bts,env1) -> translate_term_to_mlty env1 ty1))
        | FStar_Syntax_Syntax.Tm_let uu____3828 ->
            FStar_Extraction_ML_UEnv.unknownType
        | FStar_Syntax_Syntax.Tm_match uu____3842 ->
            FStar_Extraction_ML_UEnv.unknownType
         in
      let rec is_top_ty t =
        match t with
        | FStar_Extraction_ML_Syntax.MLTY_Top  -> true
        | FStar_Extraction_ML_Syntax.MLTY_Named uu____3874 ->
            let uu____3881 = FStar_Extraction_ML_Util.udelta_unfold g t  in
            (match uu____3881 with
             | FStar_Pervasives_Native.None  -> false
             | FStar_Pervasives_Native.Some t1 -> is_top_ty t1)
        | uu____3887 -> false  in
      let uu____3889 =
        FStar_TypeChecker_Util.must_erase_for_extraction
          g.FStar_Extraction_ML_UEnv.env_tcenv t0
         in
      if uu____3889
      then FStar_Extraction_ML_Syntax.MLTY_Erased
      else
        (let mlt = aux g t0  in
         let uu____3895 = is_top_ty mlt  in
         if uu____3895 then FStar_Extraction_ML_Syntax.MLTY_Top else mlt)

and (binders_as_ml_binders :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.binders ->
      ((FStar_Extraction_ML_Syntax.mlident * FStar_Extraction_ML_Syntax.mlty)
        Prims.list * FStar_Extraction_ML_UEnv.uenv))
  =
  fun g  ->
    fun bs  ->
      let uu____3913 =
        FStar_All.pipe_right bs
          (FStar_List.fold_left
             (fun uu____3969  ->
                fun b  ->
                  match uu____3969 with
                  | (ml_bs,env) ->
                      let uu____4015 = is_type_binder g b  in
                      if uu____4015
                      then
                        let b1 = FStar_Pervasives_Native.fst b  in
                        let env1 =
                          FStar_Extraction_ML_UEnv.extend_ty env b1
                            (FStar_Pervasives_Native.Some
                               FStar_Extraction_ML_Syntax.MLTY_Top)
                           in
                        let ml_b =
                          let uu____4041 =
                            FStar_Extraction_ML_UEnv.bv_as_ml_termvar b1  in
                          (uu____4041, FStar_Extraction_ML_Syntax.ml_unit_ty)
                           in
                        ((ml_b :: ml_bs), env1)
                      else
                        (let b1 = FStar_Pervasives_Native.fst b  in
                         let t =
                           translate_term_to_mlty env
                             b1.FStar_Syntax_Syntax.sort
                            in
                         let uu____4062 =
                           FStar_Extraction_ML_UEnv.extend_bv env b1 
                             ([], t) false false false
                            in
                         match uu____4062 with
                         | (env1,b2,uu____4087) ->
                             let ml_b =
                               let uu____4096 =
                                 FStar_Extraction_ML_UEnv.removeTick b2  in
                               (uu____4096, t)  in
                             ((ml_b :: ml_bs), env1))) ([], g))
         in
      match uu____3913 with | (ml_bs,env) -> ((FStar_List.rev ml_bs), env)

let (term_as_mlty :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term -> FStar_Extraction_ML_Syntax.mlty)
  =
  fun g  ->
    fun t0  ->
      let t =
        let uu____4174 = extraction_norm_steps ()  in
        FStar_TypeChecker_Normalize.normalize uu____4174
          g.FStar_Extraction_ML_UEnv.env_tcenv t0
         in
      translate_term_to_mlty g t
  
let (mk_MLE_Seq :
  FStar_Extraction_ML_Syntax.mlexpr ->
    FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr')
  =
  fun e1  ->
    fun e2  ->
      match ((e1.FStar_Extraction_ML_Syntax.expr),
              (e2.FStar_Extraction_ML_Syntax.expr))
      with
      | (FStar_Extraction_ML_Syntax.MLE_Seq
         es1,FStar_Extraction_ML_Syntax.MLE_Seq es2) ->
          FStar_Extraction_ML_Syntax.MLE_Seq (FStar_List.append es1 es2)
      | (FStar_Extraction_ML_Syntax.MLE_Seq es1,uu____4193) ->
          FStar_Extraction_ML_Syntax.MLE_Seq (FStar_List.append es1 [e2])
      | (uu____4196,FStar_Extraction_ML_Syntax.MLE_Seq es2) ->
          FStar_Extraction_ML_Syntax.MLE_Seq (e1 :: es2)
      | uu____4200 -> FStar_Extraction_ML_Syntax.MLE_Seq [e1; e2]
  
let (mk_MLE_Let :
  Prims.bool ->
    FStar_Extraction_ML_Syntax.mlletbinding ->
      FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr')
  =
  fun top_level  ->
    fun lbs  ->
      fun body  ->
        match lbs with
        | (FStar_Extraction_ML_Syntax.NonRec ,lb::[]) when
            Prims.op_Negation top_level ->
            (match lb.FStar_Extraction_ML_Syntax.mllb_tysc with
             | FStar_Pervasives_Native.Some ([],t) when
                 t = FStar_Extraction_ML_Syntax.ml_unit_ty ->
                 if
                   body.FStar_Extraction_ML_Syntax.expr =
                     FStar_Extraction_ML_Syntax.ml_unit.FStar_Extraction_ML_Syntax.expr
                 then
                   (lb.FStar_Extraction_ML_Syntax.mllb_def).FStar_Extraction_ML_Syntax.expr
                 else
                   (match body.FStar_Extraction_ML_Syntax.expr with
                    | FStar_Extraction_ML_Syntax.MLE_Var x when
                        x = lb.FStar_Extraction_ML_Syntax.mllb_name ->
                        (lb.FStar_Extraction_ML_Syntax.mllb_def).FStar_Extraction_ML_Syntax.expr
                    | uu____4234 when
                        (lb.FStar_Extraction_ML_Syntax.mllb_def).FStar_Extraction_ML_Syntax.expr
                          =
                          FStar_Extraction_ML_Syntax.ml_unit.FStar_Extraction_ML_Syntax.expr
                        -> body.FStar_Extraction_ML_Syntax.expr
                    | uu____4235 ->
                        mk_MLE_Seq lb.FStar_Extraction_ML_Syntax.mllb_def
                          body)
             | uu____4236 -> FStar_Extraction_ML_Syntax.MLE_Let (lbs, body))
        | uu____4245 -> FStar_Extraction_ML_Syntax.MLE_Let (lbs, body)
  
let (resugar_pat :
  FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option ->
    FStar_Extraction_ML_Syntax.mlpattern ->
      FStar_Extraction_ML_Syntax.mlpattern)
  =
  fun q  ->
    fun p  ->
      match p with
      | FStar_Extraction_ML_Syntax.MLP_CTor (d,pats) ->
          let uu____4273 = FStar_Extraction_ML_Util.is_xtuple d  in
          (match uu____4273 with
           | FStar_Pervasives_Native.Some n1 ->
               FStar_Extraction_ML_Syntax.MLP_Tuple pats
           | uu____4280 ->
               (match q with
                | FStar_Pervasives_Native.Some
                    (FStar_Syntax_Syntax.Record_ctor (ty,fns)) ->
                    let path =
                      FStar_List.map FStar_Ident.text_of_id ty.FStar_Ident.ns
                       in
                    let fs = record_fields fns pats  in
                    FStar_Extraction_ML_Syntax.MLP_Record (path, fs)
                | uu____4313 -> p))
      | uu____4316 -> p
  
let rec (extract_one_pat :
  Prims.bool ->
    FStar_Extraction_ML_UEnv.uenv ->
      FStar_Syntax_Syntax.pat ->
        FStar_Extraction_ML_Syntax.mlty FStar_Pervasives_Native.option ->
          (FStar_Extraction_ML_UEnv.uenv ->
             FStar_Syntax_Syntax.term ->
               (FStar_Extraction_ML_Syntax.mlexpr *
                 FStar_Extraction_ML_Syntax.e_tag *
                 FStar_Extraction_ML_Syntax.mlty))
            ->
            (FStar_Extraction_ML_UEnv.uenv *
              (FStar_Extraction_ML_Syntax.mlpattern *
              FStar_Extraction_ML_Syntax.mlexpr Prims.list)
              FStar_Pervasives_Native.option * Prims.bool))
  =
  fun imp  ->
    fun g  ->
      fun p  ->
        fun expected_topt  ->
          fun term_as_mlexpr  ->
            let ok t =
              match expected_topt with
              | FStar_Pervasives_Native.None  -> true
              | FStar_Pervasives_Native.Some t' ->
                  let ok = type_leq g t t'  in
                  (if Prims.op_Negation ok
                   then
                     FStar_Extraction_ML_UEnv.debug g
                       (fun uu____4418  ->
                          let uu____4419 =
                            FStar_Extraction_ML_Code.string_of_mlty
                              g.FStar_Extraction_ML_UEnv.currentModule t'
                             in
                          let uu____4421 =
                            FStar_Extraction_ML_Code.string_of_mlty
                              g.FStar_Extraction_ML_UEnv.currentModule t
                             in
                          FStar_Util.print2
                            "Expected pattern type %s; got pattern type %s\n"
                            uu____4419 uu____4421)
                   else ();
                   ok)
               in
            match p.FStar_Syntax_Syntax.v with
            | FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_int
                (c,swopt)) when
                let uu____4457 = FStar_Options.codegen ()  in
                uu____4457 <>
                  (FStar_Pervasives_Native.Some FStar_Options.Kremlin)
                ->
                let uu____4462 =
                  match swopt with
                  | FStar_Pervasives_Native.None  ->
                      let uu____4475 =
                        let uu____4476 =
                          let uu____4477 =
                            FStar_Extraction_ML_Util.mlconst_of_const
                              p.FStar_Syntax_Syntax.p
                              (FStar_Const.Const_int
                                 (c, FStar_Pervasives_Native.None))
                             in
                          FStar_Extraction_ML_Syntax.MLE_Const uu____4477  in
                        FStar_All.pipe_left
                          (FStar_Extraction_ML_Syntax.with_ty
                             FStar_Extraction_ML_Syntax.ml_int_ty) uu____4476
                         in
                      (uu____4475, FStar_Extraction_ML_Syntax.ml_int_ty)
                  | FStar_Pervasives_Native.Some sw ->
                      let source_term =
                        FStar_ToSyntax_ToSyntax.desugar_machine_integer
                          (g.FStar_Extraction_ML_UEnv.env_tcenv).FStar_TypeChecker_Env.dsenv
                          c sw FStar_Range.dummyRange
                         in
                      let uu____4499 = term_as_mlexpr g source_term  in
                      (match uu____4499 with
                       | (mlterm,uu____4511,mlty) -> (mlterm, mlty))
                   in
                (match uu____4462 with
                 | (mlc,ml_ty) ->
                     let x = FStar_Extraction_ML_Syntax.gensym ()  in
                     let when_clause =
                       let uu____4533 =
                         let uu____4534 =
                           let uu____4541 =
                             let uu____4544 =
                               FStar_All.pipe_left
                                 (FStar_Extraction_ML_Syntax.with_ty ml_ty)
                                 (FStar_Extraction_ML_Syntax.MLE_Var x)
                                in
                             [uu____4544; mlc]  in
                           (FStar_Extraction_ML_Util.prims_op_equality,
                             uu____4541)
                            in
                         FStar_Extraction_ML_Syntax.MLE_App uu____4534  in
                       FStar_All.pipe_left
                         (FStar_Extraction_ML_Syntax.with_ty
                            FStar_Extraction_ML_Syntax.ml_bool_ty) uu____4533
                        in
                     let uu____4547 = ok ml_ty  in
                     (g,
                       (FStar_Pervasives_Native.Some
                          ((FStar_Extraction_ML_Syntax.MLP_Var x),
                            [when_clause])), uu____4547))
            | FStar_Syntax_Syntax.Pat_constant s ->
                let t =
                  FStar_TypeChecker_TcTerm.tc_constant
                    g.FStar_Extraction_ML_UEnv.env_tcenv
                    FStar_Range.dummyRange s
                   in
                let mlty = term_as_mlty g t  in
                let uu____4569 =
                  let uu____4578 =
                    let uu____4585 =
                      let uu____4586 =
                        FStar_Extraction_ML_Util.mlconst_of_const
                          p.FStar_Syntax_Syntax.p s
                         in
                      FStar_Extraction_ML_Syntax.MLP_Const uu____4586  in
                    (uu____4585, [])  in
                  FStar_Pervasives_Native.Some uu____4578  in
                let uu____4595 = ok mlty  in (g, uu____4569, uu____4595)
            | FStar_Syntax_Syntax.Pat_var x ->
                let mlty = term_as_mlty g x.FStar_Syntax_Syntax.sort  in
                let uu____4608 =
                  FStar_Extraction_ML_UEnv.extend_bv g x ([], mlty) false
                    false imp
                   in
                (match uu____4608 with
                 | (g1,x1,uu____4636) ->
                     let uu____4639 = ok mlty  in
                     (g1,
                       (if imp
                        then FStar_Pervasives_Native.None
                        else
                          FStar_Pervasives_Native.Some
                            ((FStar_Extraction_ML_Syntax.MLP_Var x1), [])),
                       uu____4639))
            | FStar_Syntax_Syntax.Pat_wild x ->
                let mlty = term_as_mlty g x.FStar_Syntax_Syntax.sort  in
                let uu____4677 =
                  FStar_Extraction_ML_UEnv.extend_bv g x ([], mlty) false
                    false imp
                   in
                (match uu____4677 with
                 | (g1,x1,uu____4705) ->
                     let uu____4708 = ok mlty  in
                     (g1,
                       (if imp
                        then FStar_Pervasives_Native.None
                        else
                          FStar_Pervasives_Native.Some
                            ((FStar_Extraction_ML_Syntax.MLP_Var x1), [])),
                       uu____4708))
            | FStar_Syntax_Syntax.Pat_dot_term uu____4744 ->
                (g, FStar_Pervasives_Native.None, true)
            | FStar_Syntax_Syntax.Pat_cons (f,pats) ->
                let uu____4787 =
                  let uu____4796 = FStar_Extraction_ML_UEnv.lookup_fv g f  in
                  match uu____4796 with
                  | { FStar_Extraction_ML_UEnv.exp_b_name = uu____4805;
                      FStar_Extraction_ML_UEnv.exp_b_expr =
                        {
                          FStar_Extraction_ML_Syntax.expr =
                            FStar_Extraction_ML_Syntax.MLE_Name n1;
                          FStar_Extraction_ML_Syntax.mlty = uu____4807;
                          FStar_Extraction_ML_Syntax.loc = uu____4808;_};
                      FStar_Extraction_ML_UEnv.exp_b_tscheme = ttys;
                      FStar_Extraction_ML_UEnv.exp_b_inst_ok = uu____4810;_}
                      -> (n1, ttys)
                  | uu____4817 -> failwith "Expected a constructor"  in
                (match uu____4787 with
                 | (d,tys) ->
                     let nTyVars =
                       FStar_List.length (FStar_Pervasives_Native.fst tys)
                        in
                     let uu____4854 = FStar_Util.first_N nTyVars pats  in
                     (match uu____4854 with
                      | (tysVarPats,restPats) ->
                          let f_ty_opt =
                            try
                              (fun uu___831_4958  ->
                                 match () with
                                 | () ->
                                     let mlty_args =
                                       FStar_All.pipe_right tysVarPats
                                         (FStar_List.map
                                            (fun uu____4989  ->
                                               match uu____4989 with
                                               | (p1,uu____4996) ->
                                                   (match p1.FStar_Syntax_Syntax.v
                                                    with
                                                    | FStar_Syntax_Syntax.Pat_dot_term
                                                        (uu____4999,t) ->
                                                        term_as_mlty g t
                                                    | uu____5005 ->
                                                        (FStar_Extraction_ML_UEnv.debug
                                                           g
                                                           (fun uu____5009 
                                                              ->
                                                              let uu____5010
                                                                =
                                                                FStar_Syntax_Print.pat_to_string
                                                                  p1
                                                                 in
                                                              FStar_Util.print1
                                                                "Pattern %s is not extractable"
                                                                uu____5010);
                                                         FStar_Exn.raise
                                                           Un_extractable))))
                                        in
                                     let f_ty =
                                       FStar_Extraction_ML_Util.subst tys
                                         mlty_args
                                        in
                                     let uu____5014 =
                                       FStar_Extraction_ML_Util.uncurry_mlty_fun
                                         f_ty
                                        in
                                     FStar_Pervasives_Native.Some uu____5014)
                                ()
                            with
                            | Un_extractable  -> FStar_Pervasives_Native.None
                             in
                          let uu____5043 =
                            FStar_Util.fold_map
                              (fun g1  ->
                                 fun uu____5080  ->
                                   match uu____5080 with
                                   | (p1,imp1) ->
                                       let uu____5102 =
                                         extract_one_pat true g1 p1
                                           FStar_Pervasives_Native.None
                                           term_as_mlexpr
                                          in
                                       (match uu____5102 with
                                        | (g2,p2,uu____5133) -> (g2, p2))) g
                              tysVarPats
                             in
                          (match uu____5043 with
                           | (g1,tyMLPats) ->
                               let uu____5197 =
                                 FStar_Util.fold_map
                                   (fun uu____5262  ->
                                      fun uu____5263  ->
                                        match (uu____5262, uu____5263) with
                                        | ((g2,f_ty_opt1),(p1,imp1)) ->
                                            let uu____5361 =
                                              match f_ty_opt1 with
                                              | FStar_Pervasives_Native.Some
                                                  (hd1::rest,res) ->
                                                  ((FStar_Pervasives_Native.Some
                                                      (rest, res)),
                                                    (FStar_Pervasives_Native.Some
                                                       hd1))
                                              | uu____5421 ->
                                                  (FStar_Pervasives_Native.None,
                                                    FStar_Pervasives_Native.None)
                                               in
                                            (match uu____5361 with
                                             | (f_ty_opt2,expected_ty) ->
                                                 let uu____5492 =
                                                   extract_one_pat false g2
                                                     p1 expected_ty
                                                     term_as_mlexpr
                                                    in
                                                 (match uu____5492 with
                                                  | (g3,p2,uu____5535) ->
                                                      ((g3, f_ty_opt2), p2))))
                                   (g1, f_ty_opt) restPats
                                  in
                               (match uu____5197 with
                                | ((g2,f_ty_opt1),restMLPats) ->
                                    let uu____5656 =
                                      let uu____5667 =
                                        FStar_All.pipe_right
                                          (FStar_List.append tyMLPats
                                             restMLPats)
                                          (FStar_List.collect
                                             (fun uu___0_5718  ->
                                                match uu___0_5718 with
                                                | FStar_Pervasives_Native.Some
                                                    x -> [x]
                                                | uu____5760 -> []))
                                         in
                                      FStar_All.pipe_right uu____5667
                                        FStar_List.split
                                       in
                                    (match uu____5656 with
                                     | (mlPats,when_clauses) ->
                                         let pat_ty_compat =
                                           match f_ty_opt1 with
                                           | FStar_Pervasives_Native.Some
                                               ([],t) -> ok t
                                           | uu____5836 -> false  in
                                         let uu____5846 =
                                           let uu____5855 =
                                             let uu____5862 =
                                               resugar_pat
                                                 f.FStar_Syntax_Syntax.fv_qual
                                                 (FStar_Extraction_ML_Syntax.MLP_CTor
                                                    (d, mlPats))
                                                in
                                             let uu____5865 =
                                               FStar_All.pipe_right
                                                 when_clauses
                                                 FStar_List.flatten
                                                in
                                             (uu____5862, uu____5865)  in
                                           FStar_Pervasives_Native.Some
                                             uu____5855
                                            in
                                         (g2, uu____5846, pat_ty_compat))))))
  
let (extract_pat :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.pat ->
      FStar_Extraction_ML_Syntax.mlty ->
        (FStar_Extraction_ML_UEnv.uenv ->
           FStar_Syntax_Syntax.term ->
             (FStar_Extraction_ML_Syntax.mlexpr *
               FStar_Extraction_ML_Syntax.e_tag *
               FStar_Extraction_ML_Syntax.mlty))
          ->
          (FStar_Extraction_ML_UEnv.uenv *
            (FStar_Extraction_ML_Syntax.mlpattern *
            FStar_Extraction_ML_Syntax.mlexpr FStar_Pervasives_Native.option)
            Prims.list * Prims.bool))
  =
  fun g  ->
    fun p  ->
      fun expected_t  ->
        fun term_as_mlexpr  ->
          let extract_one_pat1 g1 p1 expected_t1 =
            let uu____5997 =
              extract_one_pat false g1 p1 expected_t1 term_as_mlexpr  in
            match uu____5997 with
            | (g2,FStar_Pervasives_Native.Some (x,v1),b) -> (g2, (x, v1), b)
            | uu____6060 ->
                failwith "Impossible: Unable to translate pattern"
             in
          let mk_when_clause whens =
            match whens with
            | [] -> FStar_Pervasives_Native.None
            | hd1::tl1 ->
                let uu____6108 =
                  FStar_List.fold_left FStar_Extraction_ML_Util.conjoin hd1
                    tl1
                   in
                FStar_Pervasives_Native.Some uu____6108
             in
          let uu____6109 =
            extract_one_pat1 g p (FStar_Pervasives_Native.Some expected_t)
             in
          match uu____6109 with
          | (g1,(p1,whens),b) ->
              let when_clause = mk_when_clause whens  in
              (g1, [(p1, when_clause)], b)
  
let (maybe_eta_data_and_project_record :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option ->
      FStar_Extraction_ML_Syntax.mlty ->
        FStar_Extraction_ML_Syntax.mlexpr ->
          FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun g  ->
    fun qual  ->
      fun residualType  ->
        fun mlAppExpr  ->
          let rec eta_args more_args t =
            match t with
            | FStar_Extraction_ML_Syntax.MLTY_Fun (t0,uu____6269,t1) ->
                let x = FStar_Extraction_ML_Syntax.gensym ()  in
                let uu____6273 =
                  let uu____6285 =
                    let uu____6295 =
                      FStar_All.pipe_left
                        (FStar_Extraction_ML_Syntax.with_ty t0)
                        (FStar_Extraction_ML_Syntax.MLE_Var x)
                       in
                    ((x, t0), uu____6295)  in
                  uu____6285 :: more_args  in
                eta_args uu____6273 t1
            | FStar_Extraction_ML_Syntax.MLTY_Named (uu____6311,uu____6312)
                -> ((FStar_List.rev more_args), t)
            | uu____6337 ->
                let uu____6338 =
                  let uu____6340 =
                    FStar_Extraction_ML_Code.string_of_mlexpr
                      g.FStar_Extraction_ML_UEnv.currentModule mlAppExpr
                     in
                  let uu____6342 =
                    FStar_Extraction_ML_Code.string_of_mlty
                      g.FStar_Extraction_ML_UEnv.currentModule t
                     in
                  FStar_Util.format2
                    "Impossible: Head type is not an arrow: (%s : %s)"
                    uu____6340 uu____6342
                   in
                failwith uu____6338
             in
          let as_record qual1 e =
            match ((e.FStar_Extraction_ML_Syntax.expr), qual1) with
            | (FStar_Extraction_ML_Syntax.MLE_CTor
               (uu____6377,args),FStar_Pervasives_Native.Some
               (FStar_Syntax_Syntax.Record_ctor (tyname,fields))) ->
                let path =
                  FStar_List.map FStar_Ident.text_of_id tyname.FStar_Ident.ns
                   in
                let fields1 = record_fields fields args  in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     e.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_Record (path, fields1))
            | uu____6414 -> e  in
          let resugar_and_maybe_eta qual1 e =
            let uu____6436 = eta_args [] residualType  in
            match uu____6436 with
            | (eargs,tres) ->
                (match eargs with
                 | [] ->
                     let uu____6494 = as_record qual1 e  in
                     FStar_Extraction_ML_Util.resugar_exp uu____6494
                 | uu____6495 ->
                     let uu____6507 = FStar_List.unzip eargs  in
                     (match uu____6507 with
                      | (binders,eargs1) ->
                          (match e.FStar_Extraction_ML_Syntax.expr with
                           | FStar_Extraction_ML_Syntax.MLE_CTor (head1,args)
                               ->
                               let body =
                                 let uu____6553 =
                                   let uu____6554 =
                                     FStar_All.pipe_left
                                       (FStar_Extraction_ML_Syntax.with_ty
                                          tres)
                                       (FStar_Extraction_ML_Syntax.MLE_CTor
                                          (head1,
                                            (FStar_List.append args eargs1)))
                                      in
                                   FStar_All.pipe_left (as_record qual1)
                                     uu____6554
                                    in
                                 FStar_All.pipe_left
                                   FStar_Extraction_ML_Util.resugar_exp
                                   uu____6553
                                  in
                               FStar_All.pipe_left
                                 (FStar_Extraction_ML_Syntax.with_ty
                                    e.FStar_Extraction_ML_Syntax.mlty)
                                 (FStar_Extraction_ML_Syntax.MLE_Fun
                                    (binders, body))
                           | uu____6564 ->
                               failwith "Impossible: Not a constructor")))
             in
          match ((mlAppExpr.FStar_Extraction_ML_Syntax.expr), qual) with
          | (uu____6568,FStar_Pervasives_Native.None ) -> mlAppExpr
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6572;
                FStar_Extraction_ML_Syntax.loc = uu____6573;_},mle::args),FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Record_projector (constrname,f))) ->
              let f1 =
                FStar_Ident.lid_of_ids
                  (FStar_List.append constrname.FStar_Ident.ns [f])
                 in
              let fn = FStar_Extraction_ML_Util.mlpath_of_lid f1  in
              let proj = FStar_Extraction_ML_Syntax.MLE_Proj (mle, fn)  in
              let e =
                match args with
                | [] -> proj
                | uu____6596 ->
                    let uu____6599 =
                      let uu____6606 =
                        FStar_All.pipe_left
                          (FStar_Extraction_ML_Syntax.with_ty
                             FStar_Extraction_ML_Syntax.MLTY_Top) proj
                         in
                      (uu____6606, args)  in
                    FStar_Extraction_ML_Syntax.MLE_App uu____6599
                 in
              FStar_Extraction_ML_Syntax.with_ty
                mlAppExpr.FStar_Extraction_ML_Syntax.mlty e
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_TApp
                  ({
                     FStar_Extraction_ML_Syntax.expr =
                       FStar_Extraction_ML_Syntax.MLE_Name mlp;
                     FStar_Extraction_ML_Syntax.mlty = uu____6610;
                     FStar_Extraction_ML_Syntax.loc = uu____6611;_},uu____6612);
                FStar_Extraction_ML_Syntax.mlty = uu____6613;
                FStar_Extraction_ML_Syntax.loc = uu____6614;_},mle::args),FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Record_projector (constrname,f))) ->
              let f1 =
                FStar_Ident.lid_of_ids
                  (FStar_List.append constrname.FStar_Ident.ns [f])
                 in
              let fn = FStar_Extraction_ML_Util.mlpath_of_lid f1  in
              let proj = FStar_Extraction_ML_Syntax.MLE_Proj (mle, fn)  in
              let e =
                match args with
                | [] -> proj
                | uu____6641 ->
                    let uu____6644 =
                      let uu____6651 =
                        FStar_All.pipe_left
                          (FStar_Extraction_ML_Syntax.with_ty
                             FStar_Extraction_ML_Syntax.MLTY_Top) proj
                         in
                      (uu____6651, args)  in
                    FStar_Extraction_ML_Syntax.MLE_App uu____6644
                 in
              FStar_Extraction_ML_Syntax.with_ty
                mlAppExpr.FStar_Extraction_ML_Syntax.mlty e
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6655;
                FStar_Extraction_ML_Syntax.loc = uu____6656;_},mlargs),FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Data_ctor )) ->
              let uu____6664 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, mlargs))
                 in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6664
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6668;
                FStar_Extraction_ML_Syntax.loc = uu____6669;_},mlargs),FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Record_ctor uu____6671)) ->
              let uu____6684 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, mlargs))
                 in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6684
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_TApp
                  ({
                     FStar_Extraction_ML_Syntax.expr =
                       FStar_Extraction_ML_Syntax.MLE_Name mlp;
                     FStar_Extraction_ML_Syntax.mlty = uu____6688;
                     FStar_Extraction_ML_Syntax.loc = uu____6689;_},uu____6690);
                FStar_Extraction_ML_Syntax.mlty = uu____6691;
                FStar_Extraction_ML_Syntax.loc = uu____6692;_},mlargs),FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Data_ctor )) ->
              let uu____6704 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, mlargs))
                 in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6704
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_TApp
                  ({
                     FStar_Extraction_ML_Syntax.expr =
                       FStar_Extraction_ML_Syntax.MLE_Name mlp;
                     FStar_Extraction_ML_Syntax.mlty = uu____6708;
                     FStar_Extraction_ML_Syntax.loc = uu____6709;_},uu____6710);
                FStar_Extraction_ML_Syntax.mlty = uu____6711;
                FStar_Extraction_ML_Syntax.loc = uu____6712;_},mlargs),FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Record_ctor uu____6714)) ->
              let uu____6731 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, mlargs))
                 in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6731
          | (FStar_Extraction_ML_Syntax.MLE_Name
             mlp,FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor
             )) ->
              let uu____6737 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, []))
                 in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6737
          | (FStar_Extraction_ML_Syntax.MLE_Name
             mlp,FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Record_ctor uu____6741)) ->
              let uu____6750 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, []))
                 in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6750
          | (FStar_Extraction_ML_Syntax.MLE_TApp
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6754;
                FStar_Extraction_ML_Syntax.loc = uu____6755;_},uu____6756),FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Data_ctor )) ->
              let uu____6763 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, []))
                 in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6763
          | (FStar_Extraction_ML_Syntax.MLE_TApp
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6767;
                FStar_Extraction_ML_Syntax.loc = uu____6768;_},uu____6769),FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Record_ctor uu____6770)) ->
              let uu____6783 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, []))
                 in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6783
          | uu____6786 -> mlAppExpr
  
let (maybe_promote_effect :
  FStar_Extraction_ML_Syntax.mlexpr ->
    FStar_Extraction_ML_Syntax.e_tag ->
      FStar_Extraction_ML_Syntax.mlty ->
        (FStar_Extraction_ML_Syntax.mlexpr *
          FStar_Extraction_ML_Syntax.e_tag))
  =
  fun ml_e  ->
    fun tag  ->
      fun t  ->
        match (tag, t) with
        | (FStar_Extraction_ML_Syntax.E_GHOST
           ,FStar_Extraction_ML_Syntax.MLTY_Erased ) ->
            (FStar_Extraction_ML_Syntax.ml_unit,
              FStar_Extraction_ML_Syntax.E_PURE)
        | (FStar_Extraction_ML_Syntax.E_PURE
           ,FStar_Extraction_ML_Syntax.MLTY_Erased ) ->
            (FStar_Extraction_ML_Syntax.ml_unit,
              FStar_Extraction_ML_Syntax.E_PURE)
        | uu____6817 -> (ml_e, tag)
  
let (extract_lb_sig :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.letbindings ->
      (FStar_Syntax_Syntax.lbname * FStar_Extraction_ML_Syntax.e_tag *
        (FStar_Syntax_Syntax.typ * (FStar_Syntax_Syntax.binders *
        FStar_Extraction_ML_Syntax.mltyscheme)) * Prims.bool *
        FStar_Syntax_Syntax.term) Prims.list)
  =
  fun g  ->
    fun lbs  ->
      let maybe_generalize uu____6878 =
        match uu____6878 with
        | { FStar_Syntax_Syntax.lbname = lbname_;
            FStar_Syntax_Syntax.lbunivs = uu____6899;
            FStar_Syntax_Syntax.lbtyp = lbtyp;
            FStar_Syntax_Syntax.lbeff = lbeff;
            FStar_Syntax_Syntax.lbdef = lbdef;
            FStar_Syntax_Syntax.lbattrs = lbattrs;
            FStar_Syntax_Syntax.lbpos = uu____6904;_} ->
            ((match lbattrs with
              | [] -> ()
              | uu____6941 ->
                  (FStar_Util.print1
                     "Testing whether term has any rename_let %s..." "";
                   (let uu____6949 =
                      FStar_Syntax_Util.get_attribute
                        FStar_Parser_Const.rename_let_attr lbattrs
                       in
                    match uu____6949 with
                    | FStar_Pervasives_Native.Some
                        ((arg,uu____6953)::uu____6954) ->
                        (match arg.FStar_Syntax_Syntax.n with
                         | FStar_Syntax_Syntax.Tm_constant
                             (FStar_Const.Const_string (arg1,uu____6982)) ->
                             FStar_Util.print1 "Term has rename_let %s\n"
                               arg1
                         | uu____6986 ->
                             FStar_Util.print1
                               "Term has some rename_let %s\n" "")
                    | uu____6989 ->
                        FStar_Util.print1 "no rename_let found %s\n" "")));
             (let f_e = effect_as_etag g lbeff  in
              let lbtyp1 = FStar_Syntax_Subst.compress lbtyp  in
              let no_gen uu____7041 =
                let expected_t = term_as_mlty g lbtyp1  in
                (lbname_, f_e, (lbtyp1, ([], ([], expected_t))), false,
                  lbdef)
                 in
              let uu____7118 =
                FStar_TypeChecker_Util.must_erase_for_extraction
                  g.FStar_Extraction_ML_UEnv.env_tcenv lbtyp1
                 in
              if uu____7118
              then
                (lbname_, f_e,
                  (lbtyp1,
                    ([], ([], FStar_Extraction_ML_Syntax.MLTY_Erased))),
                  false, lbdef)
              else
                (match lbtyp1.FStar_Syntax_Syntax.n with
                 | FStar_Syntax_Syntax.Tm_arrow (bs,c) when
                     let uu____7204 = FStar_List.hd bs  in
                     FStar_All.pipe_right uu____7204 (is_type_binder g) ->
                     let uu____7226 = FStar_Syntax_Subst.open_comp bs c  in
                     (match uu____7226 with
                      | (bs1,c1) ->
                          let uu____7252 =
                            let uu____7265 =
                              FStar_Util.prefix_until
                                (fun x  ->
                                   let uu____7311 = is_type_binder g x  in
                                   Prims.op_Negation uu____7311) bs1
                               in
                            match uu____7265 with
                            | FStar_Pervasives_Native.None  ->
                                (bs1, (FStar_Syntax_Util.comp_result c1))
                            | FStar_Pervasives_Native.Some (bs2,b,rest) ->
                                let uu____7438 =
                                  FStar_Syntax_Util.arrow (b :: rest) c1  in
                                (bs2, uu____7438)
                             in
                          (match uu____7252 with
                           | (tbinders,tbody) ->
                               let n_tbinders = FStar_List.length tbinders
                                  in
                               let lbdef1 =
                                 let uu____7500 = normalize_abs lbdef  in
                                 FStar_All.pipe_right uu____7500
                                   FStar_Syntax_Util.unmeta
                                  in
                               (match lbdef1.FStar_Syntax_Syntax.n with
                                | FStar_Syntax_Syntax.Tm_abs (bs2,body,copt)
                                    ->
                                    let uu____7549 =
                                      FStar_Syntax_Subst.open_term bs2 body
                                       in
                                    (match uu____7549 with
                                     | (bs3,body1) ->
                                         if
                                           n_tbinders <=
                                             (FStar_List.length bs3)
                                         then
                                           let uu____7601 =
                                             FStar_Util.first_N n_tbinders
                                               bs3
                                              in
                                           (match uu____7601 with
                                            | (targs,rest_args) ->
                                                let expected_source_ty =
                                                  let s =
                                                    FStar_List.map2
                                                      (fun uu____7704  ->
                                                         fun uu____7705  ->
                                                           match (uu____7704,
                                                                   uu____7705)
                                                           with
                                                           | ((x,uu____7731),
                                                              (y,uu____7733))
                                                               ->
                                                               let uu____7754
                                                                 =
                                                                 let uu____7761
                                                                   =
                                                                   FStar_Syntax_Syntax.bv_to_name
                                                                    y
                                                                    in
                                                                 (x,
                                                                   uu____7761)
                                                                  in
                                                               FStar_Syntax_Syntax.NT
                                                                 uu____7754)
                                                      tbinders targs
                                                     in
                                                  FStar_Syntax_Subst.subst s
                                                    tbody
                                                   in
                                                let env =
                                                  FStar_List.fold_left
                                                    (fun env  ->
                                                       fun uu____7778  ->
                                                         match uu____7778
                                                         with
                                                         | (a,uu____7786) ->
                                                             FStar_Extraction_ML_UEnv.extend_ty
                                                               env a
                                                               FStar_Pervasives_Native.None)
                                                    g targs
                                                   in
                                                let expected_t =
                                                  term_as_mlty env
                                                    expected_source_ty
                                                   in
                                                let polytype =
                                                  let uu____7797 =
                                                    FStar_All.pipe_right
                                                      targs
                                                      (FStar_List.map
                                                         (fun uu____7816  ->
                                                            match uu____7816
                                                            with
                                                            | (x,uu____7825)
                                                                ->
                                                                FStar_Extraction_ML_UEnv.bv_as_ml_tyvar
                                                                  x))
                                                     in
                                                  (uu____7797, expected_t)
                                                   in
                                                let add_unit =
                                                  match rest_args with
                                                  | [] ->
                                                      (let uu____7841 =
                                                         is_fstar_value body1
                                                          in
                                                       Prims.op_Negation
                                                         uu____7841)
                                                        ||
                                                        (let uu____7844 =
                                                           FStar_Syntax_Util.is_pure_comp
                                                             c1
                                                            in
                                                         Prims.op_Negation
                                                           uu____7844)
                                                  | uu____7846 -> false  in
                                                let rest_args1 =
                                                  if add_unit
                                                  then unit_binder ::
                                                    rest_args
                                                  else rest_args  in
                                                let polytype1 =
                                                  if add_unit
                                                  then
                                                    FStar_Extraction_ML_Syntax.push_unit
                                                      polytype
                                                  else polytype  in
                                                let body2 =
                                                  FStar_Syntax_Util.abs
                                                    rest_args1 body1 copt
                                                   in
                                                (lbname_, f_e,
                                                  (lbtyp1,
                                                    (targs, polytype1)),
                                                  add_unit, body2))
                                         else
                                           failwith "Not enough type binders")
                                | FStar_Syntax_Syntax.Tm_uinst uu____7908 ->
                                    let env =
                                      FStar_List.fold_left
                                        (fun env  ->
                                           fun uu____7927  ->
                                             match uu____7927 with
                                             | (a,uu____7935) ->
                                                 FStar_Extraction_ML_UEnv.extend_ty
                                                   env a
                                                   FStar_Pervasives_Native.None)
                                        g tbinders
                                       in
                                    let expected_t = term_as_mlty env tbody
                                       in
                                    let polytype =
                                      let uu____7946 =
                                        FStar_All.pipe_right tbinders
                                          (FStar_List.map
                                             (fun uu____7965  ->
                                                match uu____7965 with
                                                | (x,uu____7974) ->
                                                    FStar_Extraction_ML_UEnv.bv_as_ml_tyvar
                                                      x))
                                         in
                                      (uu____7946, expected_t)  in
                                    let args =
                                      FStar_All.pipe_right tbinders
                                        (FStar_List.map
                                           (fun uu____8018  ->
                                              match uu____8018 with
                                              | (bv,uu____8026) ->
                                                  let uu____8031 =
                                                    FStar_Syntax_Syntax.bv_to_name
                                                      bv
                                                     in
                                                  FStar_All.pipe_right
                                                    uu____8031
                                                    FStar_Syntax_Syntax.as_arg))
                                       in
                                    let e =
                                      FStar_Syntax_Syntax.mk
                                        (FStar_Syntax_Syntax.Tm_app
                                           (lbdef1, args))
                                        FStar_Pervasives_Native.None
                                        lbdef1.FStar_Syntax_Syntax.pos
                                       in
                                    (lbname_, f_e,
                                      (lbtyp1, (tbinders, polytype)), false,
                                      e)
                                | FStar_Syntax_Syntax.Tm_fvar uu____8061 ->
                                    let env =
                                      FStar_List.fold_left
                                        (fun env  ->
                                           fun uu____8074  ->
                                             match uu____8074 with
                                             | (a,uu____8082) ->
                                                 FStar_Extraction_ML_UEnv.extend_ty
                                                   env a
                                                   FStar_Pervasives_Native.None)
                                        g tbinders
                                       in
                                    let expected_t = term_as_mlty env tbody
                                       in
                                    let polytype =
                                      let uu____8093 =
                                        FStar_All.pipe_right tbinders
                                          (FStar_List.map
                                             (fun uu____8112  ->
                                                match uu____8112 with
                                                | (x,uu____8121) ->
                                                    FStar_Extraction_ML_UEnv.bv_as_ml_tyvar
                                                      x))
                                         in
                                      (uu____8093, expected_t)  in
                                    let args =
                                      FStar_All.pipe_right tbinders
                                        (FStar_List.map
                                           (fun uu____8165  ->
                                              match uu____8165 with
                                              | (bv,uu____8173) ->
                                                  let uu____8178 =
                                                    FStar_Syntax_Syntax.bv_to_name
                                                      bv
                                                     in
                                                  FStar_All.pipe_right
                                                    uu____8178
                                                    FStar_Syntax_Syntax.as_arg))
                                       in
                                    let e =
                                      FStar_Syntax_Syntax.mk
                                        (FStar_Syntax_Syntax.Tm_app
                                           (lbdef1, args))
                                        FStar_Pervasives_Native.None
                                        lbdef1.FStar_Syntax_Syntax.pos
                                       in
                                    (lbname_, f_e,
                                      (lbtyp1, (tbinders, polytype)), false,
                                      e)
                                | FStar_Syntax_Syntax.Tm_name uu____8208 ->
                                    let env =
                                      FStar_List.fold_left
                                        (fun env  ->
                                           fun uu____8221  ->
                                             match uu____8221 with
                                             | (a,uu____8229) ->
                                                 FStar_Extraction_ML_UEnv.extend_ty
                                                   env a
                                                   FStar_Pervasives_Native.None)
                                        g tbinders
                                       in
                                    let expected_t = term_as_mlty env tbody
                                       in
                                    let polytype =
                                      let uu____8240 =
                                        FStar_All.pipe_right tbinders
                                          (FStar_List.map
                                             (fun uu____8259  ->
                                                match uu____8259 with
                                                | (x,uu____8268) ->
                                                    FStar_Extraction_ML_UEnv.bv_as_ml_tyvar
                                                      x))
                                         in
                                      (uu____8240, expected_t)  in
                                    let args =
                                      FStar_All.pipe_right tbinders
                                        (FStar_List.map
                                           (fun uu____8312  ->
                                              match uu____8312 with
                                              | (bv,uu____8320) ->
                                                  let uu____8325 =
                                                    FStar_Syntax_Syntax.bv_to_name
                                                      bv
                                                     in
                                                  FStar_All.pipe_right
                                                    uu____8325
                                                    FStar_Syntax_Syntax.as_arg))
                                       in
                                    let e =
                                      FStar_Syntax_Syntax.mk
                                        (FStar_Syntax_Syntax.Tm_app
                                           (lbdef1, args))
                                        FStar_Pervasives_Native.None
                                        lbdef1.FStar_Syntax_Syntax.pos
                                       in
                                    (lbname_, f_e,
                                      (lbtyp1, (tbinders, polytype)), false,
                                      e)
                                | uu____8355 -> err_value_restriction lbdef1)))
                 | uu____8375 -> no_gen ())))
         in
      FStar_All.pipe_right (FStar_Pervasives_Native.snd lbs)
        (FStar_List.map maybe_generalize)
  
let (extract_lb_iface :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.letbindings ->
      (FStar_Extraction_ML_UEnv.uenv * (FStar_Syntax_Syntax.fv *
        FStar_Extraction_ML_UEnv.exp_binding) Prims.list))
  =
  fun g  ->
    fun lbs  ->
      let is_top =
        FStar_Syntax_Syntax.is_top_level (FStar_Pervasives_Native.snd lbs)
         in
      let is_rec =
        (Prims.op_Negation is_top) && (FStar_Pervasives_Native.fst lbs)  in
      let lbs1 = extract_lb_sig g lbs  in
      FStar_Util.fold_map
        (fun env  ->
           fun uu____8526  ->
             match uu____8526 with
             | (lbname,e_tag,(typ,(binders,mltyscheme)),add_unit,_body) ->
                 let uu____8587 =
                   FStar_Extraction_ML_UEnv.extend_lb env lbname typ
                     mltyscheme add_unit is_rec
                    in
                 (match uu____8587 with
                  | (env1,uu____8604,exp_binding) ->
                      let uu____8608 =
                        let uu____8613 = FStar_Util.right lbname  in
                        (uu____8613, exp_binding)  in
                      (env1, uu____8608))) g lbs1
  
let rec (check_term_as_mlexpr :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term ->
      FStar_Extraction_ML_Syntax.e_tag ->
        FStar_Extraction_ML_Syntax.mlty ->
          (FStar_Extraction_ML_Syntax.mlexpr *
            FStar_Extraction_ML_Syntax.mlty))
  =
  fun g  ->
    fun e  ->
      fun f  ->
        fun ty  ->
          FStar_Extraction_ML_UEnv.debug g
            (fun uu____8679  ->
               let uu____8680 = FStar_Syntax_Print.term_to_string e  in
               let uu____8682 =
                 FStar_Extraction_ML_Code.string_of_mlty
                   g.FStar_Extraction_ML_UEnv.currentModule ty
                  in
               FStar_Util.print2 "Checking %s at type %s\n" uu____8680
                 uu____8682);
          (match (f, ty) with
           | (FStar_Extraction_ML_Syntax.E_GHOST ,uu____8689) ->
               (FStar_Extraction_ML_Syntax.ml_unit,
                 FStar_Extraction_ML_Syntax.MLTY_Erased)
           | (FStar_Extraction_ML_Syntax.E_PURE
              ,FStar_Extraction_ML_Syntax.MLTY_Erased ) ->
               (FStar_Extraction_ML_Syntax.ml_unit,
                 FStar_Extraction_ML_Syntax.MLTY_Erased)
           | uu____8690 ->
               let uu____8695 = term_as_mlexpr g e  in
               (match uu____8695 with
                | (ml_e,tag,t) ->
                    let uu____8709 = maybe_promote_effect ml_e tag t  in
                    (match uu____8709 with
                     | (ml_e1,tag1) ->
                         let uu____8720 =
                           FStar_Extraction_ML_Util.eff_leq tag1 f  in
                         if uu____8720
                         then
                           let uu____8727 =
                             maybe_coerce e.FStar_Syntax_Syntax.pos g ml_e1 t
                               ty
                              in
                           (uu____8727, ty)
                         else
                           (match (tag1, f, ty) with
                            | (FStar_Extraction_ML_Syntax.E_GHOST
                               ,FStar_Extraction_ML_Syntax.E_PURE
                               ,FStar_Extraction_ML_Syntax.MLTY_Erased ) ->
                                let uu____8734 =
                                  maybe_coerce e.FStar_Syntax_Syntax.pos g
                                    ml_e1 t ty
                                   in
                                (uu____8734, ty)
                            | uu____8735 ->
                                (err_unexpected_eff g e ty f tag1;
                                 (let uu____8743 =
                                    maybe_coerce e.FStar_Syntax_Syntax.pos g
                                      ml_e1 t ty
                                     in
                                  (uu____8743, ty)))))))

and (term_as_mlexpr :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term ->
      (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag *
        FStar_Extraction_ML_Syntax.mlty))
  =
  fun g  ->
    fun e  ->
      let uu____8746 = term_as_mlexpr' g e  in
      match uu____8746 with
      | (e1,f,t) ->
          let uu____8762 = maybe_promote_effect e1 f t  in
          (match uu____8762 with | (e2,f1) -> (e2, f1, t))

and (term_as_mlexpr' :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term ->
      (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag *
        FStar_Extraction_ML_Syntax.mlty))
  =
  fun g  ->
    fun top  ->
      FStar_Extraction_ML_UEnv.debug g
        (fun u  ->
           let uu____8787 =
             let uu____8789 =
               FStar_Range.string_of_range top.FStar_Syntax_Syntax.pos  in
             let uu____8791 = FStar_Syntax_Print.tag_of_term top  in
             let uu____8793 = FStar_Syntax_Print.term_to_string top  in
             FStar_Util.format3 "%s: term_as_mlexpr' (%s) :  %s \n"
               uu____8789 uu____8791 uu____8793
              in
           FStar_Util.print_string uu____8787);
      (let is_match t =
         let uu____8803 =
           let uu____8804 =
             let uu____8807 =
               FStar_All.pipe_right t FStar_Syntax_Subst.compress  in
             FStar_All.pipe_right uu____8807 FStar_Syntax_Util.unascribe  in
           uu____8804.FStar_Syntax_Syntax.n  in
         match uu____8803 with
         | FStar_Syntax_Syntax.Tm_match uu____8811 -> true
         | uu____8835 -> false  in
       let should_apply_to_match_branches =
         FStar_List.for_all
           (fun uu____8854  ->
              match uu____8854 with
              | (t,uu____8863) ->
                  let uu____8868 =
                    let uu____8869 =
                      FStar_All.pipe_right t FStar_Syntax_Subst.compress  in
                    uu____8869.FStar_Syntax_Syntax.n  in
                  (match uu____8868 with
                   | FStar_Syntax_Syntax.Tm_name uu____8875 -> true
                   | FStar_Syntax_Syntax.Tm_fvar uu____8877 -> true
                   | FStar_Syntax_Syntax.Tm_constant uu____8879 -> true
                   | uu____8881 -> false))
          in
       let apply_to_match_branches head1 args =
         let uu____8920 =
           let uu____8921 =
             let uu____8924 =
               FStar_All.pipe_right head1 FStar_Syntax_Subst.compress  in
             FStar_All.pipe_right uu____8924 FStar_Syntax_Util.unascribe  in
           uu____8921.FStar_Syntax_Syntax.n  in
         match uu____8920 with
         | FStar_Syntax_Syntax.Tm_match (scrutinee,branches) ->
             let branches1 =
               FStar_All.pipe_right branches
                 (FStar_List.map
                    (fun uu____9048  ->
                       match uu____9048 with
                       | (pat,when_opt,body) ->
                           (pat, when_opt,
                             (let uu___1315_9105 = body  in
                              {
                                FStar_Syntax_Syntax.n =
                                  (FStar_Syntax_Syntax.Tm_app (body, args));
                                FStar_Syntax_Syntax.pos =
                                  (uu___1315_9105.FStar_Syntax_Syntax.pos);
                                FStar_Syntax_Syntax.vars =
                                  (uu___1315_9105.FStar_Syntax_Syntax.vars)
                              }))))
                in
             let uu___1318_9120 = head1  in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.Tm_match (scrutinee, branches1));
               FStar_Syntax_Syntax.pos =
                 (uu___1318_9120.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___1318_9120.FStar_Syntax_Syntax.vars)
             }
         | uu____9141 ->
             failwith
               "Impossible! cannot apply args to match branches if head is not a match"
          in
       let t = FStar_Syntax_Subst.compress top  in
       match t.FStar_Syntax_Syntax.n with
       | FStar_Syntax_Syntax.Tm_unknown  ->
           let uu____9152 =
             let uu____9154 = FStar_Syntax_Print.tag_of_term t  in
             FStar_Util.format1 "Impossible: Unexpected term: %s" uu____9154
              in
           failwith uu____9152
       | FStar_Syntax_Syntax.Tm_delayed uu____9163 ->
           let uu____9186 =
             let uu____9188 = FStar_Syntax_Print.tag_of_term t  in
             FStar_Util.format1 "Impossible: Unexpected term: %s" uu____9188
              in
           failwith uu____9186
       | FStar_Syntax_Syntax.Tm_uvar uu____9197 ->
           let uu____9210 =
             let uu____9212 = FStar_Syntax_Print.tag_of_term t  in
             FStar_Util.format1 "Impossible: Unexpected term: %s" uu____9212
              in
           failwith uu____9210
       | FStar_Syntax_Syntax.Tm_bvar uu____9221 ->
           let uu____9222 =
             let uu____9224 = FStar_Syntax_Print.tag_of_term t  in
             FStar_Util.format1 "Impossible: Unexpected term: %s" uu____9224
              in
           failwith uu____9222
       | FStar_Syntax_Syntax.Tm_lazy i ->
           let uu____9234 = FStar_Syntax_Util.unfold_lazy i  in
           term_as_mlexpr g uu____9234
       | FStar_Syntax_Syntax.Tm_type uu____9235 ->
           (FStar_Extraction_ML_Syntax.ml_unit,
             FStar_Extraction_ML_Syntax.E_PURE,
             FStar_Extraction_ML_Syntax.ml_unit_ty)
       | FStar_Syntax_Syntax.Tm_refine uu____9236 ->
           (FStar_Extraction_ML_Syntax.ml_unit,
             FStar_Extraction_ML_Syntax.E_PURE,
             FStar_Extraction_ML_Syntax.ml_unit_ty)
       | FStar_Syntax_Syntax.Tm_arrow uu____9243 ->
           (FStar_Extraction_ML_Syntax.ml_unit,
             FStar_Extraction_ML_Syntax.E_PURE,
             FStar_Extraction_ML_Syntax.ml_unit_ty)
       | FStar_Syntax_Syntax.Tm_quoted
           (qt,{
                 FStar_Syntax_Syntax.qkind =
                   FStar_Syntax_Syntax.Quote_dynamic ;
                 FStar_Syntax_Syntax.antiquotes = uu____9259;_})
           ->
           let uu____9272 =
             let uu____9273 =
               FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.failwith_lid
                 FStar_Syntax_Syntax.delta_constant
                 FStar_Pervasives_Native.None
                in
             FStar_Extraction_ML_UEnv.lookup_fv g uu____9273  in
           (match uu____9272 with
            | { FStar_Extraction_ML_UEnv.exp_b_name = uu____9280;
                FStar_Extraction_ML_UEnv.exp_b_expr = fw;
                FStar_Extraction_ML_UEnv.exp_b_tscheme = uu____9282;
                FStar_Extraction_ML_UEnv.exp_b_inst_ok = uu____9283;_} ->
                let uu____9286 =
                  let uu____9287 =
                    let uu____9288 =
                      let uu____9295 =
                        let uu____9298 =
                          FStar_All.pipe_left
                            (FStar_Extraction_ML_Syntax.with_ty
                               FStar_Extraction_ML_Syntax.ml_string_ty)
                            (FStar_Extraction_ML_Syntax.MLE_Const
                               (FStar_Extraction_ML_Syntax.MLC_String
                                  "Cannot evaluate open quotation at runtime"))
                           in
                        [uu____9298]  in
                      (fw, uu____9295)  in
                    FStar_Extraction_ML_Syntax.MLE_App uu____9288  in
                  FStar_All.pipe_left
                    (FStar_Extraction_ML_Syntax.with_ty
                       FStar_Extraction_ML_Syntax.ml_int_ty) uu____9287
                   in
                (uu____9286, FStar_Extraction_ML_Syntax.E_PURE,
                  FStar_Extraction_ML_Syntax.ml_int_ty))
       | FStar_Syntax_Syntax.Tm_quoted
           (qt,{
                 FStar_Syntax_Syntax.qkind = FStar_Syntax_Syntax.Quote_static ;
                 FStar_Syntax_Syntax.antiquotes = aqs;_})
           ->
           let uu____9316 = FStar_Reflection_Basic.inspect_ln qt  in
           (match uu____9316 with
            | FStar_Reflection_Data.Tv_Var bv ->
                let uu____9324 = FStar_Syntax_Syntax.lookup_aq bv aqs  in
                (match uu____9324 with
                 | FStar_Pervasives_Native.Some tm -> term_as_mlexpr g tm
                 | FStar_Pervasives_Native.None  ->
                     let tv =
                       let uu____9335 =
                         let uu____9342 =
                           FStar_Reflection_Embeddings.e_term_view_aq aqs  in
                         FStar_Syntax_Embeddings.embed uu____9342
                           (FStar_Reflection_Data.Tv_Var bv)
                          in
                       uu____9335 t.FStar_Syntax_Syntax.pos
                         FStar_Pervasives_Native.None
                         FStar_Syntax_Embeddings.id_norm_cb
                        in
                     let t1 =
                       let uu____9350 =
                         let uu____9361 = FStar_Syntax_Syntax.as_arg tv  in
                         [uu____9361]  in
                       FStar_Syntax_Util.mk_app
                         (FStar_Reflection_Data.refl_constant_term
                            FStar_Reflection_Data.fstar_refl_pack_ln)
                         uu____9350
                        in
                     term_as_mlexpr g t1)
            | tv ->
                let tv1 =
                  let uu____9388 =
                    let uu____9395 =
                      FStar_Reflection_Embeddings.e_term_view_aq aqs  in
                    FStar_Syntax_Embeddings.embed uu____9395 tv  in
                  uu____9388 t.FStar_Syntax_Syntax.pos
                    FStar_Pervasives_Native.None
                    FStar_Syntax_Embeddings.id_norm_cb
                   in
                let t1 =
                  let uu____9403 =
                    let uu____9414 = FStar_Syntax_Syntax.as_arg tv1  in
                    [uu____9414]  in
                  FStar_Syntax_Util.mk_app
                    (FStar_Reflection_Data.refl_constant_term
                       FStar_Reflection_Data.fstar_refl_pack_ln) uu____9403
                   in
                term_as_mlexpr g t1)
       | FStar_Syntax_Syntax.Tm_meta
           (t1,FStar_Syntax_Syntax.Meta_monadic (m,uu____9441)) ->
           let t2 = FStar_Syntax_Subst.compress t1  in
           (match t2.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) when
                FStar_Util.is_left lb.FStar_Syntax_Syntax.lbname ->
                let uu____9474 =
                  let uu____9481 =
                    FStar_TypeChecker_Env.effect_decl_opt
                      g.FStar_Extraction_ML_UEnv.env_tcenv m
                     in
                  FStar_Util.must uu____9481  in
                (match uu____9474 with
                 | (ed,qualifiers) ->
                     let uu____9508 =
                       let uu____9510 =
                         FStar_TypeChecker_Env.is_reifiable_effect
                           g.FStar_Extraction_ML_UEnv.env_tcenv
                           ed.FStar_Syntax_Syntax.mname
                          in
                       Prims.op_Negation uu____9510  in
                     if uu____9508
                     then term_as_mlexpr g t2
                     else
                       failwith
                         "This should not happen (should have been handled at Tm_abs level)")
            | uu____9528 -> term_as_mlexpr g t2)
       | FStar_Syntax_Syntax.Tm_meta (t1,uu____9530) -> term_as_mlexpr g t1
       | FStar_Syntax_Syntax.Tm_uinst (t1,uu____9536) -> term_as_mlexpr g t1
       | FStar_Syntax_Syntax.Tm_constant c ->
           let uu____9542 =
             FStar_TypeChecker_TcTerm.type_of_tot_term
               g.FStar_Extraction_ML_UEnv.env_tcenv t
              in
           (match uu____9542 with
            | (uu____9555,ty,uu____9557) ->
                let ml_ty = term_as_mlty g ty  in
                let uu____9559 =
                  let uu____9560 =
                    FStar_Extraction_ML_Util.mlexpr_of_const
                      t.FStar_Syntax_Syntax.pos c
                     in
                  FStar_Extraction_ML_Syntax.with_ty ml_ty uu____9560  in
                (uu____9559, FStar_Extraction_ML_Syntax.E_PURE, ml_ty))
       | FStar_Syntax_Syntax.Tm_name uu____9561 ->
           let uu____9562 = is_type g t  in
           if uu____9562
           then
             (FStar_Extraction_ML_Syntax.ml_unit,
               FStar_Extraction_ML_Syntax.E_PURE,
               FStar_Extraction_ML_Syntax.ml_unit_ty)
           else
             (let uu____9573 = FStar_Extraction_ML_UEnv.lookup_term g t  in
              match uu____9573 with
              | (FStar_Util.Inl uu____9586,uu____9587) ->
                  (FStar_Extraction_ML_Syntax.ml_unit,
                    FStar_Extraction_ML_Syntax.E_PURE,
                    FStar_Extraction_ML_Syntax.ml_unit_ty)
              | (FStar_Util.Inr
                 { FStar_Extraction_ML_UEnv.exp_b_name = uu____9592;
                   FStar_Extraction_ML_UEnv.exp_b_expr = x;
                   FStar_Extraction_ML_UEnv.exp_b_tscheme = mltys;
                   FStar_Extraction_ML_UEnv.exp_b_inst_ok = uu____9595;_},qual)
                  ->
                  (match mltys with
                   | ([],t1) when t1 = FStar_Extraction_ML_Syntax.ml_unit_ty
                       ->
                       (FStar_Extraction_ML_Syntax.ml_unit,
                         FStar_Extraction_ML_Syntax.E_PURE, t1)
                   | ([],t1) ->
                       let uu____9613 =
                         maybe_eta_data_and_project_record g qual t1 x  in
                       (uu____9613, FStar_Extraction_ML_Syntax.E_PURE, t1)
                   | uu____9614 -> instantiate_maybe_partial x mltys []))
       | FStar_Syntax_Syntax.Tm_fvar fv ->
           let uu____9616 = is_type g t  in
           if uu____9616
           then
             (FStar_Extraction_ML_Syntax.ml_unit,
               FStar_Extraction_ML_Syntax.E_PURE,
               FStar_Extraction_ML_Syntax.ml_unit_ty)
           else
             (let uu____9627 = FStar_Extraction_ML_UEnv.try_lookup_fv g fv
                 in
              match uu____9627 with
              | FStar_Pervasives_Native.None  ->
                  (FStar_Extraction_ML_Syntax.ml_unit,
                    FStar_Extraction_ML_Syntax.E_PURE,
                    FStar_Extraction_ML_Syntax.MLTY_Erased)
              | FStar_Pervasives_Native.Some
                  { FStar_Extraction_ML_UEnv.exp_b_name = uu____9636;
                    FStar_Extraction_ML_UEnv.exp_b_expr = x;
                    FStar_Extraction_ML_UEnv.exp_b_tscheme = mltys;
                    FStar_Extraction_ML_UEnv.exp_b_inst_ok = uu____9639;_}
                  ->
                  (FStar_Extraction_ML_UEnv.debug g
                     (fun uu____9647  ->
                        let uu____9648 = FStar_Syntax_Print.fv_to_string fv
                           in
                        let uu____9650 =
                          FStar_Extraction_ML_Code.string_of_mlexpr
                            g.FStar_Extraction_ML_UEnv.currentModule x
                           in
                        let uu____9652 =
                          FStar_Extraction_ML_Code.string_of_mlty
                            g.FStar_Extraction_ML_UEnv.currentModule
                            (FStar_Pervasives_Native.snd mltys)
                           in
                        FStar_Util.print3 "looked up %s: got %s at %s \n"
                          uu____9648 uu____9650 uu____9652);
                   (match mltys with
                    | ([],t1) when t1 = FStar_Extraction_ML_Syntax.ml_unit_ty
                        ->
                        (FStar_Extraction_ML_Syntax.ml_unit,
                          FStar_Extraction_ML_Syntax.E_PURE, t1)
                    | ([],t1) ->
                        let uu____9665 =
                          maybe_eta_data_and_project_record g
                            fv.FStar_Syntax_Syntax.fv_qual t1 x
                           in
                        (uu____9665, FStar_Extraction_ML_Syntax.E_PURE, t1)
                    | uu____9666 -> instantiate_maybe_partial x mltys [])))
       | FStar_Syntax_Syntax.Tm_abs (bs,body,rcopt) ->
           let uu____9694 = FStar_Syntax_Subst.open_term bs body  in
           (match uu____9694 with
            | (bs1,body1) ->
                let uu____9707 = binders_as_ml_binders g bs1  in
                (match uu____9707 with
                 | (ml_bs,env) ->
                     let body2 =
                       match rcopt with
                       | FStar_Pervasives_Native.Some rc ->
                           let uu____9743 =
                             FStar_TypeChecker_Env.is_reifiable_rc
                               env.FStar_Extraction_ML_UEnv.env_tcenv rc
                              in
                           if uu____9743
                           then
                             FStar_TypeChecker_Util.reify_body
                               env.FStar_Extraction_ML_UEnv.env_tcenv
                               [FStar_TypeChecker_Env.Inlining] body1
                           else body1
                       | FStar_Pervasives_Native.None  ->
                           (FStar_Extraction_ML_UEnv.debug g
                              (fun uu____9751  ->
                                 let uu____9752 =
                                   FStar_Syntax_Print.term_to_string body1
                                    in
                                 FStar_Util.print1
                                   "No computation type for: %s\n" uu____9752);
                            body1)
                        in
                     let uu____9755 = term_as_mlexpr env body2  in
                     (match uu____9755 with
                      | (ml_body,f,t1) ->
                          let uu____9771 =
                            FStar_List.fold_right
                              (fun uu____9791  ->
                                 fun uu____9792  ->
                                   match (uu____9791, uu____9792) with
                                   | ((uu____9815,targ),(f1,t2)) ->
                                       (FStar_Extraction_ML_Syntax.E_PURE,
                                         (FStar_Extraction_ML_Syntax.MLTY_Fun
                                            (targ, f1, t2)))) ml_bs (f, t1)
                             in
                          (match uu____9771 with
                           | (f1,tfun) ->
                               let uu____9838 =
                                 FStar_All.pipe_left
                                   (FStar_Extraction_ML_Syntax.with_ty tfun)
                                   (FStar_Extraction_ML_Syntax.MLE_Fun
                                      (ml_bs, ml_body))
                                  in
                               (uu____9838, f1, tfun)))))
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_range_of );
              FStar_Syntax_Syntax.pos = uu____9846;
              FStar_Syntax_Syntax.vars = uu____9847;_},(a1,uu____9849)::[])
           ->
           let ty =
             let uu____9889 =
               FStar_Syntax_Syntax.tabbrev FStar_Parser_Const.range_lid  in
             term_as_mlty g uu____9889  in
           let uu____9890 =
             let uu____9891 =
               FStar_Extraction_ML_Util.mlexpr_of_range
                 a1.FStar_Syntax_Syntax.pos
                in
             FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty ty)
               uu____9891
              in
           (uu____9890, FStar_Extraction_ML_Syntax.E_PURE, ty)
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_set_range_of );
              FStar_Syntax_Syntax.pos = uu____9892;
              FStar_Syntax_Syntax.vars = uu____9893;_},(t1,uu____9895)::
            (r,uu____9897)::[])
           -> term_as_mlexpr g t1
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_reflect uu____9952);
              FStar_Syntax_Syntax.pos = uu____9953;
              FStar_Syntax_Syntax.vars = uu____9954;_},uu____9955)
           -> failwith "Unreachable? Tm_app Const_reflect"
       | FStar_Syntax_Syntax.Tm_app (head1,args) when
           (is_match head1) &&
             (FStar_All.pipe_right args should_apply_to_match_branches)
           ->
           let uu____10014 =
             FStar_All.pipe_right args (apply_to_match_branches head1)  in
           FStar_All.pipe_right uu____10014 (term_as_mlexpr g)
       | FStar_Syntax_Syntax.Tm_app (head1,args) ->
           let is_total rc =
             (FStar_Ident.lid_equals rc.FStar_Syntax_Syntax.residual_effect
                FStar_Parser_Const.effect_Tot_lid)
               ||
               (FStar_All.pipe_right rc.FStar_Syntax_Syntax.residual_flags
                  (FStar_List.existsb
                     (fun uu___1_10068  ->
                        match uu___1_10068 with
                        | FStar_Syntax_Syntax.TOTAL  -> true
                        | uu____10071 -> false)))
              in
           let uu____10073 =
             let uu____10078 =
               let uu____10079 =
                 let uu____10082 =
                   FStar_All.pipe_right head1 FStar_Syntax_Subst.compress  in
                 FStar_All.pipe_right uu____10082 FStar_Syntax_Util.unascribe
                  in
               uu____10079.FStar_Syntax_Syntax.n  in
             ((head1.FStar_Syntax_Syntax.n), uu____10078)  in
           (match uu____10073 with
            | (FStar_Syntax_Syntax.Tm_uvar uu____10091,uu____10092) ->
                let t1 =
                  FStar_TypeChecker_Normalize.normalize
                    [FStar_TypeChecker_Env.Beta;
                    FStar_TypeChecker_Env.Iota;
                    FStar_TypeChecker_Env.Zeta;
                    FStar_TypeChecker_Env.EraseUniverses;
                    FStar_TypeChecker_Env.AllowUnboundUniverses]
                    g.FStar_Extraction_ML_UEnv.env_tcenv t
                   in
                term_as_mlexpr g t1
            | (uu____10106,FStar_Syntax_Syntax.Tm_abs (bs,uu____10108,_rc))
                ->
                let uu____10134 =
                  FStar_All.pipe_right t
                    (FStar_TypeChecker_Normalize.normalize
                       [FStar_TypeChecker_Env.Beta;
                       FStar_TypeChecker_Env.Iota;
                       FStar_TypeChecker_Env.Zeta;
                       FStar_TypeChecker_Env.EraseUniverses;
                       FStar_TypeChecker_Env.AllowUnboundUniverses]
                       g.FStar_Extraction_ML_UEnv.env_tcenv)
                   in
                FStar_All.pipe_right uu____10134 (term_as_mlexpr g)
            | (uu____10141,FStar_Syntax_Syntax.Tm_constant
               (FStar_Const.Const_reify )) ->
                let e =
                  let uu____10143 = FStar_List.hd args  in
                  FStar_TypeChecker_Util.reify_body_with_arg
                    g.FStar_Extraction_ML_UEnv.env_tcenv
                    [FStar_TypeChecker_Env.Inlining] head1 uu____10143
                   in
                let tm =
                  let uu____10155 =
                    let uu____10160 = FStar_TypeChecker_Util.remove_reify e
                       in
                    let uu____10161 = FStar_List.tl args  in
                    FStar_Syntax_Syntax.mk_Tm_app uu____10160 uu____10161  in
                  uu____10155 FStar_Pervasives_Native.None
                    t.FStar_Syntax_Syntax.pos
                   in
                term_as_mlexpr g tm
            | uu____10170 ->
                let rec extract_app is_data uu____10223 uu____10224 restArgs
                  =
                  match (uu____10223, uu____10224) with
                  | ((mlhead,mlargs_f),(f,t1)) ->
                      let mk_head uu____10305 =
                        let mlargs =
                          FStar_All.pipe_right (FStar_List.rev mlargs_f)
                            (FStar_List.map FStar_Pervasives_Native.fst)
                           in
                        FStar_All.pipe_left
                          (FStar_Extraction_ML_Syntax.with_ty t1)
                          (FStar_Extraction_ML_Syntax.MLE_App
                             (mlhead, mlargs))
                         in
                      (FStar_Extraction_ML_UEnv.debug g
                         (fun uu____10332  ->
                            let uu____10333 =
                              let uu____10335 = mk_head ()  in
                              FStar_Extraction_ML_Code.string_of_mlexpr
                                g.FStar_Extraction_ML_UEnv.currentModule
                                uu____10335
                               in
                            let uu____10336 =
                              FStar_Extraction_ML_Code.string_of_mlty
                                g.FStar_Extraction_ML_UEnv.currentModule t1
                               in
                            let uu____10338 =
                              match restArgs with
                              | [] -> "none"
                              | (hd1,uu____10349)::uu____10350 ->
                                  FStar_Syntax_Print.term_to_string hd1
                               in
                            FStar_Util.print3
                              "extract_app ml_head=%s type of head = %s, next arg = %s\n"
                              uu____10333 uu____10336 uu____10338);
                       (match (restArgs, t1) with
                        | ([],uu____10384) ->
                            let app =
                              let uu____10400 = mk_head ()  in
                              maybe_eta_data_and_project_record g is_data t1
                                uu____10400
                               in
                            (app, f, t1)
                        | ((arg,uu____10402)::rest,FStar_Extraction_ML_Syntax.MLTY_Fun
                           (formal_t,f',t2)) when
                            (is_type g arg) &&
                              (type_leq g formal_t
                                 FStar_Extraction_ML_Syntax.ml_unit_ty)
                            ->
                            let uu____10433 =
                              let uu____10438 =
                                FStar_Extraction_ML_Util.join
                                  arg.FStar_Syntax_Syntax.pos f f'
                                 in
                              (uu____10438, t2)  in
                            extract_app is_data
                              (mlhead,
                                ((FStar_Extraction_ML_Syntax.ml_unit,
                                   FStar_Extraction_ML_Syntax.E_PURE) ::
                                mlargs_f)) uu____10433 rest
                        | ((e0,uu____10450)::rest,FStar_Extraction_ML_Syntax.MLTY_Fun
                           (tExpected,f',t2)) ->
                            let r = e0.FStar_Syntax_Syntax.pos  in
                            let expected_effect =
                              let uu____10483 =
                                (FStar_Options.lax ()) &&
                                  (FStar_TypeChecker_Util.short_circuit_head
                                     head1)
                                 in
                              if uu____10483
                              then FStar_Extraction_ML_Syntax.E_IMPURE
                              else FStar_Extraction_ML_Syntax.E_PURE  in
                            let uu____10488 =
                              check_term_as_mlexpr g e0 expected_effect
                                tExpected
                               in
                            (match uu____10488 with
                             | (e01,tInferred) ->
                                 let uu____10501 =
                                   let uu____10506 =
                                     FStar_Extraction_ML_Util.join_l r
                                       [f; f']
                                      in
                                   (uu____10506, t2)  in
                                 extract_app is_data
                                   (mlhead, ((e01, expected_effect) ::
                                     mlargs_f)) uu____10501 rest)
                        | uu____10517 ->
                            let uu____10530 =
                              FStar_Extraction_ML_Util.udelta_unfold g t1  in
                            (match uu____10530 with
                             | FStar_Pervasives_Native.Some t2 ->
                                 extract_app is_data (mlhead, mlargs_f)
                                   (f, t2) restArgs
                             | FStar_Pervasives_Native.None  ->
                                 (match t1 with
                                  | FStar_Extraction_ML_Syntax.MLTY_Erased 
                                      ->
                                      (FStar_Extraction_ML_Syntax.ml_unit,
                                        FStar_Extraction_ML_Syntax.E_PURE,
                                        t1)
                                  | FStar_Extraction_ML_Syntax.MLTY_Top  ->
                                      let t2 =
                                        FStar_List.fold_right
                                          (fun t2  ->
                                             fun out  ->
                                               FStar_Extraction_ML_Syntax.MLTY_Fun
                                                 (FStar_Extraction_ML_Syntax.MLTY_Top,
                                                   FStar_Extraction_ML_Syntax.E_PURE,
                                                   out)) restArgs
                                          FStar_Extraction_ML_Syntax.MLTY_Top
                                         in
                                      let mlhead1 =
                                        let mlargs =
                                          FStar_All.pipe_right
                                            (FStar_List.rev mlargs_f)
                                            (FStar_List.map
                                               FStar_Pervasives_Native.fst)
                                           in
                                        let head2 =
                                          FStar_All.pipe_left
                                            (FStar_Extraction_ML_Syntax.with_ty
                                               FStar_Extraction_ML_Syntax.MLTY_Top)
                                            (FStar_Extraction_ML_Syntax.MLE_App
                                               (mlhead, mlargs))
                                           in
                                        maybe_coerce
                                          top.FStar_Syntax_Syntax.pos g head2
                                          FStar_Extraction_ML_Syntax.MLTY_Top
                                          t2
                                         in
                                      extract_app is_data (mlhead1, [])
                                        (f, t2) restArgs
                                  | uu____10602 ->
                                      let mlhead1 =
                                        let mlargs =
                                          FStar_All.pipe_right
                                            (FStar_List.rev mlargs_f)
                                            (FStar_List.map
                                               FStar_Pervasives_Native.fst)
                                           in
                                        let head2 =
                                          FStar_All.pipe_left
                                            (FStar_Extraction_ML_Syntax.with_ty
                                               FStar_Extraction_ML_Syntax.MLTY_Top)
                                            (FStar_Extraction_ML_Syntax.MLE_App
                                               (mlhead, mlargs))
                                           in
                                        maybe_coerce
                                          top.FStar_Syntax_Syntax.pos g head2
                                          FStar_Extraction_ML_Syntax.MLTY_Top
                                          t1
                                         in
                                      err_ill_typed_application g top mlhead1
                                        restArgs t1))))
                   in
                let extract_app_maybe_projector is_data mlhead uu____10673
                  args1 =
                  match uu____10673 with
                  | (f,t1) ->
                      (match is_data with
                       | FStar_Pervasives_Native.Some
                           (FStar_Syntax_Syntax.Record_projector uu____10703)
                           ->
                           let rec remove_implicits args2 f1 t2 =
                             match (args2, t2) with
                             | ((a0,FStar_Pervasives_Native.Some
                                 (FStar_Syntax_Syntax.Implicit uu____10787))::args3,FStar_Extraction_ML_Syntax.MLTY_Fun
                                (uu____10789,f',t3)) ->
                                 let uu____10827 =
                                   FStar_Extraction_ML_Util.join
                                     a0.FStar_Syntax_Syntax.pos f1 f'
                                    in
                                 remove_implicits args3 uu____10827 t3
                             | uu____10828 -> (args2, f1, t2)  in
                           let uu____10853 = remove_implicits args1 f t1  in
                           (match uu____10853 with
                            | (args2,f1,t2) ->
                                extract_app is_data (mlhead, []) (f1, t2)
                                  args2)
                       | uu____10909 ->
                           extract_app is_data (mlhead, []) (f, t1) args1)
                   in
                let extract_app_with_instantiations uu____10933 =
                  let head2 = FStar_Syntax_Util.un_uinst head1  in
                  match head2.FStar_Syntax_Syntax.n with
                  | FStar_Syntax_Syntax.Tm_name uu____10941 ->
                      let uu____10942 =
                        let uu____10963 =
                          FStar_Extraction_ML_UEnv.lookup_term g head2  in
                        match uu____10963 with
                        | (FStar_Util.Inr exp_b,q) ->
                            (FStar_Extraction_ML_UEnv.debug g
                               (fun uu____11002  ->
                                  let uu____11003 =
                                    FStar_Syntax_Print.term_to_string head2
                                     in
                                  let uu____11005 =
                                    FStar_Extraction_ML_Code.string_of_mlexpr
                                      g.FStar_Extraction_ML_UEnv.currentModule
                                      exp_b.FStar_Extraction_ML_UEnv.exp_b_expr
                                     in
                                  let uu____11007 =
                                    FStar_Extraction_ML_Code.string_of_mlty
                                      g.FStar_Extraction_ML_UEnv.currentModule
                                      (FStar_Pervasives_Native.snd
                                         exp_b.FStar_Extraction_ML_UEnv.exp_b_tscheme)
                                     in
                                  let uu____11009 =
                                    FStar_Util.string_of_bool
                                      exp_b.FStar_Extraction_ML_UEnv.exp_b_inst_ok
                                     in
                                  FStar_Util.print4
                                    "@@@looked up %s: got %s at %s (inst_ok=%s)\n"
                                    uu____11003 uu____11005 uu____11007
                                    uu____11009);
                             (((exp_b.FStar_Extraction_ML_UEnv.exp_b_expr),
                                (exp_b.FStar_Extraction_ML_UEnv.exp_b_tscheme),
                                (exp_b.FStar_Extraction_ML_UEnv.exp_b_inst_ok)),
                               q))
                        | uu____11036 -> failwith "FIXME Ty"  in
                      (match uu____10942 with
                       | ((head_ml,(vars,t1),inst_ok),qual) ->
                           let has_typ_apps =
                             match args with
                             | (a,uu____11112)::uu____11113 -> is_type g a
                             | uu____11140 -> false  in
                           let uu____11152 =
                             match vars with
                             | uu____11181::uu____11182 when
                                 (Prims.op_Negation has_typ_apps) && inst_ok
                                 -> (head_ml, t1, args)
                             | uu____11196 ->
                                 let n1 = FStar_List.length vars  in
                                 let uu____11202 =
                                   if (FStar_List.length args) <= n1
                                   then
                                     let uu____11240 =
                                       FStar_List.map
                                         (fun uu____11252  ->
                                            match uu____11252 with
                                            | (x,uu____11260) ->
                                                term_as_mlty g x) args
                                        in
                                     (uu____11240, [])
                                   else
                                     (let uu____11283 =
                                        FStar_Util.first_N n1 args  in
                                      match uu____11283 with
                                      | (prefix1,rest) ->
                                          let uu____11372 =
                                            FStar_List.map
                                              (fun uu____11384  ->
                                                 match uu____11384 with
                                                 | (x,uu____11392) ->
                                                     term_as_mlty g x)
                                              prefix1
                                             in
                                          (uu____11372, rest))
                                    in
                                 (match uu____11202 with
                                  | (provided_type_args,rest) ->
                                      let uu____11443 =
                                        match head_ml.FStar_Extraction_ML_Syntax.expr
                                        with
                                        | FStar_Extraction_ML_Syntax.MLE_Name
                                            uu____11452 ->
                                            let uu____11453 =
                                              instantiate_maybe_partial
                                                head_ml (vars, t1)
                                                provided_type_args
                                               in
                                            (match uu____11453 with
                                             | (head3,uu____11465,t2) ->
                                                 (head3, t2))
                                        | FStar_Extraction_ML_Syntax.MLE_Var
                                            uu____11467 ->
                                            let uu____11469 =
                                              instantiate_maybe_partial
                                                head_ml (vars, t1)
                                                provided_type_args
                                               in
                                            (match uu____11469 with
                                             | (head3,uu____11481,t2) ->
                                                 (head3, t2))
                                        | FStar_Extraction_ML_Syntax.MLE_App
                                            (head3,{
                                                     FStar_Extraction_ML_Syntax.expr
                                                       =
                                                       FStar_Extraction_ML_Syntax.MLE_Const
                                                       (FStar_Extraction_ML_Syntax.MLC_Unit
                                                       );
                                                     FStar_Extraction_ML_Syntax.mlty
                                                       = uu____11484;
                                                     FStar_Extraction_ML_Syntax.loc
                                                       = uu____11485;_}::[])
                                            ->
                                            let uu____11488 =
                                              instantiate_maybe_partial head3
                                                (vars, t1) provided_type_args
                                               in
                                            (match uu____11488 with
                                             | (head4,uu____11500,t2) ->
                                                 let uu____11502 =
                                                   FStar_All.pipe_right
                                                     (FStar_Extraction_ML_Syntax.MLE_App
                                                        (head4,
                                                          [FStar_Extraction_ML_Syntax.ml_unit]))
                                                     (FStar_Extraction_ML_Syntax.with_ty
                                                        t2)
                                                    in
                                                 (uu____11502, t2))
                                        | uu____11505 ->
                                            failwith
                                              "Impossible: Unexpected head term"
                                         in
                                      (match uu____11443 with
                                       | (head3,t2) -> (head3, t2, rest)))
                              in
                           (match uu____11152 with
                            | (head_ml1,head_t,args1) ->
                                (match args1 with
                                 | [] ->
                                     let uu____11572 =
                                       maybe_eta_data_and_project_record g
                                         qual head_t head_ml1
                                        in
                                     (uu____11572,
                                       FStar_Extraction_ML_Syntax.E_PURE,
                                       head_t)
                                 | uu____11573 ->
                                     extract_app_maybe_projector qual
                                       head_ml1
                                       (FStar_Extraction_ML_Syntax.E_PURE,
                                         head_t) args1)))
                  | FStar_Syntax_Syntax.Tm_fvar uu____11582 ->
                      let uu____11583 =
                        let uu____11604 =
                          FStar_Extraction_ML_UEnv.lookup_term g head2  in
                        match uu____11604 with
                        | (FStar_Util.Inr exp_b,q) ->
                            (FStar_Extraction_ML_UEnv.debug g
                               (fun uu____11643  ->
                                  let uu____11644 =
                                    FStar_Syntax_Print.term_to_string head2
                                     in
                                  let uu____11646 =
                                    FStar_Extraction_ML_Code.string_of_mlexpr
                                      g.FStar_Extraction_ML_UEnv.currentModule
                                      exp_b.FStar_Extraction_ML_UEnv.exp_b_expr
                                     in
                                  let uu____11648 =
                                    FStar_Extraction_ML_Code.string_of_mlty
                                      g.FStar_Extraction_ML_UEnv.currentModule
                                      (FStar_Pervasives_Native.snd
                                         exp_b.FStar_Extraction_ML_UEnv.exp_b_tscheme)
                                     in
                                  let uu____11650 =
                                    FStar_Util.string_of_bool
                                      exp_b.FStar_Extraction_ML_UEnv.exp_b_inst_ok
                                     in
                                  FStar_Util.print4
                                    "@@@looked up %s: got %s at %s (inst_ok=%s)\n"
                                    uu____11644 uu____11646 uu____11648
                                    uu____11650);
                             (((exp_b.FStar_Extraction_ML_UEnv.exp_b_expr),
                                (exp_b.FStar_Extraction_ML_UEnv.exp_b_tscheme),
                                (exp_b.FStar_Extraction_ML_UEnv.exp_b_inst_ok)),
                               q))
                        | uu____11677 -> failwith "FIXME Ty"  in
                      (match uu____11583 with
                       | ((head_ml,(vars,t1),inst_ok),qual) ->
                           let has_typ_apps =
                             match args with
                             | (a,uu____11753)::uu____11754 -> is_type g a
                             | uu____11781 -> false  in
                           let uu____11793 =
                             match vars with
                             | uu____11822::uu____11823 when
                                 (Prims.op_Negation has_typ_apps) && inst_ok
                                 -> (head_ml, t1, args)
                             | uu____11837 ->
                                 let n1 = FStar_List.length vars  in
                                 let uu____11843 =
                                   if (FStar_List.length args) <= n1
                                   then
                                     let uu____11881 =
                                       FStar_List.map
                                         (fun uu____11893  ->
                                            match uu____11893 with
                                            | (x,uu____11901) ->
                                                term_as_mlty g x) args
                                        in
                                     (uu____11881, [])
                                   else
                                     (let uu____11924 =
                                        FStar_Util.first_N n1 args  in
                                      match uu____11924 with
                                      | (prefix1,rest) ->
                                          let uu____12013 =
                                            FStar_List.map
                                              (fun uu____12025  ->
                                                 match uu____12025 with
                                                 | (x,uu____12033) ->
                                                     term_as_mlty g x)
                                              prefix1
                                             in
                                          (uu____12013, rest))
                                    in
                                 (match uu____11843 with
                                  | (provided_type_args,rest) ->
                                      let uu____12084 =
                                        match head_ml.FStar_Extraction_ML_Syntax.expr
                                        with
                                        | FStar_Extraction_ML_Syntax.MLE_Name
                                            uu____12093 ->
                                            let uu____12094 =
                                              instantiate_maybe_partial
                                                head_ml (vars, t1)
                                                provided_type_args
                                               in
                                            (match uu____12094 with
                                             | (head3,uu____12106,t2) ->
                                                 (head3, t2))
                                        | FStar_Extraction_ML_Syntax.MLE_Var
                                            uu____12108 ->
                                            let uu____12110 =
                                              instantiate_maybe_partial
                                                head_ml (vars, t1)
                                                provided_type_args
                                               in
                                            (match uu____12110 with
                                             | (head3,uu____12122,t2) ->
                                                 (head3, t2))
                                        | FStar_Extraction_ML_Syntax.MLE_App
                                            (head3,{
                                                     FStar_Extraction_ML_Syntax.expr
                                                       =
                                                       FStar_Extraction_ML_Syntax.MLE_Const
                                                       (FStar_Extraction_ML_Syntax.MLC_Unit
                                                       );
                                                     FStar_Extraction_ML_Syntax.mlty
                                                       = uu____12125;
                                                     FStar_Extraction_ML_Syntax.loc
                                                       = uu____12126;_}::[])
                                            ->
                                            let uu____12129 =
                                              instantiate_maybe_partial head3
                                                (vars, t1) provided_type_args
                                               in
                                            (match uu____12129 with
                                             | (head4,uu____12141,t2) ->
                                                 let uu____12143 =
                                                   FStar_All.pipe_right
                                                     (FStar_Extraction_ML_Syntax.MLE_App
                                                        (head4,
                                                          [FStar_Extraction_ML_Syntax.ml_unit]))
                                                     (FStar_Extraction_ML_Syntax.with_ty
                                                        t2)
                                                    in
                                                 (uu____12143, t2))
                                        | uu____12146 ->
                                            failwith
                                              "Impossible: Unexpected head term"
                                         in
                                      (match uu____12084 with
                                       | (head3,t2) -> (head3, t2, rest)))
                              in
                           (match uu____11793 with
                            | (head_ml1,head_t,args1) ->
                                (match args1 with
                                 | [] ->
                                     let uu____12213 =
                                       maybe_eta_data_and_project_record g
                                         qual head_t head_ml1
                                        in
                                     (uu____12213,
                                       FStar_Extraction_ML_Syntax.E_PURE,
                                       head_t)
                                 | uu____12214 ->
                                     extract_app_maybe_projector qual
                                       head_ml1
                                       (FStar_Extraction_ML_Syntax.E_PURE,
                                         head_t) args1)))
                  | uu____12223 ->
                      let uu____12224 = term_as_mlexpr g head2  in
                      (match uu____12224 with
                       | (head3,f,t1) ->
                           extract_app_maybe_projector
                             FStar_Pervasives_Native.None head3 (f, t1) args)
                   in
                let uu____12240 = is_type g t  in
                if uu____12240
                then
                  (FStar_Extraction_ML_Syntax.ml_unit,
                    FStar_Extraction_ML_Syntax.E_PURE,
                    FStar_Extraction_ML_Syntax.ml_unit_ty)
                else
                  (let uu____12251 =
                     let uu____12252 = FStar_Syntax_Util.un_uinst head1  in
                     uu____12252.FStar_Syntax_Syntax.n  in
                   match uu____12251 with
                   | FStar_Syntax_Syntax.Tm_fvar fv ->
                       let uu____12262 =
                         FStar_Extraction_ML_UEnv.try_lookup_fv g fv  in
                       (match uu____12262 with
                        | FStar_Pervasives_Native.None  ->
                            (FStar_Extraction_ML_Syntax.ml_unit,
                              FStar_Extraction_ML_Syntax.E_PURE,
                              FStar_Extraction_ML_Syntax.MLTY_Erased)
                        | uu____12271 -> extract_app_with_instantiations ())
                   | uu____12274 -> extract_app_with_instantiations ()))
       | FStar_Syntax_Syntax.Tm_ascribed (e0,(tc,uu____12277),f) ->
           let t1 =
             match tc with
             | FStar_Util.Inl t1 -> term_as_mlty g t1
             | FStar_Util.Inr c ->
                 let uu____12342 =
                   maybe_reify_comp g g.FStar_Extraction_ML_UEnv.env_tcenv c
                    in
                 term_as_mlty g uu____12342
              in
           let f1 =
             match f with
             | FStar_Pervasives_Native.None  ->
                 failwith "Ascription node with an empty effect label"
             | FStar_Pervasives_Native.Some l -> effect_as_etag g l  in
           let uu____12346 = check_term_as_mlexpr g e0 f1 t1  in
           (match uu____12346 with | (e,t2) -> (e, f1, t2))
       | FStar_Syntax_Syntax.Tm_let ((is_rec,lbs),e') ->
           let top_level = FStar_Syntax_Syntax.is_top_level lbs  in
           let uu____12381 =
             if is_rec
             then FStar_Syntax_Subst.open_let_rec lbs e'
             else
               (let uu____12397 = FStar_Syntax_Syntax.is_top_level lbs  in
                if uu____12397
                then (lbs, e')
                else
                  (let lb = FStar_List.hd lbs  in
                   let x =
                     let uu____12412 =
                       FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
                     FStar_Syntax_Syntax.freshen_bv uu____12412  in
                   let lb1 =
                     let uu___1757_12414 = lb  in
                     {
                       FStar_Syntax_Syntax.lbname = (FStar_Util.Inl x);
                       FStar_Syntax_Syntax.lbunivs =
                         (uu___1757_12414.FStar_Syntax_Syntax.lbunivs);
                       FStar_Syntax_Syntax.lbtyp =
                         (uu___1757_12414.FStar_Syntax_Syntax.lbtyp);
                       FStar_Syntax_Syntax.lbeff =
                         (uu___1757_12414.FStar_Syntax_Syntax.lbeff);
                       FStar_Syntax_Syntax.lbdef =
                         (uu___1757_12414.FStar_Syntax_Syntax.lbdef);
                       FStar_Syntax_Syntax.lbattrs =
                         (uu___1757_12414.FStar_Syntax_Syntax.lbattrs);
                       FStar_Syntax_Syntax.lbpos =
                         (uu___1757_12414.FStar_Syntax_Syntax.lbpos)
                     }  in
                   let e'1 =
                     FStar_Syntax_Subst.subst
                       [FStar_Syntax_Syntax.DB (Prims.int_zero, x)] e'
                      in
                   ([lb1], e'1)))
              in
           (match uu____12381 with
            | (lbs1,e'1) ->
                let lbs2 =
                  if top_level
                  then
                    let tcenv =
                      let uu____12439 =
                        FStar_Ident.lid_of_path
                          (FStar_List.append
                             (FStar_Pervasives_Native.fst
                                g.FStar_Extraction_ML_UEnv.currentModule)
                             [FStar_Pervasives_Native.snd
                                g.FStar_Extraction_ML_UEnv.currentModule])
                          FStar_Range.dummyRange
                         in
                      FStar_TypeChecker_Env.set_current_module
                        g.FStar_Extraction_ML_UEnv.env_tcenv uu____12439
                       in
                    FStar_All.pipe_right lbs1
                      (FStar_List.map
                         (fun lb  ->
                            let lbdef =
                              let uu____12462 = FStar_Options.ml_ish ()  in
                              if uu____12462
                              then lb.FStar_Syntax_Syntax.lbdef
                              else
                                (let norm_call uu____12474 =
                                   let uu____12475 =
                                     let uu____12476 =
                                       extraction_norm_steps ()  in
                                     FStar_TypeChecker_Env.PureSubtermsWithinComputations
                                       :: uu____12476
                                      in
                                   FStar_TypeChecker_Normalize.normalize
                                     uu____12475 tcenv
                                     lb.FStar_Syntax_Syntax.lbdef
                                    in
                                 let uu____12479 =
                                   (FStar_All.pipe_left
                                      (FStar_TypeChecker_Env.debug tcenv)
                                      (FStar_Options.Other "Extraction"))
                                     ||
                                     (FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug tcenv)
                                        (FStar_Options.Other "ExtractNorm"))
                                    in
                                 if uu____12479
                                 then
                                   ((let uu____12489 =
                                       FStar_Syntax_Print.lbname_to_string
                                         lb.FStar_Syntax_Syntax.lbname
                                        in
                                     FStar_Util.print1
                                       "Starting to normalize top-level let %s\n"
                                       uu____12489);
                                    (let a =
                                       let uu____12495 =
                                         let uu____12497 =
                                           FStar_Syntax_Print.lbname_to_string
                                             lb.FStar_Syntax_Syntax.lbname
                                            in
                                         FStar_Util.format1
                                           "###(Time to normalize top-level let %s)"
                                           uu____12497
                                          in
                                       FStar_Util.measure_execution_time
                                         uu____12495 norm_call
                                        in
                                     a))
                                 else norm_call ())
                               in
                            let uu___1774_12504 = lb  in
                            {
                              FStar_Syntax_Syntax.lbname =
                                (uu___1774_12504.FStar_Syntax_Syntax.lbname);
                              FStar_Syntax_Syntax.lbunivs =
                                (uu___1774_12504.FStar_Syntax_Syntax.lbunivs);
                              FStar_Syntax_Syntax.lbtyp =
                                (uu___1774_12504.FStar_Syntax_Syntax.lbtyp);
                              FStar_Syntax_Syntax.lbeff =
                                (uu___1774_12504.FStar_Syntax_Syntax.lbeff);
                              FStar_Syntax_Syntax.lbdef = lbdef;
                              FStar_Syntax_Syntax.lbattrs =
                                (uu___1774_12504.FStar_Syntax_Syntax.lbattrs);
                              FStar_Syntax_Syntax.lbpos =
                                (uu___1774_12504.FStar_Syntax_Syntax.lbpos)
                            }))
                  else lbs1  in
                let check_lb env uu____12557 =
                  match uu____12557 with
                  | (nm,(_lbname,f,(_t,(targs,polytype)),add_unit,e)) ->
                      let env1 =
                        FStar_List.fold_left
                          (fun env1  ->
                             fun uu____12713  ->
                               match uu____12713 with
                               | (a,uu____12721) ->
                                   FStar_Extraction_ML_UEnv.extend_ty env1 a
                                     FStar_Pervasives_Native.None) env targs
                         in
                      let expected_t = FStar_Pervasives_Native.snd polytype
                         in
                      let uu____12727 =
                        check_term_as_mlexpr env1 e f expected_t  in
                      (match uu____12727 with
                       | (e1,ty) ->
                           let uu____12738 =
                             maybe_promote_effect e1 f expected_t  in
                           (match uu____12738 with
                            | (e2,f1) ->
                                let meta =
                                  match (f1, ty) with
                                  | (FStar_Extraction_ML_Syntax.E_PURE
                                     ,FStar_Extraction_ML_Syntax.MLTY_Erased
                                     ) -> [FStar_Extraction_ML_Syntax.Erased]
                                  | (FStar_Extraction_ML_Syntax.E_GHOST
                                     ,FStar_Extraction_ML_Syntax.MLTY_Erased
                                     ) -> [FStar_Extraction_ML_Syntax.Erased]
                                  | uu____12750 -> []  in
                                (f1,
                                  {
                                    FStar_Extraction_ML_Syntax.mllb_name = nm;
                                    FStar_Extraction_ML_Syntax.mllb_tysc =
                                      (FStar_Pervasives_Native.Some polytype);
                                    FStar_Extraction_ML_Syntax.mllb_add_unit
                                      = add_unit;
                                    FStar_Extraction_ML_Syntax.mllb_def = e2;
                                    FStar_Extraction_ML_Syntax.mllb_meta =
                                      meta;
                                    FStar_Extraction_ML_Syntax.print_typ =
                                      true
                                  })))
                   in
                let lbs3 = extract_lb_sig g (is_rec, lbs2)  in
                let uu____12781 =
                  FStar_List.fold_right
                    (fun lb  ->
                       fun uu____12878  ->
                         match uu____12878 with
                         | (env,lbs4) ->
                             let uu____13012 = lb  in
                             (match uu____13012 with
                              | (lbname,uu____13063,(t1,(uu____13065,polytype)),add_unit,uu____13068)
                                  ->
                                  let uu____13083 =
                                    FStar_Extraction_ML_UEnv.extend_lb env
                                      lbname t1 polytype add_unit true
                                     in
                                  (match uu____13083 with
                                   | (env1,nm,uu____13124) ->
                                       (env1, ((nm, lb) :: lbs4))))) lbs3
                    (g, [])
                   in
                (match uu____12781 with
                 | (env_body,lbs4) ->
                     let env_def = if is_rec then env_body else g  in
                     let lbs5 =
                       FStar_All.pipe_right lbs4
                         (FStar_List.map (check_lb env_def))
                        in
                     let e'_rng = e'1.FStar_Syntax_Syntax.pos  in
                     let uu____13403 = term_as_mlexpr env_body e'1  in
                     (match uu____13403 with
                      | (e'2,f',t') ->
                          let f =
                            let uu____13420 =
                              let uu____13423 =
                                FStar_List.map FStar_Pervasives_Native.fst
                                  lbs5
                                 in
                              f' :: uu____13423  in
                            FStar_Extraction_ML_Util.join_l e'_rng
                              uu____13420
                             in
                          let is_rec1 =
                            if is_rec = true
                            then FStar_Extraction_ML_Syntax.Rec
                            else FStar_Extraction_ML_Syntax.NonRec  in
                          let uu____13436 =
                            let uu____13437 =
                              let uu____13438 =
                                let uu____13439 =
                                  FStar_List.map FStar_Pervasives_Native.snd
                                    lbs5
                                   in
                                (is_rec1, uu____13439)  in
                              mk_MLE_Let top_level uu____13438 e'2  in
                            let uu____13448 =
                              FStar_Extraction_ML_Util.mlloc_of_range
                                t.FStar_Syntax_Syntax.pos
                               in
                            FStar_Extraction_ML_Syntax.with_ty_loc t'
                              uu____13437 uu____13448
                             in
                          (uu____13436, f, t'))))
       | FStar_Syntax_Syntax.Tm_match (scrutinee,pats) ->
           let uu____13487 = term_as_mlexpr g scrutinee  in
           (match uu____13487 with
            | (e,f_e,t_e) ->
                let uu____13503 = check_pats_for_ite pats  in
                (match uu____13503 with
                 | (b,then_e,else_e) ->
                     let no_lift x t1 = x  in
                     if b
                     then
                       (match (then_e, else_e) with
                        | (FStar_Pervasives_Native.Some
                           then_e1,FStar_Pervasives_Native.Some else_e1) ->
                            let uu____13568 = term_as_mlexpr g then_e1  in
                            (match uu____13568 with
                             | (then_mle,f_then,t_then) ->
                                 let uu____13584 = term_as_mlexpr g else_e1
                                    in
                                 (match uu____13584 with
                                  | (else_mle,f_else,t_else) ->
                                      let uu____13600 =
                                        let uu____13611 =
                                          type_leq g t_then t_else  in
                                        if uu____13611
                                        then (t_else, no_lift)
                                        else
                                          (let uu____13632 =
                                             type_leq g t_else t_then  in
                                           if uu____13632
                                           then (t_then, no_lift)
                                           else
                                             (FStar_Extraction_ML_Syntax.MLTY_Top,
                                               FStar_Extraction_ML_Syntax.apply_obj_repr))
                                         in
                                      (match uu____13600 with
                                       | (t_branch,maybe_lift1) ->
                                           let uu____13679 =
                                             let uu____13680 =
                                               let uu____13681 =
                                                 let uu____13690 =
                                                   maybe_lift1 then_mle
                                                     t_then
                                                    in
                                                 let uu____13691 =
                                                   let uu____13694 =
                                                     maybe_lift1 else_mle
                                                       t_else
                                                      in
                                                   FStar_Pervasives_Native.Some
                                                     uu____13694
                                                    in
                                                 (e, uu____13690,
                                                   uu____13691)
                                                  in
                                               FStar_Extraction_ML_Syntax.MLE_If
                                                 uu____13681
                                                in
                                             FStar_All.pipe_left
                                               (FStar_Extraction_ML_Syntax.with_ty
                                                  t_branch) uu____13680
                                              in
                                           let uu____13697 =
                                             FStar_Extraction_ML_Util.join
                                               then_e1.FStar_Syntax_Syntax.pos
                                               f_then f_else
                                              in
                                           (uu____13679, uu____13697,
                                             t_branch))))
                        | uu____13698 ->
                            failwith
                              "ITE pats matched but then and else expressions not found?")
                     else
                       (let uu____13716 =
                          FStar_All.pipe_right pats
                            (FStar_Util.fold_map
                               (fun compat  ->
                                  fun br  ->
                                    let uu____13815 =
                                      FStar_Syntax_Subst.open_branch br  in
                                    match uu____13815 with
                                    | (pat,when_opt,branch1) ->
                                        let uu____13860 =
                                          extract_pat g pat t_e
                                            term_as_mlexpr
                                           in
                                        (match uu____13860 with
                                         | (env,p,pat_t_compat) ->
                                             let uu____13922 =
                                               match when_opt with
                                               | FStar_Pervasives_Native.None
                                                    ->
                                                   (FStar_Pervasives_Native.None,
                                                     FStar_Extraction_ML_Syntax.E_PURE)
                                               | FStar_Pervasives_Native.Some
                                                   w ->
                                                   let w_pos =
                                                     w.FStar_Syntax_Syntax.pos
                                                      in
                                                   let uu____13945 =
                                                     term_as_mlexpr env w  in
                                                   (match uu____13945 with
                                                    | (w1,f_w,t_w) ->
                                                        let w2 =
                                                          maybe_coerce w_pos
                                                            env w1 t_w
                                                            FStar_Extraction_ML_Syntax.ml_bool_ty
                                                           in
                                                        ((FStar_Pervasives_Native.Some
                                                            w2), f_w))
                                                in
                                             (match uu____13922 with
                                              | (when_opt1,f_when) ->
                                                  let uu____13995 =
                                                    term_as_mlexpr env
                                                      branch1
                                                     in
                                                  (match uu____13995 with
                                                   | (mlbranch,f_branch,t_branch)
                                                       ->
                                                       let uu____14030 =
                                                         FStar_All.pipe_right
                                                           p
                                                           (FStar_List.map
                                                              (fun
                                                                 uu____14107 
                                                                 ->
                                                                 match uu____14107
                                                                 with
                                                                 | (p1,wopt)
                                                                    ->
                                                                    let when_clause
                                                                    =
                                                                    FStar_Extraction_ML_Util.conjoin_opt
                                                                    wopt
                                                                    when_opt1
                                                                     in
                                                                    (p1,
                                                                    (when_clause,
                                                                    f_when),
                                                                    (mlbranch,
                                                                    f_branch,
                                                                    t_branch))))
                                                          in
                                                       ((compat &&
                                                           pat_t_compat),
                                                         uu____14030)))))
                               true)
                           in
                        match uu____13716 with
                        | (pat_t_compat,mlbranches) ->
                            let mlbranches1 = FStar_List.flatten mlbranches
                               in
                            let e1 =
                              if pat_t_compat
                              then e
                              else
                                (FStar_Extraction_ML_UEnv.debug g
                                   (fun uu____14278  ->
                                      let uu____14279 =
                                        FStar_Extraction_ML_Code.string_of_mlexpr
                                          g.FStar_Extraction_ML_UEnv.currentModule
                                          e
                                         in
                                      let uu____14281 =
                                        FStar_Extraction_ML_Code.string_of_mlty
                                          g.FStar_Extraction_ML_UEnv.currentModule
                                          t_e
                                         in
                                      FStar_Util.print2
                                        "Coercing scrutinee %s from type %s because pattern type is incompatible\n"
                                        uu____14279 uu____14281);
                                 FStar_All.pipe_left
                                   (FStar_Extraction_ML_Syntax.with_ty t_e)
                                   (FStar_Extraction_ML_Syntax.MLE_Coerce
                                      (e, t_e,
                                        FStar_Extraction_ML_Syntax.MLTY_Top)))
                               in
                            (match mlbranches1 with
                             | [] ->
                                 let uu____14308 =
                                   let uu____14309 =
                                     FStar_Syntax_Syntax.lid_as_fv
                                       FStar_Parser_Const.failwith_lid
                                       FStar_Syntax_Syntax.delta_constant
                                       FStar_Pervasives_Native.None
                                      in
                                   FStar_Extraction_ML_UEnv.lookup_fv g
                                     uu____14309
                                    in
                                 (match uu____14308 with
                                  | {
                                      FStar_Extraction_ML_UEnv.exp_b_name =
                                        uu____14316;
                                      FStar_Extraction_ML_UEnv.exp_b_expr =
                                        fw;
                                      FStar_Extraction_ML_UEnv.exp_b_tscheme
                                        = uu____14318;
                                      FStar_Extraction_ML_UEnv.exp_b_inst_ok
                                        = uu____14319;_}
                                      ->
                                      let uu____14322 =
                                        let uu____14323 =
                                          let uu____14324 =
                                            let uu____14331 =
                                              let uu____14334 =
                                                FStar_All.pipe_left
                                                  (FStar_Extraction_ML_Syntax.with_ty
                                                     FStar_Extraction_ML_Syntax.ml_string_ty)
                                                  (FStar_Extraction_ML_Syntax.MLE_Const
                                                     (FStar_Extraction_ML_Syntax.MLC_String
                                                        "unreachable"))
                                                 in
                                              [uu____14334]  in
                                            (fw, uu____14331)  in
                                          FStar_Extraction_ML_Syntax.MLE_App
                                            uu____14324
                                           in
                                        FStar_All.pipe_left
                                          (FStar_Extraction_ML_Syntax.with_ty
                                             FStar_Extraction_ML_Syntax.ml_int_ty)
                                          uu____14323
                                         in
                                      (uu____14322,
                                        FStar_Extraction_ML_Syntax.E_PURE,
                                        FStar_Extraction_ML_Syntax.ml_int_ty))
                             | (uu____14338,uu____14339,(uu____14340,f_first,t_first))::rest
                                 ->
                                 let uu____14400 =
                                   FStar_List.fold_left
                                     (fun uu____14442  ->
                                        fun uu____14443  ->
                                          match (uu____14442, uu____14443)
                                          with
                                          | ((topt,f),(uu____14500,uu____14501,
                                                       (uu____14502,f_branch,t_branch)))
                                              ->
                                              let f1 =
                                                FStar_Extraction_ML_Util.join
                                                  top.FStar_Syntax_Syntax.pos
                                                  f f_branch
                                                 in
                                              let topt1 =
                                                match topt with
                                                | FStar_Pervasives_Native.None
                                                     ->
                                                    FStar_Pervasives_Native.None
                                                | FStar_Pervasives_Native.Some
                                                    t1 ->
                                                    let uu____14558 =
                                                      type_leq g t1 t_branch
                                                       in
                                                    if uu____14558
                                                    then
                                                      FStar_Pervasives_Native.Some
                                                        t_branch
                                                    else
                                                      (let uu____14565 =
                                                         type_leq g t_branch
                                                           t1
                                                          in
                                                       if uu____14565
                                                       then
                                                         FStar_Pervasives_Native.Some
                                                           t1
                                                       else
                                                         FStar_Pervasives_Native.None)
                                                 in
                                              (topt1, f1))
                                     ((FStar_Pervasives_Native.Some t_first),
                                       f_first) rest
                                    in
                                 (match uu____14400 with
                                  | (topt,f_match) ->
                                      let mlbranches2 =
                                        FStar_All.pipe_right mlbranches1
                                          (FStar_List.map
                                             (fun uu____14663  ->
                                                match uu____14663 with
                                                | (p,(wopt,uu____14692),
                                                   (b1,uu____14694,t1)) ->
                                                    let b2 =
                                                      match topt with
                                                      | FStar_Pervasives_Native.None
                                                           ->
                                                          FStar_Extraction_ML_Syntax.apply_obj_repr
                                                            b1 t1
                                                      | FStar_Pervasives_Native.Some
                                                          uu____14713 -> b1
                                                       in
                                                    (p, wopt, b2)))
                                         in
                                      let t_match =
                                        match topt with
                                        | FStar_Pervasives_Native.None  ->
                                            FStar_Extraction_ML_Syntax.MLTY_Top
                                        | FStar_Pervasives_Native.Some t1 ->
                                            t1
                                         in
                                      let uu____14718 =
                                        FStar_All.pipe_left
                                          (FStar_Extraction_ML_Syntax.with_ty
                                             t_match)
                                          (FStar_Extraction_ML_Syntax.MLE_Match
                                             (e1, mlbranches2))
                                         in
                                      (uu____14718, f_match, t_match)))))))

let (ind_discriminator_body :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Ident.lident ->
      FStar_Ident.lident -> FStar_Extraction_ML_Syntax.mlmodule1)
  =
  fun env  ->
    fun discName  ->
      fun constrName  ->
        let uu____14745 =
          let uu____14750 =
            FStar_TypeChecker_Env.lookup_lid
              env.FStar_Extraction_ML_UEnv.env_tcenv discName
             in
          FStar_All.pipe_left FStar_Pervasives_Native.fst uu____14750  in
        match uu____14745 with
        | (uu____14775,fstar_disc_type) ->
            let wildcards =
              let uu____14785 =
                let uu____14786 = FStar_Syntax_Subst.compress fstar_disc_type
                   in
                uu____14786.FStar_Syntax_Syntax.n  in
              match uu____14785 with
              | FStar_Syntax_Syntax.Tm_arrow (binders,uu____14797) ->
                  let uu____14818 =
                    FStar_All.pipe_right binders
                      (FStar_List.filter
                         (fun uu___2_14852  ->
                            match uu___2_14852 with
                            | (uu____14860,FStar_Pervasives_Native.Some
                               (FStar_Syntax_Syntax.Implicit uu____14861)) ->
                                true
                            | uu____14866 -> false))
                     in
                  FStar_All.pipe_right uu____14818
                    (FStar_List.map
                       (fun uu____14902  ->
                          let uu____14909 = fresh "_"  in
                          (uu____14909, FStar_Extraction_ML_Syntax.MLTY_Top)))
              | uu____14913 -> failwith "Discriminator must be a function"
               in
            let mlid = fresh "_discr_"  in
            let targ = FStar_Extraction_ML_Syntax.MLTY_Top  in
            let disc_ty = FStar_Extraction_ML_Syntax.MLTY_Top  in
            let discrBody =
              let uu____14928 =
                let uu____14929 =
                  let uu____14941 =
                    let uu____14942 =
                      let uu____14943 =
                        let uu____14958 =
                          FStar_All.pipe_left
                            (FStar_Extraction_ML_Syntax.with_ty targ)
                            (FStar_Extraction_ML_Syntax.MLE_Name ([], mlid))
                           in
                        let uu____14964 =
                          let uu____14975 =
                            let uu____14984 =
                              let uu____14985 =
                                let uu____14992 =
                                  FStar_Extraction_ML_Syntax.mlpath_of_lident
                                    constrName
                                   in
                                (uu____14992,
                                  [FStar_Extraction_ML_Syntax.MLP_Wild])
                                 in
                              FStar_Extraction_ML_Syntax.MLP_CTor uu____14985
                               in
                            let uu____14995 =
                              FStar_All.pipe_left
                                (FStar_Extraction_ML_Syntax.with_ty
                                   FStar_Extraction_ML_Syntax.ml_bool_ty)
                                (FStar_Extraction_ML_Syntax.MLE_Const
                                   (FStar_Extraction_ML_Syntax.MLC_Bool true))
                               in
                            (uu____14984, FStar_Pervasives_Native.None,
                              uu____14995)
                             in
                          let uu____14999 =
                            let uu____15010 =
                              let uu____15019 =
                                FStar_All.pipe_left
                                  (FStar_Extraction_ML_Syntax.with_ty
                                     FStar_Extraction_ML_Syntax.ml_bool_ty)
                                  (FStar_Extraction_ML_Syntax.MLE_Const
                                     (FStar_Extraction_ML_Syntax.MLC_Bool
                                        false))
                                 in
                              (FStar_Extraction_ML_Syntax.MLP_Wild,
                                FStar_Pervasives_Native.None, uu____15019)
                               in
                            [uu____15010]  in
                          uu____14975 :: uu____14999  in
                        (uu____14958, uu____14964)  in
                      FStar_Extraction_ML_Syntax.MLE_Match uu____14943  in
                    FStar_All.pipe_left
                      (FStar_Extraction_ML_Syntax.with_ty
                         FStar_Extraction_ML_Syntax.ml_bool_ty) uu____14942
                     in
                  ((FStar_List.append wildcards [(mlid, targ)]), uu____14941)
                   in
                FStar_Extraction_ML_Syntax.MLE_Fun uu____14929  in
              FStar_All.pipe_left
                (FStar_Extraction_ML_Syntax.with_ty disc_ty) uu____14928
               in
            let uu____15080 =
              let uu____15081 =
                let uu____15084 =
                  let uu____15085 =
                    FStar_Extraction_ML_UEnv.convIdent
                      discName.FStar_Ident.ident
                     in
                  {
                    FStar_Extraction_ML_Syntax.mllb_name = uu____15085;
                    FStar_Extraction_ML_Syntax.mllb_tysc =
                      FStar_Pervasives_Native.None;
                    FStar_Extraction_ML_Syntax.mllb_add_unit = false;
                    FStar_Extraction_ML_Syntax.mllb_def = discrBody;
                    FStar_Extraction_ML_Syntax.mllb_meta = [];
                    FStar_Extraction_ML_Syntax.print_typ = false
                  }  in
                [uu____15084]  in
              (FStar_Extraction_ML_Syntax.NonRec, uu____15081)  in
            FStar_Extraction_ML_Syntax.MLM_Let uu____15080
  