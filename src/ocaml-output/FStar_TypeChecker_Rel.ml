open Prims
let (print_ctx_uvar : FStar_Syntax_Syntax.ctx_uvar -> Prims.string) =
  fun ctx_uvar  -> FStar_Syntax_Print.ctx_uvar_to_string ctx_uvar 
type uvi =
  | TERM of (FStar_Syntax_Syntax.ctx_uvar,FStar_Syntax_Syntax.term)
  FStar_Pervasives_Native.tuple2 
  | UNIV of (FStar_Syntax_Syntax.universe_uvar,FStar_Syntax_Syntax.universe)
  FStar_Pervasives_Native.tuple2 
let (uu___is_TERM : uvi -> Prims.bool) =
  fun projectee  ->
    match projectee with | TERM _0 -> true | uu____34 -> false
  
let (__proj__TERM__item___0 :
  uvi ->
    (FStar_Syntax_Syntax.ctx_uvar,FStar_Syntax_Syntax.term)
      FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | TERM _0 -> _0 
let (uu___is_UNIV : uvi -> Prims.bool) =
  fun projectee  ->
    match projectee with | UNIV _0 -> true | uu____64 -> false
  
let (__proj__UNIV__item___0 :
  uvi ->
    (FStar_Syntax_Syntax.universe_uvar,FStar_Syntax_Syntax.universe)
      FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | UNIV _0 -> _0 
type worklist =
  {
  attempting: FStar_TypeChecker_Common.probs ;
  wl_deferred:
    (Prims.int,Prims.string,FStar_TypeChecker_Common.prob)
      FStar_Pervasives_Native.tuple3 Prims.list
    ;
  ctr: Prims.int ;
  defer_ok: Prims.bool ;
  smt_ok: Prims.bool ;
  tcenv: FStar_TypeChecker_Env.env ;
  wl_implicits: FStar_TypeChecker_Env.implicits }
let (__proj__Mkworklist__item__attempting :
  worklist -> FStar_TypeChecker_Common.probs) =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;
        wl_implicits = __fname__wl_implicits;_} -> __fname__attempting
  
let (__proj__Mkworklist__item__wl_deferred :
  worklist ->
    (Prims.int,Prims.string,FStar_TypeChecker_Common.prob)
      FStar_Pervasives_Native.tuple3 Prims.list)
  =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;
        wl_implicits = __fname__wl_implicits;_} -> __fname__wl_deferred
  
let (__proj__Mkworklist__item__ctr : worklist -> Prims.int) =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;
        wl_implicits = __fname__wl_implicits;_} -> __fname__ctr
  
let (__proj__Mkworklist__item__defer_ok : worklist -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;
        wl_implicits = __fname__wl_implicits;_} -> __fname__defer_ok
  
let (__proj__Mkworklist__item__smt_ok : worklist -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;
        wl_implicits = __fname__wl_implicits;_} -> __fname__smt_ok
  
let (__proj__Mkworklist__item__tcenv : worklist -> FStar_TypeChecker_Env.env)
  =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;
        wl_implicits = __fname__wl_implicits;_} -> __fname__tcenv
  
let (__proj__Mkworklist__item__wl_implicits :
  worklist -> FStar_TypeChecker_Env.implicits) =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;
        wl_implicits = __fname__wl_implicits;_} -> __fname__wl_implicits
  
let (new_uvar :
  Prims.string ->
    worklist ->
      FStar_Range.range ->
        FStar_Syntax_Syntax.binding Prims.list ->
          (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
            FStar_Pervasives_Native.tuple2 Prims.list ->
            FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
              FStar_Syntax_Syntax.should_check_uvar ->
                (FStar_Syntax_Syntax.ctx_uvar,FStar_Syntax_Syntax.term,
                  worklist) FStar_Pervasives_Native.tuple3)
  =
  fun reason  ->
    fun wl  ->
      fun r  ->
        fun gamma  ->
          fun binders  ->
            fun k  ->
              fun should_check  ->
                let ctx_uvar =
                  let uu____351 = FStar_Syntax_Unionfind.fresh ()  in
                  {
                    FStar_Syntax_Syntax.ctx_uvar_head = uu____351;
                    FStar_Syntax_Syntax.ctx_uvar_gamma = gamma;
                    FStar_Syntax_Syntax.ctx_uvar_binders = binders;
                    FStar_Syntax_Syntax.ctx_uvar_typ = k;
                    FStar_Syntax_Syntax.ctx_uvar_reason = reason;
                    FStar_Syntax_Syntax.ctx_uvar_should_check = should_check;
                    FStar_Syntax_Syntax.ctx_uvar_range = r
                  }  in
                FStar_TypeChecker_Common.check_uvar_ctx_invariant reason r
                  true gamma binders;
                (let t =
                   FStar_Syntax_Syntax.mk
                     (FStar_Syntax_Syntax.Tm_uvar
                        (ctx_uvar, ([], FStar_Syntax_Syntax.NoUseRange)))
                     FStar_Pervasives_Native.None r
                    in
                 (ctx_uvar, t,
                   (let uu___335_381 = wl  in
                    {
                      attempting = (uu___335_381.attempting);
                      wl_deferred = (uu___335_381.wl_deferred);
                      ctr = (uu___335_381.ctr);
                      defer_ok = (uu___335_381.defer_ok);
                      smt_ok = (uu___335_381.smt_ok);
                      tcenv = (uu___335_381.tcenv);
                      wl_implicits = ((reason, t, ctx_uvar, r) ::
                        (wl.wl_implicits))
                    })))
  
let (copy_uvar :
  FStar_Syntax_Syntax.ctx_uvar ->
    FStar_Syntax_Syntax.binders ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        worklist ->
          (FStar_Syntax_Syntax.ctx_uvar,FStar_Syntax_Syntax.term,worklist)
            FStar_Pervasives_Native.tuple3)
  =
  fun u  ->
    fun bs  ->
      fun t  ->
        fun wl  ->
          let env =
            let uu___336_421 = wl.tcenv  in
            {
              FStar_TypeChecker_Env.solver =
                (uu___336_421.FStar_TypeChecker_Env.solver);
              FStar_TypeChecker_Env.range =
                (uu___336_421.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___336_421.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (u.FStar_Syntax_Syntax.ctx_uvar_gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___336_421.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___336_421.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___336_421.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___336_421.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___336_421.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.is_pattern =
                (uu___336_421.FStar_TypeChecker_Env.is_pattern);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___336_421.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___336_421.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___336_421.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___336_421.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level =
                (uu___336_421.FStar_TypeChecker_Env.top_level);
              FStar_TypeChecker_Env.check_uvars =
                (uu___336_421.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq =
                (uu___336_421.FStar_TypeChecker_Env.use_eq);
              FStar_TypeChecker_Env.is_iface =
                (uu___336_421.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___336_421.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax =
                (uu___336_421.FStar_TypeChecker_Env.lax);
              FStar_TypeChecker_Env.lax_universes =
                (uu___336_421.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___336_421.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___336_421.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___336_421.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___336_421.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___336_421.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___336_421.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___336_421.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___336_421.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts =
                (uu___336_421.FStar_TypeChecker_Env.use_bv_sorts);
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___336_421.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___336_421.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.proof_ns =
                (uu___336_421.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
                (uu___336_421.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.splice =
                (uu___336_421.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.is_native_tactic =
                (uu___336_421.FStar_TypeChecker_Env.is_native_tactic);
              FStar_TypeChecker_Env.identifier_info =
                (uu___336_421.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___336_421.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___336_421.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.dep_graph =
                (uu___336_421.FStar_TypeChecker_Env.dep_graph)
            }  in
          let env1 = FStar_TypeChecker_Env.push_binders env bs  in
          let uu____423 = FStar_TypeChecker_Env.all_binders env1  in
          new_uvar u.FStar_Syntax_Syntax.ctx_uvar_reason wl
            u.FStar_Syntax_Syntax.ctx_uvar_range
            env1.FStar_TypeChecker_Env.gamma uu____423 t
            u.FStar_Syntax_Syntax.ctx_uvar_should_check
  
type solution =
  | Success of
  (FStar_TypeChecker_Common.deferred,FStar_TypeChecker_Env.implicits)
  FStar_Pervasives_Native.tuple2 
  | Failed of (FStar_TypeChecker_Common.prob,Prims.string)
  FStar_Pervasives_Native.tuple2 
let (uu___is_Success : solution -> Prims.bool) =
  fun projectee  ->
    match projectee with | Success _0 -> true | uu____458 -> false
  
let (__proj__Success__item___0 :
  solution ->
    (FStar_TypeChecker_Common.deferred,FStar_TypeChecker_Env.implicits)
      FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | Success _0 -> _0 
let (uu___is_Failed : solution -> Prims.bool) =
  fun projectee  ->
    match projectee with | Failed _0 -> true | uu____488 -> false
  
let (__proj__Failed__item___0 :
  solution ->
    (FStar_TypeChecker_Common.prob,Prims.string)
      FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | Failed _0 -> _0 
type variance =
  | COVARIANT 
  | CONTRAVARIANT 
  | INVARIANT 
let (uu___is_COVARIANT : variance -> Prims.bool) =
  fun projectee  ->
    match projectee with | COVARIANT  -> true | uu____513 -> false
  
let (uu___is_CONTRAVARIANT : variance -> Prims.bool) =
  fun projectee  ->
    match projectee with | CONTRAVARIANT  -> true | uu____519 -> false
  
let (uu___is_INVARIANT : variance -> Prims.bool) =
  fun projectee  ->
    match projectee with | INVARIANT  -> true | uu____525 -> false
  
type tprob = FStar_Syntax_Syntax.typ FStar_TypeChecker_Common.problem
type cprob = FStar_Syntax_Syntax.comp FStar_TypeChecker_Common.problem
type 'a problem_t = 'a FStar_TypeChecker_Common.problem
let (rel_to_string : FStar_TypeChecker_Common.rel -> Prims.string) =
  fun uu___302_540  ->
    match uu___302_540 with
    | FStar_TypeChecker_Common.EQ  -> "="
    | FStar_TypeChecker_Common.SUB  -> "<:"
    | FStar_TypeChecker_Common.SUBINV  -> ":>"
  
let (term_to_string : FStar_Syntax_Syntax.term -> Prims.string) =
  fun t  ->
    let uu____546 = FStar_Syntax_Util.head_and_args t  in
    match uu____546 with
    | (head1,args) ->
        (match head1.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
             let uu____601 = FStar_Syntax_Print.ctx_uvar_to_string u  in
             let uu____602 =
               match FStar_Pervasives_Native.fst s with
               | [] -> ""
               | s1 ->
                   let uu____614 =
                     let uu____615 = FStar_List.hd s1  in
                     FStar_Syntax_Print.subst_to_string uu____615  in
                   FStar_Util.format1 "@<%s>" uu____614
                in
             let uu____618 = FStar_Syntax_Print.args_to_string args  in
             FStar_Util.format3 "%s%s %s" uu____601 uu____602 uu____618
         | uu____619 -> FStar_Syntax_Print.term_to_string t)
  
let (prob_to_string :
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Common.prob -> Prims.string)
  =
  fun env  ->
    fun uu___303_629  ->
      match uu___303_629 with
      | FStar_TypeChecker_Common.TProb p ->
          let uu____633 =
            let uu____636 =
              FStar_Util.string_of_int p.FStar_TypeChecker_Common.pid  in
            let uu____637 =
              let uu____640 = term_to_string p.FStar_TypeChecker_Common.lhs
                 in
              let uu____641 =
                let uu____644 =
                  let uu____647 =
                    term_to_string p.FStar_TypeChecker_Common.rhs  in
                  [uu____647]  in
                (rel_to_string p.FStar_TypeChecker_Common.relation) ::
                  uu____644
                 in
              uu____640 :: uu____641  in
            uu____636 :: uu____637  in
          FStar_Util.format "\n%s:\t%s \n\t\t%s\n\t%s\n" uu____633
      | FStar_TypeChecker_Common.CProb p ->
          let uu____651 =
            FStar_Util.string_of_int p.FStar_TypeChecker_Common.pid  in
          let uu____652 =
            FStar_TypeChecker_Normalize.comp_to_string env
              p.FStar_TypeChecker_Common.lhs
             in
          let uu____653 =
            FStar_TypeChecker_Normalize.comp_to_string env
              p.FStar_TypeChecker_Common.rhs
             in
          FStar_Util.format4 "\n%s:\t%s \n\t\t%s\n\t%s" uu____651 uu____652
            (rel_to_string p.FStar_TypeChecker_Common.relation) uu____653
  
let (uvi_to_string : FStar_TypeChecker_Env.env -> uvi -> Prims.string) =
  fun env  ->
    fun uu___304_663  ->
      match uu___304_663 with
      | UNIV (u,t) ->
          let x =
            let uu____667 = FStar_Options.hide_uvar_nums ()  in
            if uu____667
            then "?"
            else
              (let uu____669 = FStar_Syntax_Unionfind.univ_uvar_id u  in
               FStar_All.pipe_right uu____669 FStar_Util.string_of_int)
             in
          let uu____670 = FStar_Syntax_Print.univ_to_string t  in
          FStar_Util.format2 "UNIV %s %s" x uu____670
      | TERM (u,t) ->
          let x =
            let uu____674 = FStar_Options.hide_uvar_nums ()  in
            if uu____674
            then "?"
            else
              (let uu____676 =
                 FStar_Syntax_Unionfind.uvar_id
                   u.FStar_Syntax_Syntax.ctx_uvar_head
                  in
               FStar_All.pipe_right uu____676 FStar_Util.string_of_int)
             in
          let uu____677 = FStar_TypeChecker_Normalize.term_to_string env t
             in
          FStar_Util.format2 "TERM %s %s" x uu____677
  
let (uvis_to_string :
  FStar_TypeChecker_Env.env -> uvi Prims.list -> Prims.string) =
  fun env  ->
    fun uvis  ->
      let uu____692 = FStar_List.map (uvi_to_string env) uvis  in
      FStar_All.pipe_right uu____692 (FStar_String.concat ", ")
  
let (names_to_string : FStar_Syntax_Syntax.bv FStar_Util.set -> Prims.string)
  =
  fun nms  ->
    let uu____706 =
      let uu____709 = FStar_Util.set_elements nms  in
      FStar_All.pipe_right uu____709
        (FStar_List.map FStar_Syntax_Print.bv_to_string)
       in
    FStar_All.pipe_right uu____706 (FStar_String.concat ", ")
  
let args_to_string :
  'Auu____722 .
    (FStar_Syntax_Syntax.term,'Auu____722) FStar_Pervasives_Native.tuple2
      Prims.list -> Prims.string
  =
  fun args  ->
    let uu____740 =
      FStar_All.pipe_right args
        (FStar_List.map
           (fun uu____758  ->
              match uu____758 with
              | (x,uu____764) -> FStar_Syntax_Print.term_to_string x))
       in
    FStar_All.pipe_right uu____740 (FStar_String.concat " ")
  
let (empty_worklist : FStar_TypeChecker_Env.env -> worklist) =
  fun env  ->
    {
      attempting = [];
      wl_deferred = [];
      ctr = (Prims.parse_int "0");
      defer_ok = true;
      smt_ok = true;
      tcenv = env;
      wl_implicits = []
    }
  
let (giveup :
  FStar_TypeChecker_Env.env ->
    Prims.string -> FStar_TypeChecker_Common.prob -> solution)
  =
  fun env  ->
    fun reason  ->
      fun prob  ->
        (let uu____802 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Rel")
            in
         if uu____802
         then
           let uu____803 = prob_to_string env prob  in
           FStar_Util.print2 "Failed %s:\n%s\n" reason uu____803
         else ());
        Failed (prob, reason)
  
let (invert_rel :
  FStar_TypeChecker_Common.rel -> FStar_TypeChecker_Common.rel) =
  fun uu___305_809  ->
    match uu___305_809 with
    | FStar_TypeChecker_Common.EQ  -> FStar_TypeChecker_Common.EQ
    | FStar_TypeChecker_Common.SUB  -> FStar_TypeChecker_Common.SUBINV
    | FStar_TypeChecker_Common.SUBINV  -> FStar_TypeChecker_Common.SUB
  
let invert :
  'Auu____814 .
    'Auu____814 FStar_TypeChecker_Common.problem ->
      'Auu____814 FStar_TypeChecker_Common.problem
  =
  fun p  ->
    let uu___337_826 = p  in
    {
      FStar_TypeChecker_Common.pid =
        (uu___337_826.FStar_TypeChecker_Common.pid);
      FStar_TypeChecker_Common.lhs = (p.FStar_TypeChecker_Common.rhs);
      FStar_TypeChecker_Common.relation =
        (invert_rel p.FStar_TypeChecker_Common.relation);
      FStar_TypeChecker_Common.rhs = (p.FStar_TypeChecker_Common.lhs);
      FStar_TypeChecker_Common.element =
        (uu___337_826.FStar_TypeChecker_Common.element);
      FStar_TypeChecker_Common.logical_guard =
        (uu___337_826.FStar_TypeChecker_Common.logical_guard);
      FStar_TypeChecker_Common.logical_guard_uvar =
        (uu___337_826.FStar_TypeChecker_Common.logical_guard_uvar);
      FStar_TypeChecker_Common.reason =
        (uu___337_826.FStar_TypeChecker_Common.reason);
      FStar_TypeChecker_Common.loc =
        (uu___337_826.FStar_TypeChecker_Common.loc);
      FStar_TypeChecker_Common.rank =
        (uu___337_826.FStar_TypeChecker_Common.rank)
    }
  
let maybe_invert :
  'Auu____833 .
    'Auu____833 FStar_TypeChecker_Common.problem ->
      'Auu____833 FStar_TypeChecker_Common.problem
  =
  fun p  ->
    if p.FStar_TypeChecker_Common.relation = FStar_TypeChecker_Common.SUBINV
    then invert p
    else p
  
let (maybe_invert_p :
  FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.prob) =
  fun uu___306_850  ->
    match uu___306_850 with
    | FStar_TypeChecker_Common.TProb p ->
        FStar_All.pipe_right (maybe_invert p)
          (fun _0_16  -> FStar_TypeChecker_Common.TProb _0_16)
    | FStar_TypeChecker_Common.CProb p ->
        FStar_All.pipe_right (maybe_invert p)
          (fun _0_17  -> FStar_TypeChecker_Common.CProb _0_17)
  
let (make_prob_eq :
  FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.prob) =
  fun uu___307_865  ->
    match uu___307_865 with
    | FStar_TypeChecker_Common.TProb p ->
        FStar_TypeChecker_Common.TProb
          (let uu___338_871 = p  in
           {
             FStar_TypeChecker_Common.pid =
               (uu___338_871.FStar_TypeChecker_Common.pid);
             FStar_TypeChecker_Common.lhs =
               (uu___338_871.FStar_TypeChecker_Common.lhs);
             FStar_TypeChecker_Common.relation = FStar_TypeChecker_Common.EQ;
             FStar_TypeChecker_Common.rhs =
               (uu___338_871.FStar_TypeChecker_Common.rhs);
             FStar_TypeChecker_Common.element =
               (uu___338_871.FStar_TypeChecker_Common.element);
             FStar_TypeChecker_Common.logical_guard =
               (uu___338_871.FStar_TypeChecker_Common.logical_guard);
             FStar_TypeChecker_Common.logical_guard_uvar =
               (uu___338_871.FStar_TypeChecker_Common.logical_guard_uvar);
             FStar_TypeChecker_Common.reason =
               (uu___338_871.FStar_TypeChecker_Common.reason);
             FStar_TypeChecker_Common.loc =
               (uu___338_871.FStar_TypeChecker_Common.loc);
             FStar_TypeChecker_Common.rank =
               (uu___338_871.FStar_TypeChecker_Common.rank)
           })
    | FStar_TypeChecker_Common.CProb p ->
        FStar_TypeChecker_Common.CProb
          (let uu___339_879 = p  in
           {
             FStar_TypeChecker_Common.pid =
               (uu___339_879.FStar_TypeChecker_Common.pid);
             FStar_TypeChecker_Common.lhs =
               (uu___339_879.FStar_TypeChecker_Common.lhs);
             FStar_TypeChecker_Common.relation = FStar_TypeChecker_Common.EQ;
             FStar_TypeChecker_Common.rhs =
               (uu___339_879.FStar_TypeChecker_Common.rhs);
             FStar_TypeChecker_Common.element =
               (uu___339_879.FStar_TypeChecker_Common.element);
             FStar_TypeChecker_Common.logical_guard =
               (uu___339_879.FStar_TypeChecker_Common.logical_guard);
             FStar_TypeChecker_Common.logical_guard_uvar =
               (uu___339_879.FStar_TypeChecker_Common.logical_guard_uvar);
             FStar_TypeChecker_Common.reason =
               (uu___339_879.FStar_TypeChecker_Common.reason);
             FStar_TypeChecker_Common.loc =
               (uu___339_879.FStar_TypeChecker_Common.loc);
             FStar_TypeChecker_Common.rank =
               (uu___339_879.FStar_TypeChecker_Common.rank)
           })
  
let (vary_rel :
  FStar_TypeChecker_Common.rel -> variance -> FStar_TypeChecker_Common.rel) =
  fun rel  ->
    fun uu___308_891  ->
      match uu___308_891 with
      | INVARIANT  -> FStar_TypeChecker_Common.EQ
      | CONTRAVARIANT  -> invert_rel rel
      | COVARIANT  -> rel
  
let (p_pid : FStar_TypeChecker_Common.prob -> Prims.int) =
  fun uu___309_896  ->
    match uu___309_896 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.pid
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.pid
  
let (p_rel : FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.rel) =
  fun uu___310_907  ->
    match uu___310_907 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.relation
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.relation
  
let (p_reason : FStar_TypeChecker_Common.prob -> Prims.string Prims.list) =
  fun uu___311_920  ->
    match uu___311_920 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.reason
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.reason
  
let (p_loc : FStar_TypeChecker_Common.prob -> FStar_Range.range) =
  fun uu___312_933  ->
    match uu___312_933 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.loc
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.loc
  
let (p_element :
  FStar_TypeChecker_Common.prob ->
    FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option)
  =
  fun uu___313_946  ->
    match uu___313_946 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.element
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.element
  
let (p_guard : FStar_TypeChecker_Common.prob -> FStar_Syntax_Syntax.term) =
  fun uu___314_959  ->
    match uu___314_959 with
    | FStar_TypeChecker_Common.TProb p ->
        p.FStar_TypeChecker_Common.logical_guard
    | FStar_TypeChecker_Common.CProb p ->
        p.FStar_TypeChecker_Common.logical_guard
  
let (p_guard_uvar :
  FStar_TypeChecker_Common.prob -> FStar_Syntax_Syntax.ctx_uvar) =
  fun uu___315_970  ->
    match uu___315_970 with
    | FStar_TypeChecker_Common.TProb p ->
        p.FStar_TypeChecker_Common.logical_guard_uvar
    | FStar_TypeChecker_Common.CProb p ->
        p.FStar_TypeChecker_Common.logical_guard_uvar
  
let def_scope_wf :
  'Auu____985 .
    Prims.string ->
      FStar_Range.range ->
        (FStar_Syntax_Syntax.bv,'Auu____985) FStar_Pervasives_Native.tuple2
          Prims.list -> unit
  =
  fun msg  ->
    fun rng  ->
      fun r  ->
        let uu____1013 =
          let uu____1014 = FStar_Options.defensive ()  in
          Prims.op_Negation uu____1014  in
        if uu____1013
        then ()
        else
          (let rec aux prev next =
             match next with
             | [] -> ()
             | (bv,uu____1048)::bs ->
                 (FStar_TypeChecker_Env.def_check_closed_in rng msg prev
                    bv.FStar_Syntax_Syntax.sort;
                  aux (FStar_List.append prev [bv]) bs)
              in
           aux [] r)
  
let (p_scope :
  FStar_TypeChecker_Common.prob ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun prob  ->
    let r =
      match prob with
      | FStar_TypeChecker_Common.TProb p ->
          let uu____1088 =
            match p_element prob with
            | FStar_Pervasives_Native.None  -> []
            | FStar_Pervasives_Native.Some x ->
                let uu____1106 = FStar_Syntax_Syntax.mk_binder x  in
                [uu____1106]
             in
          FStar_List.append
            (p.FStar_TypeChecker_Common.logical_guard_uvar).FStar_Syntax_Syntax.ctx_uvar_binders
            uu____1088
      | FStar_TypeChecker_Common.CProb p ->
          let uu____1126 =
            match p_element prob with
            | FStar_Pervasives_Native.None  -> []
            | FStar_Pervasives_Native.Some x ->
                let uu____1144 = FStar_Syntax_Syntax.mk_binder x  in
                [uu____1144]
             in
          FStar_List.append
            (p.FStar_TypeChecker_Common.logical_guard_uvar).FStar_Syntax_Syntax.ctx_uvar_binders
            uu____1126
       in
    def_scope_wf "p_scope" (p_loc prob) r; r
  
let (def_check_scoped :
  Prims.string ->
    FStar_TypeChecker_Common.prob -> FStar_Syntax_Syntax.term -> unit)
  =
  fun msg  ->
    fun prob  ->
      fun phi  ->
        let uu____1177 =
          let uu____1178 = FStar_Options.defensive ()  in
          Prims.op_Negation uu____1178  in
        if uu____1177
        then ()
        else
          (let uu____1180 =
             let uu____1183 = p_scope prob  in
             FStar_All.pipe_left (FStar_List.map FStar_Pervasives_Native.fst)
               uu____1183
              in
           FStar_TypeChecker_Env.def_check_closed_in (p_loc prob) msg
             uu____1180 phi)
  
let (def_check_scoped_comp :
  Prims.string ->
    FStar_TypeChecker_Common.prob ->
      FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax -> unit)
  =
  fun msg  ->
    fun prob  ->
      fun comp  ->
        let uu____1221 =
          let uu____1222 = FStar_Options.defensive ()  in
          Prims.op_Negation uu____1222  in
        if uu____1221
        then ()
        else
          (let uu____1224 = FStar_Syntax_Util.arrow [] comp  in
           def_check_scoped msg prob uu____1224)
  
let (def_check_prob : Prims.string -> FStar_TypeChecker_Common.prob -> unit)
  =
  fun msg  ->
    fun prob  ->
      let uu____1239 =
        let uu____1240 = FStar_Options.defensive ()  in
        Prims.op_Negation uu____1240  in
      if uu____1239
      then ()
      else
        (let msgf m =
           let uu____1248 =
             let uu____1249 =
               let uu____1250 = FStar_Util.string_of_int (p_pid prob)  in
               Prims.strcat uu____1250 (Prims.strcat "." m)  in
             Prims.strcat "." uu____1249  in
           Prims.strcat msg uu____1248  in
         (let uu____1252 = msgf "scope"  in
          let uu____1253 = p_scope prob  in
          def_scope_wf uu____1252 (p_loc prob) uu____1253);
         (let uu____1261 = msgf "guard"  in
          def_check_scoped uu____1261 prob (p_guard prob));
         (match prob with
          | FStar_TypeChecker_Common.TProb p ->
              ((let uu____1266 = msgf "lhs"  in
                def_check_scoped uu____1266 prob
                  p.FStar_TypeChecker_Common.lhs);
               (let uu____1267 = msgf "rhs"  in
                def_check_scoped uu____1267 prob
                  p.FStar_TypeChecker_Common.rhs))
          | FStar_TypeChecker_Common.CProb p ->
              ((let uu____1272 = msgf "lhs"  in
                def_check_scoped_comp uu____1272 prob
                  p.FStar_TypeChecker_Common.lhs);
               (let uu____1273 = msgf "rhs"  in
                def_check_scoped_comp uu____1273 prob
                  p.FStar_TypeChecker_Common.rhs))))
  
let (singleton :
  worklist -> FStar_TypeChecker_Common.prob -> Prims.bool -> worklist) =
  fun wl  ->
    fun prob  ->
      fun smt_ok  ->
        let uu___340_1289 = wl  in
        {
          attempting = [prob];
          wl_deferred = (uu___340_1289.wl_deferred);
          ctr = (uu___340_1289.ctr);
          defer_ok = (uu___340_1289.defer_ok);
          smt_ok;
          tcenv = (uu___340_1289.tcenv);
          wl_implicits = (uu___340_1289.wl_implicits)
        }
  
let wl_of_guard :
  'Auu____1296 .
    FStar_TypeChecker_Env.env ->
      ('Auu____1296,FStar_TypeChecker_Common.prob)
        FStar_Pervasives_Native.tuple2 Prims.list -> worklist
  =
  fun env  ->
    fun g  ->
      let uu___341_1319 = empty_worklist env  in
      let uu____1320 = FStar_List.map FStar_Pervasives_Native.snd g  in
      {
        attempting = uu____1320;
        wl_deferred = (uu___341_1319.wl_deferred);
        ctr = (uu___341_1319.ctr);
        defer_ok = (uu___341_1319.defer_ok);
        smt_ok = (uu___341_1319.smt_ok);
        tcenv = (uu___341_1319.tcenv);
        wl_implicits = (uu___341_1319.wl_implicits)
      }
  
let (defer :
  Prims.string -> FStar_TypeChecker_Common.prob -> worklist -> worklist) =
  fun reason  ->
    fun prob  ->
      fun wl  ->
        let uu___342_1340 = wl  in
        {
          attempting = (uu___342_1340.attempting);
          wl_deferred = (((wl.ctr), reason, prob) :: (wl.wl_deferred));
          ctr = (uu___342_1340.ctr);
          defer_ok = (uu___342_1340.defer_ok);
          smt_ok = (uu___342_1340.smt_ok);
          tcenv = (uu___342_1340.tcenv);
          wl_implicits = (uu___342_1340.wl_implicits)
        }
  
let (attempt :
  FStar_TypeChecker_Common.prob Prims.list -> worklist -> worklist) =
  fun probs  ->
    fun wl  ->
      FStar_List.iter (def_check_prob "attempt") probs;
      (let uu___343_1362 = wl  in
       {
         attempting = (FStar_List.append probs wl.attempting);
         wl_deferred = (uu___343_1362.wl_deferred);
         ctr = (uu___343_1362.ctr);
         defer_ok = (uu___343_1362.defer_ok);
         smt_ok = (uu___343_1362.smt_ok);
         tcenv = (uu___343_1362.tcenv);
         wl_implicits = (uu___343_1362.wl_implicits)
       })
  
let mk_eq2 :
  'Auu____1373 .
    worklist ->
      'Auu____1373 ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
          FStar_Syntax_Syntax.term ->
            (FStar_Syntax_Syntax.term,worklist)
              FStar_Pervasives_Native.tuple2
  =
  fun wl  ->
    fun prob  ->
      fun t1  ->
        fun t2  ->
          let uu____1402 = FStar_Syntax_Util.type_u ()  in
          match uu____1402 with
          | (t_type,u) ->
              let binders = FStar_TypeChecker_Env.all_binders wl.tcenv  in
              let uu____1414 =
                new_uvar "eq2" wl t1.FStar_Syntax_Syntax.pos
                  (wl.tcenv).FStar_TypeChecker_Env.gamma binders t_type
                  FStar_Syntax_Syntax.Allow_unresolved
                 in
              (match uu____1414 with
               | (uu____1425,tt,wl1) ->
                   let uu____1428 = FStar_Syntax_Util.mk_eq2 u tt t1 t2  in
                   (uu____1428, wl1))
  
let (p_invert :
  FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.prob) =
  fun uu___316_1433  ->
    match uu___316_1433 with
    | FStar_TypeChecker_Common.TProb p ->
        FStar_All.pipe_left
          (fun _0_18  -> FStar_TypeChecker_Common.TProb _0_18) (invert p)
    | FStar_TypeChecker_Common.CProb p ->
        FStar_All.pipe_left
          (fun _0_19  -> FStar_TypeChecker_Common.CProb _0_19) (invert p)
  
let (is_top_level_prob : FStar_TypeChecker_Common.prob -> Prims.bool) =
  fun p  ->
    let uu____1449 = FStar_All.pipe_right (p_reason p) FStar_List.length  in
    uu____1449 = (Prims.parse_int "1")
  
let (next_pid : unit -> Prims.int) =
  let ctr = FStar_Util.mk_ref (Prims.parse_int "0")  in
  fun uu____1459  -> FStar_Util.incr ctr; FStar_ST.op_Bang ctr 
let mk_problem :
  'Auu____1557 .
    worklist ->
      (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        FStar_TypeChecker_Common.prob ->
          'Auu____1557 ->
            FStar_TypeChecker_Common.rel ->
              'Auu____1557 ->
                FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
                  Prims.string ->
                    ('Auu____1557 FStar_TypeChecker_Common.problem,worklist)
                      FStar_Pervasives_Native.tuple2
  =
  fun wl  ->
    fun scope  ->
      fun orig  ->
        fun lhs  ->
          fun rel  ->
            fun rhs  ->
              fun elt  ->
                fun reason  ->
                  let scope1 =
                    match elt with
                    | FStar_Pervasives_Native.None  -> scope
                    | FStar_Pervasives_Native.Some x ->
                        let uu____1634 =
                          let uu____1641 = FStar_Syntax_Syntax.mk_binder x
                             in
                          [uu____1641]  in
                        FStar_List.append scope uu____1634
                     in
                  let bs =
                    FStar_List.append
                      (p_guard_uvar orig).FStar_Syntax_Syntax.ctx_uvar_binders
                      scope1
                     in
                  let gamma =
                    let uu____1672 =
                      let uu____1675 =
                        FStar_List.map
                          (fun b  ->
                             FStar_Syntax_Syntax.Binding_var
                               (FStar_Pervasives_Native.fst b)) scope1
                         in
                      FStar_List.rev uu____1675  in
                    FStar_List.append uu____1672
                      (p_guard_uvar orig).FStar_Syntax_Syntax.ctx_uvar_gamma
                     in
                  let uu____1688 =
                    new_uvar
                      (Prims.strcat "mk_problem: logical guard for " reason)
                      wl FStar_Range.dummyRange gamma bs
                      FStar_Syntax_Util.ktype0
                      FStar_Syntax_Syntax.Allow_untyped
                     in
                  match uu____1688 with
                  | (ctx_uvar,lg,wl1) ->
                      let prob =
                        let uu____1707 = next_pid ()  in
                        {
                          FStar_TypeChecker_Common.pid = uu____1707;
                          FStar_TypeChecker_Common.lhs = lhs;
                          FStar_TypeChecker_Common.relation = rel;
                          FStar_TypeChecker_Common.rhs = rhs;
                          FStar_TypeChecker_Common.element = elt;
                          FStar_TypeChecker_Common.logical_guard = lg;
                          FStar_TypeChecker_Common.logical_guard_uvar =
                            ctx_uvar;
                          FStar_TypeChecker_Common.reason = (reason ::
                            (p_reason orig));
                          FStar_TypeChecker_Common.loc = (p_loc orig);
                          FStar_TypeChecker_Common.rank =
                            FStar_Pervasives_Native.None
                        }  in
                      (prob, wl1)
  
let (mk_t_problem :
  worklist ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list ->
      FStar_TypeChecker_Common.prob ->
        FStar_Syntax_Syntax.typ ->
          FStar_TypeChecker_Common.rel ->
            FStar_Syntax_Syntax.typ ->
              FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
                Prims.string ->
                  (FStar_TypeChecker_Common.prob,worklist)
                    FStar_Pervasives_Native.tuple2)
  =
  fun wl  ->
    fun scope  ->
      fun orig  ->
        fun lhs  ->
          fun rel  ->
            fun rhs  ->
              fun elt  ->
                fun reason  ->
                  def_check_prob (Prims.strcat reason ".mk_t.arg") orig;
                  (let uu____1771 =
                     mk_problem wl scope orig lhs rel rhs elt reason  in
                   match uu____1771 with
                   | (p,wl1) ->
                       (def_check_prob (Prims.strcat reason ".mk_t")
                          (FStar_TypeChecker_Common.TProb p);
                        ((FStar_TypeChecker_Common.TProb p), wl1)))
  
let (mk_c_problem :
  worklist ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list ->
      FStar_TypeChecker_Common.prob ->
        FStar_Syntax_Syntax.comp ->
          FStar_TypeChecker_Common.rel ->
            FStar_Syntax_Syntax.comp ->
              FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
                Prims.string ->
                  (FStar_TypeChecker_Common.prob,worklist)
                    FStar_Pervasives_Native.tuple2)
  =
  fun wl  ->
    fun scope  ->
      fun orig  ->
        fun lhs  ->
          fun rel  ->
            fun rhs  ->
              fun elt  ->
                fun reason  ->
                  def_check_prob (Prims.strcat reason ".mk_c.arg") orig;
                  (let uu____1850 =
                     mk_problem wl scope orig lhs rel rhs elt reason  in
                   match uu____1850 with
                   | (p,wl1) ->
                       (def_check_prob (Prims.strcat reason ".mk_c")
                          (FStar_TypeChecker_Common.CProb p);
                        ((FStar_TypeChecker_Common.CProb p), wl1)))
  
let new_problem :
  'Auu____1886 .
    worklist ->
      FStar_TypeChecker_Env.env ->
        'Auu____1886 ->
          FStar_TypeChecker_Common.rel ->
            'Auu____1886 ->
              FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
                FStar_Range.range ->
                  Prims.string ->
                    ('Auu____1886 FStar_TypeChecker_Common.problem,worklist)
                      FStar_Pervasives_Native.tuple2
  =
  fun wl  ->
    fun env  ->
      fun lhs  ->
        fun rel  ->
          fun rhs  ->
            fun subject  ->
              fun loc  ->
                fun reason  ->
                  let lg_ty =
                    match subject with
                    | FStar_Pervasives_Native.None  ->
                        FStar_Syntax_Util.ktype0
                    | FStar_Pervasives_Native.Some x ->
                        let bs =
                          let uu____1950 = FStar_Syntax_Syntax.mk_binder x
                             in
                          [uu____1950]  in
                        let uu____1963 =
                          FStar_Syntax_Syntax.mk_Total
                            FStar_Syntax_Util.ktype0
                           in
                        FStar_Syntax_Util.arrow bs uu____1963
                     in
                  let uu____1966 =
                    let uu____1973 = FStar_TypeChecker_Env.all_binders env
                       in
                    new_uvar
                      (Prims.strcat "new_problem: logical guard for " reason)
                      (let uu___344_1981 = wl  in
                       {
                         attempting = (uu___344_1981.attempting);
                         wl_deferred = (uu___344_1981.wl_deferred);
                         ctr = (uu___344_1981.ctr);
                         defer_ok = (uu___344_1981.defer_ok);
                         smt_ok = (uu___344_1981.smt_ok);
                         tcenv = env;
                         wl_implicits = (uu___344_1981.wl_implicits)
                       }) loc env.FStar_TypeChecker_Env.gamma uu____1973
                      lg_ty FStar_Syntax_Syntax.Allow_untyped
                     in
                  match uu____1966 with
                  | (ctx_uvar,lg,wl1) ->
                      let lg1 =
                        match subject with
                        | FStar_Pervasives_Native.None  -> lg
                        | FStar_Pervasives_Native.Some x ->
                            let uu____1993 =
                              let uu____1998 =
                                let uu____1999 =
                                  let uu____2006 =
                                    FStar_Syntax_Syntax.bv_to_name x  in
                                  FStar_All.pipe_left
                                    FStar_Syntax_Syntax.as_arg uu____2006
                                   in
                                [uu____1999]  in
                              FStar_Syntax_Syntax.mk_Tm_app lg uu____1998  in
                            uu____1993 FStar_Pervasives_Native.None loc
                         in
                      let prob =
                        let uu____2030 = next_pid ()  in
                        {
                          FStar_TypeChecker_Common.pid = uu____2030;
                          FStar_TypeChecker_Common.lhs = lhs;
                          FStar_TypeChecker_Common.relation = rel;
                          FStar_TypeChecker_Common.rhs = rhs;
                          FStar_TypeChecker_Common.element = subject;
                          FStar_TypeChecker_Common.logical_guard = lg1;
                          FStar_TypeChecker_Common.logical_guard_uvar =
                            ctx_uvar;
                          FStar_TypeChecker_Common.reason = [reason];
                          FStar_TypeChecker_Common.loc = loc;
                          FStar_TypeChecker_Common.rank =
                            FStar_Pervasives_Native.None
                        }  in
                      (prob, wl1)
  
let (problem_using_guard :
  FStar_TypeChecker_Common.prob ->
    FStar_Syntax_Syntax.typ ->
      FStar_TypeChecker_Common.rel ->
        FStar_Syntax_Syntax.typ ->
          FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
            Prims.string ->
              FStar_Syntax_Syntax.typ FStar_TypeChecker_Common.problem)
  =
  fun orig  ->
    fun lhs  ->
      fun rel  ->
        fun rhs  ->
          fun elt  ->
            fun reason  ->
              let p =
                let uu____2072 = next_pid ()  in
                {
                  FStar_TypeChecker_Common.pid = uu____2072;
                  FStar_TypeChecker_Common.lhs = lhs;
                  FStar_TypeChecker_Common.relation = rel;
                  FStar_TypeChecker_Common.rhs = rhs;
                  FStar_TypeChecker_Common.element = elt;
                  FStar_TypeChecker_Common.logical_guard = (p_guard orig);
                  FStar_TypeChecker_Common.logical_guard_uvar =
                    (p_guard_uvar orig);
                  FStar_TypeChecker_Common.reason = (reason ::
                    (p_reason orig));
                  FStar_TypeChecker_Common.loc = (p_loc orig);
                  FStar_TypeChecker_Common.rank =
                    FStar_Pervasives_Native.None
                }  in
              def_check_prob reason (FStar_TypeChecker_Common.TProb p); p
  
let guard_on_element :
  'Auu____2084 .
    worklist ->
      'Auu____2084 FStar_TypeChecker_Common.problem ->
        FStar_Syntax_Syntax.bv ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
            FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
  =
  fun wl  ->
    fun problem  ->
      fun x  ->
        fun phi  ->
          match problem.FStar_TypeChecker_Common.element with
          | FStar_Pervasives_Native.None  ->
              let u =
                (wl.tcenv).FStar_TypeChecker_Env.universe_of wl.tcenv
                  x.FStar_Syntax_Syntax.sort
                 in
              FStar_Syntax_Util.mk_forall u x phi
          | FStar_Pervasives_Native.Some e ->
              let uu____2117 =
                let uu____2120 =
                  let uu____2121 =
                    let uu____2128 = FStar_Syntax_Syntax.bv_to_name e  in
                    (x, uu____2128)  in
                  FStar_Syntax_Syntax.NT uu____2121  in
                [uu____2120]  in
              FStar_Syntax_Subst.subst uu____2117 phi
  
let (explain :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob -> Prims.string -> Prims.string)
  =
  fun env  ->
    fun d  ->
      fun s  ->
        let uu____2148 =
          (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "ExplainRel"))
            ||
            (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Rel"))
           in
        if uu____2148
        then
          let uu____2149 =
            FStar_All.pipe_left FStar_Range.string_of_range (p_loc d)  in
          let uu____2150 = prob_to_string env d  in
          let uu____2151 =
            FStar_All.pipe_right (p_reason d) (FStar_String.concat "\n\t>")
             in
          FStar_Util.format4
            "(%s) Failed to solve the sub-problem\n%s\nWhich arose because:\n\t%s\nFailed because:%s\n"
            uu____2149 uu____2150 uu____2151 s
        else
          (let d1 = maybe_invert_p d  in
           let rel =
             match p_rel d1 with
             | FStar_TypeChecker_Common.EQ  -> "equal to"
             | FStar_TypeChecker_Common.SUB  -> "a subtype of"
             | uu____2157 -> failwith "impossible"  in
           let uu____2158 =
             match d1 with
             | FStar_TypeChecker_Common.TProb tp ->
                 let uu____2170 =
                   FStar_TypeChecker_Normalize.term_to_string env
                     tp.FStar_TypeChecker_Common.lhs
                    in
                 let uu____2171 =
                   FStar_TypeChecker_Normalize.term_to_string env
                     tp.FStar_TypeChecker_Common.rhs
                    in
                 (uu____2170, uu____2171)
             | FStar_TypeChecker_Common.CProb cp ->
                 let uu____2175 =
                   FStar_TypeChecker_Normalize.comp_to_string env
                     cp.FStar_TypeChecker_Common.lhs
                    in
                 let uu____2176 =
                   FStar_TypeChecker_Normalize.comp_to_string env
                     cp.FStar_TypeChecker_Common.rhs
                    in
                 (uu____2175, uu____2176)
              in
           match uu____2158 with
           | (lhs,rhs) ->
               FStar_Util.format3 "%s is not %s the expected type %s" lhs rel
                 rhs)
  
let (commit : uvi Prims.list -> unit) =
  fun uvis  ->
    FStar_All.pipe_right uvis
      (FStar_List.iter
         (fun uu___317_2194  ->
            match uu___317_2194 with
            | UNIV (u,t) ->
                (match t with
                 | FStar_Syntax_Syntax.U_unif u' ->
                     FStar_Syntax_Unionfind.univ_union u u'
                 | uu____2206 -> FStar_Syntax_Unionfind.univ_change u t)
            | TERM (u,t) ->
                ((let uu____2210 =
                    FStar_List.map FStar_Pervasives_Native.fst
                      u.FStar_Syntax_Syntax.ctx_uvar_binders
                     in
                  FStar_TypeChecker_Env.def_check_closed_in
                    t.FStar_Syntax_Syntax.pos "commit" uu____2210 t);
                 FStar_Syntax_Util.set_uvar
                   u.FStar_Syntax_Syntax.ctx_uvar_head t)))
  
let (find_term_uvar :
  FStar_Syntax_Syntax.uvar ->
    uvi Prims.list -> FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun uv  ->
    fun s  ->
      FStar_Util.find_map s
        (fun uu___318_2235  ->
           match uu___318_2235 with
           | UNIV uu____2238 -> FStar_Pervasives_Native.None
           | TERM (u,t) ->
               let uu____2245 =
                 FStar_Syntax_Unionfind.equiv uv
                   u.FStar_Syntax_Syntax.ctx_uvar_head
                  in
               if uu____2245
               then FStar_Pervasives_Native.Some t
               else FStar_Pervasives_Native.None)
  
let (find_univ_uvar :
  FStar_Syntax_Syntax.universe_uvar ->
    uvi Prims.list ->
      FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  =
  fun u  ->
    fun s  ->
      FStar_Util.find_map s
        (fun uu___319_2269  ->
           match uu___319_2269 with
           | UNIV (u',t) ->
               let uu____2274 = FStar_Syntax_Unionfind.univ_equiv u u'  in
               if uu____2274
               then FStar_Pervasives_Native.Some t
               else FStar_Pervasives_Native.None
           | uu____2278 -> FStar_Pervasives_Native.None)
  
let (whnf :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      let uu____2289 =
        let uu____2290 = FStar_Syntax_Util.unmeta t  in
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Beta;
          FStar_TypeChecker_Normalize.Weak;
          FStar_TypeChecker_Normalize.HNF] env uu____2290
         in
      FStar_Syntax_Subst.compress uu____2289
  
let (sn :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      let uu____2301 =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Beta] env t
         in
      FStar_Syntax_Subst.compress uu____2301
  
let norm_arg :
  'Auu____2308 .
    FStar_TypeChecker_Env.env ->
      (FStar_Syntax_Syntax.term,'Auu____2308) FStar_Pervasives_Native.tuple2
        ->
        (FStar_Syntax_Syntax.term,'Auu____2308)
          FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun t  ->
      let uu____2331 = sn env (FStar_Pervasives_Native.fst t)  in
      (uu____2331, (FStar_Pervasives_Native.snd t))
  
let (sn_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
        FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun env  ->
    fun binders  ->
      FStar_All.pipe_right binders
        (FStar_List.map
           (fun uu____2372  ->
              match uu____2372 with
              | (x,imp) ->
                  let uu____2383 =
                    let uu___345_2384 = x  in
                    let uu____2385 = sn env x.FStar_Syntax_Syntax.sort  in
                    {
                      FStar_Syntax_Syntax.ppname =
                        (uu___345_2384.FStar_Syntax_Syntax.ppname);
                      FStar_Syntax_Syntax.index =
                        (uu___345_2384.FStar_Syntax_Syntax.index);
                      FStar_Syntax_Syntax.sort = uu____2385
                    }  in
                  (uu____2383, imp)))
  
let (norm_univ :
  worklist -> FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe) =
  fun wl  ->
    fun u  ->
      let rec aux u1 =
        let u2 = FStar_Syntax_Subst.compress_univ u1  in
        match u2 with
        | FStar_Syntax_Syntax.U_succ u3 ->
            let uu____2406 = aux u3  in FStar_Syntax_Syntax.U_succ uu____2406
        | FStar_Syntax_Syntax.U_max us ->
            let uu____2410 = FStar_List.map aux us  in
            FStar_Syntax_Syntax.U_max uu____2410
        | uu____2413 -> u2  in
      let uu____2414 = aux u  in
      FStar_TypeChecker_Normalize.normalize_universe wl.tcenv uu____2414
  
let (base_and_refinement_maybe_delta :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,(FStar_Syntax_Syntax.bv,
                                                                FStar_Syntax_Syntax.term'
                                                                  FStar_Syntax_Syntax.syntax)
                                                                FStar_Pervasives_Native.tuple2
                                                                FStar_Pervasives_Native.option)
          FStar_Pervasives_Native.tuple2)
  =
  fun should_delta  ->
    fun env  ->
      fun t1  ->
        let norm_refinement env1 t =
          let steps =
            if should_delta
            then
              [FStar_TypeChecker_Normalize.Weak;
              FStar_TypeChecker_Normalize.HNF;
              FStar_TypeChecker_Normalize.UnfoldUntil
                FStar_Syntax_Syntax.delta_constant]
            else
              [FStar_TypeChecker_Normalize.Weak;
              FStar_TypeChecker_Normalize.HNF]
             in
          FStar_TypeChecker_Normalize.normalize_refinement steps env1 t  in
        let rec aux norm1 t11 =
          let t12 = FStar_Syntax_Util.unmeta t11  in
          match t12.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
              if norm1
              then
                ((x.FStar_Syntax_Syntax.sort),
                  (FStar_Pervasives_Native.Some (x, phi)))
              else
                (let uu____2536 = norm_refinement env t12  in
                 match uu____2536 with
                 | {
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_refine
                       (x1,phi1);
                     FStar_Syntax_Syntax.pos = uu____2553;
                     FStar_Syntax_Syntax.vars = uu____2554;_} ->
                     ((x1.FStar_Syntax_Syntax.sort),
                       (FStar_Pervasives_Native.Some (x1, phi1)))
                 | tt ->
                     let uu____2580 =
                       let uu____2581 = FStar_Syntax_Print.term_to_string tt
                          in
                       let uu____2582 = FStar_Syntax_Print.tag_of_term tt  in
                       FStar_Util.format2 "impossible: Got %s ... %s\n"
                         uu____2581 uu____2582
                        in
                     failwith uu____2580)
          | FStar_Syntax_Syntax.Tm_lazy i ->
              let uu____2598 = FStar_Syntax_Util.unfold_lazy i  in
              aux norm1 uu____2598
          | FStar_Syntax_Syntax.Tm_uinst uu____2599 ->
              if norm1
              then (t12, FStar_Pervasives_Native.None)
              else
                (let t1' = norm_refinement env t12  in
                 let uu____2638 =
                   let uu____2639 = FStar_Syntax_Subst.compress t1'  in
                   uu____2639.FStar_Syntax_Syntax.n  in
                 match uu____2638 with
                 | FStar_Syntax_Syntax.Tm_refine uu____2656 -> aux true t1'
                 | uu____2663 -> (t12, FStar_Pervasives_Native.None))
          | FStar_Syntax_Syntax.Tm_fvar uu____2680 ->
              if norm1
              then (t12, FStar_Pervasives_Native.None)
              else
                (let t1' = norm_refinement env t12  in
                 let uu____2713 =
                   let uu____2714 = FStar_Syntax_Subst.compress t1'  in
                   uu____2714.FStar_Syntax_Syntax.n  in
                 match uu____2713 with
                 | FStar_Syntax_Syntax.Tm_refine uu____2731 -> aux true t1'
                 | uu____2738 -> (t12, FStar_Pervasives_Native.None))
          | FStar_Syntax_Syntax.Tm_app uu____2755 ->
              if norm1
              then (t12, FStar_Pervasives_Native.None)
              else
                (let t1' = norm_refinement env t12  in
                 let uu____2802 =
                   let uu____2803 = FStar_Syntax_Subst.compress t1'  in
                   uu____2803.FStar_Syntax_Syntax.n  in
                 match uu____2802 with
                 | FStar_Syntax_Syntax.Tm_refine uu____2820 -> aux true t1'
                 | uu____2827 -> (t12, FStar_Pervasives_Native.None))
          | FStar_Syntax_Syntax.Tm_type uu____2844 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_constant uu____2861 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_name uu____2878 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_bvar uu____2895 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_arrow uu____2912 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_abs uu____2941 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_quoted uu____2974 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_uvar uu____2997 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_let uu____3026 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_match uu____3055 ->
              (t12, FStar_Pervasives_Native.None)
          | FStar_Syntax_Syntax.Tm_meta uu____3094 ->
              let uu____3101 =
                let uu____3102 = FStar_Syntax_Print.term_to_string t12  in
                let uu____3103 = FStar_Syntax_Print.tag_of_term t12  in
                FStar_Util.format2 "impossible (outer): Got %s ... %s\n"
                  uu____3102 uu____3103
                 in
              failwith uu____3101
          | FStar_Syntax_Syntax.Tm_ascribed uu____3118 ->
              let uu____3145 =
                let uu____3146 = FStar_Syntax_Print.term_to_string t12  in
                let uu____3147 = FStar_Syntax_Print.tag_of_term t12  in
                FStar_Util.format2 "impossible (outer): Got %s ... %s\n"
                  uu____3146 uu____3147
                 in
              failwith uu____3145
          | FStar_Syntax_Syntax.Tm_delayed uu____3162 ->
              let uu____3185 =
                let uu____3186 = FStar_Syntax_Print.term_to_string t12  in
                let uu____3187 = FStar_Syntax_Print.tag_of_term t12  in
                FStar_Util.format2 "impossible (outer): Got %s ... %s\n"
                  uu____3186 uu____3187
                 in
              failwith uu____3185
          | FStar_Syntax_Syntax.Tm_unknown  ->
              let uu____3202 =
                let uu____3203 = FStar_Syntax_Print.term_to_string t12  in
                let uu____3204 = FStar_Syntax_Print.tag_of_term t12  in
                FStar_Util.format2 "impossible (outer): Got %s ... %s\n"
                  uu____3203 uu____3204
                 in
              failwith uu____3202
           in
        let uu____3219 = whnf env t1  in aux false uu____3219
  
let (base_and_refinement :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,(FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.term)
                                  FStar_Pervasives_Native.tuple2
                                  FStar_Pervasives_Native.option)
        FStar_Pervasives_Native.tuple2)
  = fun env  -> fun t  -> base_and_refinement_maybe_delta false env t 
let (normalize_refinement :
  FStar_TypeChecker_Normalize.steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun steps  ->
    fun env  ->
      fun t0  ->
        FStar_TypeChecker_Normalize.normalize_refinement steps env t0
  
let (unrefine :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun env  ->
    fun t  ->
      let uu____3275 = base_and_refinement env t  in
      FStar_All.pipe_right uu____3275 FStar_Pervasives_Native.fst
  
let (trivial_refinement :
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.term)
      FStar_Pervasives_Native.tuple2)
  =
  fun t  ->
    let uu____3315 = FStar_Syntax_Syntax.null_bv t  in
    (uu____3315, FStar_Syntax_Util.t_true)
  
let (as_refinement :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.term)
          FStar_Pervasives_Native.tuple2)
  =
  fun delta1  ->
    fun env  ->
      fun t  ->
        let uu____3339 = base_and_refinement_maybe_delta delta1 env t  in
        match uu____3339 with
        | (t_base,refinement) ->
            (match refinement with
             | FStar_Pervasives_Native.None  -> trivial_refinement t_base
             | FStar_Pervasives_Native.Some (x,phi) -> (x, phi))
  
let (force_refinement :
  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,(FStar_Syntax_Syntax.bv,
                                                          FStar_Syntax_Syntax.term)
                                                          FStar_Pervasives_Native.tuple2
                                                          FStar_Pervasives_Native.option)
    FStar_Pervasives_Native.tuple2 -> FStar_Syntax_Syntax.term)
  =
  fun uu____3418  ->
    match uu____3418 with
    | (t_base,refopt) ->
        let uu____3449 =
          match refopt with
          | FStar_Pervasives_Native.Some (y,phi) -> (y, phi)
          | FStar_Pervasives_Native.None  -> trivial_refinement t_base  in
        (match uu____3449 with
         | (y,phi) ->
             FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_refine (y, phi))
               FStar_Pervasives_Native.None t_base.FStar_Syntax_Syntax.pos)
  
let (wl_prob_to_string :
  worklist -> FStar_TypeChecker_Common.prob -> Prims.string) =
  fun wl  -> fun prob  -> prob_to_string wl.tcenv prob 
let (wl_to_string : worklist -> Prims.string) =
  fun wl  ->
    let uu____3487 =
      let uu____3490 =
        let uu____3493 =
          FStar_All.pipe_right wl.wl_deferred
            (FStar_List.map
               (fun uu____3516  ->
                  match uu____3516 with | (uu____3523,uu____3524,x) -> x))
           in
        FStar_List.append wl.attempting uu____3493  in
      FStar_List.map (wl_prob_to_string wl) uu____3490  in
    FStar_All.pipe_right uu____3487 (FStar_String.concat "\n\t")
  
type flex_t =
  (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.ctx_uvar,FStar_Syntax_Syntax.args)
    FStar_Pervasives_Native.tuple3
let flex_t_to_string :
  'Auu____3538 .
    ('Auu____3538,FStar_Syntax_Syntax.ctx_uvar,FStar_Syntax_Syntax.args)
      FStar_Pervasives_Native.tuple3 -> Prims.string
  =
  fun uu____3549  ->
    match uu____3549 with
    | (uu____3556,c,args) ->
        let uu____3559 = print_ctx_uvar c  in
        let uu____3560 = FStar_Syntax_Print.args_to_string args  in
        FStar_Util.format2 "%s [%s]" uu____3559 uu____3560
  
let (is_flex : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t  ->
    let uu____3566 = FStar_Syntax_Util.head_and_args t  in
    match uu____3566 with
    | (head1,_args) ->
        let uu____3603 =
          let uu____3604 = FStar_Syntax_Subst.compress head1  in
          uu____3604.FStar_Syntax_Syntax.n  in
        (match uu____3603 with
         | FStar_Syntax_Syntax.Tm_uvar uu____3607 -> true
         | uu____3620 -> false)
  
let (flex_uvar_head :
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.ctx_uvar) =
  fun t  ->
    let uu____3626 = FStar_Syntax_Util.head_and_args t  in
    match uu____3626 with
    | (head1,_args) ->
        let uu____3663 =
          let uu____3664 = FStar_Syntax_Subst.compress head1  in
          uu____3664.FStar_Syntax_Syntax.n  in
        (match uu____3663 with
         | FStar_Syntax_Syntax.Tm_uvar (u,uu____3668) -> u
         | uu____3685 -> failwith "Not a flex-uvar")
  
let (destruct_flex_t :
  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
    worklist -> (flex_t,worklist) FStar_Pervasives_Native.tuple2)
  =
  fun t  ->
    fun wl  ->
      let uu____3708 = FStar_Syntax_Util.head_and_args t  in
      match uu____3708 with
      | (head1,args) ->
          let uu____3749 =
            let uu____3750 = FStar_Syntax_Subst.compress head1  in
            uu____3750.FStar_Syntax_Syntax.n  in
          (match uu____3749 with
           | FStar_Syntax_Syntax.Tm_uvar (uv,([],uu____3758)) ->
               ((t, uv, args), wl)
           | FStar_Syntax_Syntax.Tm_uvar (uv,s) ->
               let uu____3791 =
                 FStar_All.pipe_right uv.FStar_Syntax_Syntax.ctx_uvar_gamma
                   (FStar_List.partition
                      (fun uu___320_3816  ->
                         match uu___320_3816 with
                         | FStar_Syntax_Syntax.Binding_var x ->
                             let t_x = FStar_Syntax_Syntax.bv_to_name x  in
                             let t_x' = FStar_Syntax_Subst.subst' s t_x  in
                             let uu____3820 =
                               let uu____3821 =
                                 FStar_Syntax_Subst.compress t_x'  in
                               uu____3821.FStar_Syntax_Syntax.n  in
                             (match uu____3820 with
                              | FStar_Syntax_Syntax.Tm_name y ->
                                  FStar_Syntax_Syntax.bv_eq x y
                              | uu____3825 -> false)
                         | uu____3826 -> true))
                  in
               (match uu____3791 with
                | (new_gamma,dom_binders_rev) ->
                    let dom_binders =
                      let uu____3848 =
                        FStar_List.collect
                          (fun uu___321_3858  ->
                             match uu___321_3858 with
                             | FStar_Syntax_Syntax.Binding_var x ->
                                 let uu____3862 =
                                   FStar_Syntax_Syntax.mk_binder x  in
                                 [uu____3862]
                             | uu____3863 -> []) dom_binders_rev
                         in
                      FStar_All.pipe_right uu____3848 FStar_List.rev  in
                    let uu____3880 =
                      let uu____3887 =
                        let uu____3894 =
                          FStar_All.pipe_right new_gamma
                            (FStar_List.collect
                               (fun uu___322_3912  ->
                                  match uu___322_3912 with
                                  | FStar_Syntax_Syntax.Binding_var x ->
                                      let uu____3916 =
                                        FStar_Syntax_Syntax.mk_binder x  in
                                      [uu____3916]
                                  | uu____3917 -> []))
                           in
                        FStar_All.pipe_right uu____3894 FStar_List.rev  in
                      let uu____3934 =
                        let uu____3937 =
                          FStar_Syntax_Syntax.mk_Total
                            uv.FStar_Syntax_Syntax.ctx_uvar_typ
                           in
                        FStar_Syntax_Util.arrow dom_binders uu____3937  in
                      new_uvar
                        (Prims.strcat uv.FStar_Syntax_Syntax.ctx_uvar_reason
                           "; force delayed") wl t.FStar_Syntax_Syntax.pos
                        new_gamma uu____3887 uu____3934
                        uv.FStar_Syntax_Syntax.ctx_uvar_should_check
                       in
                    (match uu____3880 with
                     | (v1,t_v,wl1) ->
                         let args_sol =
                           FStar_List.map
                             (fun uu____3966  ->
                                match uu____3966 with
                                | (x,i) ->
                                    let uu____3977 =
                                      FStar_Syntax_Syntax.bv_to_name x  in
                                    (uu____3977, i)) dom_binders
                            in
                         let sol =
                           FStar_Syntax_Syntax.mk_Tm_app t_v args_sol
                             FStar_Pervasives_Native.None
                             t.FStar_Syntax_Syntax.pos
                            in
                         let args_sol_s =
                           FStar_List.map
                             (fun uu____4000  ->
                                match uu____4000 with
                                | (a,i) ->
                                    let uu____4011 =
                                      FStar_Syntax_Subst.subst' s a  in
                                    (uu____4011, i)) args_sol
                            in
                         let all_args = FStar_List.append args_sol_s args  in
                         let t1 =
                           FStar_Syntax_Syntax.mk_Tm_app t_v all_args
                             FStar_Pervasives_Native.None
                             t.FStar_Syntax_Syntax.pos
                            in
                         (FStar_Syntax_Unionfind.change
                            uv.FStar_Syntax_Syntax.ctx_uvar_head sol;
                          ((t1, v1, all_args), wl1))))
           | uu____4027 -> failwith "Not a flex-uvar")
  
let (u_abs :
  FStar_Syntax_Syntax.typ ->
    FStar_Syntax_Syntax.binders ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun k  ->
    fun ys  ->
      fun t  ->
        let uu____4047 =
          let uu____4068 =
            let uu____4069 = FStar_Syntax_Subst.compress k  in
            uu____4069.FStar_Syntax_Syntax.n  in
          match uu____4068 with
          | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
              if (FStar_List.length bs) = (FStar_List.length ys)
              then
                let uu____4138 = FStar_Syntax_Subst.open_comp bs c  in
                ((ys, t), uu____4138)
              else
                (let uu____4168 = FStar_Syntax_Util.abs_formals t  in
                 match uu____4168 with
                 | (ys',t1,uu____4199) ->
                     let uu____4204 = FStar_Syntax_Util.arrow_formals_comp k
                        in
                     (((FStar_List.append ys ys'), t1), uu____4204))
          | uu____4237 ->
              let uu____4238 =
                let uu____4243 = FStar_Syntax_Syntax.mk_Total k  in
                ([], uu____4243)  in
              ((ys, t), uu____4238)
           in
        match uu____4047 with
        | ((ys1,t1),(xs,c)) ->
            if (FStar_List.length xs) <> (FStar_List.length ys1)
            then
              FStar_Syntax_Util.abs ys1 t1
                (FStar_Pervasives_Native.Some
                   (FStar_Syntax_Util.mk_residual_comp
                      FStar_Parser_Const.effect_Tot_lid
                      FStar_Pervasives_Native.None []))
            else
              (let c1 =
                 let uu____4320 = FStar_Syntax_Util.rename_binders xs ys1  in
                 FStar_Syntax_Subst.subst_comp uu____4320 c  in
               FStar_Syntax_Util.abs ys1 t1
                 (FStar_Pervasives_Native.Some
                    (FStar_Syntax_Util.residual_comp_of_comp c1)))
  
let (solve_prob' :
  Prims.bool ->
    FStar_TypeChecker_Common.prob ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
        FStar_Pervasives_Native.option ->
        uvi Prims.list -> worklist -> worklist)
  =
  fun resolve_ok  ->
    fun prob  ->
      fun logical_guard  ->
        fun uvis  ->
          fun wl  ->
            def_check_prob "solve_prob'" prob;
            (let phi =
               match logical_guard with
               | FStar_Pervasives_Native.None  -> FStar_Syntax_Util.t_true
               | FStar_Pervasives_Native.Some phi -> phi  in
             let assign_solution xs uv phi1 =
               (let uu____4394 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug wl.tcenv)
                    (FStar_Options.Other "Rel")
                   in
                if uu____4394
                then
                  let uu____4395 = FStar_Util.string_of_int (p_pid prob)  in
                  let uu____4396 = print_ctx_uvar uv  in
                  let uu____4397 = FStar_Syntax_Print.term_to_string phi1  in
                  FStar_Util.print3 "Solving %s (%s) with formula %s\n"
                    uu____4395 uu____4396 uu____4397
                else ());
               (let phi2 =
                  FStar_Syntax_Util.abs xs phi1
                    (FStar_Pervasives_Native.Some
                       (FStar_Syntax_Util.residual_tot
                          FStar_Syntax_Util.ktype0))
                   in
                (let uu____4403 =
                   let uu____4404 = FStar_Util.string_of_int (p_pid prob)  in
                   Prims.strcat "solve_prob'.sol." uu____4404  in
                 let uu____4405 =
                   let uu____4408 = p_scope prob  in
                   FStar_All.pipe_left
                     (FStar_List.map FStar_Pervasives_Native.fst) uu____4408
                    in
                 FStar_TypeChecker_Env.def_check_closed_in (p_loc prob)
                   uu____4403 uu____4405 phi2);
                FStar_Syntax_Util.set_uvar
                  uv.FStar_Syntax_Syntax.ctx_uvar_head phi2)
                in
             let uv = p_guard_uvar prob  in
             let fail1 uu____4433 =
               let uu____4434 =
                 let uu____4435 = FStar_Syntax_Print.ctx_uvar_to_string uv
                    in
                 let uu____4436 =
                   FStar_Syntax_Print.term_to_string (p_guard prob)  in
                 FStar_Util.format2
                   "Impossible: this instance %s has already been assigned a solution\n%s\n"
                   uu____4435 uu____4436
                  in
               failwith uu____4434  in
             let args_as_binders args =
               FStar_All.pipe_right args
                 (FStar_List.collect
                    (fun uu____4486  ->
                       match uu____4486 with
                       | (a,i) ->
                           let uu____4499 =
                             let uu____4500 = FStar_Syntax_Subst.compress a
                                in
                             uu____4500.FStar_Syntax_Syntax.n  in
                           (match uu____4499 with
                            | FStar_Syntax_Syntax.Tm_name x -> [(x, i)]
                            | uu____4518 -> (fail1 (); []))))
                in
             let wl1 =
               let g = whnf wl.tcenv (p_guard prob)  in
               let uu____4526 =
                 let uu____4527 = is_flex g  in Prims.op_Negation uu____4527
                  in
               if uu____4526
               then (if resolve_ok then wl else (fail1 (); wl))
               else
                 (let uu____4531 = destruct_flex_t g wl  in
                  match uu____4531 with
                  | ((uu____4536,uv1,args),wl1) ->
                      ((let uu____4541 = args_as_binders args  in
                        assign_solution uu____4541 uv1 phi);
                       wl1))
                in
             commit uvis;
             (let uu___346_4543 = wl1  in
              {
                attempting = (uu___346_4543.attempting);
                wl_deferred = (uu___346_4543.wl_deferred);
                ctr = (wl1.ctr + (Prims.parse_int "1"));
                defer_ok = (uu___346_4543.defer_ok);
                smt_ok = (uu___346_4543.smt_ok);
                tcenv = (uu___346_4543.tcenv);
                wl_implicits = (uu___346_4543.wl_implicits)
              }))
  
let (extend_solution : Prims.int -> uvi Prims.list -> worklist -> worklist) =
  fun pid  ->
    fun sol  ->
      fun wl  ->
        (let uu____4564 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug wl.tcenv)
             (FStar_Options.Other "Rel")
            in
         if uu____4564
         then
           let uu____4565 = FStar_Util.string_of_int pid  in
           let uu____4566 =
             let uu____4567 = FStar_List.map (uvi_to_string wl.tcenv) sol  in
             FStar_All.pipe_right uu____4567 (FStar_String.concat ", ")  in
           FStar_Util.print2 "Solving %s: with [%s]\n" uu____4565 uu____4566
         else ());
        commit sol;
        (let uu___347_4574 = wl  in
         {
           attempting = (uu___347_4574.attempting);
           wl_deferred = (uu___347_4574.wl_deferred);
           ctr = (wl.ctr + (Prims.parse_int "1"));
           defer_ok = (uu___347_4574.defer_ok);
           smt_ok = (uu___347_4574.smt_ok);
           tcenv = (uu___347_4574.tcenv);
           wl_implicits = (uu___347_4574.wl_implicits)
         })
  
let (solve_prob :
  FStar_TypeChecker_Common.prob ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
      uvi Prims.list -> worklist -> worklist)
  =
  fun prob  ->
    fun logical_guard  ->
      fun uvis  ->
        fun wl  ->
          def_check_prob "solve_prob.prob" prob;
          FStar_Util.iter_opt logical_guard
            (def_check_scoped "solve_prob.guard" prob);
          (let conj_guard1 t g =
             match (t, g) with
             | (uu____4636,FStar_TypeChecker_Common.Trivial ) -> t
             | (FStar_Pervasives_Native.None
                ,FStar_TypeChecker_Common.NonTrivial f) ->
                 FStar_Pervasives_Native.Some f
             | (FStar_Pervasives_Native.Some
                t1,FStar_TypeChecker_Common.NonTrivial f) ->
                 let uu____4664 = FStar_Syntax_Util.mk_conj t1 f  in
                 FStar_Pervasives_Native.Some uu____4664
              in
           (let uu____4670 =
              FStar_All.pipe_left (FStar_TypeChecker_Env.debug wl.tcenv)
                (FStar_Options.Other "Rel")
               in
            if uu____4670
            then
              let uu____4671 =
                FStar_All.pipe_left FStar_Util.string_of_int (p_pid prob)  in
              let uu____4672 =
                let uu____4673 = FStar_List.map (uvi_to_string wl.tcenv) uvis
                   in
                FStar_All.pipe_right uu____4673 (FStar_String.concat ", ")
                 in
              FStar_Util.print2 "Solving %s: with %s\n" uu____4671 uu____4672
            else ());
           solve_prob' false prob logical_guard uvis wl)
  
let (occurs :
  FStar_Syntax_Syntax.ctx_uvar ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.ctx_uvar Prims.list,Prims.bool)
        FStar_Pervasives_Native.tuple2)
  =
  fun uk  ->
    fun t  ->
      let uvars1 =
        let uu____4698 = FStar_Syntax_Free.uvars t  in
        FStar_All.pipe_right uu____4698 FStar_Util.set_elements  in
      let occurs =
        FStar_All.pipe_right uvars1
          (FStar_Util.for_some
             (fun uv  ->
                FStar_Syntax_Unionfind.equiv
                  uv.FStar_Syntax_Syntax.ctx_uvar_head
                  uk.FStar_Syntax_Syntax.ctx_uvar_head))
         in
      (uvars1, occurs)
  
let (occurs_check :
  FStar_Syntax_Syntax.ctx_uvar ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.ctx_uvar Prims.list,Prims.bool,Prims.string
                                                            FStar_Pervasives_Native.option)
        FStar_Pervasives_Native.tuple3)
  =
  fun uk  ->
    fun t  ->
      let uu____4732 = occurs uk t  in
      match uu____4732 with
      | (uvars1,occurs1) ->
          let msg =
            if Prims.op_Negation occurs1
            then FStar_Pervasives_Native.None
            else
              (let uu____4761 =
                 let uu____4762 =
                   FStar_Syntax_Print.uvar_to_string
                     uk.FStar_Syntax_Syntax.ctx_uvar_head
                    in
                 let uu____4763 = FStar_Syntax_Print.term_to_string t  in
                 FStar_Util.format2 "occurs-check failed (%s occurs in %s)"
                   uu____4762 uu____4763
                  in
               FStar_Pervasives_Native.Some uu____4761)
             in
          (uvars1, (Prims.op_Negation occurs1), msg)
  
let rec (maximal_prefix :
  FStar_Syntax_Syntax.binders ->
    FStar_Syntax_Syntax.binders ->
      (FStar_Syntax_Syntax.binders,(FStar_Syntax_Syntax.binders,FStar_Syntax_Syntax.binders)
                                     FStar_Pervasives_Native.tuple2)
        FStar_Pervasives_Native.tuple2)
  =
  fun bs  ->
    fun bs'  ->
      match (bs, bs') with
      | ((b,i)::bs_tail,(b',i')::bs'_tail) ->
          if FStar_Syntax_Syntax.bv_eq b b'
          then
            let uu____4852 = maximal_prefix bs_tail bs'_tail  in
            (match uu____4852 with | (pfx,rest) -> (((b, i) :: pfx), rest))
          else ([], (bs, bs'))
      | uu____4896 -> ([], (bs, bs'))
  
let (extend_gamma :
  FStar_Syntax_Syntax.gamma ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binding Prims.list)
  =
  fun g  ->
    fun bs  ->
      FStar_List.fold_left
        (fun g1  ->
           fun uu____4944  ->
             match uu____4944 with
             | (x,uu____4954) -> (FStar_Syntax_Syntax.Binding_var x) :: g1) g
        bs
  
let (gamma_until :
  FStar_Syntax_Syntax.gamma ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binding Prims.list)
  =
  fun g  ->
    fun bs  ->
      let uu____4967 = FStar_List.last bs  in
      match uu____4967 with
      | FStar_Pervasives_Native.None  -> []
      | FStar_Pervasives_Native.Some (x,uu____4985) ->
          let uu____4990 =
            FStar_Util.prefix_until
              (fun uu___323_5005  ->
                 match uu___323_5005 with
                 | FStar_Syntax_Syntax.Binding_var x' ->
                     FStar_Syntax_Syntax.bv_eq x x'
                 | uu____5007 -> false) g
             in
          (match uu____4990 with
           | FStar_Pervasives_Native.None  -> []
           | FStar_Pervasives_Native.Some (uu____5020,bx,rest) -> bx :: rest)
  
let (restrict_ctx :
  FStar_Syntax_Syntax.ctx_uvar ->
    FStar_Syntax_Syntax.ctx_uvar -> worklist -> worklist)
  =
  fun tgt  ->
    fun src  ->
      fun wl  ->
        let uu____5056 =
          maximal_prefix tgt.FStar_Syntax_Syntax.ctx_uvar_binders
            src.FStar_Syntax_Syntax.ctx_uvar_binders
           in
        match uu____5056 with
        | (pfx,uu____5066) ->
            let g = gamma_until src.FStar_Syntax_Syntax.ctx_uvar_gamma pfx
               in
            let uu____5078 =
              new_uvar src.FStar_Syntax_Syntax.ctx_uvar_reason wl
                src.FStar_Syntax_Syntax.ctx_uvar_range g pfx
                src.FStar_Syntax_Syntax.ctx_uvar_typ
                src.FStar_Syntax_Syntax.ctx_uvar_should_check
               in
            (match uu____5078 with
             | (uu____5085,src',wl1) ->
                 (FStar_Syntax_Unionfind.change
                    src.FStar_Syntax_Syntax.ctx_uvar_head src';
                  wl1))
  
let (restrict_all_uvars :
  FStar_Syntax_Syntax.ctx_uvar ->
    FStar_Syntax_Syntax.ctx_uvar Prims.list -> worklist -> worklist)
  =
  fun tgt  ->
    fun sources  ->
      fun wl  -> FStar_List.fold_right (restrict_ctx tgt) sources wl
  
let (intersect_binders :
  FStar_Syntax_Syntax.gamma ->
    FStar_Syntax_Syntax.binders ->
      FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders)
  =
  fun g  ->
    fun v1  ->
      fun v2  ->
        let as_set1 v3 =
          FStar_All.pipe_right v3
            (FStar_List.fold_left
               (fun out  ->
                  fun x  ->
                    FStar_Util.set_add (FStar_Pervasives_Native.fst x) out)
               FStar_Syntax_Syntax.no_names)
           in
        let v1_set = as_set1 v1  in
        let ctx_binders =
          FStar_List.fold_left
            (fun out  ->
               fun b  ->
                 match b with
                 | FStar_Syntax_Syntax.Binding_var x ->
                     FStar_Util.set_add x out
                 | uu____5185 -> out) FStar_Syntax_Syntax.no_names g
           in
        let uu____5186 =
          FStar_All.pipe_right v2
            (FStar_List.fold_left
               (fun uu____5240  ->
                  fun uu____5241  ->
                    match (uu____5240, uu____5241) with
                    | ((isect,isect_set),(x,imp)) ->
                        let uu____5322 =
                          let uu____5323 = FStar_Util.set_mem x v1_set  in
                          FStar_All.pipe_left Prims.op_Negation uu____5323
                           in
                        if uu____5322
                        then (isect, isect_set)
                        else
                          (let fvs =
                             FStar_Syntax_Free.names
                               x.FStar_Syntax_Syntax.sort
                              in
                           let uu____5348 =
                             FStar_Util.set_is_subset_of fvs isect_set  in
                           if uu____5348
                           then
                             let uu____5361 = FStar_Util.set_add x isect_set
                                in
                             (((x, imp) :: isect), uu____5361)
                           else (isect, isect_set))) ([], ctx_binders))
           in
        match uu____5186 with | (isect,uu____5398) -> FStar_List.rev isect
  
let binders_eq :
  'Auu____5427 'Auu____5428 .
    (FStar_Syntax_Syntax.bv,'Auu____5427) FStar_Pervasives_Native.tuple2
      Prims.list ->
      (FStar_Syntax_Syntax.bv,'Auu____5428) FStar_Pervasives_Native.tuple2
        Prims.list -> Prims.bool
  =
  fun v1  ->
    fun v2  ->
      ((FStar_List.length v1) = (FStar_List.length v2)) &&
        (FStar_List.forall2
           (fun uu____5485  ->
              fun uu____5486  ->
                match (uu____5485, uu____5486) with
                | ((a,uu____5504),(b,uu____5506)) ->
                    FStar_Syntax_Syntax.bv_eq a b) v1 v2)
  
let name_exists_in_binders :
  'Auu____5521 .
    FStar_Syntax_Syntax.bv ->
      (FStar_Syntax_Syntax.bv,'Auu____5521) FStar_Pervasives_Native.tuple2
        Prims.list -> Prims.bool
  =
  fun x  ->
    fun bs  ->
      FStar_Util.for_some
        (fun uu____5551  ->
           match uu____5551 with
           | (y,uu____5557) -> FStar_Syntax_Syntax.bv_eq x y) bs
  
let pat_vars :
  'Auu____5566 .
    FStar_TypeChecker_Env.env ->
      (FStar_Syntax_Syntax.bv,'Auu____5566) FStar_Pervasives_Native.tuple2
        Prims.list ->
        (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.aqual)
          FStar_Pervasives_Native.tuple2 Prims.list ->
          FStar_Syntax_Syntax.binders FStar_Pervasives_Native.option
  =
  fun env  ->
    fun ctx  ->
      fun args  ->
        let rec aux seen args1 =
          match args1 with
          | [] -> FStar_Pervasives_Native.Some (FStar_List.rev seen)
          | (arg,i)::args2 ->
              let hd1 = sn env arg  in
              (match hd1.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_name a ->
                   let uu____5696 =
                     (name_exists_in_binders a seen) ||
                       (name_exists_in_binders a ctx)
                      in
                   if uu____5696
                   then FStar_Pervasives_Native.None
                   else aux ((a, i) :: seen) args2
               | uu____5716 -> FStar_Pervasives_Native.None)
           in
        aux [] args
  
type match_result =
  | MisMatch of
  (FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option,FStar_Syntax_Syntax.delta_depth
                                                                    FStar_Pervasives_Native.option)
  FStar_Pervasives_Native.tuple2 
  | HeadMatch of Prims.bool 
  | FullMatch 
let (uu___is_MisMatch : match_result -> Prims.bool) =
  fun projectee  ->
    match projectee with | MisMatch _0 -> true | uu____5759 -> false
  
let (__proj__MisMatch__item___0 :
  match_result ->
    (FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option,FStar_Syntax_Syntax.delta_depth
                                                                    FStar_Pervasives_Native.option)
      FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | MisMatch _0 -> _0 
let (uu___is_HeadMatch : match_result -> Prims.bool) =
  fun projectee  ->
    match projectee with | HeadMatch _0 -> true | uu____5797 -> false
  
let (__proj__HeadMatch__item___0 : match_result -> Prims.bool) =
  fun projectee  -> match projectee with | HeadMatch _0 -> _0 
let (uu___is_FullMatch : match_result -> Prims.bool) =
  fun projectee  ->
    match projectee with | FullMatch  -> true | uu____5810 -> false
  
let string_of_option :
  'Auu____5817 .
    ('Auu____5817 -> Prims.string) ->
      'Auu____5817 FStar_Pervasives_Native.option -> Prims.string
  =
  fun f  ->
    fun uu___324_5832  ->
      match uu___324_5832 with
      | FStar_Pervasives_Native.None  -> "None"
      | FStar_Pervasives_Native.Some x ->
          let uu____5838 = f x  in Prims.strcat "Some " uu____5838
  
let (string_of_match_result : match_result -> Prims.string) =
  fun uu___325_5843  ->
    match uu___325_5843 with
    | MisMatch (d1,d2) ->
        let uu____5854 =
          let uu____5855 =
            string_of_option FStar_Syntax_Print.delta_depth_to_string d1  in
          let uu____5856 =
            let uu____5857 =
              let uu____5858 =
                string_of_option FStar_Syntax_Print.delta_depth_to_string d2
                 in
              Prims.strcat uu____5858 ")"  in
            Prims.strcat ") (" uu____5857  in
          Prims.strcat uu____5855 uu____5856  in
        Prims.strcat "MisMatch (" uu____5854
    | HeadMatch u ->
        let uu____5860 = FStar_Util.string_of_bool u  in
        Prims.strcat "HeadMatch " uu____5860
    | FullMatch  -> "FullMatch"
  
let (head_match : match_result -> match_result) =
  fun uu___326_5865  ->
    match uu___326_5865 with
    | MisMatch (i,j) -> MisMatch (i, j)
    | HeadMatch (true ) -> HeadMatch true
    | uu____5880 -> HeadMatch false
  
let (fv_delta_depth :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.delta_depth)
  =
  fun env  ->
    fun fv  ->
      match fv.FStar_Syntax_Syntax.fv_delta with
      | FStar_Syntax_Syntax.Delta_abstract d ->
          if
            ((env.FStar_TypeChecker_Env.curmodule).FStar_Ident.str =
               ((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v).FStar_Ident.nsstr)
              && (Prims.op_Negation env.FStar_TypeChecker_Env.is_iface)
          then d
          else FStar_Syntax_Syntax.delta_constant
      | FStar_Syntax_Syntax.Delta_constant_at_level i when
          i > (Prims.parse_int "0") ->
          let uu____5894 =
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Unfold
                 FStar_Syntax_Syntax.delta_constant] env
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          (match uu____5894 with
           | FStar_Pervasives_Native.None  ->
               FStar_Syntax_Syntax.delta_constant
           | uu____5905 -> fv.FStar_Syntax_Syntax.fv_delta)
      | d -> d
  
let rec (delta_depth_of_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun t  ->
      let t1 = FStar_Syntax_Util.unmeta t  in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_meta uu____5928 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_delayed uu____5937 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_lazy i ->
          let uu____5963 = FStar_Syntax_Util.unfold_lazy i  in
          delta_depth_of_term env uu____5963
      | FStar_Syntax_Syntax.Tm_unknown  -> FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_bvar uu____5964 ->
          FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_name uu____5965 ->
          FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_uvar uu____5966 ->
          FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_let uu____5979 -> FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_match uu____5992 ->
          FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_uinst (t2,uu____6016) ->
          delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____6022,uu____6023) ->
          delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_app (t2,uu____6065) ->
          delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_refine
          ({ FStar_Syntax_Syntax.ppname = uu____6086;
             FStar_Syntax_Syntax.index = uu____6087;
             FStar_Syntax_Syntax.sort = t2;_},uu____6089)
          -> delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_constant uu____6096 ->
          FStar_Pervasives_Native.Some FStar_Syntax_Syntax.delta_constant
      | FStar_Syntax_Syntax.Tm_type uu____6097 ->
          FStar_Pervasives_Native.Some FStar_Syntax_Syntax.delta_constant
      | FStar_Syntax_Syntax.Tm_arrow uu____6098 ->
          FStar_Pervasives_Native.Some FStar_Syntax_Syntax.delta_constant
      | FStar_Syntax_Syntax.Tm_quoted uu____6111 ->
          FStar_Pervasives_Native.Some FStar_Syntax_Syntax.delta_constant
      | FStar_Syntax_Syntax.Tm_abs uu____6118 ->
          FStar_Pervasives_Native.Some FStar_Syntax_Syntax.delta_constant
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____6136 = fv_delta_depth env fv  in
          FStar_Pervasives_Native.Some uu____6136
  
let rec (head_matches :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term -> match_result)
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        let t11 = FStar_Syntax_Util.unmeta t1  in
        let t21 = FStar_Syntax_Util.unmeta t2  in
        match ((t11.FStar_Syntax_Syntax.n), (t21.FStar_Syntax_Syntax.n)) with
        | (FStar_Syntax_Syntax.Tm_name x,FStar_Syntax_Syntax.Tm_name y) ->
            if FStar_Syntax_Syntax.bv_eq x y
            then FullMatch
            else
              MisMatch
                (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None)
        | (FStar_Syntax_Syntax.Tm_fvar f,FStar_Syntax_Syntax.Tm_fvar g) ->
            let uu____6163 = FStar_Syntax_Syntax.fv_eq f g  in
            if uu____6163
            then FullMatch
            else
              (let uu____6165 =
                 let uu____6174 =
                   let uu____6177 = fv_delta_depth env f  in
                   FStar_Pervasives_Native.Some uu____6177  in
                 let uu____6178 =
                   let uu____6181 = fv_delta_depth env g  in
                   FStar_Pervasives_Native.Some uu____6181  in
                 (uu____6174, uu____6178)  in
               MisMatch uu____6165)
        | (FStar_Syntax_Syntax.Tm_uinst
           (f,uu____6187),FStar_Syntax_Syntax.Tm_uinst (g,uu____6189)) ->
            let uu____6198 = head_matches env f g  in
            FStar_All.pipe_right uu____6198 head_match
        | (FStar_Syntax_Syntax.Tm_constant c,FStar_Syntax_Syntax.Tm_constant
           d) ->
            let uu____6201 = FStar_Const.eq_const c d  in
            if uu____6201
            then FullMatch
            else
              MisMatch
                (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None)
        | (FStar_Syntax_Syntax.Tm_uvar
           (uv,uu____6208),FStar_Syntax_Syntax.Tm_uvar (uv',uu____6210)) ->
            let uu____6243 =
              FStar_Syntax_Unionfind.equiv
                uv.FStar_Syntax_Syntax.ctx_uvar_head
                uv'.FStar_Syntax_Syntax.ctx_uvar_head
               in
            if uu____6243
            then FullMatch
            else
              MisMatch
                (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None)
        | (FStar_Syntax_Syntax.Tm_refine
           (x,uu____6250),FStar_Syntax_Syntax.Tm_refine (y,uu____6252)) ->
            let uu____6261 =
              head_matches env x.FStar_Syntax_Syntax.sort
                y.FStar_Syntax_Syntax.sort
               in
            FStar_All.pipe_right uu____6261 head_match
        | (FStar_Syntax_Syntax.Tm_refine (x,uu____6263),uu____6264) ->
            let uu____6269 = head_matches env x.FStar_Syntax_Syntax.sort t21
               in
            FStar_All.pipe_right uu____6269 head_match
        | (uu____6270,FStar_Syntax_Syntax.Tm_refine (x,uu____6272)) ->
            let uu____6277 = head_matches env t11 x.FStar_Syntax_Syntax.sort
               in
            FStar_All.pipe_right uu____6277 head_match
        | (FStar_Syntax_Syntax.Tm_type uu____6278,FStar_Syntax_Syntax.Tm_type
           uu____6279) -> HeadMatch false
        | (FStar_Syntax_Syntax.Tm_arrow
           uu____6280,FStar_Syntax_Syntax.Tm_arrow uu____6281) ->
            HeadMatch false
        | (FStar_Syntax_Syntax.Tm_app
           (head1,uu____6307),FStar_Syntax_Syntax.Tm_app (head',uu____6309))
            ->
            let uu____6350 = head_matches env head1 head'  in
            FStar_All.pipe_right uu____6350 head_match
        | (FStar_Syntax_Syntax.Tm_app (head1,uu____6352),uu____6353) ->
            let uu____6374 = head_matches env head1 t21  in
            FStar_All.pipe_right uu____6374 head_match
        | (uu____6375,FStar_Syntax_Syntax.Tm_app (head1,uu____6377)) ->
            let uu____6398 = head_matches env t11 head1  in
            FStar_All.pipe_right uu____6398 head_match
        | (FStar_Syntax_Syntax.Tm_let uu____6399,FStar_Syntax_Syntax.Tm_let
           uu____6400) -> HeadMatch true
        | (FStar_Syntax_Syntax.Tm_match
           uu____6425,FStar_Syntax_Syntax.Tm_match uu____6426) ->
            HeadMatch true
        | uu____6471 ->
            let uu____6476 =
              let uu____6485 = delta_depth_of_term env t11  in
              let uu____6488 = delta_depth_of_term env t21  in
              (uu____6485, uu____6488)  in
            MisMatch uu____6476
  
let (head_matches_delta :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        (match_result,(FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.typ)
                        FStar_Pervasives_Native.tuple2
                        FStar_Pervasives_Native.option)
          FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        let maybe_inline t =
          let head1 = FStar_Syntax_Util.head_of t  in
          (let uu____6548 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "RelDelta")
              in
           if uu____6548
           then
             let uu____6549 = FStar_Syntax_Print.term_to_string t  in
             let uu____6550 = FStar_Syntax_Print.term_to_string head1  in
             FStar_Util.print2 "Head of %s is %s\n" uu____6549 uu____6550
           else ());
          (let uu____6552 =
             let uu____6553 = FStar_Syntax_Util.un_uinst head1  in
             uu____6553.FStar_Syntax_Syntax.n  in
           match uu____6552 with
           | FStar_Syntax_Syntax.Tm_fvar fv ->
               let uu____6559 =
                 FStar_TypeChecker_Env.lookup_definition
                   [FStar_TypeChecker_Env.Unfold
                      FStar_Syntax_Syntax.delta_constant;
                   FStar_TypeChecker_Env.Eager_unfolding_only] env
                   (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                  in
               (match uu____6559 with
                | FStar_Pervasives_Native.None  ->
                    ((let uu____6573 =
                        FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                          (FStar_Options.Other "RelDelta")
                         in
                      if uu____6573
                      then
                        let uu____6574 =
                          FStar_Syntax_Print.term_to_string head1  in
                        FStar_Util.print1 "No definition found for %s\n"
                          uu____6574
                      else ());
                     FStar_Pervasives_Native.None)
                | FStar_Pervasives_Native.Some uu____6576 ->
                    let t' =
                      FStar_TypeChecker_Normalize.normalize
                        [FStar_TypeChecker_Normalize.UnfoldUntil
                           FStar_Syntax_Syntax.delta_constant;
                        FStar_TypeChecker_Normalize.Weak;
                        FStar_TypeChecker_Normalize.HNF;
                        FStar_TypeChecker_Normalize.Primops;
                        FStar_TypeChecker_Normalize.Beta;
                        FStar_TypeChecker_Normalize.Eager_unfolding;
                        FStar_TypeChecker_Normalize.Iota] env t
                       in
                    ((let uu____6587 =
                        FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                          (FStar_Options.Other "RelDelta")
                         in
                      if uu____6587
                      then
                        let uu____6588 = FStar_Syntax_Print.term_to_string t
                           in
                        let uu____6589 = FStar_Syntax_Print.term_to_string t'
                           in
                        FStar_Util.print2 "Inlined %s to %s\n" uu____6588
                          uu____6589
                      else ());
                     FStar_Pervasives_Native.Some t'))
           | uu____6591 -> FStar_Pervasives_Native.None)
           in
        let success d r t11 t21 =
          (r,
            (if d > (Prims.parse_int "0")
             then FStar_Pervasives_Native.Some (t11, t21)
             else FStar_Pervasives_Native.None))
           in
        let fail1 d r t11 t21 =
          (r,
            (if d > (Prims.parse_int "0")
             then FStar_Pervasives_Native.Some (t11, t21)
             else FStar_Pervasives_Native.None))
           in
        let rec aux retry n_delta t11 t21 =
          let r = head_matches env t11 t21  in
          (let uu____6729 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "RelDelta")
              in
           if uu____6729
           then
             let uu____6730 = FStar_Syntax_Print.term_to_string t11  in
             let uu____6731 = FStar_Syntax_Print.term_to_string t21  in
             let uu____6732 = string_of_match_result r  in
             FStar_Util.print3 "head_matches (%s, %s) = %s\n" uu____6730
               uu____6731 uu____6732
           else ());
          (let reduce_one_and_try_again d1 d2 =
             let d1_greater_than_d2 =
               FStar_TypeChecker_Common.delta_depth_greater_than d1 d2  in
             let uu____6756 =
               if d1_greater_than_d2
               then
                 let t1' =
                   normalize_refinement
                     [FStar_TypeChecker_Normalize.UnfoldUntil d2;
                     FStar_TypeChecker_Normalize.Weak;
                     FStar_TypeChecker_Normalize.HNF] env t11
                    in
                 (t1', t21)
               else
                 (let t2' =
                    normalize_refinement
                      [FStar_TypeChecker_Normalize.UnfoldUntil d1;
                      FStar_TypeChecker_Normalize.Weak;
                      FStar_TypeChecker_Normalize.HNF] env t21
                     in
                  (t11, t2'))
                in
             match uu____6756 with
             | (t12,t22) ->
                 aux retry (n_delta + (Prims.parse_int "1")) t12 t22
              in
           let reduce_both_and_try_again d r1 =
             let uu____6801 = FStar_TypeChecker_Common.decr_delta_depth d  in
             match uu____6801 with
             | FStar_Pervasives_Native.None  -> fail1 n_delta r1 t11 t21
             | FStar_Pervasives_Native.Some d1 ->
                 let t12 =
                   normalize_refinement
                     [FStar_TypeChecker_Normalize.UnfoldUntil d1;
                     FStar_TypeChecker_Normalize.Weak;
                     FStar_TypeChecker_Normalize.HNF] env t11
                    in
                 let t22 =
                   normalize_refinement
                     [FStar_TypeChecker_Normalize.UnfoldUntil d1;
                     FStar_TypeChecker_Normalize.Weak;
                     FStar_TypeChecker_Normalize.HNF] env t21
                    in
                 aux retry (n_delta + (Prims.parse_int "1")) t12 t22
              in
           match r with
           | MisMatch
               (FStar_Pervasives_Native.Some
                (FStar_Syntax_Syntax.Delta_equational_at_level
                i),FStar_Pervasives_Native.Some
                (FStar_Syntax_Syntax.Delta_equational_at_level j))
               when
               ((i > (Prims.parse_int "0")) || (j > (Prims.parse_int "0")))
                 && (i <> j)
               ->
               reduce_one_and_try_again
                 (FStar_Syntax_Syntax.Delta_equational_at_level i)
                 (FStar_Syntax_Syntax.Delta_equational_at_level j)
           | MisMatch
               (FStar_Pervasives_Native.Some
                (FStar_Syntax_Syntax.Delta_equational_at_level
                uu____6833),uu____6834)
               ->
               if Prims.op_Negation retry
               then fail1 n_delta r t11 t21
               else
                 (let uu____6852 =
                    let uu____6861 = maybe_inline t11  in
                    let uu____6864 = maybe_inline t21  in
                    (uu____6861, uu____6864)  in
                  match uu____6852 with
                  | (FStar_Pervasives_Native.None
                     ,FStar_Pervasives_Native.None ) ->
                      fail1 n_delta r t11 t21
                  | (FStar_Pervasives_Native.Some
                     t12,FStar_Pervasives_Native.None ) ->
                      aux false (n_delta + (Prims.parse_int "1")) t12 t21
                  | (FStar_Pervasives_Native.None
                     ,FStar_Pervasives_Native.Some t22) ->
                      aux false (n_delta + (Prims.parse_int "1")) t11 t22
                  | (FStar_Pervasives_Native.Some
                     t12,FStar_Pervasives_Native.Some t22) ->
                      aux false (n_delta + (Prims.parse_int "1")) t12 t22)
           | MisMatch
               (uu____6901,FStar_Pervasives_Native.Some
                (FStar_Syntax_Syntax.Delta_equational_at_level uu____6902))
               ->
               if Prims.op_Negation retry
               then fail1 n_delta r t11 t21
               else
                 (let uu____6920 =
                    let uu____6929 = maybe_inline t11  in
                    let uu____6932 = maybe_inline t21  in
                    (uu____6929, uu____6932)  in
                  match uu____6920 with
                  | (FStar_Pervasives_Native.None
                     ,FStar_Pervasives_Native.None ) ->
                      fail1 n_delta r t11 t21
                  | (FStar_Pervasives_Native.Some
                     t12,FStar_Pervasives_Native.None ) ->
                      aux false (n_delta + (Prims.parse_int "1")) t12 t21
                  | (FStar_Pervasives_Native.None
                     ,FStar_Pervasives_Native.Some t22) ->
                      aux false (n_delta + (Prims.parse_int "1")) t11 t22
                  | (FStar_Pervasives_Native.Some
                     t12,FStar_Pervasives_Native.Some t22) ->
                      aux false (n_delta + (Prims.parse_int "1")) t12 t22)
           | MisMatch
               (FStar_Pervasives_Native.Some d1,FStar_Pervasives_Native.Some
                d2)
               when d1 = d2 -> reduce_both_and_try_again d1 r
           | MisMatch
               (FStar_Pervasives_Native.Some d1,FStar_Pervasives_Native.Some
                d2)
               -> reduce_one_and_try_again d1 d2
           | MisMatch uu____6981 -> fail1 n_delta r t11 t21
           | uu____6990 -> success n_delta r t11 t21)
           in
        let r = aux true (Prims.parse_int "0") t1 t2  in
        (let uu____7003 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "RelDelta")
            in
         if uu____7003
         then
           let uu____7004 = FStar_Syntax_Print.term_to_string t1  in
           let uu____7005 = FStar_Syntax_Print.term_to_string t2  in
           let uu____7006 =
             string_of_match_result (FStar_Pervasives_Native.fst r)  in
           let uu____7013 =
             if
               (FStar_Pervasives_Native.snd r) = FStar_Pervasives_Native.None
             then "None"
             else
               (let uu____7031 =
                  FStar_All.pipe_right (FStar_Pervasives_Native.snd r)
                    FStar_Util.must
                   in
                FStar_All.pipe_right uu____7031
                  (fun uu____7065  ->
                     match uu____7065 with
                     | (t11,t21) ->
                         let uu____7072 =
                           FStar_Syntax_Print.term_to_string t11  in
                         let uu____7073 =
                           let uu____7074 =
                             FStar_Syntax_Print.term_to_string t21  in
                           Prims.strcat "; " uu____7074  in
                         Prims.strcat uu____7072 uu____7073))
              in
           FStar_Util.print4 "head_matches_delta (%s, %s) = %s (%s)\n"
             uu____7004 uu____7005 uu____7006 uu____7013
         else ());
        r
  
let (kind_type :
  FStar_Syntax_Syntax.binders -> FStar_Range.range -> FStar_Syntax_Syntax.typ)
  =
  fun binders  ->
    fun r  ->
      let uu____7086 = FStar_Syntax_Util.type_u ()  in
      FStar_All.pipe_right uu____7086 FStar_Pervasives_Native.fst
  
let (rank_t_num : FStar_TypeChecker_Common.rank_t -> Prims.int) =
  fun uu___327_7099  ->
    match uu___327_7099 with
    | FStar_TypeChecker_Common.Rigid_rigid  -> (Prims.parse_int "0")
    | FStar_TypeChecker_Common.Flex_rigid_eq  -> (Prims.parse_int "1")
    | FStar_TypeChecker_Common.Flex_flex_pattern_eq  -> (Prims.parse_int "2")
    | FStar_TypeChecker_Common.Flex_rigid  -> (Prims.parse_int "3")
    | FStar_TypeChecker_Common.Rigid_flex  -> (Prims.parse_int "4")
    | FStar_TypeChecker_Common.Flex_flex  -> (Prims.parse_int "5")
  
let (rank_leq :
  FStar_TypeChecker_Common.rank_t ->
    FStar_TypeChecker_Common.rank_t -> Prims.bool)
  = fun r1  -> fun r2  -> (rank_t_num r1) <= (rank_t_num r2) 
let (rank_less_than :
  FStar_TypeChecker_Common.rank_t ->
    FStar_TypeChecker_Common.rank_t -> Prims.bool)
  = fun r1  -> fun r2  -> (r1 <> r2) && ((rank_t_num r1) <= (rank_t_num r2)) 
let (compress_tprob :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term FStar_TypeChecker_Common.problem ->
      FStar_Syntax_Syntax.term FStar_TypeChecker_Common.problem)
  =
  fun tcenv  ->
    fun p  ->
      let uu___348_7136 = p  in
      let uu____7139 = whnf tcenv p.FStar_TypeChecker_Common.lhs  in
      let uu____7140 = whnf tcenv p.FStar_TypeChecker_Common.rhs  in
      {
        FStar_TypeChecker_Common.pid =
          (uu___348_7136.FStar_TypeChecker_Common.pid);
        FStar_TypeChecker_Common.lhs = uu____7139;
        FStar_TypeChecker_Common.relation =
          (uu___348_7136.FStar_TypeChecker_Common.relation);
        FStar_TypeChecker_Common.rhs = uu____7140;
        FStar_TypeChecker_Common.element =
          (uu___348_7136.FStar_TypeChecker_Common.element);
        FStar_TypeChecker_Common.logical_guard =
          (uu___348_7136.FStar_TypeChecker_Common.logical_guard);
        FStar_TypeChecker_Common.logical_guard_uvar =
          (uu___348_7136.FStar_TypeChecker_Common.logical_guard_uvar);
        FStar_TypeChecker_Common.reason =
          (uu___348_7136.FStar_TypeChecker_Common.reason);
        FStar_TypeChecker_Common.loc =
          (uu___348_7136.FStar_TypeChecker_Common.loc);
        FStar_TypeChecker_Common.rank =
          (uu___348_7136.FStar_TypeChecker_Common.rank)
      }
  
let (compress_prob :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.prob)
  =
  fun tcenv  ->
    fun p  ->
      match p with
      | FStar_TypeChecker_Common.TProb p1 ->
          let uu____7154 = compress_tprob tcenv p1  in
          FStar_All.pipe_right uu____7154
            (fun _0_20  -> FStar_TypeChecker_Common.TProb _0_20)
      | FStar_TypeChecker_Common.CProb uu____7159 -> p
  
let (rank :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob ->
      (FStar_TypeChecker_Common.rank_t,FStar_TypeChecker_Common.prob)
        FStar_Pervasives_Native.tuple2)
  =
  fun tcenv  ->
    fun pr  ->
      let prob =
        let uu____7181 = compress_prob tcenv pr  in
        FStar_All.pipe_right uu____7181 maybe_invert_p  in
      match prob with
      | FStar_TypeChecker_Common.TProb tp ->
          let uu____7189 =
            FStar_Syntax_Util.head_and_args tp.FStar_TypeChecker_Common.lhs
             in
          (match uu____7189 with
           | (lh,lhs_args) ->
               let uu____7230 =
                 FStar_Syntax_Util.head_and_args
                   tp.FStar_TypeChecker_Common.rhs
                  in
               (match uu____7230 with
                | (rh,rhs_args) ->
                    let uu____7271 =
                      match ((lh.FStar_Syntax_Syntax.n),
                              (rh.FStar_Syntax_Syntax.n))
                      with
                      | (FStar_Syntax_Syntax.Tm_uvar
                         uu____7284,FStar_Syntax_Syntax.Tm_uvar uu____7285)
                          ->
                          (match (lhs_args, rhs_args) with
                           | ([],[]) when
                               tp.FStar_TypeChecker_Common.relation =
                                 FStar_TypeChecker_Common.EQ
                               ->
                               (FStar_TypeChecker_Common.Flex_flex_pattern_eq,
                                 tp)
                           | uu____7362 ->
                               (FStar_TypeChecker_Common.Flex_flex, tp))
                      | (FStar_Syntax_Syntax.Tm_uvar uu____7385,uu____7386)
                          when
                          tp.FStar_TypeChecker_Common.relation =
                            FStar_TypeChecker_Common.EQ
                          -> (FStar_TypeChecker_Common.Flex_rigid_eq, tp)
                      | (uu____7401,FStar_Syntax_Syntax.Tm_uvar uu____7402)
                          when
                          tp.FStar_TypeChecker_Common.relation =
                            FStar_TypeChecker_Common.EQ
                          -> (FStar_TypeChecker_Common.Flex_rigid_eq, tp)
                      | (FStar_Syntax_Syntax.Tm_uvar
                         uu____7417,FStar_Syntax_Syntax.Tm_arrow uu____7418)
                          ->
                          (FStar_TypeChecker_Common.Flex_rigid_eq,
                            (let uu___349_7446 = tp  in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___349_7446.FStar_TypeChecker_Common.pid);
                               FStar_TypeChecker_Common.lhs =
                                 (uu___349_7446.FStar_TypeChecker_Common.lhs);
                               FStar_TypeChecker_Common.relation =
                                 FStar_TypeChecker_Common.EQ;
                               FStar_TypeChecker_Common.rhs =
                                 (uu___349_7446.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___349_7446.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___349_7446.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.logical_guard_uvar =
                                 (uu___349_7446.FStar_TypeChecker_Common.logical_guard_uvar);
                               FStar_TypeChecker_Common.reason =
                                 (uu___349_7446.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___349_7446.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___349_7446.FStar_TypeChecker_Common.rank)
                             }))
                      | (FStar_Syntax_Syntax.Tm_uvar
                         uu____7449,FStar_Syntax_Syntax.Tm_type uu____7450)
                          ->
                          (FStar_TypeChecker_Common.Flex_rigid_eq,
                            (let uu___349_7466 = tp  in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___349_7466.FStar_TypeChecker_Common.pid);
                               FStar_TypeChecker_Common.lhs =
                                 (uu___349_7466.FStar_TypeChecker_Common.lhs);
                               FStar_TypeChecker_Common.relation =
                                 FStar_TypeChecker_Common.EQ;
                               FStar_TypeChecker_Common.rhs =
                                 (uu___349_7466.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___349_7466.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___349_7466.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.logical_guard_uvar =
                                 (uu___349_7466.FStar_TypeChecker_Common.logical_guard_uvar);
                               FStar_TypeChecker_Common.reason =
                                 (uu___349_7466.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___349_7466.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___349_7466.FStar_TypeChecker_Common.rank)
                             }))
                      | (FStar_Syntax_Syntax.Tm_type
                         uu____7469,FStar_Syntax_Syntax.Tm_uvar uu____7470)
                          ->
                          (FStar_TypeChecker_Common.Flex_rigid_eq,
                            (let uu___349_7486 = tp  in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___349_7486.FStar_TypeChecker_Common.pid);
                               FStar_TypeChecker_Common.lhs =
                                 (uu___349_7486.FStar_TypeChecker_Common.lhs);
                               FStar_TypeChecker_Common.relation =
                                 FStar_TypeChecker_Common.EQ;
                               FStar_TypeChecker_Common.rhs =
                                 (uu___349_7486.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___349_7486.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___349_7486.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.logical_guard_uvar =
                                 (uu___349_7486.FStar_TypeChecker_Common.logical_guard_uvar);
                               FStar_TypeChecker_Common.reason =
                                 (uu___349_7486.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___349_7486.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___349_7486.FStar_TypeChecker_Common.rank)
                             }))
                      | (uu____7489,FStar_Syntax_Syntax.Tm_uvar uu____7490)
                          -> (FStar_TypeChecker_Common.Rigid_flex, tp)
                      | (FStar_Syntax_Syntax.Tm_uvar uu____7505,uu____7506)
                          -> (FStar_TypeChecker_Common.Flex_rigid, tp)
                      | (uu____7521,FStar_Syntax_Syntax.Tm_uvar uu____7522)
                          -> (FStar_TypeChecker_Common.Rigid_flex, tp)
                      | (uu____7537,uu____7538) ->
                          (FStar_TypeChecker_Common.Rigid_rigid, tp)
                       in
                    (match uu____7271 with
                     | (rank,tp1) ->
                         let uu____7551 =
                           FStar_All.pipe_right
                             (let uu___350_7555 = tp1  in
                              {
                                FStar_TypeChecker_Common.pid =
                                  (uu___350_7555.FStar_TypeChecker_Common.pid);
                                FStar_TypeChecker_Common.lhs =
                                  (uu___350_7555.FStar_TypeChecker_Common.lhs);
                                FStar_TypeChecker_Common.relation =
                                  (uu___350_7555.FStar_TypeChecker_Common.relation);
                                FStar_TypeChecker_Common.rhs =
                                  (uu___350_7555.FStar_TypeChecker_Common.rhs);
                                FStar_TypeChecker_Common.element =
                                  (uu___350_7555.FStar_TypeChecker_Common.element);
                                FStar_TypeChecker_Common.logical_guard =
                                  (uu___350_7555.FStar_TypeChecker_Common.logical_guard);
                                FStar_TypeChecker_Common.logical_guard_uvar =
                                  (uu___350_7555.FStar_TypeChecker_Common.logical_guard_uvar);
                                FStar_TypeChecker_Common.reason =
                                  (uu___350_7555.FStar_TypeChecker_Common.reason);
                                FStar_TypeChecker_Common.loc =
                                  (uu___350_7555.FStar_TypeChecker_Common.loc);
                                FStar_TypeChecker_Common.rank =
                                  (FStar_Pervasives_Native.Some rank)
                              })
                             (fun _0_21  ->
                                FStar_TypeChecker_Common.TProb _0_21)
                            in
                         (rank, uu____7551))))
      | FStar_TypeChecker_Common.CProb cp ->
          let uu____7561 =
            FStar_All.pipe_right
              (let uu___351_7565 = cp  in
               {
                 FStar_TypeChecker_Common.pid =
                   (uu___351_7565.FStar_TypeChecker_Common.pid);
                 FStar_TypeChecker_Common.lhs =
                   (uu___351_7565.FStar_TypeChecker_Common.lhs);
                 FStar_TypeChecker_Common.relation =
                   (uu___351_7565.FStar_TypeChecker_Common.relation);
                 FStar_TypeChecker_Common.rhs =
                   (uu___351_7565.FStar_TypeChecker_Common.rhs);
                 FStar_TypeChecker_Common.element =
                   (uu___351_7565.FStar_TypeChecker_Common.element);
                 FStar_TypeChecker_Common.logical_guard =
                   (uu___351_7565.FStar_TypeChecker_Common.logical_guard);
                 FStar_TypeChecker_Common.logical_guard_uvar =
                   (uu___351_7565.FStar_TypeChecker_Common.logical_guard_uvar);
                 FStar_TypeChecker_Common.reason =
                   (uu___351_7565.FStar_TypeChecker_Common.reason);
                 FStar_TypeChecker_Common.loc =
                   (uu___351_7565.FStar_TypeChecker_Common.loc);
                 FStar_TypeChecker_Common.rank =
                   (FStar_Pervasives_Native.Some
                      FStar_TypeChecker_Common.Rigid_rigid)
               }) (fun _0_22  -> FStar_TypeChecker_Common.CProb _0_22)
             in
          (FStar_TypeChecker_Common.Rigid_rigid, uu____7561)
  
let (next_prob :
  worklist ->
    (FStar_TypeChecker_Common.prob,FStar_TypeChecker_Common.prob Prims.list,
      FStar_TypeChecker_Common.rank_t) FStar_Pervasives_Native.tuple3
      FStar_Pervasives_Native.option)
  =
  fun wl  ->
    let rec aux uu____7626 probs =
      match uu____7626 with
      | (min_rank,min1,out) ->
          (match probs with
           | [] ->
               (match (min1, min_rank) with
                | (FStar_Pervasives_Native.Some
                   p,FStar_Pervasives_Native.Some r) ->
                    FStar_Pervasives_Native.Some (p, out, r)
                | uu____7707 -> FStar_Pervasives_Native.None)
           | hd1::tl1 ->
               let uu____7728 = rank wl.tcenv hd1  in
               (match uu____7728 with
                | (rank1,hd2) ->
                    if rank_leq rank1 FStar_TypeChecker_Common.Flex_rigid_eq
                    then
                      (match min1 with
                       | FStar_Pervasives_Native.None  ->
                           FStar_Pervasives_Native.Some
                             (hd2, (FStar_List.append out tl1), rank1)
                       | FStar_Pervasives_Native.Some m ->
                           FStar_Pervasives_Native.Some
                             (hd2, (FStar_List.append out (m :: tl1)), rank1))
                    else
                      (let uu____7787 =
                         (min_rank = FStar_Pervasives_Native.None) ||
                           (let uu____7791 = FStar_Option.get min_rank  in
                            rank_less_than rank1 uu____7791)
                          in
                       if uu____7787
                       then
                         match min1 with
                         | FStar_Pervasives_Native.None  ->
                             aux
                               ((FStar_Pervasives_Native.Some rank1),
                                 (FStar_Pervasives_Native.Some hd2), out) tl1
                         | FStar_Pervasives_Native.Some m ->
                             aux
                               ((FStar_Pervasives_Native.Some rank1),
                                 (FStar_Pervasives_Native.Some hd2), (m ::
                                 out)) tl1
                       else aux (min_rank, min1, (hd2 :: out)) tl1)))
       in
    aux (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None, [])
      wl.attempting
  
let (flex_prob_closing :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      FStar_TypeChecker_Common.prob -> Prims.bool)
  =
  fun tcenv  ->
    fun bs  ->
      fun p  ->
        let flex_will_be_closed t =
          let uu____7859 = FStar_Syntax_Util.head_and_args t  in
          match uu____7859 with
          | (hd1,uu____7875) ->
              let uu____7896 =
                let uu____7897 = FStar_Syntax_Subst.compress hd1  in
                uu____7897.FStar_Syntax_Syntax.n  in
              (match uu____7896 with
               | FStar_Syntax_Syntax.Tm_uvar (u,uu____7901) ->
                   FStar_All.pipe_right
                     u.FStar_Syntax_Syntax.ctx_uvar_binders
                     (FStar_Util.for_some
                        (fun uu____7931  ->
                           match uu____7931 with
                           | (y,uu____7937) ->
                               FStar_All.pipe_right bs
                                 (FStar_Util.for_some
                                    (fun uu____7951  ->
                                       match uu____7951 with
                                       | (x,uu____7957) ->
                                           FStar_Syntax_Syntax.bv_eq x y))))
               | uu____7958 -> false)
           in
        let uu____7959 = rank tcenv p  in
        match uu____7959 with
        | (r,p1) ->
            (match p1 with
             | FStar_TypeChecker_Common.CProb uu____7966 -> true
             | FStar_TypeChecker_Common.TProb p2 ->
                 (match r with
                  | FStar_TypeChecker_Common.Rigid_rigid  -> true
                  | FStar_TypeChecker_Common.Flex_rigid_eq  -> true
                  | FStar_TypeChecker_Common.Flex_flex_pattern_eq  -> true
                  | FStar_TypeChecker_Common.Flex_rigid  ->
                      flex_will_be_closed p2.FStar_TypeChecker_Common.lhs
                  | FStar_TypeChecker_Common.Rigid_flex  ->
                      flex_will_be_closed p2.FStar_TypeChecker_Common.rhs
                  | FStar_TypeChecker_Common.Flex_flex  ->
                      (p2.FStar_TypeChecker_Common.relation =
                         FStar_TypeChecker_Common.EQ)
                        &&
                        ((flex_will_be_closed p2.FStar_TypeChecker_Common.lhs)
                           ||
                           (flex_will_be_closed
                              p2.FStar_TypeChecker_Common.rhs))))
  
type univ_eq_sol =
  | UDeferred of worklist 
  | USolved of worklist 
  | UFailed of Prims.string 
let (uu___is_UDeferred : univ_eq_sol -> Prims.bool) =
  fun projectee  ->
    match projectee with | UDeferred _0 -> true | uu____7993 -> false
  
let (__proj__UDeferred__item___0 : univ_eq_sol -> worklist) =
  fun projectee  -> match projectee with | UDeferred _0 -> _0 
let (uu___is_USolved : univ_eq_sol -> Prims.bool) =
  fun projectee  ->
    match projectee with | USolved _0 -> true | uu____8007 -> false
  
let (__proj__USolved__item___0 : univ_eq_sol -> worklist) =
  fun projectee  -> match projectee with | USolved _0 -> _0 
let (uu___is_UFailed : univ_eq_sol -> Prims.bool) =
  fun projectee  ->
    match projectee with | UFailed _0 -> true | uu____8021 -> false
  
let (__proj__UFailed__item___0 : univ_eq_sol -> Prims.string) =
  fun projectee  -> match projectee with | UFailed _0 -> _0 
let rec (really_solve_universe_eq :
  Prims.int ->
    worklist ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.universe -> univ_eq_sol)
  =
  fun pid_orig  ->
    fun wl  ->
      fun u1  ->
        fun u2  ->
          let u11 =
            FStar_TypeChecker_Normalize.normalize_universe wl.tcenv u1  in
          let u21 =
            FStar_TypeChecker_Normalize.normalize_universe wl.tcenv u2  in
          let rec occurs_univ v1 u =
            match u with
            | FStar_Syntax_Syntax.U_max us ->
                FStar_All.pipe_right us
                  (FStar_Util.for_some
                     (fun u3  ->
                        let uu____8073 = FStar_Syntax_Util.univ_kernel u3  in
                        match uu____8073 with
                        | (k,uu____8079) ->
                            (match k with
                             | FStar_Syntax_Syntax.U_unif v2 ->
                                 FStar_Syntax_Unionfind.univ_equiv v1 v2
                             | uu____8089 -> false)))
            | uu____8090 -> occurs_univ v1 (FStar_Syntax_Syntax.U_max [u])
             in
          let rec filter_out_common_univs u12 u22 =
            let common_elts =
              FStar_All.pipe_right u12
                (FStar_List.fold_left
                   (fun uvs  ->
                      fun uv1  ->
                        let uu____8142 =
                          FStar_All.pipe_right u22
                            (FStar_List.existsML
                               (fun uv2  ->
                                  let uu____8148 =
                                    FStar_Syntax_Util.compare_univs uv1 uv2
                                     in
                                  uu____8148 = (Prims.parse_int "0")))
                           in
                        if uu____8142 then uv1 :: uvs else uvs) [])
               in
            let filter1 =
              FStar_List.filter
                (fun u  ->
                   let uu____8164 =
                     FStar_All.pipe_right common_elts
                       (FStar_List.existsML
                          (fun u'  ->
                             let uu____8170 =
                               FStar_Syntax_Util.compare_univs u u'  in
                             uu____8170 = (Prims.parse_int "0")))
                      in
                   Prims.op_Negation uu____8164)
               in
            let uu____8171 = filter1 u12  in
            let uu____8174 = filter1 u22  in (uu____8171, uu____8174)  in
          let try_umax_components u12 u22 msg =
            match (u12, u22) with
            | (FStar_Syntax_Syntax.U_max us1,FStar_Syntax_Syntax.U_max us2)
                ->
                let uu____8203 = filter_out_common_univs us1 us2  in
                (match uu____8203 with
                 | (us11,us21) ->
                     if (FStar_List.length us11) = (FStar_List.length us21)
                     then
                       let rec aux wl1 us12 us22 =
                         match (us12, us22) with
                         | (u13::us13,u23::us23) ->
                             let uu____8262 =
                               really_solve_universe_eq pid_orig wl1 u13 u23
                                in
                             (match uu____8262 with
                              | USolved wl2 -> aux wl2 us13 us23
                              | failed -> failed)
                         | uu____8265 -> USolved wl1  in
                       aux wl us11 us21
                     else
                       (let uu____8275 =
                          let uu____8276 =
                            FStar_Syntax_Print.univ_to_string u12  in
                          let uu____8277 =
                            FStar_Syntax_Print.univ_to_string u22  in
                          FStar_Util.format2
                            "Unable to unify universes: %s and %s" uu____8276
                            uu____8277
                           in
                        UFailed uu____8275))
            | (FStar_Syntax_Syntax.U_max us,u') ->
                let rec aux wl1 us1 =
                  match us1 with
                  | [] -> USolved wl1
                  | u::us2 ->
                      let uu____8301 =
                        really_solve_universe_eq pid_orig wl1 u u'  in
                      (match uu____8301 with
                       | USolved wl2 -> aux wl2 us2
                       | failed -> failed)
                   in
                aux wl us
            | (u',FStar_Syntax_Syntax.U_max us) ->
                let rec aux wl1 us1 =
                  match us1 with
                  | [] -> USolved wl1
                  | u::us2 ->
                      let uu____8327 =
                        really_solve_universe_eq pid_orig wl1 u u'  in
                      (match uu____8327 with
                       | USolved wl2 -> aux wl2 us2
                       | failed -> failed)
                   in
                aux wl us
            | uu____8330 ->
                let uu____8335 =
                  let uu____8336 = FStar_Syntax_Print.univ_to_string u12  in
                  let uu____8337 = FStar_Syntax_Print.univ_to_string u22  in
                  FStar_Util.format3
                    "Unable to unify universes: %s and %s (%s)" uu____8336
                    uu____8337 msg
                   in
                UFailed uu____8335
             in
          match (u11, u21) with
          | (FStar_Syntax_Syntax.U_bvar uu____8338,uu____8339) ->
              let uu____8340 =
                let uu____8341 = FStar_Syntax_Print.univ_to_string u11  in
                let uu____8342 = FStar_Syntax_Print.univ_to_string u21  in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____8341 uu____8342
                 in
              failwith uu____8340
          | (FStar_Syntax_Syntax.U_unknown ,uu____8343) ->
              let uu____8344 =
                let uu____8345 = FStar_Syntax_Print.univ_to_string u11  in
                let uu____8346 = FStar_Syntax_Print.univ_to_string u21  in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____8345 uu____8346
                 in
              failwith uu____8344
          | (uu____8347,FStar_Syntax_Syntax.U_bvar uu____8348) ->
              let uu____8349 =
                let uu____8350 = FStar_Syntax_Print.univ_to_string u11  in
                let uu____8351 = FStar_Syntax_Print.univ_to_string u21  in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____8350 uu____8351
                 in
              failwith uu____8349
          | (uu____8352,FStar_Syntax_Syntax.U_unknown ) ->
              let uu____8353 =
                let uu____8354 = FStar_Syntax_Print.univ_to_string u11  in
                let uu____8355 = FStar_Syntax_Print.univ_to_string u21  in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____8354 uu____8355
                 in
              failwith uu____8353
          | (FStar_Syntax_Syntax.U_name x,FStar_Syntax_Syntax.U_name y) ->
              if x.FStar_Ident.idText = y.FStar_Ident.idText
              then USolved wl
              else UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_zero ) ->
              USolved wl
          | (FStar_Syntax_Syntax.U_succ u12,FStar_Syntax_Syntax.U_succ u22)
              -> really_solve_universe_eq pid_orig wl u12 u22
          | (FStar_Syntax_Syntax.U_unif v1,FStar_Syntax_Syntax.U_unif v2) ->
              let uu____8379 = FStar_Syntax_Unionfind.univ_equiv v1 v2  in
              if uu____8379
              then USolved wl
              else
                (let wl1 = extend_solution pid_orig [UNIV (v1, u21)] wl  in
                 USolved wl1)
          | (FStar_Syntax_Syntax.U_unif v1,u) ->
              let u3 = norm_univ wl u  in
              let uu____8393 = occurs_univ v1 u3  in
              if uu____8393
              then
                let uu____8394 =
                  let uu____8395 =
                    FStar_Syntax_Print.univ_to_string
                      (FStar_Syntax_Syntax.U_unif v1)
                     in
                  let uu____8396 = FStar_Syntax_Print.univ_to_string u3  in
                  FStar_Util.format2 "Failed occurs check: %s occurs in %s"
                    uu____8395 uu____8396
                   in
                try_umax_components u11 u21 uu____8394
              else
                (let uu____8398 = extend_solution pid_orig [UNIV (v1, u3)] wl
                    in
                 USolved uu____8398)
          | (u,FStar_Syntax_Syntax.U_unif v1) ->
              let u3 = norm_univ wl u  in
              let uu____8410 = occurs_univ v1 u3  in
              if uu____8410
              then
                let uu____8411 =
                  let uu____8412 =
                    FStar_Syntax_Print.univ_to_string
                      (FStar_Syntax_Syntax.U_unif v1)
                     in
                  let uu____8413 = FStar_Syntax_Print.univ_to_string u3  in
                  FStar_Util.format2 "Failed occurs check: %s occurs in %s"
                    uu____8412 uu____8413
                   in
                try_umax_components u11 u21 uu____8411
              else
                (let uu____8415 = extend_solution pid_orig [UNIV (v1, u3)] wl
                    in
                 USolved uu____8415)
          | (FStar_Syntax_Syntax.U_max uu____8416,uu____8417) ->
              if wl.defer_ok
              then UDeferred wl
              else
                (let u12 = norm_univ wl u11  in
                 let u22 = norm_univ wl u21  in
                 let uu____8423 = FStar_Syntax_Util.eq_univs u12 u22  in
                 if uu____8423
                 then USolved wl
                 else try_umax_components u12 u22 "")
          | (uu____8425,FStar_Syntax_Syntax.U_max uu____8426) ->
              if wl.defer_ok
              then UDeferred wl
              else
                (let u12 = norm_univ wl u11  in
                 let u22 = norm_univ wl u21  in
                 let uu____8432 = FStar_Syntax_Util.eq_univs u12 u22  in
                 if uu____8432
                 then USolved wl
                 else try_umax_components u12 u22 "")
          | (FStar_Syntax_Syntax.U_succ uu____8434,FStar_Syntax_Syntax.U_zero
             ) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_succ uu____8435,FStar_Syntax_Syntax.U_name
             uu____8436) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_succ
             uu____8437) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_name
             uu____8438) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_name uu____8439,FStar_Syntax_Syntax.U_succ
             uu____8440) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_name uu____8441,FStar_Syntax_Syntax.U_zero
             ) -> UFailed "Incompatible universes"
  
let (solve_universe_eq :
  Prims.int ->
    worklist ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.universe -> univ_eq_sol)
  =
  fun orig  ->
    fun wl  ->
      fun u1  ->
        fun u2  ->
          if (wl.tcenv).FStar_TypeChecker_Env.lax_universes
          then USolved wl
          else really_solve_universe_eq orig wl u1 u2
  
let match_num_binders :
  'a 'b .
    ('a Prims.list,'a Prims.list -> 'b) FStar_Pervasives_Native.tuple2 ->
      ('a Prims.list,'a Prims.list -> 'b) FStar_Pervasives_Native.tuple2 ->
        (('a Prims.list,'b) FStar_Pervasives_Native.tuple2,('a Prims.list,
                                                             'b)
                                                             FStar_Pervasives_Native.tuple2)
          FStar_Pervasives_Native.tuple2
  =
  fun bc1  ->
    fun bc2  ->
      let uu____8541 = bc1  in
      match uu____8541 with
      | (bs1,mk_cod1) ->
          let uu____8585 = bc2  in
          (match uu____8585 with
           | (bs2,mk_cod2) ->
               let rec aux bs11 bs21 =
                 match (bs11, bs21) with
                 | (x::xs,y::ys) ->
                     let uu____8696 = aux xs ys  in
                     (match uu____8696 with
                      | ((xs1,xr),(ys1,yr)) ->
                          (((x :: xs1), xr), ((y :: ys1), yr)))
                 | (xs,ys) ->
                     let uu____8779 =
                       let uu____8786 = mk_cod1 xs  in ([], uu____8786)  in
                     let uu____8789 =
                       let uu____8796 = mk_cod2 ys  in ([], uu____8796)  in
                     (uu____8779, uu____8789)
                  in
               aux bs1 bs2)
  
let (guard_of_prob :
  FStar_TypeChecker_Env.env ->
    worklist ->
      tprob ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term ->
            (FStar_Syntax_Syntax.term,worklist)
              FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun wl  ->
      fun problem  ->
        fun t1  ->
          fun t2  ->
            let has_type_guard t11 t21 =
              match problem.FStar_TypeChecker_Common.element with
              | FStar_Pervasives_Native.Some t ->
                  let uu____8864 = FStar_Syntax_Syntax.bv_to_name t  in
                  FStar_Syntax_Util.mk_has_type t11 uu____8864 t21
              | FStar_Pervasives_Native.None  ->
                  let x =
                    FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                      t11
                     in
                  let u_x = env.FStar_TypeChecker_Env.universe_of env t11  in
                  let uu____8867 =
                    let uu____8868 = FStar_Syntax_Syntax.bv_to_name x  in
                    FStar_Syntax_Util.mk_has_type t11 uu____8868 t21  in
                  FStar_Syntax_Util.mk_forall u_x x uu____8867
               in
            match problem.FStar_TypeChecker_Common.relation with
            | FStar_TypeChecker_Common.EQ  ->
                mk_eq2 wl (FStar_TypeChecker_Common.TProb problem) t1 t2
            | FStar_TypeChecker_Common.SUB  ->
                let uu____8873 = has_type_guard t1 t2  in (uu____8873, wl)
            | FStar_TypeChecker_Common.SUBINV  ->
                let uu____8874 = has_type_guard t2 t1  in (uu____8874, wl)
  
let is_flex_pat :
  'Auu____8883 'Auu____8884 'Auu____8885 .
    ('Auu____8883,'Auu____8884,'Auu____8885 Prims.list)
      FStar_Pervasives_Native.tuple3 -> Prims.bool
  =
  fun uu___328_8898  ->
    match uu___328_8898 with
    | (uu____8907,uu____8908,[]) -> true
    | uu____8911 -> false
  
let (quasi_pattern :
  FStar_TypeChecker_Env.env ->
    flex_t ->
      (FStar_Syntax_Syntax.binders,FStar_Syntax_Syntax.typ)
        FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun f  ->
      let uu____8942 = f  in
      match uu____8942 with
      | (uu____8949,{ FStar_Syntax_Syntax.ctx_uvar_head = uu____8950;
                      FStar_Syntax_Syntax.ctx_uvar_gamma = uu____8951;
                      FStar_Syntax_Syntax.ctx_uvar_binders = ctx;
                      FStar_Syntax_Syntax.ctx_uvar_typ = t_hd;
                      FStar_Syntax_Syntax.ctx_uvar_reason = uu____8954;
                      FStar_Syntax_Syntax.ctx_uvar_should_check = uu____8955;
                      FStar_Syntax_Syntax.ctx_uvar_range = uu____8956;_},args)
          ->
          let name_exists_in x bs =
            FStar_Util.for_some
              (fun uu____9008  ->
                 match uu____9008 with
                 | (y,uu____9014) -> FStar_Syntax_Syntax.bv_eq x y) bs
             in
          let rec aux pat_binders formals t_res args1 =
            match (formals, args1) with
            | ([],[]) ->
                let uu____9136 =
                  let uu____9149 =
                    let uu____9152 = FStar_Syntax_Syntax.mk_Total t_res  in
                    FStar_Syntax_Util.arrow formals uu____9152  in
                  ((FStar_List.rev pat_binders), uu____9149)  in
                FStar_Pervasives_Native.Some uu____9136
            | (uu____9179,[]) ->
                let uu____9202 =
                  let uu____9215 =
                    let uu____9218 = FStar_Syntax_Syntax.mk_Total t_res  in
                    FStar_Syntax_Util.arrow formals uu____9218  in
                  ((FStar_List.rev pat_binders), uu____9215)  in
                FStar_Pervasives_Native.Some uu____9202
            | ((formal,formal_imp)::formals1,(a,a_imp)::args2) ->
                let uu____9283 =
                  let uu____9284 = FStar_Syntax_Subst.compress a  in
                  uu____9284.FStar_Syntax_Syntax.n  in
                (match uu____9283 with
                 | FStar_Syntax_Syntax.Tm_name x ->
                     let uu____9302 =
                       (name_exists_in x ctx) ||
                         (name_exists_in x pat_binders)
                        in
                     if uu____9302
                     then
                       aux ((formal, formal_imp) :: pat_binders) formals1
                         t_res args2
                     else
                       (let x1 =
                          let uu___352_9323 = x  in
                          {
                            FStar_Syntax_Syntax.ppname =
                              (uu___352_9323.FStar_Syntax_Syntax.ppname);
                            FStar_Syntax_Syntax.index =
                              (uu___352_9323.FStar_Syntax_Syntax.index);
                            FStar_Syntax_Syntax.sort =
                              (formal.FStar_Syntax_Syntax.sort)
                          }  in
                        let subst1 =
                          let uu____9327 =
                            let uu____9328 =
                              let uu____9335 =
                                FStar_Syntax_Syntax.bv_to_name x1  in
                              (formal, uu____9335)  in
                            FStar_Syntax_Syntax.NT uu____9328  in
                          [uu____9327]  in
                        let formals2 =
                          FStar_Syntax_Subst.subst_binders subst1 formals1
                           in
                        let t_res1 = FStar_Syntax_Subst.subst subst1 t_res
                           in
                        aux
                          (((let uu___353_9347 = x1  in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___353_9347.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___353_9347.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort =
                                 (formal.FStar_Syntax_Syntax.sort)
                             }), a_imp) :: pat_binders) formals2 t_res1 args2)
                 | uu____9348 ->
                     aux ((formal, formal_imp) :: pat_binders) formals1 t_res
                       args2)
            | ([],args2) ->
                let uu____9376 =
                  let uu____9389 =
                    FStar_TypeChecker_Normalize.unfold_whnf env t_res  in
                  FStar_Syntax_Util.arrow_formals uu____9389  in
                (match uu____9376 with
                 | (more_formals,t_res1) ->
                     (match more_formals with
                      | [] -> FStar_Pervasives_Native.None
                      | uu____9452 ->
                          aux pat_binders more_formals t_res1 args2))
             in
          (match args with
           | [] -> FStar_Pervasives_Native.Some ([], t_hd)
           | uu____9479 ->
               let uu____9480 = FStar_Syntax_Util.arrow_formals t_hd  in
               (match uu____9480 with
                | (formals,t_res) -> aux [] formals t_res args))
  
let rec (solve : FStar_TypeChecker_Env.env -> worklist -> solution) =
  fun env  ->
    fun probs  ->
      (let uu____9756 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "Rel")
          in
       if uu____9756
       then
         let uu____9757 = wl_to_string probs  in
         FStar_Util.print1 "solve:\n\t%s\n" uu____9757
       else ());
      (let uu____9759 = next_prob probs  in
       match uu____9759 with
       | FStar_Pervasives_Native.Some (hd1,tl1,rank1) ->
           let probs1 =
             let uu___354_9786 = probs  in
             {
               attempting = tl1;
               wl_deferred = (uu___354_9786.wl_deferred);
               ctr = (uu___354_9786.ctr);
               defer_ok = (uu___354_9786.defer_ok);
               smt_ok = (uu___354_9786.smt_ok);
               tcenv = (uu___354_9786.tcenv);
               wl_implicits = (uu___354_9786.wl_implicits)
             }  in
           (def_check_prob "solve,hd" hd1;
            (match hd1 with
             | FStar_TypeChecker_Common.CProb cp ->
                 solve_c env (maybe_invert cp) probs1
             | FStar_TypeChecker_Common.TProb tp ->
                 let uu____9794 =
                   FStar_Util.physical_equality
                     tp.FStar_TypeChecker_Common.lhs
                     tp.FStar_TypeChecker_Common.rhs
                    in
                 if uu____9794
                 then
                   let uu____9795 =
                     solve_prob hd1 FStar_Pervasives_Native.None [] probs1
                      in
                   solve env uu____9795
                 else
                   if
                     (rank1 = FStar_TypeChecker_Common.Rigid_rigid) ||
                       ((tp.FStar_TypeChecker_Common.relation =
                           FStar_TypeChecker_Common.EQ)
                          && (rank1 <> FStar_TypeChecker_Common.Flex_flex))
                   then solve_t' env tp probs1
                   else
                     if probs1.defer_ok
                     then
                       solve env
                         (defer "deferring flex_rigid or flex_flex subtyping"
                            hd1 probs1)
                     else
                       if rank1 = FStar_TypeChecker_Common.Flex_flex
                       then
                         solve_t' env
                           (let uu___355_9800 = tp  in
                            {
                              FStar_TypeChecker_Common.pid =
                                (uu___355_9800.FStar_TypeChecker_Common.pid);
                              FStar_TypeChecker_Common.lhs =
                                (uu___355_9800.FStar_TypeChecker_Common.lhs);
                              FStar_TypeChecker_Common.relation =
                                FStar_TypeChecker_Common.EQ;
                              FStar_TypeChecker_Common.rhs =
                                (uu___355_9800.FStar_TypeChecker_Common.rhs);
                              FStar_TypeChecker_Common.element =
                                (uu___355_9800.FStar_TypeChecker_Common.element);
                              FStar_TypeChecker_Common.logical_guard =
                                (uu___355_9800.FStar_TypeChecker_Common.logical_guard);
                              FStar_TypeChecker_Common.logical_guard_uvar =
                                (uu___355_9800.FStar_TypeChecker_Common.logical_guard_uvar);
                              FStar_TypeChecker_Common.reason =
                                (uu___355_9800.FStar_TypeChecker_Common.reason);
                              FStar_TypeChecker_Common.loc =
                                (uu___355_9800.FStar_TypeChecker_Common.loc);
                              FStar_TypeChecker_Common.rank =
                                (uu___355_9800.FStar_TypeChecker_Common.rank)
                            }) probs1
                       else
                         solve_rigid_flex_or_flex_rigid_subtyping rank1 env
                           tp probs1))
       | FStar_Pervasives_Native.None  ->
           (match probs.wl_deferred with
            | [] -> Success ([], (probs.wl_implicits))
            | uu____9822 ->
                let uu____9831 =
                  FStar_All.pipe_right probs.wl_deferred
                    (FStar_List.partition
                       (fun uu____9890  ->
                          match uu____9890 with
                          | (c,uu____9898,uu____9899) -> c < probs.ctr))
                   in
                (match uu____9831 with
                 | (attempt1,rest) ->
                     (match attempt1 with
                      | [] ->
                          let uu____9940 =
                            let uu____9945 =
                              FStar_List.map
                                (fun uu____9960  ->
                                   match uu____9960 with
                                   | (uu____9971,x,y) -> (x, y))
                                probs.wl_deferred
                               in
                            (uu____9945, (probs.wl_implicits))  in
                          Success uu____9940
                      | uu____9974 ->
                          let uu____9983 =
                            let uu___356_9984 = probs  in
                            let uu____9985 =
                              FStar_All.pipe_right attempt1
                                (FStar_List.map
                                   (fun uu____10004  ->
                                      match uu____10004 with
                                      | (uu____10011,uu____10012,y) -> y))
                               in
                            {
                              attempting = uu____9985;
                              wl_deferred = rest;
                              ctr = (uu___356_9984.ctr);
                              defer_ok = (uu___356_9984.defer_ok);
                              smt_ok = (uu___356_9984.smt_ok);
                              tcenv = (uu___356_9984.tcenv);
                              wl_implicits = (uu___356_9984.wl_implicits)
                            }  in
                          solve env uu____9983))))

and (solve_one_universe_eq :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.universe -> worklist -> solution)
  =
  fun env  ->
    fun orig  ->
      fun u1  ->
        fun u2  ->
          fun wl  ->
            let uu____10019 = solve_universe_eq (p_pid orig) wl u1 u2  in
            match uu____10019 with
            | USolved wl1 ->
                let uu____10021 =
                  solve_prob orig FStar_Pervasives_Native.None [] wl1  in
                solve env uu____10021
            | UFailed msg -> giveup env msg orig
            | UDeferred wl1 -> solve env (defer "" orig wl1)

and (solve_maybe_uinsts :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.term -> worklist -> univ_eq_sol)
  =
  fun env  ->
    fun orig  ->
      fun t1  ->
        fun t2  ->
          fun wl  ->
            let rec aux wl1 us1 us2 =
              match (us1, us2) with
              | ([],[]) -> USolved wl1
              | (u1::us11,u2::us21) ->
                  let uu____10073 = solve_universe_eq (p_pid orig) wl1 u1 u2
                     in
                  (match uu____10073 with
                   | USolved wl2 -> aux wl2 us11 us21
                   | failed_or_deferred -> failed_or_deferred)
              | uu____10076 -> UFailed "Unequal number of universes"  in
            let t11 = whnf env t1  in
            let t21 = whnf env t2  in
            match ((t11.FStar_Syntax_Syntax.n), (t21.FStar_Syntax_Syntax.n))
            with
            | (FStar_Syntax_Syntax.Tm_uinst
               ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar f;
                  FStar_Syntax_Syntax.pos = uu____10088;
                  FStar_Syntax_Syntax.vars = uu____10089;_},us1),FStar_Syntax_Syntax.Tm_uinst
               ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar g;
                  FStar_Syntax_Syntax.pos = uu____10092;
                  FStar_Syntax_Syntax.vars = uu____10093;_},us2))
                -> let b = FStar_Syntax_Syntax.fv_eq f g  in aux wl us1 us2
            | (FStar_Syntax_Syntax.Tm_uinst uu____10105,uu____10106) ->
                failwith "Impossible: expect head symbols to match"
            | (uu____10113,FStar_Syntax_Syntax.Tm_uinst uu____10114) ->
                failwith "Impossible: expect head symbols to match"
            | uu____10121 -> USolved wl

and (giveup_or_defer :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob -> worklist -> Prims.string -> solution)
  =
  fun env  ->
    fun orig  ->
      fun wl  ->
        fun msg  ->
          if wl.defer_ok
          then
            ((let uu____10131 =
                FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                  (FStar_Options.Other "Rel")
                 in
              if uu____10131
              then
                let uu____10132 = prob_to_string env orig  in
                FStar_Util.print2 "\n\t\tDeferring %s\n\t\tBecause %s\n"
                  uu____10132 msg
              else ());
             solve env (defer msg orig wl))
          else giveup env msg orig

and (solve_rigid_flex_or_flex_rigid_subtyping :
  FStar_TypeChecker_Common.rank_t ->
    FStar_TypeChecker_Env.env -> tprob -> worklist -> solution)
  =
  fun rank1  ->
    fun env  ->
      fun tp  ->
        fun wl  ->
          def_check_prob "solve_rigid_flex_or_flex_rigid_subtyping"
            (FStar_TypeChecker_Common.TProb tp);
          (let flip = rank1 = FStar_TypeChecker_Common.Flex_rigid  in
           let meet_or_join op ts env1 wl1 =
             let eq_prob t1 t2 wl2 =
               let uu____10218 =
                 new_problem wl2 env1 t1 FStar_TypeChecker_Common.EQ t2
                   FStar_Pervasives_Native.None t1.FStar_Syntax_Syntax.pos
                   "join/meet refinements"
                  in
               match uu____10218 with
               | (p,wl3) ->
                   (def_check_prob "meet_or_join"
                      (FStar_TypeChecker_Common.TProb p);
                    ((FStar_TypeChecker_Common.TProb p), wl3))
                in
             let pairwise t1 t2 wl2 =
               (let uu____10271 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                    (FStar_Options.Other "Rel")
                   in
                if uu____10271
                then
                  let uu____10272 = FStar_Syntax_Print.term_to_string t1  in
                  let uu____10273 = FStar_Syntax_Print.term_to_string t2  in
                  FStar_Util.print2 "[meet/join]: pairwise: %s and %s\n"
                    uu____10272 uu____10273
                else ());
               (let uu____10275 = head_matches_delta env1 t1 t2  in
                match uu____10275 with
                | (mr,ts1) ->
                    (match mr with
                     | HeadMatch (true ) ->
                         let uu____10320 = eq_prob t1 t2 wl2  in
                         (match uu____10320 with | (p,wl3) -> (t1, [p], wl3))
                     | MisMatch uu____10341 ->
                         let uu____10350 = eq_prob t1 t2 wl2  in
                         (match uu____10350 with | (p,wl3) -> (t1, [p], wl3))
                     | FullMatch  ->
                         (match ts1 with
                          | FStar_Pervasives_Native.None  -> (t1, [], wl2)
                          | FStar_Pervasives_Native.Some (t11,t21) ->
                              (t11, [], wl2))
                     | HeadMatch (false ) ->
                         let uu____10399 =
                           match ts1 with
                           | FStar_Pervasives_Native.Some (t11,t21) ->
                               let uu____10414 =
                                 FStar_Syntax_Subst.compress t11  in
                               let uu____10415 =
                                 FStar_Syntax_Subst.compress t21  in
                               (uu____10414, uu____10415)
                           | FStar_Pervasives_Native.None  ->
                               let uu____10420 =
                                 FStar_Syntax_Subst.compress t1  in
                               let uu____10421 =
                                 FStar_Syntax_Subst.compress t2  in
                               (uu____10420, uu____10421)
                            in
                         (match uu____10399 with
                          | (t11,t21) ->
                              let try_eq t12 t22 wl3 =
                                let uu____10452 =
                                  FStar_Syntax_Util.head_and_args t12  in
                                match uu____10452 with
                                | (t1_hd,t1_args) ->
                                    let uu____10491 =
                                      FStar_Syntax_Util.head_and_args t22  in
                                    (match uu____10491 with
                                     | (t2_hd,t2_args) ->
                                         if
                                           (FStar_List.length t1_args) <>
                                             (FStar_List.length t2_args)
                                         then FStar_Pervasives_Native.None
                                         else
                                           (let uu____10545 =
                                              let uu____10552 =
                                                let uu____10561 =
                                                  FStar_Syntax_Syntax.as_arg
                                                    t1_hd
                                                   in
                                                uu____10561 :: t1_args  in
                                              let uu____10574 =
                                                let uu____10581 =
                                                  FStar_Syntax_Syntax.as_arg
                                                    t2_hd
                                                   in
                                                uu____10581 :: t2_args  in
                                              FStar_List.fold_left2
                                                (fun uu____10622  ->
                                                   fun uu____10623  ->
                                                     fun uu____10624  ->
                                                       match (uu____10622,
                                                               uu____10623,
                                                               uu____10624)
                                                       with
                                                       | ((probs,wl4),
                                                          (a1,uu____10666),
                                                          (a2,uu____10668))
                                                           ->
                                                           let uu____10693 =
                                                             eq_prob a1 a2
                                                               wl4
                                                              in
                                                           (match uu____10693
                                                            with
                                                            | (p,wl5) ->
                                                                ((p ::
                                                                  probs),
                                                                  wl5)))
                                                ([], wl3) uu____10552
                                                uu____10574
                                               in
                                            match uu____10545 with
                                            | (probs,wl4) ->
                                                let wl' =
                                                  let uu___357_10719 = wl4
                                                     in
                                                  {
                                                    attempting = probs;
                                                    wl_deferred = [];
                                                    ctr =
                                                      (uu___357_10719.ctr);
                                                    defer_ok = false;
                                                    smt_ok = false;
                                                    tcenv =
                                                      (uu___357_10719.tcenv);
                                                    wl_implicits = []
                                                  }  in
                                                let tx =
                                                  FStar_Syntax_Unionfind.new_transaction
                                                    ()
                                                   in
                                                let uu____10735 =
                                                  solve env1 wl'  in
                                                (match uu____10735 with
                                                 | Success (uu____10738,imps)
                                                     ->
                                                     (FStar_Syntax_Unionfind.commit
                                                        tx;
                                                      FStar_Pervasives_Native.Some
                                                        ((let uu___358_10742
                                                            = wl4  in
                                                          {
                                                            attempting =
                                                              (uu___358_10742.attempting);
                                                            wl_deferred =
                                                              (uu___358_10742.wl_deferred);
                                                            ctr =
                                                              (uu___358_10742.ctr);
                                                            defer_ok =
                                                              (uu___358_10742.defer_ok);
                                                            smt_ok =
                                                              (uu___358_10742.smt_ok);
                                                            tcenv =
                                                              (uu___358_10742.tcenv);
                                                            wl_implicits =
                                                              (FStar_List.append
                                                                 wl4.wl_implicits
                                                                 imps)
                                                          })))
                                                 | Failed uu____10751 ->
                                                     (FStar_Syntax_Unionfind.rollback
                                                        tx;
                                                      FStar_Pervasives_Native.None))))
                                 in
                              let combine t12 t22 wl3 =
                                let uu____10783 =
                                  base_and_refinement_maybe_delta false env1
                                    t12
                                   in
                                match uu____10783 with
                                | (t1_base,p1_opt) ->
                                    let uu____10830 =
                                      base_and_refinement_maybe_delta false
                                        env1 t22
                                       in
                                    (match uu____10830 with
                                     | (t2_base,p2_opt) ->
                                         let combine_refinements t_base
                                           p1_opt1 p2_opt1 =
                                           let refine1 x t =
                                             let uu____10940 =
                                               FStar_Syntax_Util.is_t_true t
                                                in
                                             if uu____10940
                                             then x.FStar_Syntax_Syntax.sort
                                             else
                                               FStar_Syntax_Util.refine x t
                                              in
                                           match (p1_opt1, p2_opt1) with
                                           | (FStar_Pervasives_Native.Some
                                              (x,phi1),FStar_Pervasives_Native.Some
                                              (y,phi2)) ->
                                               let x1 =
                                                 FStar_Syntax_Syntax.freshen_bv
                                                   x
                                                  in
                                               let subst1 =
                                                 [FStar_Syntax_Syntax.DB
                                                    ((Prims.parse_int "0"),
                                                      x1)]
                                                  in
                                               let phi11 =
                                                 FStar_Syntax_Subst.subst
                                                   subst1 phi1
                                                  in
                                               let phi21 =
                                                 FStar_Syntax_Subst.subst
                                                   subst1 phi2
                                                  in
                                               let uu____10988 =
                                                 op phi11 phi21  in
                                               refine1 x1 uu____10988
                                           | (FStar_Pervasives_Native.None
                                              ,FStar_Pervasives_Native.Some
                                              (x,phi)) ->
                                               let x1 =
                                                 FStar_Syntax_Syntax.freshen_bv
                                                   x
                                                  in
                                               let subst1 =
                                                 [FStar_Syntax_Syntax.DB
                                                    ((Prims.parse_int "0"),
                                                      x1)]
                                                  in
                                               let phi1 =
                                                 FStar_Syntax_Subst.subst
                                                   subst1 phi
                                                  in
                                               let uu____11018 =
                                                 op FStar_Syntax_Util.t_true
                                                   phi1
                                                  in
                                               refine1 x1 uu____11018
                                           | (FStar_Pervasives_Native.Some
                                              (x,phi),FStar_Pervasives_Native.None
                                              ) ->
                                               let x1 =
                                                 FStar_Syntax_Syntax.freshen_bv
                                                   x
                                                  in
                                               let subst1 =
                                                 [FStar_Syntax_Syntax.DB
                                                    ((Prims.parse_int "0"),
                                                      x1)]
                                                  in
                                               let phi1 =
                                                 FStar_Syntax_Subst.subst
                                                   subst1 phi
                                                  in
                                               let uu____11048 =
                                                 op FStar_Syntax_Util.t_true
                                                   phi1
                                                  in
                                               refine1 x1 uu____11048
                                           | uu____11051 -> t_base  in
                                         let uu____11068 =
                                           try_eq t1_base t2_base wl3  in
                                         (match uu____11068 with
                                          | FStar_Pervasives_Native.Some wl4
                                              ->
                                              let uu____11082 =
                                                combine_refinements t1_base
                                                  p1_opt p2_opt
                                                 in
                                              (uu____11082, [], wl4)
                                          | FStar_Pervasives_Native.None  ->
                                              let uu____11089 =
                                                base_and_refinement_maybe_delta
                                                  true env1 t12
                                                 in
                                              (match uu____11089 with
                                               | (t1_base1,p1_opt1) ->
                                                   let uu____11136 =
                                                     base_and_refinement_maybe_delta
                                                       true env1 t22
                                                      in
                                                   (match uu____11136 with
                                                    | (t2_base1,p2_opt1) ->
                                                        let uu____11183 =
                                                          eq_prob t1_base1
                                                            t2_base1 wl3
                                                           in
                                                        (match uu____11183
                                                         with
                                                         | (p,wl4) ->
                                                             let t =
                                                               combine_refinements
                                                                 t1_base1
                                                                 p1_opt1
                                                                 p2_opt1
                                                                in
                                                             (t, [p], wl4))))))
                                 in
                              let uu____11207 = combine t11 t21 wl2  in
                              (match uu____11207 with
                               | (t12,ps,wl3) ->
                                   ((let uu____11240 =
                                       FStar_All.pipe_left
                                         (FStar_TypeChecker_Env.debug env1)
                                         (FStar_Options.Other "Rel")
                                        in
                                     if uu____11240
                                     then
                                       let uu____11241 =
                                         FStar_Syntax_Print.term_to_string
                                           t12
                                          in
                                       FStar_Util.print1
                                         "pairwise fallback2 succeeded: %s"
                                         uu____11241
                                     else ());
                                    (t12, ps, wl3))))))
                in
             let rec aux uu____11280 ts1 =
               match uu____11280 with
               | (out,probs,wl2) ->
                   (match ts1 with
                    | [] -> (out, probs, wl2)
                    | t::ts2 ->
                        let uu____11343 = pairwise out t wl2  in
                        (match uu____11343 with
                         | (out1,probs',wl3) ->
                             aux
                               (out1, (FStar_List.append probs probs'), wl3)
                               ts2))
                in
             let uu____11379 =
               let uu____11390 = FStar_List.hd ts  in (uu____11390, [], wl1)
                in
             let uu____11399 = FStar_List.tl ts  in
             aux uu____11379 uu____11399  in
           let uu____11406 =
             if flip
             then
               ((tp.FStar_TypeChecker_Common.lhs),
                 (tp.FStar_TypeChecker_Common.rhs))
             else
               ((tp.FStar_TypeChecker_Common.rhs),
                 (tp.FStar_TypeChecker_Common.lhs))
              in
           match uu____11406 with
           | (this_flex,this_rigid) ->
               let uu____11430 =
                 let uu____11431 = FStar_Syntax_Subst.compress this_rigid  in
                 uu____11431.FStar_Syntax_Syntax.n  in
               (match uu____11430 with
                | FStar_Syntax_Syntax.Tm_arrow (_bs,comp) ->
                    let uu____11452 =
                      FStar_Syntax_Util.is_tot_or_gtot_comp comp  in
                    if uu____11452
                    then
                      let uu____11453 = destruct_flex_t this_flex wl  in
                      (match uu____11453 with
                       | (flex,wl1) ->
                           let uu____11460 = quasi_pattern env flex  in
                           (match uu____11460 with
                            | FStar_Pervasives_Native.None  ->
                                giveup env
                                  "flex-arrow subtyping, not a quasi pattern"
                                  (FStar_TypeChecker_Common.TProb tp)
                            | FStar_Pervasives_Native.Some (flex_bs,flex_t)
                                ->
                                ((let uu____11478 =
                                    FStar_All.pipe_left
                                      (FStar_TypeChecker_Env.debug env)
                                      (FStar_Options.Other "Rel")
                                     in
                                  if uu____11478
                                  then
                                    let uu____11479 =
                                      FStar_Util.string_of_int
                                        tp.FStar_TypeChecker_Common.pid
                                       in
                                    FStar_Util.print1
                                      "Trying to solve by imitating arrow:%s\n"
                                      uu____11479
                                  else ());
                                 imitate_arrow
                                   (FStar_TypeChecker_Common.TProb tp) env
                                   wl1 flex flex_bs flex_t
                                   tp.FStar_TypeChecker_Common.relation
                                   this_rigid)))
                    else
                      (let uu____11482 =
                         attempt
                           [FStar_TypeChecker_Common.TProb
                              ((let uu___359_11485 = tp  in
                                {
                                  FStar_TypeChecker_Common.pid =
                                    (uu___359_11485.FStar_TypeChecker_Common.pid);
                                  FStar_TypeChecker_Common.lhs =
                                    (uu___359_11485.FStar_TypeChecker_Common.lhs);
                                  FStar_TypeChecker_Common.relation =
                                    FStar_TypeChecker_Common.EQ;
                                  FStar_TypeChecker_Common.rhs =
                                    (uu___359_11485.FStar_TypeChecker_Common.rhs);
                                  FStar_TypeChecker_Common.element =
                                    (uu___359_11485.FStar_TypeChecker_Common.element);
                                  FStar_TypeChecker_Common.logical_guard =
                                    (uu___359_11485.FStar_TypeChecker_Common.logical_guard);
                                  FStar_TypeChecker_Common.logical_guard_uvar
                                    =
                                    (uu___359_11485.FStar_TypeChecker_Common.logical_guard_uvar);
                                  FStar_TypeChecker_Common.reason =
                                    (uu___359_11485.FStar_TypeChecker_Common.reason);
                                  FStar_TypeChecker_Common.loc =
                                    (uu___359_11485.FStar_TypeChecker_Common.loc);
                                  FStar_TypeChecker_Common.rank =
                                    (uu___359_11485.FStar_TypeChecker_Common.rank)
                                }))] wl
                          in
                       solve env uu____11482)
                | uu____11486 ->
                    ((let uu____11488 =
                        FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                          (FStar_Options.Other "Rel")
                         in
                      if uu____11488
                      then
                        let uu____11489 =
                          FStar_Util.string_of_int
                            tp.FStar_TypeChecker_Common.pid
                           in
                        FStar_Util.print1
                          "Trying to solve by meeting refinements:%s\n"
                          uu____11489
                      else ());
                     (let uu____11491 =
                        FStar_Syntax_Util.head_and_args this_flex  in
                      match uu____11491 with
                      | (u,_args) ->
                          let uu____11528 =
                            let uu____11529 = FStar_Syntax_Subst.compress u
                               in
                            uu____11529.FStar_Syntax_Syntax.n  in
                          (match uu____11528 with
                           | FStar_Syntax_Syntax.Tm_uvar (ctx_uvar,_subst) ->
                               let equiv1 t =
                                 let uu____11556 =
                                   FStar_Syntax_Util.head_and_args t  in
                                 match uu____11556 with
                                 | (u',uu____11572) ->
                                     let uu____11593 =
                                       let uu____11594 = whnf env u'  in
                                       uu____11594.FStar_Syntax_Syntax.n  in
                                     (match uu____11593 with
                                      | FStar_Syntax_Syntax.Tm_uvar
                                          (ctx_uvar',_subst') ->
                                          FStar_Syntax_Unionfind.equiv
                                            ctx_uvar.FStar_Syntax_Syntax.ctx_uvar_head
                                            ctx_uvar'.FStar_Syntax_Syntax.ctx_uvar_head
                                      | uu____11615 -> false)
                                  in
                               let uu____11616 =
                                 FStar_All.pipe_right wl.attempting
                                   (FStar_List.partition
                                      (fun uu___329_11639  ->
                                         match uu___329_11639 with
                                         | FStar_TypeChecker_Common.TProb tp1
                                             ->
                                             let tp2 = maybe_invert tp1  in
                                             (match tp2.FStar_TypeChecker_Common.rank
                                              with
                                              | FStar_Pervasives_Native.Some
                                                  rank' when rank1 = rank' ->
                                                  if flip
                                                  then
                                                    equiv1
                                                      tp2.FStar_TypeChecker_Common.lhs
                                                  else
                                                    equiv1
                                                      tp2.FStar_TypeChecker_Common.rhs
                                              | uu____11648 -> false)
                                         | uu____11651 -> false))
                                  in
                               (match uu____11616 with
                                | (bounds_probs,rest) ->
                                    let bounds_typs =
                                      let uu____11665 = whnf env this_rigid
                                         in
                                      let uu____11666 =
                                        FStar_List.collect
                                          (fun uu___330_11672  ->
                                             match uu___330_11672 with
                                             | FStar_TypeChecker_Common.TProb
                                                 p ->
                                                 let uu____11678 =
                                                   if flip
                                                   then
                                                     whnf env
                                                       (maybe_invert p).FStar_TypeChecker_Common.rhs
                                                   else
                                                     whnf env
                                                       (maybe_invert p).FStar_TypeChecker_Common.lhs
                                                    in
                                                 [uu____11678]
                                             | uu____11680 -> [])
                                          bounds_probs
                                         in
                                      uu____11665 :: uu____11666  in
                                    let uu____11681 =
                                      meet_or_join
                                        (if flip
                                         then FStar_Syntax_Util.mk_conj_simp
                                         else FStar_Syntax_Util.mk_disj_simp)
                                        bounds_typs env wl
                                       in
                                    (match uu____11681 with
                                     | (bound,sub_probs,wl1) ->
                                         let uu____11712 =
                                           let flex_u =
                                             flex_uvar_head this_flex  in
                                           let bound1 =
                                             let uu____11727 =
                                               let uu____11728 =
                                                 FStar_Syntax_Subst.compress
                                                   bound
                                                  in
                                               uu____11728.FStar_Syntax_Syntax.n
                                                in
                                             match uu____11727 with
                                             | FStar_Syntax_Syntax.Tm_refine
                                                 (x,phi) when
                                                 (tp.FStar_TypeChecker_Common.relation
                                                    =
                                                    FStar_TypeChecker_Common.SUB)
                                                   &&
                                                   (let uu____11740 =
                                                      occurs flex_u
                                                        x.FStar_Syntax_Syntax.sort
                                                       in
                                                    FStar_Pervasives_Native.snd
                                                      uu____11740)
                                                 ->
                                                 x.FStar_Syntax_Syntax.sort
                                             | uu____11749 -> bound  in
                                           let uu____11750 =
                                             new_problem wl1 env bound1
                                               FStar_TypeChecker_Common.EQ
                                               this_flex
                                               FStar_Pervasives_Native.None
                                               tp.FStar_TypeChecker_Common.loc
                                               (if flip
                                                then "joining refinements"
                                                else "meeting refinements")
                                              in
                                           (bound1, uu____11750)  in
                                         (match uu____11712 with
                                          | (bound_typ,(eq_prob,wl')) ->
                                              (def_check_prob "meet_or_join2"
                                                 (FStar_TypeChecker_Common.TProb
                                                    eq_prob);
                                               (let uu____11779 =
                                                  FStar_All.pipe_left
                                                    (FStar_TypeChecker_Env.debug
                                                       env)
                                                    (FStar_Options.Other
                                                       "Rel")
                                                   in
                                                if uu____11779
                                                then
                                                  let wl'1 =
                                                    let uu___360_11781 = wl1
                                                       in
                                                    {
                                                      attempting =
                                                        ((FStar_TypeChecker_Common.TProb
                                                            eq_prob) ::
                                                        sub_probs);
                                                      wl_deferred =
                                                        (uu___360_11781.wl_deferred);
                                                      ctr =
                                                        (uu___360_11781.ctr);
                                                      defer_ok =
                                                        (uu___360_11781.defer_ok);
                                                      smt_ok =
                                                        (uu___360_11781.smt_ok);
                                                      tcenv =
                                                        (uu___360_11781.tcenv);
                                                      wl_implicits =
                                                        (uu___360_11781.wl_implicits)
                                                    }  in
                                                  let uu____11782 =
                                                    wl_to_string wl'1  in
                                                  FStar_Util.print1
                                                    "After meet/join refinements: %s\n"
                                                    uu____11782
                                                else ());
                                               (let tx =
                                                  FStar_Syntax_Unionfind.new_transaction
                                                    ()
                                                   in
                                                let uu____11785 =
                                                  solve_t env eq_prob
                                                    (let uu___361_11787 = wl'
                                                        in
                                                     {
                                                       attempting = sub_probs;
                                                       wl_deferred =
                                                         (uu___361_11787.wl_deferred);
                                                       ctr =
                                                         (uu___361_11787.ctr);
                                                       defer_ok = false;
                                                       smt_ok =
                                                         (uu___361_11787.smt_ok);
                                                       tcenv =
                                                         (uu___361_11787.tcenv);
                                                       wl_implicits =
                                                         (uu___361_11787.wl_implicits)
                                                     })
                                                   in
                                                match uu____11785 with
                                                | Success uu____11788 ->
                                                    let wl2 =
                                                      let uu___362_11794 =
                                                        wl'  in
                                                      {
                                                        attempting = rest;
                                                        wl_deferred =
                                                          (uu___362_11794.wl_deferred);
                                                        ctr =
                                                          (uu___362_11794.ctr);
                                                        defer_ok =
                                                          (uu___362_11794.defer_ok);
                                                        smt_ok =
                                                          (uu___362_11794.smt_ok);
                                                        tcenv =
                                                          (uu___362_11794.tcenv);
                                                        wl_implicits =
                                                          (uu___362_11794.wl_implicits)
                                                      }  in
                                                    let g =
                                                      FStar_List.fold_left
                                                        (fun g  ->
                                                           fun p  ->
                                                             FStar_Syntax_Util.mk_conj
                                                               g (p_guard p))
                                                        eq_prob.FStar_TypeChecker_Common.logical_guard
                                                        sub_probs
                                                       in
                                                    let wl3 =
                                                      solve_prob' false
                                                        (FStar_TypeChecker_Common.TProb
                                                           tp)
                                                        (FStar_Pervasives_Native.Some
                                                           g) [] wl2
                                                       in
                                                    let uu____11809 =
                                                      FStar_List.fold_left
                                                        (fun wl4  ->
                                                           fun p  ->
                                                             solve_prob' true
                                                               p
                                                               FStar_Pervasives_Native.None
                                                               [] wl4) wl3
                                                        bounds_probs
                                                       in
                                                    (FStar_Syntax_Unionfind.commit
                                                       tx;
                                                     solve env wl3)
                                                | Failed (p,msg) ->
                                                    (FStar_Syntax_Unionfind.rollback
                                                       tx;
                                                     (let uu____11821 =
                                                        FStar_All.pipe_left
                                                          (FStar_TypeChecker_Env.debug
                                                             env)
                                                          (FStar_Options.Other
                                                             "Rel")
                                                         in
                                                      if uu____11821
                                                      then
                                                        let uu____11822 =
                                                          let uu____11823 =
                                                            FStar_List.map
                                                              (prob_to_string
                                                                 env)
                                                              ((FStar_TypeChecker_Common.TProb
                                                                  eq_prob) ::
                                                              sub_probs)
                                                             in
                                                          FStar_All.pipe_right
                                                            uu____11823
                                                            (FStar_String.concat
                                                               "\n")
                                                           in
                                                        FStar_Util.print1
                                                          "meet/join attempted and failed to solve problems:\n%s\n"
                                                          uu____11822
                                                      else ());
                                                     (let uu____11829 =
                                                        let uu____11844 =
                                                          base_and_refinement
                                                            env bound_typ
                                                           in
                                                        (rank1, uu____11844)
                                                         in
                                                      match uu____11829 with
                                                      | (FStar_TypeChecker_Common.Rigid_flex
                                                         ,(t_base,FStar_Pervasives_Native.Some
                                                           uu____11866))
                                                          ->
                                                          let uu____11891 =
                                                            new_problem wl1
                                                              env t_base
                                                              FStar_TypeChecker_Common.EQ
                                                              this_flex
                                                              FStar_Pervasives_Native.None
                                                              tp.FStar_TypeChecker_Common.loc
                                                              "widened subtyping"
                                                             in
                                                          (match uu____11891
                                                           with
                                                           | (eq_prob1,wl2)
                                                               ->
                                                               (def_check_prob
                                                                  "meet_or_join3"
                                                                  (FStar_TypeChecker_Common.TProb
                                                                    eq_prob1);
                                                                (let wl3 =
                                                                   solve_prob'
                                                                    false
                                                                    (FStar_TypeChecker_Common.TProb
                                                                    tp)
                                                                    (FStar_Pervasives_Native.Some
                                                                    (p_guard
                                                                    (FStar_TypeChecker_Common.TProb
                                                                    eq_prob1)))
                                                                    [] wl2
                                                                    in
                                                                 let uu____11908
                                                                   =
                                                                   attempt
                                                                    [
                                                                    FStar_TypeChecker_Common.TProb
                                                                    eq_prob1]
                                                                    wl3
                                                                    in
                                                                 solve env
                                                                   uu____11908)))
                                                      | (FStar_TypeChecker_Common.Flex_rigid
                                                         ,(t_base,FStar_Pervasives_Native.Some
                                                           (x,phi)))
                                                          ->
                                                          let uu____11932 =
                                                            new_problem wl1
                                                              env t_base
                                                              FStar_TypeChecker_Common.EQ
                                                              this_flex
                                                              FStar_Pervasives_Native.None
                                                              tp.FStar_TypeChecker_Common.loc
                                                              "widened subtyping"
                                                             in
                                                          (match uu____11932
                                                           with
                                                           | (eq_prob1,wl2)
                                                               ->
                                                               (def_check_prob
                                                                  "meet_or_join4"
                                                                  (FStar_TypeChecker_Common.TProb
                                                                    eq_prob1);
                                                                (let phi1 =
                                                                   guard_on_element
                                                                    wl2 tp x
                                                                    phi
                                                                    in
                                                                 let wl3 =
                                                                   let uu____11950
                                                                    =
                                                                    let uu____11955
                                                                    =
                                                                    FStar_Syntax_Util.mk_conj
                                                                    phi1
                                                                    (p_guard
                                                                    (FStar_TypeChecker_Common.TProb
                                                                    eq_prob1))
                                                                     in
                                                                    FStar_Pervasives_Native.Some
                                                                    uu____11955
                                                                     in
                                                                   solve_prob'
                                                                    false
                                                                    (FStar_TypeChecker_Common.TProb
                                                                    tp)
                                                                    uu____11950
                                                                    [] wl2
                                                                    in
                                                                 let uu____11960
                                                                   =
                                                                   attempt
                                                                    [
                                                                    FStar_TypeChecker_Common.TProb
                                                                    eq_prob1]
                                                                    wl3
                                                                    in
                                                                 solve env
                                                                   uu____11960)))
                                                      | uu____11961 ->
                                                          giveup env
                                                            (Prims.strcat
                                                               "failed to solve sub-problems: "
                                                               msg) p)))))))
                           | uu____11976 when flip ->
                               let uu____11977 =
                                 let uu____11978 =
                                   FStar_Util.string_of_int
                                     (rank_t_num rank1)
                                    in
                                 let uu____11979 =
                                   prob_to_string env
                                     (FStar_TypeChecker_Common.TProb tp)
                                    in
                                 FStar_Util.format2
                                   "Impossible: (rank=%s) Not a flex-rigid: %s"
                                   uu____11978 uu____11979
                                  in
                               failwith uu____11977
                           | uu____11980 ->
                               let uu____11981 =
                                 let uu____11982 =
                                   FStar_Util.string_of_int
                                     (rank_t_num rank1)
                                    in
                                 let uu____11983 =
                                   prob_to_string env
                                     (FStar_TypeChecker_Common.TProb tp)
                                    in
                                 FStar_Util.format2
                                   "Impossible: (rank=%s) Not a rigid-flex: %s"
                                   uu____11982 uu____11983
                                  in
                               failwith uu____11981)))))

and (imitate_arrow :
  FStar_TypeChecker_Common.prob ->
    FStar_TypeChecker_Env.env ->
      worklist ->
        flex_t ->
          FStar_Syntax_Syntax.binders ->
            FStar_Syntax_Syntax.term ->
              FStar_TypeChecker_Common.rel ->
                FStar_Syntax_Syntax.term -> solution)
  =
  fun orig  ->
    fun env  ->
      fun wl  ->
        fun lhs  ->
          fun bs_lhs  ->
            fun t_res_lhs  ->
              fun rel  ->
                fun arrow1  ->
                  let bs_lhs_args =
                    FStar_List.map
                      (fun uu____12011  ->
                         match uu____12011 with
                         | (x,i) ->
                             let uu____12022 =
                               FStar_Syntax_Syntax.bv_to_name x  in
                             (uu____12022, i)) bs_lhs
                     in
                  let uu____12023 = lhs  in
                  match uu____12023 with
                  | (uu____12024,u_lhs,uu____12026) ->
                      let imitate_comp bs bs_terms c wl1 =
                        let imitate_tot_or_gtot t uopt f wl2 =
                          let uu____12119 =
                            match uopt with
                            | FStar_Pervasives_Native.None  ->
                                FStar_Syntax_Util.type_u ()
                            | FStar_Pervasives_Native.Some univ ->
                                let uu____12129 =
                                  FStar_Syntax_Syntax.mk
                                    (FStar_Syntax_Syntax.Tm_type univ)
                                    FStar_Pervasives_Native.None
                                    t.FStar_Syntax_Syntax.pos
                                   in
                                (uu____12129, univ)
                             in
                          match uu____12119 with
                          | (k,univ) ->
                              let uu____12136 =
                                copy_uvar u_lhs (FStar_List.append bs_lhs bs)
                                  k wl2
                                 in
                              (match uu____12136 with
                               | (uu____12151,u,wl3) ->
                                   let uu____12154 =
                                     f u (FStar_Pervasives_Native.Some univ)
                                      in
                                   (uu____12154, wl3))
                           in
                        match c.FStar_Syntax_Syntax.n with
                        | FStar_Syntax_Syntax.Total (t,uopt) ->
                            imitate_tot_or_gtot t uopt
                              FStar_Syntax_Syntax.mk_Total' wl1
                        | FStar_Syntax_Syntax.GTotal (t,uopt) ->
                            imitate_tot_or_gtot t uopt
                              FStar_Syntax_Syntax.mk_GTotal' wl1
                        | FStar_Syntax_Syntax.Comp ct ->
                            let uu____12180 =
                              let uu____12191 =
                                let uu____12200 =
                                  FStar_Syntax_Syntax.as_arg
                                    ct.FStar_Syntax_Syntax.result_typ
                                   in
                                uu____12200 ::
                                  (ct.FStar_Syntax_Syntax.effect_args)
                                 in
                              FStar_List.fold_right
                                (fun uu____12243  ->
                                   fun uu____12244  ->
                                     match (uu____12243, uu____12244) with
                                     | ((a,i),(out_args,wl2)) ->
                                         let uu____12323 =
                                           let uu____12330 =
                                             let uu____12333 =
                                               FStar_Syntax_Util.type_u ()
                                                in
                                             FStar_All.pipe_left
                                               FStar_Pervasives_Native.fst
                                               uu____12333
                                              in
                                           copy_uvar u_lhs [] uu____12330 wl2
                                            in
                                         (match uu____12323 with
                                          | (uu____12358,t_a,wl3) ->
                                              let uu____12361 =
                                                copy_uvar u_lhs bs t_a wl3
                                                 in
                                              (match uu____12361 with
                                               | (uu____12378,a',wl4) ->
                                                   (((a', i) :: out_args),
                                                     wl4)))) uu____12191
                                ([], wl1)
                               in
                            (match uu____12180 with
                             | (out_args,wl2) ->
                                 let ct' =
                                   let uu___363_12420 = ct  in
                                   let uu____12421 =
                                     let uu____12424 = FStar_List.hd out_args
                                        in
                                     FStar_Pervasives_Native.fst uu____12424
                                      in
                                   let uu____12433 = FStar_List.tl out_args
                                      in
                                   {
                                     FStar_Syntax_Syntax.comp_univs =
                                       (uu___363_12420.FStar_Syntax_Syntax.comp_univs);
                                     FStar_Syntax_Syntax.effect_name =
                                       (uu___363_12420.FStar_Syntax_Syntax.effect_name);
                                     FStar_Syntax_Syntax.result_typ =
                                       uu____12421;
                                     FStar_Syntax_Syntax.effect_args =
                                       uu____12433;
                                     FStar_Syntax_Syntax.flags =
                                       (uu___363_12420.FStar_Syntax_Syntax.flags)
                                   }  in
                                 ((let uu___364_12447 = c  in
                                   {
                                     FStar_Syntax_Syntax.n =
                                       (FStar_Syntax_Syntax.Comp ct');
                                     FStar_Syntax_Syntax.pos =
                                       (uu___364_12447.FStar_Syntax_Syntax.pos);
                                     FStar_Syntax_Syntax.vars =
                                       (uu___364_12447.FStar_Syntax_Syntax.vars)
                                   }), wl2))
                         in
                      let uu____12450 =
                        FStar_Syntax_Util.arrow_formals_comp arrow1  in
                      (match uu____12450 with
                       | (formals,c) ->
                           let rec aux bs bs_terms formals1 wl1 =
                             match formals1 with
                             | [] ->
                                 let uu____12504 =
                                   imitate_comp bs bs_terms c wl1  in
                                 (match uu____12504 with
                                  | (c',wl2) ->
                                      let lhs' =
                                        FStar_Syntax_Util.arrow bs c'  in
                                      let sol =
                                        let uu____12515 =
                                          let uu____12520 =
                                            FStar_Syntax_Util.abs bs_lhs lhs'
                                              (FStar_Pervasives_Native.Some
                                                 (FStar_Syntax_Util.residual_tot
                                                    t_res_lhs))
                                             in
                                          (u_lhs, uu____12520)  in
                                        TERM uu____12515  in
                                      let uu____12521 =
                                        mk_t_problem wl2 [] orig lhs' rel
                                          arrow1 FStar_Pervasives_Native.None
                                          "arrow imitation"
                                         in
                                      (match uu____12521 with
                                       | (sub_prob,wl3) ->
                                           let uu____12532 =
                                             let uu____12533 =
                                               solve_prob orig
                                                 FStar_Pervasives_Native.None
                                                 [sol] wl3
                                                in
                                             attempt [sub_prob] uu____12533
                                              in
                                           solve env uu____12532))
                             | (x,imp)::formals2 ->
                                 let uu____12547 =
                                   let uu____12554 =
                                     let uu____12557 =
                                       FStar_Syntax_Util.type_u ()  in
                                     FStar_All.pipe_right uu____12557
                                       FStar_Pervasives_Native.fst
                                      in
                                   copy_uvar u_lhs
                                     (FStar_List.append bs_lhs bs)
                                     uu____12554 wl1
                                    in
                                 (match uu____12547 with
                                  | (_ctx_u_x,u_x,wl2) ->
                                      let y =
                                        let uu____12576 =
                                          let uu____12579 =
                                            FStar_Syntax_Syntax.range_of_bv x
                                             in
                                          FStar_Pervasives_Native.Some
                                            uu____12579
                                           in
                                        FStar_Syntax_Syntax.new_bv
                                          uu____12576 u_x
                                         in
                                      let uu____12580 =
                                        let uu____12583 =
                                          let uu____12586 =
                                            let uu____12587 =
                                              FStar_Syntax_Syntax.bv_to_name
                                                y
                                               in
                                            (uu____12587, imp)  in
                                          [uu____12586]  in
                                        FStar_List.append bs_terms
                                          uu____12583
                                         in
                                      aux (FStar_List.append bs [(y, imp)])
                                        uu____12580 formals2 wl2)
                              in
                           let uu____12604 = occurs_check u_lhs arrow1  in
                           (match uu____12604 with
                            | (uu____12615,occurs_ok,msg) ->
                                if Prims.op_Negation occurs_ok
                                then
                                  let uu____12626 =
                                    let uu____12627 = FStar_Option.get msg
                                       in
                                    Prims.strcat "occurs-check failed: "
                                      uu____12627
                                     in
                                  giveup_or_defer env orig wl uu____12626
                                else aux [] [] formals wl))

and (solve_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      FStar_Syntax_Syntax.binders ->
        FStar_TypeChecker_Common.prob ->
          worklist ->
            (worklist ->
               FStar_Syntax_Syntax.binders ->
                 FStar_TypeChecker_Env.env ->
                   FStar_Syntax_Syntax.subst_elt Prims.list ->
                     (FStar_TypeChecker_Common.prob,worklist)
                       FStar_Pervasives_Native.tuple2)
              -> solution)
  =
  fun env  ->
    fun bs1  ->
      fun bs2  ->
        fun orig  ->
          fun wl  ->
            fun rhs  ->
              (let uu____12654 =
                 FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                   (FStar_Options.Other "Rel")
                  in
               if uu____12654
               then
                 let uu____12655 =
                   FStar_Syntax_Print.binders_to_string ", " bs1  in
                 let uu____12656 =
                   FStar_Syntax_Print.binders_to_string ", " bs2  in
                 FStar_Util.print3 "solve_binders\n\t%s\n%s\n\t%s\n"
                   uu____12655 (rel_to_string (p_rel orig)) uu____12656
               else ());
              (let rec aux wl1 scope env1 subst1 xs ys =
                 match (xs, ys) with
                 | ([],[]) ->
                     let uu____12761 = rhs wl1 scope env1 subst1  in
                     (match uu____12761 with
                      | (rhs_prob,wl2) ->
                          ((let uu____12781 =
                              FStar_All.pipe_left
                                (FStar_TypeChecker_Env.debug env1)
                                (FStar_Options.Other "Rel")
                               in
                            if uu____12781
                            then
                              let uu____12782 = prob_to_string env1 rhs_prob
                                 in
                              FStar_Util.print1 "rhs_prob = %s\n" uu____12782
                            else ());
                           (let formula = p_guard rhs_prob  in
                            ((FStar_Util.Inl ([rhs_prob], formula)), wl2))))
                 | ((hd1,imp)::xs1,(hd2,imp')::ys1) when imp = imp' ->
                     let hd11 =
                       let uu___365_12836 = hd1  in
                       let uu____12837 =
                         FStar_Syntax_Subst.subst subst1
                           hd1.FStar_Syntax_Syntax.sort
                          in
                       {
                         FStar_Syntax_Syntax.ppname =
                           (uu___365_12836.FStar_Syntax_Syntax.ppname);
                         FStar_Syntax_Syntax.index =
                           (uu___365_12836.FStar_Syntax_Syntax.index);
                         FStar_Syntax_Syntax.sort = uu____12837
                       }  in
                     let hd21 =
                       let uu___366_12841 = hd2  in
                       let uu____12842 =
                         FStar_Syntax_Subst.subst subst1
                           hd2.FStar_Syntax_Syntax.sort
                          in
                       {
                         FStar_Syntax_Syntax.ppname =
                           (uu___366_12841.FStar_Syntax_Syntax.ppname);
                         FStar_Syntax_Syntax.index =
                           (uu___366_12841.FStar_Syntax_Syntax.index);
                         FStar_Syntax_Syntax.sort = uu____12842
                       }  in
                     let uu____12845 =
                       let uu____12850 =
                         FStar_All.pipe_left invert_rel (p_rel orig)  in
                       mk_t_problem wl1 scope orig
                         hd11.FStar_Syntax_Syntax.sort uu____12850
                         hd21.FStar_Syntax_Syntax.sort
                         FStar_Pervasives_Native.None "Formal parameter"
                        in
                     (match uu____12845 with
                      | (prob,wl2) ->
                          let hd12 = FStar_Syntax_Syntax.freshen_bv hd11  in
                          let subst2 =
                            let uu____12869 =
                              FStar_Syntax_Subst.shift_subst
                                (Prims.parse_int "1") subst1
                               in
                            (FStar_Syntax_Syntax.DB
                               ((Prims.parse_int "0"), hd12))
                              :: uu____12869
                             in
                          let env2 = FStar_TypeChecker_Env.push_bv env1 hd12
                             in
                          let uu____12873 =
                            aux wl2 (FStar_List.append scope [(hd12, imp)])
                              env2 subst2 xs1 ys1
                             in
                          (match uu____12873 with
                           | (FStar_Util.Inl (sub_probs,phi),wl3) ->
                               let phi1 =
                                 let uu____12928 =
                                   FStar_TypeChecker_Env.close_forall env2
                                     [(hd12, imp)] phi
                                    in
                                 FStar_Syntax_Util.mk_conj (p_guard prob)
                                   uu____12928
                                  in
                               ((let uu____12940 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env2)
                                     (FStar_Options.Other "Rel")
                                    in
                                 if uu____12940
                                 then
                                   let uu____12941 =
                                     FStar_Syntax_Print.term_to_string phi1
                                      in
                                   let uu____12942 =
                                     FStar_Syntax_Print.bv_to_string hd12  in
                                   FStar_Util.print2
                                     "Formula is %s\n\thd1=%s\n" uu____12941
                                     uu____12942
                                 else ());
                                ((FStar_Util.Inl ((prob :: sub_probs), phi1)),
                                  wl3))
                           | fail1 -> fail1))
                 | uu____12969 ->
                     ((FStar_Util.Inr "arity or argument-qualifier mismatch"),
                       wl1)
                  in
               let uu____12998 = aux wl [] env [] bs1 bs2  in
               match uu____12998 with
               | (FStar_Util.Inr msg,wl1) -> giveup env msg orig
               | (FStar_Util.Inl (sub_probs,phi),wl1) ->
                   let wl2 =
                     solve_prob orig (FStar_Pervasives_Native.Some phi) []
                       wl1
                      in
                   let uu____13045 = attempt sub_probs wl2  in
                   solve env uu____13045)

and (solve_t : FStar_TypeChecker_Env.env -> tprob -> worklist -> solution) =
  fun env  ->
    fun problem  ->
      fun wl  ->
        def_check_prob "solve_t" (FStar_TypeChecker_Common.TProb problem);
        (let uu____13050 = compress_tprob wl.tcenv problem  in
         solve_t' env uu____13050 wl)

and (solve_t_flex_rigid_eq :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob ->
      worklist -> flex_t -> FStar_Syntax_Syntax.term -> solution)
  =
  fun env  ->
    fun orig  ->
      fun wl  ->
        fun lhs  ->
          fun rhs  ->
            let binders_as_bv_set bs =
              let uu____13064 = FStar_List.map FStar_Pervasives_Native.fst bs
                 in
              FStar_Util.as_set uu____13064 FStar_Syntax_Syntax.order_bv  in
            let mk_solution env1 lhs1 bs rhs1 =
              let uu____13094 = lhs1  in
              match uu____13094 with
              | (uu____13097,ctx_u,uu____13099) ->
                  let sol =
                    match bs with
                    | [] -> rhs1
                    | uu____13105 ->
                        let uu____13106 = sn_binders env1 bs  in
                        u_abs ctx_u.FStar_Syntax_Syntax.ctx_uvar_typ
                          uu____13106 rhs1
                     in
                  [TERM (ctx_u, sol)]
               in
            let try_quasi_pattern orig1 env1 wl1 lhs1 rhs1 =
              let uu____13153 = quasi_pattern env1 lhs1  in
              match uu____13153 with
              | FStar_Pervasives_Native.None  ->
                  ((FStar_Util.Inl "Not a quasi-pattern"), wl1)
              | FStar_Pervasives_Native.Some (bs,uu____13183) ->
                  let uu____13188 = lhs1  in
                  (match uu____13188 with
                   | (t_lhs,ctx_u,args) ->
                       let uu____13202 = occurs_check ctx_u rhs1  in
                       (match uu____13202 with
                        | (uvars1,occurs_ok,msg) ->
                            if Prims.op_Negation occurs_ok
                            then
                              let uu____13244 =
                                let uu____13251 =
                                  let uu____13252 = FStar_Option.get msg  in
                                  Prims.strcat
                                    "quasi-pattern, occurs-check failed: "
                                    uu____13252
                                   in
                                FStar_Util.Inl uu____13251  in
                              (uu____13244, wl1)
                            else
                              (let fvs_lhs =
                                 binders_as_bv_set
                                   (FStar_List.append
                                      ctx_u.FStar_Syntax_Syntax.ctx_uvar_binders
                                      bs)
                                  in
                               let fvs_rhs = FStar_Syntax_Free.names rhs1  in
                               let uu____13272 =
                                 let uu____13273 =
                                   FStar_Util.set_is_subset_of fvs_rhs
                                     fvs_lhs
                                    in
                                 Prims.op_Negation uu____13273  in
                               if uu____13272
                               then
                                 ((FStar_Util.Inl
                                     "quasi-pattern, free names on the RHS are not included in the LHS"),
                                   wl1)
                               else
                                 (let uu____13293 =
                                    let uu____13300 =
                                      mk_solution env1 lhs1 bs rhs1  in
                                    FStar_Util.Inr uu____13300  in
                                  let uu____13305 =
                                    restrict_all_uvars ctx_u uvars1 wl1  in
                                  (uu____13293, uu____13305)))))
               in
            let imitate_app orig1 env1 wl1 lhs1 bs_lhs t_res_lhs rhs1 =
              let bs_lhs_args =
                FStar_List.map
                  (fun uu____13367  ->
                     match uu____13367 with
                     | (x,i) ->
                         let uu____13378 = FStar_Syntax_Syntax.bv_to_name x
                            in
                         (uu____13378, i)) bs_lhs
                 in
              let uu____13379 = FStar_Syntax_Util.head_and_args rhs1  in
              match uu____13379 with
              | (rhs_hd,args) ->
                  let uu____13416 = FStar_Util.prefix args  in
                  (match uu____13416 with
                   | (args_rhs,last_arg_rhs) ->
                       let rhs' =
                         FStar_Syntax_Syntax.mk_Tm_app rhs_hd args_rhs
                           FStar_Pervasives_Native.None
                           rhs1.FStar_Syntax_Syntax.pos
                          in
                       let uu____13474 = lhs1  in
                       (match uu____13474 with
                        | (t_lhs,u_lhs,_lhs_args) ->
                            let uu____13478 =
                              let uu____13489 =
                                let uu____13496 =
                                  let uu____13499 =
                                    FStar_Syntax_Util.type_u ()  in
                                  FStar_All.pipe_left
                                    FStar_Pervasives_Native.fst uu____13499
                                   in
                                copy_uvar u_lhs [] uu____13496 wl1  in
                              match uu____13489 with
                              | (uu____13524,t_last_arg,wl2) ->
                                  let uu____13527 =
                                    let uu____13534 =
                                      let uu____13535 =
                                        let uu____13542 =
                                          FStar_Syntax_Syntax.null_binder
                                            t_last_arg
                                           in
                                        [uu____13542]  in
                                      FStar_List.append bs_lhs uu____13535
                                       in
                                    copy_uvar u_lhs uu____13534 t_res_lhs wl2
                                     in
                                  (match uu____13527 with
                                   | (uu____13569,lhs',wl3) ->
                                       let uu____13572 =
                                         copy_uvar u_lhs bs_lhs t_last_arg
                                           wl3
                                          in
                                       (match uu____13572 with
                                        | (uu____13589,lhs'_last_arg,wl4) ->
                                            (lhs', lhs'_last_arg, wl4)))
                               in
                            (match uu____13478 with
                             | (lhs',lhs'_last_arg,wl2) ->
                                 let sol =
                                   let uu____13610 =
                                     let uu____13611 =
                                       let uu____13616 =
                                         let uu____13617 =
                                           let uu____13620 =
                                             let uu____13625 =
                                               let uu____13626 =
                                                 FStar_Syntax_Syntax.as_arg
                                                   lhs'_last_arg
                                                  in
                                               [uu____13626]  in
                                             FStar_Syntax_Syntax.mk_Tm_app
                                               lhs' uu____13625
                                              in
                                           uu____13620
                                             FStar_Pervasives_Native.None
                                             t_lhs.FStar_Syntax_Syntax.pos
                                            in
                                         FStar_Syntax_Util.abs bs_lhs
                                           uu____13617
                                           (FStar_Pervasives_Native.Some
                                              (FStar_Syntax_Util.residual_tot
                                                 t_res_lhs))
                                          in
                                       (u_lhs, uu____13616)  in
                                     TERM uu____13611  in
                                   [uu____13610]  in
                                 let uu____13647 =
                                   let uu____13654 =
                                     mk_t_problem wl2 [] orig1 lhs'
                                       FStar_TypeChecker_Common.EQ rhs'
                                       FStar_Pervasives_Native.None
                                       "first-order lhs"
                                      in
                                   match uu____13654 with
                                   | (p1,wl3) ->
                                       let uu____13671 =
                                         mk_t_problem wl3 [] orig1
                                           lhs'_last_arg
                                           FStar_TypeChecker_Common.EQ
                                           (FStar_Pervasives_Native.fst
                                              last_arg_rhs)
                                           FStar_Pervasives_Native.None
                                           "first-order rhs"
                                          in
                                       (match uu____13671 with
                                        | (p2,wl4) -> ([p1; p2], wl4))
                                    in
                                 (match uu____13647 with
                                  | (sub_probs,wl3) ->
                                      let uu____13698 =
                                        let uu____13699 =
                                          solve_prob orig1
                                            FStar_Pervasives_Native.None sol
                                            wl3
                                           in
                                        attempt sub_probs uu____13699  in
                                      solve env1 uu____13698))))
               in
            let first_order orig1 env1 wl1 lhs1 rhs1 =
              let is_app rhs2 =
                let uu____13732 = FStar_Syntax_Util.head_and_args rhs2  in
                match uu____13732 with
                | (uu____13747,args) ->
                    (match args with | [] -> false | uu____13775 -> true)
                 in
              let is_arrow rhs2 =
                let uu____13790 =
                  let uu____13791 = FStar_Syntax_Subst.compress rhs2  in
                  uu____13791.FStar_Syntax_Syntax.n  in
                match uu____13790 with
                | FStar_Syntax_Syntax.Tm_arrow uu____13794 -> true
                | uu____13807 -> false  in
              let uu____13808 = quasi_pattern env1 lhs1  in
              match uu____13808 with
              | FStar_Pervasives_Native.None  ->
                  let uu____13819 =
                    let uu____13820 = prob_to_string env1 orig1  in
                    FStar_Util.format1
                      "first_order heursitic cannot solve %s; lhs not a quasi-pattern"
                      uu____13820
                     in
                  giveup_or_defer env1 orig1 wl1 uu____13819
              | FStar_Pervasives_Native.Some (bs_lhs,t_res_lhs) ->
                  let uu____13827 = is_app rhs1  in
                  if uu____13827
                  then imitate_app orig1 env1 wl1 lhs1 bs_lhs t_res_lhs rhs1
                  else
                    (let uu____13829 = is_arrow rhs1  in
                     if uu____13829
                     then
                       imitate_arrow orig1 env1 wl1 lhs1 bs_lhs t_res_lhs
                         FStar_TypeChecker_Common.EQ rhs1
                     else
                       (let uu____13831 =
                          let uu____13832 = prob_to_string env1 orig1  in
                          FStar_Util.format1
                            "first_order heursitic cannot solve %s; rhs not an app or arrow"
                            uu____13832
                           in
                        giveup_or_defer env1 orig1 wl1 uu____13831))
               in
            match p_rel orig with
            | FStar_TypeChecker_Common.SUB  ->
                if wl.defer_ok
                then giveup_or_defer env orig wl "flex-rigid subtyping"
                else solve_t_flex_rigid_eq env (make_prob_eq orig) wl lhs rhs
            | FStar_TypeChecker_Common.SUBINV  ->
                if wl.defer_ok
                then giveup_or_defer env orig wl "flex-rigid subtyping"
                else solve_t_flex_rigid_eq env (make_prob_eq orig) wl lhs rhs
            | FStar_TypeChecker_Common.EQ  ->
                let uu____13835 = lhs  in
                (match uu____13835 with
                 | (_t1,ctx_uv,args_lhs) ->
                     let uu____13839 =
                       pat_vars env
                         ctx_uv.FStar_Syntax_Syntax.ctx_uvar_binders args_lhs
                        in
                     (match uu____13839 with
                      | FStar_Pervasives_Native.Some lhs_binders ->
                          let rhs1 = sn env rhs  in
                          let names_to_string1 fvs =
                            let uu____13854 =
                              let uu____13857 = FStar_Util.set_elements fvs
                                 in
                              FStar_List.map FStar_Syntax_Print.bv_to_string
                                uu____13857
                               in
                            FStar_All.pipe_right uu____13854
                              (FStar_String.concat ", ")
                             in
                          let fvs1 =
                            binders_as_bv_set
                              (FStar_List.append
                                 ctx_uv.FStar_Syntax_Syntax.ctx_uvar_binders
                                 lhs_binders)
                             in
                          let fvs2 = FStar_Syntax_Free.names rhs1  in
                          let uu____13872 = occurs_check ctx_uv rhs1  in
                          (match uu____13872 with
                           | (uvars1,occurs_ok,msg) ->
                               if Prims.op_Negation occurs_ok
                               then
                                 let uu____13894 =
                                   let uu____13895 = FStar_Option.get msg  in
                                   Prims.strcat "occurs-check failed: "
                                     uu____13895
                                    in
                                 giveup_or_defer env orig wl uu____13894
                               else
                                 (let uu____13897 =
                                    FStar_Util.set_is_subset_of fvs2 fvs1  in
                                  if uu____13897
                                  then
                                    let sol =
                                      mk_solution env lhs lhs_binders rhs1
                                       in
                                    let wl1 =
                                      restrict_all_uvars ctx_uv uvars1 wl  in
                                    let uu____13902 =
                                      solve_prob orig
                                        FStar_Pervasives_Native.None sol wl1
                                       in
                                    solve env uu____13902
                                  else
                                    if wl.defer_ok
                                    then
                                      (let uu____13904 =
                                         let uu____13905 =
                                           names_to_string1 fvs2  in
                                         let uu____13906 =
                                           names_to_string1 fvs1  in
                                         let uu____13907 =
                                           FStar_Syntax_Print.binders_to_string
                                             ", "
                                             (FStar_List.append
                                                ctx_uv.FStar_Syntax_Syntax.ctx_uvar_binders
                                                lhs_binders)
                                            in
                                         FStar_Util.format3
                                           "free names in the RHS {%s} are out of scope for the LHS: {%s}, {%s}"
                                           uu____13905 uu____13906
                                           uu____13907
                                          in
                                       giveup_or_defer env orig wl
                                         uu____13904)
                                    else first_order orig env wl lhs rhs1))
                      | uu____13913 ->
                          if wl.defer_ok
                          then giveup_or_defer env orig wl "Not a pattern"
                          else
                            (let uu____13917 =
                               try_quasi_pattern orig env wl lhs rhs  in
                             match uu____13917 with
                             | (FStar_Util.Inr sol,wl1) ->
                                 let uu____13940 =
                                   solve_prob orig
                                     FStar_Pervasives_Native.None sol wl1
                                    in
                                 solve env uu____13940
                             | (FStar_Util.Inl msg,uu____13942) ->
                                 first_order orig env wl lhs rhs)))

and (solve_t_flex_flex :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob -> worklist -> flex_t -> flex_t -> solution)
  =
  fun env  ->
    fun orig  ->
      fun wl  ->
        fun lhs  ->
          fun rhs  ->
            match p_rel orig with
            | FStar_TypeChecker_Common.SUB  ->
                if wl.defer_ok
                then giveup_or_defer env orig wl "flex-flex subtyping"
                else solve_t_flex_flex env (make_prob_eq orig) wl lhs rhs
            | FStar_TypeChecker_Common.SUBINV  ->
                if wl.defer_ok
                then giveup_or_defer env orig wl "flex-flex subtyping"
                else solve_t_flex_flex env (make_prob_eq orig) wl lhs rhs
            | FStar_TypeChecker_Common.EQ  ->
                if
                  wl.defer_ok &&
                    ((Prims.op_Negation (is_flex_pat lhs)) ||
                       (Prims.op_Negation (is_flex_pat rhs)))
                then giveup_or_defer env orig wl "flex-flex non-pattern"
                else
                  (let uu____13971 =
                     let uu____13988 = quasi_pattern env lhs  in
                     let uu____13995 = quasi_pattern env rhs  in
                     (uu____13988, uu____13995)  in
                   match uu____13971 with
                   | (FStar_Pervasives_Native.Some
                      (binders_lhs,t_res_lhs),FStar_Pervasives_Native.Some
                      (binders_rhs,t_res_rhs)) ->
                       let uu____14038 = lhs  in
                       (match uu____14038 with
                        | ({ FStar_Syntax_Syntax.n = uu____14039;
                             FStar_Syntax_Syntax.pos = range;
                             FStar_Syntax_Syntax.vars = uu____14041;_},u_lhs,uu____14043)
                            ->
                            let uu____14046 = rhs  in
                            (match uu____14046 with
                             | (uu____14047,u_rhs,uu____14049) ->
                                 let uu____14050 =
                                   (FStar_Syntax_Unionfind.equiv
                                      u_lhs.FStar_Syntax_Syntax.ctx_uvar_head
                                      u_rhs.FStar_Syntax_Syntax.ctx_uvar_head)
                                     && (binders_eq binders_lhs binders_rhs)
                                    in
                                 if uu____14050
                                 then
                                   let uu____14051 =
                                     solve_prob orig
                                       FStar_Pervasives_Native.None [] wl
                                      in
                                   solve env uu____14051
                                 else
                                   (let uu____14053 =
                                      mk_t_problem wl [] orig t_res_lhs
                                        FStar_TypeChecker_Common.EQ t_res_rhs
                                        FStar_Pervasives_Native.None
                                        "flex-flex typing"
                                       in
                                    match uu____14053 with
                                    | (sub_prob,wl1) ->
                                        let uu____14064 =
                                          maximal_prefix
                                            u_lhs.FStar_Syntax_Syntax.ctx_uvar_binders
                                            u_rhs.FStar_Syntax_Syntax.ctx_uvar_binders
                                           in
                                        (match uu____14064 with
                                         | (ctx_w,(ctx_l,ctx_r)) ->
                                             let gamma_w =
                                               gamma_until
                                                 u_lhs.FStar_Syntax_Syntax.ctx_uvar_gamma
                                                 ctx_w
                                                in
                                             let zs =
                                               intersect_binders gamma_w
                                                 (FStar_List.append ctx_l
                                                    binders_lhs)
                                                 (FStar_List.append ctx_r
                                                    binders_rhs)
                                                in
                                             let uu____14092 =
                                               let uu____14099 =
                                                 let uu____14102 =
                                                   FStar_Syntax_Syntax.mk_Total
                                                     t_res_lhs
                                                    in
                                                 FStar_Syntax_Util.arrow zs
                                                   uu____14102
                                                  in
                                               new_uvar
                                                 (Prims.strcat
                                                    "flex-flex quasi:"
                                                    (Prims.strcat "\tlhs="
                                                       (Prims.strcat
                                                          u_lhs.FStar_Syntax_Syntax.ctx_uvar_reason
                                                          (Prims.strcat
                                                             "\trhs="
                                                             u_rhs.FStar_Syntax_Syntax.ctx_uvar_reason))))
                                                 wl1 range gamma_w ctx_w
                                                 uu____14099
                                                 FStar_Syntax_Syntax.Strict
                                                in
                                             (match uu____14092 with
                                              | (uu____14105,w,wl2) ->
                                                  let w_app =
                                                    let uu____14111 =
                                                      let uu____14116 =
                                                        FStar_List.map
                                                          (fun uu____14125 
                                                             ->
                                                             match uu____14125
                                                             with
                                                             | (z,uu____14131)
                                                                 ->
                                                                 let uu____14132
                                                                   =
                                                                   FStar_Syntax_Syntax.bv_to_name
                                                                    z
                                                                    in
                                                                 FStar_Syntax_Syntax.as_arg
                                                                   uu____14132)
                                                          zs
                                                         in
                                                      FStar_Syntax_Syntax.mk_Tm_app
                                                        w uu____14116
                                                       in
                                                    uu____14111
                                                      FStar_Pervasives_Native.None
                                                      w.FStar_Syntax_Syntax.pos
                                                     in
                                                  ((let uu____14136 =
                                                      FStar_All.pipe_left
                                                        (FStar_TypeChecker_Env.debug
                                                           env)
                                                        (FStar_Options.Other
                                                           "Rel")
                                                       in
                                                    if uu____14136
                                                    then
                                                      let uu____14137 =
                                                        let uu____14140 =
                                                          flex_t_to_string
                                                            lhs
                                                           in
                                                        let uu____14141 =
                                                          let uu____14144 =
                                                            flex_t_to_string
                                                              rhs
                                                             in
                                                          let uu____14145 =
                                                            let uu____14148 =
                                                              term_to_string
                                                                w
                                                               in
                                                            let uu____14149 =
                                                              let uu____14152
                                                                =
                                                                FStar_Syntax_Print.binders_to_string
                                                                  ", "
                                                                  (FStar_List.append
                                                                    ctx_l
                                                                    binders_lhs)
                                                                 in
                                                              let uu____14157
                                                                =
                                                                let uu____14160
                                                                  =
                                                                  FStar_Syntax_Print.binders_to_string
                                                                    ", "
                                                                    (
                                                                    FStar_List.append
                                                                    ctx_r
                                                                    binders_rhs)
                                                                   in
                                                                let uu____14165
                                                                  =
                                                                  let uu____14168
                                                                    =
                                                                    FStar_Syntax_Print.binders_to_string
                                                                    ", " zs
                                                                     in
                                                                  [uu____14168]
                                                                   in
                                                                uu____14160
                                                                  ::
                                                                  uu____14165
                                                                 in
                                                              uu____14152 ::
                                                                uu____14157
                                                               in
                                                            uu____14148 ::
                                                              uu____14149
                                                             in
                                                          uu____14144 ::
                                                            uu____14145
                                                           in
                                                        uu____14140 ::
                                                          uu____14141
                                                         in
                                                      FStar_Util.print
                                                        "flex-flex quasi:\n\tlhs=%s\n\trhs=%s\n\tsol=%s\n\tctx_l@binders_lhs=%s\n\tctx_r@binders_rhs=%s\n\tzs=%s\n"
                                                        uu____14137
                                                    else ());
                                                   (let sol =
                                                      let s1 =
                                                        let uu____14174 =
                                                          let uu____14179 =
                                                            FStar_Syntax_Util.abs
                                                              binders_lhs
                                                              w_app
                                                              (FStar_Pervasives_Native.Some
                                                                 (FStar_Syntax_Util.residual_tot
                                                                    t_res_lhs))
                                                             in
                                                          (u_lhs,
                                                            uu____14179)
                                                           in
                                                        TERM uu____14174  in
                                                      let uu____14180 =
                                                        FStar_Syntax_Unionfind.equiv
                                                          u_lhs.FStar_Syntax_Syntax.ctx_uvar_head
                                                          u_rhs.FStar_Syntax_Syntax.ctx_uvar_head
                                                         in
                                                      if uu____14180
                                                      then [s1]
                                                      else
                                                        (let s2 =
                                                           let uu____14185 =
                                                             let uu____14190
                                                               =
                                                               FStar_Syntax_Util.abs
                                                                 binders_rhs
                                                                 w_app
                                                                 (FStar_Pervasives_Native.Some
                                                                    (
                                                                    FStar_Syntax_Util.residual_tot
                                                                    t_res_lhs))
                                                                in
                                                             (u_rhs,
                                                               uu____14190)
                                                              in
                                                           TERM uu____14185
                                                            in
                                                         [s1; s2])
                                                       in
                                                    let uu____14191 =
                                                      let uu____14192 =
                                                        solve_prob orig
                                                          FStar_Pervasives_Native.None
                                                          sol wl2
                                                         in
                                                      attempt [sub_prob]
                                                        uu____14192
                                                       in
                                                    solve env uu____14191)))))))
                   | uu____14193 ->
                       giveup_or_defer env orig wl "flex-flex: non-patterns")

and (solve_t' : FStar_TypeChecker_Env.env -> tprob -> worklist -> solution) =
  fun env  ->
    fun problem  ->
      fun wl  ->
        def_check_prob "solve_t'.1" (FStar_TypeChecker_Common.TProb problem);
        (let giveup_or_defer1 orig msg = giveup_or_defer env orig wl msg  in
         let rigid_heads_match env1 need_unif orig wl1 t1 t2 =
           (let uu____14257 =
              FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                (FStar_Options.Other "Rel")
               in
            if uu____14257
            then
              let uu____14258 = FStar_Syntax_Print.term_to_string t1  in
              let uu____14259 = FStar_Syntax_Print.tag_of_term t1  in
              let uu____14260 = FStar_Syntax_Print.term_to_string t2  in
              let uu____14261 = FStar_Syntax_Print.tag_of_term t2  in
              FStar_Util.print5 "Heads %s: %s (%s) and %s (%s)\n"
                (if need_unif then "need unification" else "match")
                uu____14258 uu____14259 uu____14260 uu____14261
            else ());
           (let uu____14264 = FStar_Syntax_Util.head_and_args t1  in
            match uu____14264 with
            | (head1,args1) ->
                let uu____14301 = FStar_Syntax_Util.head_and_args t2  in
                (match uu____14301 with
                 | (head2,args2) ->
                     let nargs = FStar_List.length args1  in
                     if nargs <> (FStar_List.length args2)
                     then
                       let uu____14355 =
                         let uu____14356 =
                           FStar_Syntax_Print.term_to_string head1  in
                         let uu____14357 = args_to_string args1  in
                         let uu____14358 =
                           FStar_Syntax_Print.term_to_string head2  in
                         let uu____14359 = args_to_string args2  in
                         FStar_Util.format4
                           "unequal number of arguments: %s[%s] and %s[%s]"
                           uu____14356 uu____14357 uu____14358 uu____14359
                          in
                       giveup env1 uu____14355 orig
                     else
                       (let uu____14361 =
                          (nargs = (Prims.parse_int "0")) ||
                            (let uu____14367 =
                               FStar_Syntax_Util.eq_args args1 args2  in
                             uu____14367 = FStar_Syntax_Util.Equal)
                           in
                        if uu____14361
                        then
                          (if need_unif
                           then
                             solve_t env1
                               (let uu___367_14369 = problem  in
                                {
                                  FStar_TypeChecker_Common.pid =
                                    (uu___367_14369.FStar_TypeChecker_Common.pid);
                                  FStar_TypeChecker_Common.lhs = head1;
                                  FStar_TypeChecker_Common.relation =
                                    (uu___367_14369.FStar_TypeChecker_Common.relation);
                                  FStar_TypeChecker_Common.rhs = head2;
                                  FStar_TypeChecker_Common.element =
                                    (uu___367_14369.FStar_TypeChecker_Common.element);
                                  FStar_TypeChecker_Common.logical_guard =
                                    (uu___367_14369.FStar_TypeChecker_Common.logical_guard);
                                  FStar_TypeChecker_Common.logical_guard_uvar
                                    =
                                    (uu___367_14369.FStar_TypeChecker_Common.logical_guard_uvar);
                                  FStar_TypeChecker_Common.reason =
                                    (uu___367_14369.FStar_TypeChecker_Common.reason);
                                  FStar_TypeChecker_Common.loc =
                                    (uu___367_14369.FStar_TypeChecker_Common.loc);
                                  FStar_TypeChecker_Common.rank =
                                    (uu___367_14369.FStar_TypeChecker_Common.rank)
                                }) wl1
                           else
                             (let uu____14371 =
                                solve_maybe_uinsts env1 orig head1 head2 wl1
                                 in
                              match uu____14371 with
                              | USolved wl2 ->
                                  let uu____14373 =
                                    solve_prob orig
                                      FStar_Pervasives_Native.None [] wl2
                                     in
                                  solve env1 uu____14373
                              | UFailed msg -> giveup env1 msg orig
                              | UDeferred wl2 ->
                                  solve env1
                                    (defer "universe constraints" orig wl2)))
                        else
                          (let uu____14377 = base_and_refinement env1 t1  in
                           match uu____14377 with
                           | (base1,refinement1) ->
                               let uu____14402 = base_and_refinement env1 t2
                                  in
                               (match uu____14402 with
                                | (base2,refinement2) ->
                                    (match (refinement1, refinement2) with
                                     | (FStar_Pervasives_Native.None
                                        ,FStar_Pervasives_Native.None ) ->
                                         if need_unif
                                         then
                                           let argp =
                                             FStar_List.zip
                                               ((head1,
                                                  FStar_Pervasives_Native.None)
                                               :: args1)
                                               ((head2,
                                                  FStar_Pervasives_Native.None)
                                               :: args2)
                                              in
                                           let uu____14506 =
                                             FStar_List.fold_right
                                               (fun uu____14542  ->
                                                  fun uu____14543  ->
                                                    match (uu____14542,
                                                            uu____14543)
                                                    with
                                                    | (((a1,uu____14587),
                                                        (a2,uu____14589)),
                                                       (probs,wl2)) ->
                                                        let uu____14622 =
                                                          let uu____14629 =
                                                            p_scope orig  in
                                                          mk_problem wl2
                                                            uu____14629 orig
                                                            a1
                                                            FStar_TypeChecker_Common.EQ
                                                            a2
                                                            FStar_Pervasives_Native.None
                                                            "index"
                                                           in
                                                        (match uu____14622
                                                         with
                                                         | (prob',wl3) ->
                                                             (((FStar_TypeChecker_Common.TProb
                                                                  prob') ::
                                                               probs), wl3)))
                                               argp ([], wl1)
                                              in
                                           (match uu____14506 with
                                            | (subprobs,wl2) ->
                                                ((let uu____14659 =
                                                    FStar_All.pipe_left
                                                      (FStar_TypeChecker_Env.debug
                                                         env1)
                                                      (FStar_Options.Other
                                                         "Rel")
                                                     in
                                                  if uu____14659
                                                  then
                                                    let uu____14660 =
                                                      FStar_Syntax_Print.list_to_string
                                                        (prob_to_string env1)
                                                        subprobs
                                                       in
                                                    FStar_Util.print1
                                                      "Adding subproblems for arguments: %s"
                                                      uu____14660
                                                  else ());
                                                 (let formula =
                                                    let uu____14665 =
                                                      FStar_List.map
                                                        (fun p  -> p_guard p)
                                                        subprobs
                                                       in
                                                    FStar_Syntax_Util.mk_conj_l
                                                      uu____14665
                                                     in
                                                  let wl3 =
                                                    solve_prob orig
                                                      (FStar_Pervasives_Native.Some
                                                         formula) [] wl2
                                                     in
                                                  let uu____14673 =
                                                    attempt subprobs wl3  in
                                                  solve env1 uu____14673)))
                                         else
                                           (let uu____14675 =
                                              solve_maybe_uinsts env1 orig
                                                head1 head2 wl1
                                               in
                                            match uu____14675 with
                                            | UFailed msg ->
                                                giveup env1 msg orig
                                            | UDeferred wl2 ->
                                                solve env1
                                                  (defer
                                                     "universe constraints"
                                                     orig wl2)
                                            | USolved wl2 ->
                                                let uu____14679 =
                                                  FStar_List.fold_right2
                                                    (fun uu____14712  ->
                                                       fun uu____14713  ->
                                                         fun uu____14714  ->
                                                           match (uu____14712,
                                                                   uu____14713,
                                                                   uu____14714)
                                                           with
                                                           | ((a,uu____14750),
                                                              (a',uu____14752),
                                                              (subprobs,wl3))
                                                               ->
                                                               let uu____14773
                                                                 =
                                                                 mk_t_problem
                                                                   wl3 []
                                                                   orig a
                                                                   FStar_TypeChecker_Common.EQ
                                                                   a'
                                                                   FStar_Pervasives_Native.None
                                                                   "index"
                                                                  in
                                                               (match uu____14773
                                                                with
                                                                | (p,wl4) ->
                                                                    ((p ::
                                                                    subprobs),
                                                                    wl4)))
                                                    args1 args2 ([], wl2)
                                                   in
                                                (match uu____14679 with
                                                 | (subprobs,wl3) ->
                                                     ((let uu____14801 =
                                                         FStar_All.pipe_left
                                                           (FStar_TypeChecker_Env.debug
                                                              env1)
                                                           (FStar_Options.Other
                                                              "Rel")
                                                          in
                                                       if uu____14801
                                                       then
                                                         let uu____14802 =
                                                           FStar_Syntax_Print.list_to_string
                                                             (prob_to_string
                                                                env1)
                                                             subprobs
                                                            in
                                                         FStar_Util.print1
                                                           "Adding subproblems for arguments: %s\n"
                                                           uu____14802
                                                       else ());
                                                      FStar_List.iter
                                                        (def_check_prob
                                                           "solve_t' subprobs")
                                                        subprobs;
                                                      (let formula =
                                                         let uu____14808 =
                                                           FStar_List.map
                                                             p_guard subprobs
                                                            in
                                                         FStar_Syntax_Util.mk_conj_l
                                                           uu____14808
                                                          in
                                                       let wl4 =
                                                         solve_prob orig
                                                           (FStar_Pervasives_Native.Some
                                                              formula) [] wl3
                                                          in
                                                       let uu____14816 =
                                                         attempt subprobs wl4
                                                          in
                                                       solve env1 uu____14816))))
                                     | uu____14817 ->
                                         let lhs =
                                           force_refinement
                                             (base1, refinement1)
                                            in
                                         let rhs =
                                           force_refinement
                                             (base2, refinement2)
                                            in
                                         solve_t env1
                                           (let uu___368_14853 = problem  in
                                            {
                                              FStar_TypeChecker_Common.pid =
                                                (uu___368_14853.FStar_TypeChecker_Common.pid);
                                              FStar_TypeChecker_Common.lhs =
                                                lhs;
                                              FStar_TypeChecker_Common.relation
                                                =
                                                (uu___368_14853.FStar_TypeChecker_Common.relation);
                                              FStar_TypeChecker_Common.rhs =
                                                rhs;
                                              FStar_TypeChecker_Common.element
                                                =
                                                (uu___368_14853.FStar_TypeChecker_Common.element);
                                              FStar_TypeChecker_Common.logical_guard
                                                =
                                                (uu___368_14853.FStar_TypeChecker_Common.logical_guard);
                                              FStar_TypeChecker_Common.logical_guard_uvar
                                                =
                                                (uu___368_14853.FStar_TypeChecker_Common.logical_guard_uvar);
                                              FStar_TypeChecker_Common.reason
                                                =
                                                (uu___368_14853.FStar_TypeChecker_Common.reason);
                                              FStar_TypeChecker_Common.loc =
                                                (uu___368_14853.FStar_TypeChecker_Common.loc);
                                              FStar_TypeChecker_Common.rank =
                                                (uu___368_14853.FStar_TypeChecker_Common.rank)
                                            }) wl1))))))
            in
         let try_match_heuristic env1 orig wl1 s1 s2 t1t2_opt =
           let try_solve_branch scrutinee p =
             let uu____14928 = destruct_flex_t scrutinee wl1  in
             match uu____14928 with
             | ((_t,uv,_args),wl2) ->
                 let tc_annot env2 t =
                   let uu____14954 =
                     env2.FStar_TypeChecker_Env.type_of env2 t  in
                   match uu____14954 with | (t1,uu____14966,g) -> (t1, g)  in
                 let uu____14968 =
                   FStar_TypeChecker_PatternUtils.pat_as_exp true env1 p
                     tc_annot
                    in
                 (match uu____14968 with
                  | (xs,pat_term,uu____14983,uu____14984) ->
                      let uu____14989 =
                        FStar_List.fold_left
                          (fun uu____15012  ->
                             fun x  ->
                               match uu____15012 with
                               | (subst1,wl3) ->
                                   let t_x =
                                     FStar_Syntax_Subst.subst subst1
                                       x.FStar_Syntax_Syntax.sort
                                      in
                                   let uu____15033 = copy_uvar uv [] t_x wl3
                                      in
                                   (match uu____15033 with
                                    | (uu____15050,u,wl4) ->
                                        let subst2 =
                                          (FStar_Syntax_Syntax.NT (x, u)) ::
                                          subst1  in
                                        (subst2, wl4))) ([], wl2) xs
                         in
                      (match uu____14989 with
                       | (subst1,wl3) ->
                           let pat_term1 =
                             FStar_Syntax_Subst.subst subst1 pat_term  in
                           let uu____15071 =
                             new_problem wl3 env1 scrutinee
                               FStar_TypeChecker_Common.EQ pat_term1
                               FStar_Pervasives_Native.None
                               scrutinee.FStar_Syntax_Syntax.pos
                               "match heuristic"
                              in
                           (match uu____15071 with
                            | (prob,wl4) ->
                                let wl' =
                                  let uu___369_15087 = wl4  in
                                  {
                                    attempting =
                                      [FStar_TypeChecker_Common.TProb prob];
                                    wl_deferred = [];
                                    ctr = (uu___369_15087.ctr);
                                    defer_ok = false;
                                    smt_ok = false;
                                    tcenv = (uu___369_15087.tcenv);
                                    wl_implicits = []
                                  }  in
                                let tx =
                                  FStar_Syntax_Unionfind.new_transaction ()
                                   in
                                let uu____15103 = solve env1 wl'  in
                                (match uu____15103 with
                                 | Success (uu____15106,imps) ->
                                     let wl'1 =
                                       let uu___370_15109 = wl'  in
                                       {
                                         attempting = [orig];
                                         wl_deferred =
                                           (uu___370_15109.wl_deferred);
                                         ctr = (uu___370_15109.ctr);
                                         defer_ok = (uu___370_15109.defer_ok);
                                         smt_ok = (uu___370_15109.smt_ok);
                                         tcenv = (uu___370_15109.tcenv);
                                         wl_implicits =
                                           (uu___370_15109.wl_implicits)
                                       }  in
                                     let uu____15110 = solve env1 wl'1  in
                                     (match uu____15110 with
                                      | Success (uu____15113,imps') ->
                                          (FStar_Syntax_Unionfind.commit tx;
                                           FStar_Pervasives_Native.Some
                                             ((let uu___371_15117 = wl4  in
                                               {
                                                 attempting =
                                                   (uu___371_15117.attempting);
                                                 wl_deferred =
                                                   (uu___371_15117.wl_deferred);
                                                 ctr = (uu___371_15117.ctr);
                                                 defer_ok =
                                                   (uu___371_15117.defer_ok);
                                                 smt_ok =
                                                   (uu___371_15117.smt_ok);
                                                 tcenv =
                                                   (uu___371_15117.tcenv);
                                                 wl_implicits =
                                                   (FStar_List.append
                                                      wl4.wl_implicits
                                                      (FStar_List.append imps
                                                         imps'))
                                               })))
                                      | Failed uu____15134 ->
                                          (FStar_Syntax_Unionfind.rollback tx;
                                           FStar_Pervasives_Native.None))
                                 | uu____15140 ->
                                     (FStar_Syntax_Unionfind.rollback tx;
                                      FStar_Pervasives_Native.None)))))
              in
           match t1t2_opt with
           | FStar_Pervasives_Native.None  ->
               FStar_Util.Inr FStar_Pervasives_Native.None
           | FStar_Pervasives_Native.Some (t1,t2) ->
               ((let uu____15161 =
                   FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                     (FStar_Options.Other "Rel")
                    in
                 if uu____15161
                 then
                   let uu____15162 = FStar_Syntax_Print.term_to_string t1  in
                   let uu____15163 = FStar_Syntax_Print.term_to_string t2  in
                   FStar_Util.print2 "Trying match heuristic for %s vs. %s\n"
                     uu____15162 uu____15163
                 else ());
                (let uu____15165 =
                   let uu____15186 =
                     let uu____15195 = FStar_Syntax_Util.unmeta t1  in
                     (s1, uu____15195)  in
                   let uu____15202 =
                     let uu____15211 = FStar_Syntax_Util.unmeta t2  in
                     (s2, uu____15211)  in
                   (uu____15186, uu____15202)  in
                 match uu____15165 with
                 | ((uu____15240,{
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Tm_match
                                     (scrutinee,branches);
                                   FStar_Syntax_Syntax.pos = uu____15243;
                                   FStar_Syntax_Syntax.vars = uu____15244;_}),
                    (s,t)) ->
                     let uu____15315 =
                       let uu____15316 = is_flex scrutinee  in
                       Prims.op_Negation uu____15316  in
                     if uu____15315
                     then
                       ((let uu____15324 =
                           FStar_All.pipe_left
                             (FStar_TypeChecker_Env.debug env1)
                             (FStar_Options.Other "Rel")
                            in
                         if uu____15324
                         then
                           let uu____15325 =
                             FStar_Syntax_Print.term_to_string scrutinee  in
                           FStar_Util.print1
                             "match head %s is not a flex term\n" uu____15325
                         else ());
                        FStar_Util.Inr FStar_Pervasives_Native.None)
                     else
                       if wl1.defer_ok
                       then
                         ((let uu____15337 =
                             FStar_All.pipe_left
                               (FStar_TypeChecker_Env.debug env1)
                               (FStar_Options.Other "Rel")
                              in
                           if uu____15337
                           then FStar_Util.print_string "Deferring ... \n"
                           else ());
                          FStar_Util.Inl "defer")
                       else
                         ((let uu____15343 =
                             FStar_All.pipe_left
                               (FStar_TypeChecker_Env.debug env1)
                               (FStar_Options.Other "Rel")
                              in
                           if uu____15343
                           then
                             let uu____15344 =
                               FStar_Syntax_Print.term_to_string scrutinee
                                in
                             let uu____15345 =
                               FStar_Syntax_Print.term_to_string t  in
                             FStar_Util.print2
                               "Heuristic applicable with scrutinee %s and other side = %s\n"
                               uu____15344 uu____15345
                           else ());
                          (let pat_discriminates uu___331_15366 =
                             match uu___331_15366 with
                             | ({
                                  FStar_Syntax_Syntax.v =
                                    FStar_Syntax_Syntax.Pat_constant
                                    uu____15381;
                                  FStar_Syntax_Syntax.p = uu____15382;_},FStar_Pervasives_Native.None
                                ,uu____15383) -> true
                             | ({
                                  FStar_Syntax_Syntax.v =
                                    FStar_Syntax_Syntax.Pat_cons uu____15396;
                                  FStar_Syntax_Syntax.p = uu____15397;_},FStar_Pervasives_Native.None
                                ,uu____15398) -> true
                             | uu____15423 -> false  in
                           let head_matching_branch =
                             FStar_All.pipe_right branches
                               (FStar_Util.try_find
                                  (fun b  ->
                                     if pat_discriminates b
                                     then
                                       let uu____15523 =
                                         FStar_Syntax_Subst.open_branch b  in
                                       match uu____15523 with
                                       | (uu____15524,uu____15525,t') ->
                                           let uu____15543 =
                                             head_matches_delta env1 s t'  in
                                           (match uu____15543 with
                                            | (FullMatch ,uu____15554) ->
                                                true
                                            | (HeadMatch
                                               uu____15567,uu____15568) ->
                                                true
                                            | uu____15581 -> false)
                                     else false))
                              in
                           match head_matching_branch with
                           | FStar_Pervasives_Native.None  ->
                               ((let uu____15614 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env1)
                                     (FStar_Options.Other "Rel")
                                    in
                                 if uu____15614
                                 then
                                   FStar_Util.print_string
                                     "No head_matching branch\n"
                                 else ());
                                (let try_branches =
                                   let uu____15631 =
                                     FStar_Util.prefix_until
                                       (fun b  ->
                                          Prims.op_Negation
                                            (pat_discriminates b)) branches
                                      in
                                   match uu____15631 with
                                   | FStar_Pervasives_Native.Some
                                       (branches1,uu____15731,uu____15732) ->
                                       branches1
                                   | uu____15877 -> branches  in
                                 let uu____15932 =
                                   FStar_Util.find_map try_branches
                                     (fun uu____15951  ->
                                        match uu____15951 with
                                        | (p,uu____15967,uu____15968) ->
                                            try_solve_branch scrutinee p)
                                    in
                                 FStar_All.pipe_left
                                   (fun _0_23  -> FStar_Util.Inr _0_23)
                                   uu____15932))
                           | FStar_Pervasives_Native.Some (p,uu____15992,e)
                               ->
                               ((let uu____16025 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env1)
                                     (FStar_Options.Other "Rel")
                                    in
                                 if uu____16025
                                 then
                                   let uu____16026 =
                                     FStar_Syntax_Print.pat_to_string p  in
                                   let uu____16027 =
                                     FStar_Syntax_Print.term_to_string e  in
                                   FStar_Util.print2
                                     "Found head matching branch %s -> e\n"
                                     uu____16026 uu____16027
                                 else ());
                                (let uu____16029 =
                                   try_solve_branch scrutinee p  in
                                 FStar_All.pipe_left
                                   (fun _0_24  -> FStar_Util.Inr _0_24)
                                   uu____16029))))
                 | ((s,t),(uu____16044,{
                                         FStar_Syntax_Syntax.n =
                                           FStar_Syntax_Syntax.Tm_match
                                           (scrutinee,branches);
                                         FStar_Syntax_Syntax.pos =
                                           uu____16047;
                                         FStar_Syntax_Syntax.vars =
                                           uu____16048;_}))
                     ->
                     let uu____16117 =
                       let uu____16118 = is_flex scrutinee  in
                       Prims.op_Negation uu____16118  in
                     if uu____16117
                     then
                       ((let uu____16126 =
                           FStar_All.pipe_left
                             (FStar_TypeChecker_Env.debug env1)
                             (FStar_Options.Other "Rel")
                            in
                         if uu____16126
                         then
                           let uu____16127 =
                             FStar_Syntax_Print.term_to_string scrutinee  in
                           FStar_Util.print1
                             "match head %s is not a flex term\n" uu____16127
                         else ());
                        FStar_Util.Inr FStar_Pervasives_Native.None)
                     else
                       if wl1.defer_ok
                       then
                         ((let uu____16139 =
                             FStar_All.pipe_left
                               (FStar_TypeChecker_Env.debug env1)
                               (FStar_Options.Other "Rel")
                              in
                           if uu____16139
                           then FStar_Util.print_string "Deferring ... \n"
                           else ());
                          FStar_Util.Inl "defer")
                       else
                         ((let uu____16145 =
                             FStar_All.pipe_left
                               (FStar_TypeChecker_Env.debug env1)
                               (FStar_Options.Other "Rel")
                              in
                           if uu____16145
                           then
                             let uu____16146 =
                               FStar_Syntax_Print.term_to_string scrutinee
                                in
                             let uu____16147 =
                               FStar_Syntax_Print.term_to_string t  in
                             FStar_Util.print2
                               "Heuristic applicable with scrutinee %s and other side = %s\n"
                               uu____16146 uu____16147
                           else ());
                          (let pat_discriminates uu___331_16168 =
                             match uu___331_16168 with
                             | ({
                                  FStar_Syntax_Syntax.v =
                                    FStar_Syntax_Syntax.Pat_constant
                                    uu____16183;
                                  FStar_Syntax_Syntax.p = uu____16184;_},FStar_Pervasives_Native.None
                                ,uu____16185) -> true
                             | ({
                                  FStar_Syntax_Syntax.v =
                                    FStar_Syntax_Syntax.Pat_cons uu____16198;
                                  FStar_Syntax_Syntax.p = uu____16199;_},FStar_Pervasives_Native.None
                                ,uu____16200) -> true
                             | uu____16225 -> false  in
                           let head_matching_branch =
                             FStar_All.pipe_right branches
                               (FStar_Util.try_find
                                  (fun b  ->
                                     if pat_discriminates b
                                     then
                                       let uu____16325 =
                                         FStar_Syntax_Subst.open_branch b  in
                                       match uu____16325 with
                                       | (uu____16326,uu____16327,t') ->
                                           let uu____16345 =
                                             head_matches_delta env1 s t'  in
                                           (match uu____16345 with
                                            | (FullMatch ,uu____16356) ->
                                                true
                                            | (HeadMatch
                                               uu____16369,uu____16370) ->
                                                true
                                            | uu____16383 -> false)
                                     else false))
                              in
                           match head_matching_branch with
                           | FStar_Pervasives_Native.None  ->
                               ((let uu____16416 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env1)
                                     (FStar_Options.Other "Rel")
                                    in
                                 if uu____16416
                                 then
                                   FStar_Util.print_string
                                     "No head_matching branch\n"
                                 else ());
                                (let try_branches =
                                   let uu____16433 =
                                     FStar_Util.prefix_until
                                       (fun b  ->
                                          Prims.op_Negation
                                            (pat_discriminates b)) branches
                                      in
                                   match uu____16433 with
                                   | FStar_Pervasives_Native.Some
                                       (branches1,uu____16533,uu____16534) ->
                                       branches1
                                   | uu____16679 -> branches  in
                                 let uu____16734 =
                                   FStar_Util.find_map try_branches
                                     (fun uu____16753  ->
                                        match uu____16753 with
                                        | (p,uu____16769,uu____16770) ->
                                            try_solve_branch scrutinee p)
                                    in
                                 FStar_All.pipe_left
                                   (fun _0_25  -> FStar_Util.Inr _0_25)
                                   uu____16734))
                           | FStar_Pervasives_Native.Some (p,uu____16794,e)
                               ->
                               ((let uu____16827 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env1)
                                     (FStar_Options.Other "Rel")
                                    in
                                 if uu____16827
                                 then
                                   let uu____16828 =
                                     FStar_Syntax_Print.pat_to_string p  in
                                   let uu____16829 =
                                     FStar_Syntax_Print.term_to_string e  in
                                   FStar_Util.print2
                                     "Found head matching branch %s -> e\n"
                                     uu____16828 uu____16829
                                 else ());
                                (let uu____16831 =
                                   try_solve_branch scrutinee p  in
                                 FStar_All.pipe_left
                                   (fun _0_26  -> FStar_Util.Inr _0_26)
                                   uu____16831))))
                 | uu____16844 ->
                     ((let uu____16866 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env1)
                           (FStar_Options.Other "Rel")
                          in
                       if uu____16866
                       then
                         let uu____16867 = FStar_Syntax_Print.tag_of_term t1
                            in
                         let uu____16868 = FStar_Syntax_Print.tag_of_term t2
                            in
                         FStar_Util.print2
                           "Heuristic not applicable: tag lhs=%s, rhs=%s\n"
                           uu____16867 uu____16868
                       else ());
                      FStar_Util.Inr FStar_Pervasives_Native.None)))
            in
         let rigid_rigid_delta env1 orig wl1 head1 head2 t1 t2 =
           (let uu____16909 =
              FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                (FStar_Options.Other "RelDelta")
               in
            if uu____16909
            then
              let uu____16910 = FStar_Syntax_Print.tag_of_term t1  in
              let uu____16911 = FStar_Syntax_Print.tag_of_term t2  in
              let uu____16912 = FStar_Syntax_Print.term_to_string t1  in
              let uu____16913 = FStar_Syntax_Print.term_to_string t2  in
              FStar_Util.print4 "rigid_rigid_delta of %s-%s (%s, %s)\n"
                uu____16910 uu____16911 uu____16912 uu____16913
            else ());
           (let uu____16915 = head_matches_delta env1 t1 t2  in
            match uu____16915 with
            | (m,o) ->
                (match (m, o) with
                 | (MisMatch uu____16946,uu____16947) ->
                     let rec may_relate head3 =
                       let uu____16974 =
                         let uu____16975 = FStar_Syntax_Subst.compress head3
                            in
                         uu____16975.FStar_Syntax_Syntax.n  in
                       match uu____16974 with
                       | FStar_Syntax_Syntax.Tm_name uu____16978 -> true
                       | FStar_Syntax_Syntax.Tm_match uu____16979 -> true
                       | FStar_Syntax_Syntax.Tm_fvar
                           { FStar_Syntax_Syntax.fv_name = uu____17002;
                             FStar_Syntax_Syntax.fv_delta =
                               FStar_Syntax_Syntax.Delta_equational_at_level
                               uu____17003;
                             FStar_Syntax_Syntax.fv_qual = uu____17004;_}
                           -> true
                       | FStar_Syntax_Syntax.Tm_fvar
                           { FStar_Syntax_Syntax.fv_name = uu____17007;
                             FStar_Syntax_Syntax.fv_delta =
                               FStar_Syntax_Syntax.Delta_abstract uu____17008;
                             FStar_Syntax_Syntax.fv_qual = uu____17009;_}
                           ->
                           problem.FStar_TypeChecker_Common.relation =
                             FStar_TypeChecker_Common.EQ
                       | FStar_Syntax_Syntax.Tm_ascribed
                           (t,uu____17013,uu____17014) -> may_relate t
                       | FStar_Syntax_Syntax.Tm_uinst (t,uu____17056) ->
                           may_relate t
                       | FStar_Syntax_Syntax.Tm_meta (t,uu____17062) ->
                           may_relate t
                       | uu____17067 -> false  in
                     let uu____17068 =
                       try_match_heuristic env1 orig wl1 t1 t2 o  in
                     (match uu____17068 with
                      | FStar_Util.Inl _defer_ok ->
                          giveup_or_defer1 orig "delaying match heuristic"
                      | FStar_Util.Inr (FStar_Pervasives_Native.Some wl2) ->
                          solve env1 wl2
                      | FStar_Util.Inr (FStar_Pervasives_Native.None ) ->
                          let uu____17083 =
                            ((may_relate head1) || (may_relate head2)) &&
                              wl1.smt_ok
                             in
                          if uu____17083
                          then
                            let uu____17084 =
                              guard_of_prob env1 wl1 problem t1 t2  in
                            (match uu____17084 with
                             | (guard,wl2) ->
                                 let uu____17091 =
                                   solve_prob orig
                                     (FStar_Pervasives_Native.Some guard) []
                                     wl2
                                    in
                                 solve env1 uu____17091)
                          else
                            (let uu____17093 =
                               let uu____17094 =
                                 FStar_Syntax_Print.term_to_string head1  in
                               let uu____17095 =
                                 FStar_Syntax_Print.term_to_string head2  in
                               FStar_Util.format2 "head mismatch (%s vs %s)"
                                 uu____17094 uu____17095
                                in
                             giveup env1 uu____17093 orig))
                 | (HeadMatch (true ),uu____17096) when
                     problem.FStar_TypeChecker_Common.relation <>
                       FStar_TypeChecker_Common.EQ
                     ->
                     if wl1.smt_ok
                     then
                       let uu____17109 = guard_of_prob env1 wl1 problem t1 t2
                          in
                       (match uu____17109 with
                        | (guard,wl2) ->
                            let uu____17116 =
                              solve_prob orig
                                (FStar_Pervasives_Native.Some guard) [] wl2
                               in
                            solve env1 uu____17116)
                     else
                       (let uu____17118 =
                          let uu____17119 =
                            FStar_Syntax_Print.term_to_string t1  in
                          let uu____17120 =
                            FStar_Syntax_Print.term_to_string t2  in
                          FStar_Util.format2
                            "head mismatch for subtyping (%s vs %s)"
                            uu____17119 uu____17120
                           in
                        giveup env1 uu____17118 orig)
                 | (uu____17121,FStar_Pervasives_Native.Some (t11,t21)) ->
                     solve_t env1
                       (let uu___372_17135 = problem  in
                        {
                          FStar_TypeChecker_Common.pid =
                            (uu___372_17135.FStar_TypeChecker_Common.pid);
                          FStar_TypeChecker_Common.lhs = t11;
                          FStar_TypeChecker_Common.relation =
                            (uu___372_17135.FStar_TypeChecker_Common.relation);
                          FStar_TypeChecker_Common.rhs = t21;
                          FStar_TypeChecker_Common.element =
                            (uu___372_17135.FStar_TypeChecker_Common.element);
                          FStar_TypeChecker_Common.logical_guard =
                            (uu___372_17135.FStar_TypeChecker_Common.logical_guard);
                          FStar_TypeChecker_Common.logical_guard_uvar =
                            (uu___372_17135.FStar_TypeChecker_Common.logical_guard_uvar);
                          FStar_TypeChecker_Common.reason =
                            (uu___372_17135.FStar_TypeChecker_Common.reason);
                          FStar_TypeChecker_Common.loc =
                            (uu___372_17135.FStar_TypeChecker_Common.loc);
                          FStar_TypeChecker_Common.rank =
                            (uu___372_17135.FStar_TypeChecker_Common.rank)
                        }) wl1
                 | (HeadMatch unif,FStar_Pervasives_Native.None ) ->
                     rigid_heads_match env1 unif orig wl1 t1 t2
                 | (FullMatch ,FStar_Pervasives_Native.None ) ->
                     rigid_heads_match env1 false orig wl1 t1 t2))
            in
         let orig = FStar_TypeChecker_Common.TProb problem  in
         def_check_prob "solve_t'.2" orig;
         (let uu____17159 =
            FStar_Util.physical_equality problem.FStar_TypeChecker_Common.lhs
              problem.FStar_TypeChecker_Common.rhs
             in
          if uu____17159
          then
            let uu____17160 =
              solve_prob orig FStar_Pervasives_Native.None [] wl  in
            solve env uu____17160
          else
            (let t1 = problem.FStar_TypeChecker_Common.lhs  in
             let t2 = problem.FStar_TypeChecker_Common.rhs  in
             (let uu____17165 =
                let uu____17168 = p_scope orig  in
                FStar_List.map FStar_Pervasives_Native.fst uu____17168  in
              FStar_TypeChecker_Env.def_check_closed_in (p_loc orig) "ref.t1"
                uu____17165 t1);
             (let uu____17180 =
                let uu____17183 = p_scope orig  in
                FStar_List.map FStar_Pervasives_Native.fst uu____17183  in
              FStar_TypeChecker_Env.def_check_closed_in (p_loc orig) "ref.t2"
                uu____17180 t2);
             (let uu____17195 =
                FStar_TypeChecker_Env.debug env (FStar_Options.Other "Rel")
                 in
              if uu____17195
              then
                let uu____17196 =
                  FStar_Util.string_of_int
                    problem.FStar_TypeChecker_Common.pid
                   in
                let uu____17197 =
                  let uu____17198 = FStar_Syntax_Print.tag_of_term t1  in
                  let uu____17199 =
                    let uu____17200 = FStar_Syntax_Print.term_to_string t1
                       in
                    Prims.strcat "::" uu____17200  in
                  Prims.strcat uu____17198 uu____17199  in
                let uu____17201 =
                  let uu____17202 = FStar_Syntax_Print.tag_of_term t2  in
                  let uu____17203 =
                    let uu____17204 = FStar_Syntax_Print.term_to_string t2
                       in
                    Prims.strcat "::" uu____17204  in
                  Prims.strcat uu____17202 uu____17203  in
                FStar_Util.print3 "Attempting %s (%s vs %s)\n" uu____17196
                  uu____17197 uu____17201
              else ());
             (let r = FStar_TypeChecker_Env.get_range env  in
              match ((t1.FStar_Syntax_Syntax.n), (t2.FStar_Syntax_Syntax.n))
              with
              | (FStar_Syntax_Syntax.Tm_delayed uu____17207,uu____17208) ->
                  failwith "Impossible: terms were not compressed"
              | (uu____17231,FStar_Syntax_Syntax.Tm_delayed uu____17232) ->
                  failwith "Impossible: terms were not compressed"
              | (FStar_Syntax_Syntax.Tm_ascribed uu____17255,uu____17256) ->
                  let uu____17283 =
                    let uu___373_17284 = problem  in
                    let uu____17285 = FStar_Syntax_Util.unascribe t1  in
                    {
                      FStar_TypeChecker_Common.pid =
                        (uu___373_17284.FStar_TypeChecker_Common.pid);
                      FStar_TypeChecker_Common.lhs = uu____17285;
                      FStar_TypeChecker_Common.relation =
                        (uu___373_17284.FStar_TypeChecker_Common.relation);
                      FStar_TypeChecker_Common.rhs =
                        (uu___373_17284.FStar_TypeChecker_Common.rhs);
                      FStar_TypeChecker_Common.element =
                        (uu___373_17284.FStar_TypeChecker_Common.element);
                      FStar_TypeChecker_Common.logical_guard =
                        (uu___373_17284.FStar_TypeChecker_Common.logical_guard);
                      FStar_TypeChecker_Common.logical_guard_uvar =
                        (uu___373_17284.FStar_TypeChecker_Common.logical_guard_uvar);
                      FStar_TypeChecker_Common.reason =
                        (uu___373_17284.FStar_TypeChecker_Common.reason);
                      FStar_TypeChecker_Common.loc =
                        (uu___373_17284.FStar_TypeChecker_Common.loc);
                      FStar_TypeChecker_Common.rank =
                        (uu___373_17284.FStar_TypeChecker_Common.rank)
                    }  in
                  solve_t' env uu____17283 wl
              | (FStar_Syntax_Syntax.Tm_meta uu____17286,uu____17287) ->
                  let uu____17294 =
                    let uu___374_17295 = problem  in
                    let uu____17296 = FStar_Syntax_Util.unmeta t1  in
                    {
                      FStar_TypeChecker_Common.pid =
                        (uu___374_17295.FStar_TypeChecker_Common.pid);
                      FStar_TypeChecker_Common.lhs = uu____17296;
                      FStar_TypeChecker_Common.relation =
                        (uu___374_17295.FStar_TypeChecker_Common.relation);
                      FStar_TypeChecker_Common.rhs =
                        (uu___374_17295.FStar_TypeChecker_Common.rhs);
                      FStar_TypeChecker_Common.element =
                        (uu___374_17295.FStar_TypeChecker_Common.element);
                      FStar_TypeChecker_Common.logical_guard =
                        (uu___374_17295.FStar_TypeChecker_Common.logical_guard);
                      FStar_TypeChecker_Common.logical_guard_uvar =
                        (uu___374_17295.FStar_TypeChecker_Common.logical_guard_uvar);
                      FStar_TypeChecker_Common.reason =
                        (uu___374_17295.FStar_TypeChecker_Common.reason);
                      FStar_TypeChecker_Common.loc =
                        (uu___374_17295.FStar_TypeChecker_Common.loc);
                      FStar_TypeChecker_Common.rank =
                        (uu___374_17295.FStar_TypeChecker_Common.rank)
                    }  in
                  solve_t' env uu____17294 wl
              | (uu____17297,FStar_Syntax_Syntax.Tm_ascribed uu____17298) ->
                  let uu____17325 =
                    let uu___375_17326 = problem  in
                    let uu____17327 = FStar_Syntax_Util.unascribe t2  in
                    {
                      FStar_TypeChecker_Common.pid =
                        (uu___375_17326.FStar_TypeChecker_Common.pid);
                      FStar_TypeChecker_Common.lhs =
                        (uu___375_17326.FStar_TypeChecker_Common.lhs);
                      FStar_TypeChecker_Common.relation =
                        (uu___375_17326.FStar_TypeChecker_Common.relation);
                      FStar_TypeChecker_Common.rhs = uu____17327;
                      FStar_TypeChecker_Common.element =
                        (uu___375_17326.FStar_TypeChecker_Common.element);
                      FStar_TypeChecker_Common.logical_guard =
                        (uu___375_17326.FStar_TypeChecker_Common.logical_guard);
                      FStar_TypeChecker_Common.logical_guard_uvar =
                        (uu___375_17326.FStar_TypeChecker_Common.logical_guard_uvar);
                      FStar_TypeChecker_Common.reason =
                        (uu___375_17326.FStar_TypeChecker_Common.reason);
                      FStar_TypeChecker_Common.loc =
                        (uu___375_17326.FStar_TypeChecker_Common.loc);
                      FStar_TypeChecker_Common.rank =
                        (uu___375_17326.FStar_TypeChecker_Common.rank)
                    }  in
                  solve_t' env uu____17325 wl
              | (uu____17328,FStar_Syntax_Syntax.Tm_meta uu____17329) ->
                  let uu____17336 =
                    let uu___376_17337 = problem  in
                    let uu____17338 = FStar_Syntax_Util.unmeta t2  in
                    {
                      FStar_TypeChecker_Common.pid =
                        (uu___376_17337.FStar_TypeChecker_Common.pid);
                      FStar_TypeChecker_Common.lhs =
                        (uu___376_17337.FStar_TypeChecker_Common.lhs);
                      FStar_TypeChecker_Common.relation =
                        (uu___376_17337.FStar_TypeChecker_Common.relation);
                      FStar_TypeChecker_Common.rhs = uu____17338;
                      FStar_TypeChecker_Common.element =
                        (uu___376_17337.FStar_TypeChecker_Common.element);
                      FStar_TypeChecker_Common.logical_guard =
                        (uu___376_17337.FStar_TypeChecker_Common.logical_guard);
                      FStar_TypeChecker_Common.logical_guard_uvar =
                        (uu___376_17337.FStar_TypeChecker_Common.logical_guard_uvar);
                      FStar_TypeChecker_Common.reason =
                        (uu___376_17337.FStar_TypeChecker_Common.reason);
                      FStar_TypeChecker_Common.loc =
                        (uu___376_17337.FStar_TypeChecker_Common.loc);
                      FStar_TypeChecker_Common.rank =
                        (uu___376_17337.FStar_TypeChecker_Common.rank)
                    }  in
                  solve_t' env uu____17336 wl
              | (FStar_Syntax_Syntax.Tm_quoted
                 (t11,uu____17340),FStar_Syntax_Syntax.Tm_quoted
                 (t21,uu____17342)) ->
                  let uu____17351 =
                    solve_prob orig FStar_Pervasives_Native.None [] wl  in
                  solve env uu____17351
              | (FStar_Syntax_Syntax.Tm_bvar uu____17352,uu____17353) ->
                  failwith
                    "Only locally nameless! We should never see a de Bruijn variable"
              | (uu____17354,FStar_Syntax_Syntax.Tm_bvar uu____17355) ->
                  failwith
                    "Only locally nameless! We should never see a de Bruijn variable"
              | (FStar_Syntax_Syntax.Tm_type u1,FStar_Syntax_Syntax.Tm_type
                 u2) -> solve_one_universe_eq env orig u1 u2 wl
              | (FStar_Syntax_Syntax.Tm_arrow
                 (bs1,c1),FStar_Syntax_Syntax.Tm_arrow (bs2,c2)) ->
                  let mk_c c uu___332_17414 =
                    match uu___332_17414 with
                    | [] -> c
                    | bs ->
                        let uu____17436 =
                          FStar_Syntax_Syntax.mk
                            (FStar_Syntax_Syntax.Tm_arrow (bs, c))
                            FStar_Pervasives_Native.None
                            c.FStar_Syntax_Syntax.pos
                           in
                        FStar_Syntax_Syntax.mk_Total uu____17436
                     in
                  let uu____17445 =
                    match_num_binders (bs1, (mk_c c1)) (bs2, (mk_c c2))  in
                  (match uu____17445 with
                   | ((bs11,c11),(bs21,c21)) ->
                       solve_binders env bs11 bs21 orig wl
                         (fun wl1  ->
                            fun scope  ->
                              fun env1  ->
                                fun subst1  ->
                                  let c12 =
                                    FStar_Syntax_Subst.subst_comp subst1 c11
                                     in
                                  let c22 =
                                    FStar_Syntax_Subst.subst_comp subst1 c21
                                     in
                                  let rel =
                                    let uu____17568 =
                                      FStar_Options.use_eq_at_higher_order ()
                                       in
                                    if uu____17568
                                    then FStar_TypeChecker_Common.EQ
                                    else
                                      problem.FStar_TypeChecker_Common.relation
                                     in
                                  mk_c_problem wl1 scope orig c12 rel c22
                                    FStar_Pervasives_Native.None
                                    "function co-domain"))
              | (FStar_Syntax_Syntax.Tm_abs
                 (bs1,tbody1,lopt1),FStar_Syntax_Syntax.Tm_abs
                 (bs2,tbody2,lopt2)) ->
                  let mk_t t l uu___333_17643 =
                    match uu___333_17643 with
                    | [] -> t
                    | bs ->
                        FStar_Syntax_Syntax.mk
                          (FStar_Syntax_Syntax.Tm_abs (bs, t, l))
                          FStar_Pervasives_Native.None
                          t.FStar_Syntax_Syntax.pos
                     in
                  let uu____17677 =
                    match_num_binders (bs1, (mk_t tbody1 lopt1))
                      (bs2, (mk_t tbody2 lopt2))
                     in
                  (match uu____17677 with
                   | ((bs11,tbody11),(bs21,tbody21)) ->
                       solve_binders env bs11 bs21 orig wl
                         (fun wl1  ->
                            fun scope  ->
                              fun env1  ->
                                fun subst1  ->
                                  let uu____17796 =
                                    FStar_Syntax_Subst.subst subst1 tbody11
                                     in
                                  let uu____17797 =
                                    FStar_Syntax_Subst.subst subst1 tbody21
                                     in
                                  mk_t_problem wl1 scope orig uu____17796
                                    problem.FStar_TypeChecker_Common.relation
                                    uu____17797 FStar_Pervasives_Native.None
                                    "lambda co-domain"))
              | (FStar_Syntax_Syntax.Tm_abs uu____17798,uu____17799) ->
                  let is_abs t =
                    match t.FStar_Syntax_Syntax.n with
                    | FStar_Syntax_Syntax.Tm_abs uu____17826 -> true
                    | uu____17843 -> false  in
                  let maybe_eta t =
                    if is_abs t
                    then FStar_Util.Inl t
                    else
                      (let t3 =
                         FStar_TypeChecker_Normalize.eta_expand wl.tcenv t
                          in
                       if is_abs t3
                       then FStar_Util.Inl t3
                       else FStar_Util.Inr t3)
                     in
                  let force_eta t =
                    if is_abs t
                    then t
                    else
                      (let uu____17896 =
                         env.FStar_TypeChecker_Env.type_of
                           (let uu___377_17904 = env  in
                            {
                              FStar_TypeChecker_Env.solver =
                                (uu___377_17904.FStar_TypeChecker_Env.solver);
                              FStar_TypeChecker_Env.range =
                                (uu___377_17904.FStar_TypeChecker_Env.range);
                              FStar_TypeChecker_Env.curmodule =
                                (uu___377_17904.FStar_TypeChecker_Env.curmodule);
                              FStar_TypeChecker_Env.gamma =
                                (uu___377_17904.FStar_TypeChecker_Env.gamma);
                              FStar_TypeChecker_Env.gamma_sig =
                                (uu___377_17904.FStar_TypeChecker_Env.gamma_sig);
                              FStar_TypeChecker_Env.gamma_cache =
                                (uu___377_17904.FStar_TypeChecker_Env.gamma_cache);
                              FStar_TypeChecker_Env.modules =
                                (uu___377_17904.FStar_TypeChecker_Env.modules);
                              FStar_TypeChecker_Env.expected_typ =
                                FStar_Pervasives_Native.None;
                              FStar_TypeChecker_Env.sigtab =
                                (uu___377_17904.FStar_TypeChecker_Env.sigtab);
                              FStar_TypeChecker_Env.is_pattern =
                                (uu___377_17904.FStar_TypeChecker_Env.is_pattern);
                              FStar_TypeChecker_Env.instantiate_imp =
                                (uu___377_17904.FStar_TypeChecker_Env.instantiate_imp);
                              FStar_TypeChecker_Env.effects =
                                (uu___377_17904.FStar_TypeChecker_Env.effects);
                              FStar_TypeChecker_Env.generalize =
                                (uu___377_17904.FStar_TypeChecker_Env.generalize);
                              FStar_TypeChecker_Env.letrecs =
                                (uu___377_17904.FStar_TypeChecker_Env.letrecs);
                              FStar_TypeChecker_Env.top_level =
                                (uu___377_17904.FStar_TypeChecker_Env.top_level);
                              FStar_TypeChecker_Env.check_uvars =
                                (uu___377_17904.FStar_TypeChecker_Env.check_uvars);
                              FStar_TypeChecker_Env.use_eq =
                                (uu___377_17904.FStar_TypeChecker_Env.use_eq);
                              FStar_TypeChecker_Env.is_iface =
                                (uu___377_17904.FStar_TypeChecker_Env.is_iface);
                              FStar_TypeChecker_Env.admit =
                                (uu___377_17904.FStar_TypeChecker_Env.admit);
                              FStar_TypeChecker_Env.lax = true;
                              FStar_TypeChecker_Env.lax_universes =
                                (uu___377_17904.FStar_TypeChecker_Env.lax_universes);
                              FStar_TypeChecker_Env.phase1 =
                                (uu___377_17904.FStar_TypeChecker_Env.phase1);
                              FStar_TypeChecker_Env.failhard =
                                (uu___377_17904.FStar_TypeChecker_Env.failhard);
                              FStar_TypeChecker_Env.nosynth =
                                (uu___377_17904.FStar_TypeChecker_Env.nosynth);
                              FStar_TypeChecker_Env.uvar_subtyping =
                                (uu___377_17904.FStar_TypeChecker_Env.uvar_subtyping);
                              FStar_TypeChecker_Env.tc_term =
                                (uu___377_17904.FStar_TypeChecker_Env.tc_term);
                              FStar_TypeChecker_Env.type_of =
                                (uu___377_17904.FStar_TypeChecker_Env.type_of);
                              FStar_TypeChecker_Env.universe_of =
                                (uu___377_17904.FStar_TypeChecker_Env.universe_of);
                              FStar_TypeChecker_Env.check_type_of =
                                (uu___377_17904.FStar_TypeChecker_Env.check_type_of);
                              FStar_TypeChecker_Env.use_bv_sorts = true;
                              FStar_TypeChecker_Env.qtbl_name_and_index =
                                (uu___377_17904.FStar_TypeChecker_Env.qtbl_name_and_index);
                              FStar_TypeChecker_Env.normalized_eff_names =
                                (uu___377_17904.FStar_TypeChecker_Env.normalized_eff_names);
                              FStar_TypeChecker_Env.proof_ns =
                                (uu___377_17904.FStar_TypeChecker_Env.proof_ns);
                              FStar_TypeChecker_Env.synth_hook =
                                (uu___377_17904.FStar_TypeChecker_Env.synth_hook);
                              FStar_TypeChecker_Env.splice =
                                (uu___377_17904.FStar_TypeChecker_Env.splice);
                              FStar_TypeChecker_Env.is_native_tactic =
                                (uu___377_17904.FStar_TypeChecker_Env.is_native_tactic);
                              FStar_TypeChecker_Env.identifier_info =
                                (uu___377_17904.FStar_TypeChecker_Env.identifier_info);
                              FStar_TypeChecker_Env.tc_hooks =
                                (uu___377_17904.FStar_TypeChecker_Env.tc_hooks);
                              FStar_TypeChecker_Env.dsenv =
                                (uu___377_17904.FStar_TypeChecker_Env.dsenv);
                              FStar_TypeChecker_Env.dep_graph =
                                (uu___377_17904.FStar_TypeChecker_Env.dep_graph)
                            }) t
                          in
                       match uu____17896 with
                       | (uu____17907,ty,uu____17909) ->
                           let uu____17910 =
                             FStar_TypeChecker_Normalize.unfold_whnf env ty
                              in
                           FStar_TypeChecker_Normalize.eta_expand_with_type
                             env t uu____17910)
                     in
                  let uu____17911 =
                    let uu____17928 = maybe_eta t1  in
                    let uu____17935 = maybe_eta t2  in
                    (uu____17928, uu____17935)  in
                  (match uu____17911 with
                   | (FStar_Util.Inl t11,FStar_Util.Inl t21) ->
                       solve_t env
                         (let uu___378_17977 = problem  in
                          {
                            FStar_TypeChecker_Common.pid =
                              (uu___378_17977.FStar_TypeChecker_Common.pid);
                            FStar_TypeChecker_Common.lhs = t11;
                            FStar_TypeChecker_Common.relation =
                              (uu___378_17977.FStar_TypeChecker_Common.relation);
                            FStar_TypeChecker_Common.rhs = t21;
                            FStar_TypeChecker_Common.element =
                              (uu___378_17977.FStar_TypeChecker_Common.element);
                            FStar_TypeChecker_Common.logical_guard =
                              (uu___378_17977.FStar_TypeChecker_Common.logical_guard);
                            FStar_TypeChecker_Common.logical_guard_uvar =
                              (uu___378_17977.FStar_TypeChecker_Common.logical_guard_uvar);
                            FStar_TypeChecker_Common.reason =
                              (uu___378_17977.FStar_TypeChecker_Common.reason);
                            FStar_TypeChecker_Common.loc =
                              (uu___378_17977.FStar_TypeChecker_Common.loc);
                            FStar_TypeChecker_Common.rank =
                              (uu___378_17977.FStar_TypeChecker_Common.rank)
                          }) wl
                   | (FStar_Util.Inl t_abs,FStar_Util.Inr not_abs) ->
                       let uu____17998 =
                         (is_flex not_abs) &&
                           ((p_rel orig) = FStar_TypeChecker_Common.EQ)
                          in
                       if uu____17998
                       then
                         let uu____17999 = destruct_flex_t not_abs wl  in
                         (match uu____17999 with
                          | (flex,wl1) ->
                              solve_t_flex_rigid_eq env orig wl1 flex t_abs)
                       else
                         (let t11 = force_eta t1  in
                          let t21 = force_eta t2  in
                          if (is_abs t11) && (is_abs t21)
                          then
                            solve_t env
                              (let uu___379_18014 = problem  in
                               {
                                 FStar_TypeChecker_Common.pid =
                                   (uu___379_18014.FStar_TypeChecker_Common.pid);
                                 FStar_TypeChecker_Common.lhs = t11;
                                 FStar_TypeChecker_Common.relation =
                                   (uu___379_18014.FStar_TypeChecker_Common.relation);
                                 FStar_TypeChecker_Common.rhs = t21;
                                 FStar_TypeChecker_Common.element =
                                   (uu___379_18014.FStar_TypeChecker_Common.element);
                                 FStar_TypeChecker_Common.logical_guard =
                                   (uu___379_18014.FStar_TypeChecker_Common.logical_guard);
                                 FStar_TypeChecker_Common.logical_guard_uvar
                                   =
                                   (uu___379_18014.FStar_TypeChecker_Common.logical_guard_uvar);
                                 FStar_TypeChecker_Common.reason =
                                   (uu___379_18014.FStar_TypeChecker_Common.reason);
                                 FStar_TypeChecker_Common.loc =
                                   (uu___379_18014.FStar_TypeChecker_Common.loc);
                                 FStar_TypeChecker_Common.rank =
                                   (uu___379_18014.FStar_TypeChecker_Common.rank)
                               }) wl
                          else
                            giveup env
                              "head tag mismatch: RHS is an abstraction" orig)
                   | (FStar_Util.Inr not_abs,FStar_Util.Inl t_abs) ->
                       let uu____18036 =
                         (is_flex not_abs) &&
                           ((p_rel orig) = FStar_TypeChecker_Common.EQ)
                          in
                       if uu____18036
                       then
                         let uu____18037 = destruct_flex_t not_abs wl  in
                         (match uu____18037 with
                          | (flex,wl1) ->
                              solve_t_flex_rigid_eq env orig wl1 flex t_abs)
                       else
                         (let t11 = force_eta t1  in
                          let t21 = force_eta t2  in
                          if (is_abs t11) && (is_abs t21)
                          then
                            solve_t env
                              (let uu___379_18052 = problem  in
                               {
                                 FStar_TypeChecker_Common.pid =
                                   (uu___379_18052.FStar_TypeChecker_Common.pid);
                                 FStar_TypeChecker_Common.lhs = t11;
                                 FStar_TypeChecker_Common.relation =
                                   (uu___379_18052.FStar_TypeChecker_Common.relation);
                                 FStar_TypeChecker_Common.rhs = t21;
                                 FStar_TypeChecker_Common.element =
                                   (uu___379_18052.FStar_TypeChecker_Common.element);
                                 FStar_TypeChecker_Common.logical_guard =
                                   (uu___379_18052.FStar_TypeChecker_Common.logical_guard);
                                 FStar_TypeChecker_Common.logical_guard_uvar
                                   =
                                   (uu___379_18052.FStar_TypeChecker_Common.logical_guard_uvar);
                                 FStar_TypeChecker_Common.reason =
                                   (uu___379_18052.FStar_TypeChecker_Common.reason);
                                 FStar_TypeChecker_Common.loc =
                                   (uu___379_18052.FStar_TypeChecker_Common.loc);
                                 FStar_TypeChecker_Common.rank =
                                   (uu___379_18052.FStar_TypeChecker_Common.rank)
                               }) wl
                          else
                            giveup env
                              "head tag mismatch: RHS is an abstraction" orig)
                   | uu____18054 ->
                       failwith
                         "Impossible: at least one side is an abstraction")
              | (uu____18071,FStar_Syntax_Syntax.Tm_abs uu____18072) ->
                  let is_abs t =
                    match t.FStar_Syntax_Syntax.n with
                    | FStar_Syntax_Syntax.Tm_abs uu____18099 -> true
                    | uu____18116 -> false  in
                  let maybe_eta t =
                    if is_abs t
                    then FStar_Util.Inl t
                    else
                      (let t3 =
                         FStar_TypeChecker_Normalize.eta_expand wl.tcenv t
                          in
                       if is_abs t3
                       then FStar_Util.Inl t3
                       else FStar_Util.Inr t3)
                     in
                  let force_eta t =
                    if is_abs t
                    then t
                    else
                      (let uu____18169 =
                         env.FStar_TypeChecker_Env.type_of
                           (let uu___377_18177 = env  in
                            {
                              FStar_TypeChecker_Env.solver =
                                (uu___377_18177.FStar_TypeChecker_Env.solver);
                              FStar_TypeChecker_Env.range =
                                (uu___377_18177.FStar_TypeChecker_Env.range);
                              FStar_TypeChecker_Env.curmodule =
                                (uu___377_18177.FStar_TypeChecker_Env.curmodule);
                              FStar_TypeChecker_Env.gamma =
                                (uu___377_18177.FStar_TypeChecker_Env.gamma);
                              FStar_TypeChecker_Env.gamma_sig =
                                (uu___377_18177.FStar_TypeChecker_Env.gamma_sig);
                              FStar_TypeChecker_Env.gamma_cache =
                                (uu___377_18177.FStar_TypeChecker_Env.gamma_cache);
                              FStar_TypeChecker_Env.modules =
                                (uu___377_18177.FStar_TypeChecker_Env.modules);
                              FStar_TypeChecker_Env.expected_typ =
                                FStar_Pervasives_Native.None;
                              FStar_TypeChecker_Env.sigtab =
                                (uu___377_18177.FStar_TypeChecker_Env.sigtab);
                              FStar_TypeChecker_Env.is_pattern =
                                (uu___377_18177.FStar_TypeChecker_Env.is_pattern);
                              FStar_TypeChecker_Env.instantiate_imp =
                                (uu___377_18177.FStar_TypeChecker_Env.instantiate_imp);
                              FStar_TypeChecker_Env.effects =
                                (uu___377_18177.FStar_TypeChecker_Env.effects);
                              FStar_TypeChecker_Env.generalize =
                                (uu___377_18177.FStar_TypeChecker_Env.generalize);
                              FStar_TypeChecker_Env.letrecs =
                                (uu___377_18177.FStar_TypeChecker_Env.letrecs);
                              FStar_TypeChecker_Env.top_level =
                                (uu___377_18177.FStar_TypeChecker_Env.top_level);
                              FStar_TypeChecker_Env.check_uvars =
                                (uu___377_18177.FStar_TypeChecker_Env.check_uvars);
                              FStar_TypeChecker_Env.use_eq =
                                (uu___377_18177.FStar_TypeChecker_Env.use_eq);
                              FStar_TypeChecker_Env.is_iface =
                                (uu___377_18177.FStar_TypeChecker_Env.is_iface);
                              FStar_TypeChecker_Env.admit =
                                (uu___377_18177.FStar_TypeChecker_Env.admit);
                              FStar_TypeChecker_Env.lax = true;
                              FStar_TypeChecker_Env.lax_universes =
                                (uu___377_18177.FStar_TypeChecker_Env.lax_universes);
                              FStar_TypeChecker_Env.phase1 =
                                (uu___377_18177.FStar_TypeChecker_Env.phase1);
                              FStar_TypeChecker_Env.failhard =
                                (uu___377_18177.FStar_TypeChecker_Env.failhard);
                              FStar_TypeChecker_Env.nosynth =
                                (uu___377_18177.FStar_TypeChecker_Env.nosynth);
                              FStar_TypeChecker_Env.uvar_subtyping =
                                (uu___377_18177.FStar_TypeChecker_Env.uvar_subtyping);
                              FStar_TypeChecker_Env.tc_term =
                                (uu___377_18177.FStar_TypeChecker_Env.tc_term);
                              FStar_TypeChecker_Env.type_of =
                                (uu___377_18177.FStar_TypeChecker_Env.type_of);
                              FStar_TypeChecker_Env.universe_of =
                                (uu___377_18177.FStar_TypeChecker_Env.universe_of);
                              FStar_TypeChecker_Env.check_type_of =
                                (uu___377_18177.FStar_TypeChecker_Env.check_type_of);
                              FStar_TypeChecker_Env.use_bv_sorts = true;
                              FStar_TypeChecker_Env.qtbl_name_and_index =
                                (uu___377_18177.FStar_TypeChecker_Env.qtbl_name_and_index);
                              FStar_TypeChecker_Env.normalized_eff_names =
                                (uu___377_18177.FStar_TypeChecker_Env.normalized_eff_names);
                              FStar_TypeChecker_Env.proof_ns =
                                (uu___377_18177.FStar_TypeChecker_Env.proof_ns);
                              FStar_TypeChecker_Env.synth_hook =
                                (uu___377_18177.FStar_TypeChecker_Env.synth_hook);
                              FStar_TypeChecker_Env.splice =
                                (uu___377_18177.FStar_TypeChecker_Env.splice);
                              FStar_TypeChecker_Env.is_native_tactic =
                                (uu___377_18177.FStar_TypeChecker_Env.is_native_tactic);
                              FStar_TypeChecker_Env.identifier_info =
                                (uu___377_18177.FStar_TypeChecker_Env.identifier_info);
                              FStar_TypeChecker_Env.tc_hooks =
                                (uu___377_18177.FStar_TypeChecker_Env.tc_hooks);
                              FStar_TypeChecker_Env.dsenv =
                                (uu___377_18177.FStar_TypeChecker_Env.dsenv);
                              FStar_TypeChecker_Env.dep_graph =
                                (uu___377_18177.FStar_TypeChecker_Env.dep_graph)
                            }) t
                          in
                       match uu____18169 with
                       | (uu____18180,ty,uu____18182) ->
                           let uu____18183 =
                             FStar_TypeChecker_Normalize.unfold_whnf env ty
                              in
                           FStar_TypeChecker_Normalize.eta_expand_with_type
                             env t uu____18183)
                     in
                  let uu____18184 =
                    let uu____18201 = maybe_eta t1  in
                    let uu____18208 = maybe_eta t2  in
                    (uu____18201, uu____18208)  in
                  (match uu____18184 with
                   | (FStar_Util.Inl t11,FStar_Util.Inl t21) ->
                       solve_t env
                         (let uu___378_18250 = problem  in
                          {
                            FStar_TypeChecker_Common.pid =
                              (uu___378_18250.FStar_TypeChecker_Common.pid);
                            FStar_TypeChecker_Common.lhs = t11;
                            FStar_TypeChecker_Common.relation =
                              (uu___378_18250.FStar_TypeChecker_Common.relation);
                            FStar_TypeChecker_Common.rhs = t21;
                            FStar_TypeChecker_Common.element =
                              (uu___378_18250.FStar_TypeChecker_Common.element);
                            FStar_TypeChecker_Common.logical_guard =
                              (uu___378_18250.FStar_TypeChecker_Common.logical_guard);
                            FStar_TypeChecker_Common.logical_guard_uvar =
                              (uu___378_18250.FStar_TypeChecker_Common.logical_guard_uvar);
                            FStar_TypeChecker_Common.reason =
                              (uu___378_18250.FStar_TypeChecker_Common.reason);
                            FStar_TypeChecker_Common.loc =
                              (uu___378_18250.FStar_TypeChecker_Common.loc);
                            FStar_TypeChecker_Common.rank =
                              (uu___378_18250.FStar_TypeChecker_Common.rank)
                          }) wl
                   | (FStar_Util.Inl t_abs,FStar_Util.Inr not_abs) ->
                       let uu____18271 =
                         (is_flex not_abs) &&
                           ((p_rel orig) = FStar_TypeChecker_Common.EQ)
                          in
                       if uu____18271
                       then
                         let uu____18272 = destruct_flex_t not_abs wl  in
                         (match uu____18272 with
                          | (flex,wl1) ->
                              solve_t_flex_rigid_eq env orig wl1 flex t_abs)
                       else
                         (let t11 = force_eta t1  in
                          let t21 = force_eta t2  in
                          if (is_abs t11) && (is_abs t21)
                          then
                            solve_t env
                              (let uu___379_18287 = problem  in
                               {
                                 FStar_TypeChecker_Common.pid =
                                   (uu___379_18287.FStar_TypeChecker_Common.pid);
                                 FStar_TypeChecker_Common.lhs = t11;
                                 FStar_TypeChecker_Common.relation =
                                   (uu___379_18287.FStar_TypeChecker_Common.relation);
                                 FStar_TypeChecker_Common.rhs = t21;
                                 FStar_TypeChecker_Common.element =
                                   (uu___379_18287.FStar_TypeChecker_Common.element);
                                 FStar_TypeChecker_Common.logical_guard =
                                   (uu___379_18287.FStar_TypeChecker_Common.logical_guard);
                                 FStar_TypeChecker_Common.logical_guard_uvar
                                   =
                                   (uu___379_18287.FStar_TypeChecker_Common.logical_guard_uvar);
                                 FStar_TypeChecker_Common.reason =
                                   (uu___379_18287.FStar_TypeChecker_Common.reason);
                                 FStar_TypeChecker_Common.loc =
                                   (uu___379_18287.FStar_TypeChecker_Common.loc);
                                 FStar_TypeChecker_Common.rank =
                                   (uu___379_18287.FStar_TypeChecker_Common.rank)
                               }) wl
                          else
                            giveup env
                              "head tag mismatch: RHS is an abstraction" orig)
                   | (FStar_Util.Inr not_abs,FStar_Util.Inl t_abs) ->
                       let uu____18309 =
                         (is_flex not_abs) &&
                           ((p_rel orig) = FStar_TypeChecker_Common.EQ)
                          in
                       if uu____18309
                       then
                         let uu____18310 = destruct_flex_t not_abs wl  in
                         (match uu____18310 with
                          | (flex,wl1) ->
                              solve_t_flex_rigid_eq env orig wl1 flex t_abs)
                       else
                         (let t11 = force_eta t1  in
                          let t21 = force_eta t2  in
                          if (is_abs t11) && (is_abs t21)
                          then
                            solve_t env
                              (let uu___379_18325 = problem  in
                               {
                                 FStar_TypeChecker_Common.pid =
                                   (uu___379_18325.FStar_TypeChecker_Common.pid);
                                 FStar_TypeChecker_Common.lhs = t11;
                                 FStar_TypeChecker_Common.relation =
                                   (uu___379_18325.FStar_TypeChecker_Common.relation);
                                 FStar_TypeChecker_Common.rhs = t21;
                                 FStar_TypeChecker_Common.element =
                                   (uu___379_18325.FStar_TypeChecker_Common.element);
                                 FStar_TypeChecker_Common.logical_guard =
                                   (uu___379_18325.FStar_TypeChecker_Common.logical_guard);
                                 FStar_TypeChecker_Common.logical_guard_uvar
                                   =
                                   (uu___379_18325.FStar_TypeChecker_Common.logical_guard_uvar);
                                 FStar_TypeChecker_Common.reason =
                                   (uu___379_18325.FStar_TypeChecker_Common.reason);
                                 FStar_TypeChecker_Common.loc =
                                   (uu___379_18325.FStar_TypeChecker_Common.loc);
                                 FStar_TypeChecker_Common.rank =
                                   (uu___379_18325.FStar_TypeChecker_Common.rank)
                               }) wl
                          else
                            giveup env
                              "head tag mismatch: RHS is an abstraction" orig)
                   | uu____18327 ->
                       failwith
                         "Impossible: at least one side is an abstraction")
              | (FStar_Syntax_Syntax.Tm_refine
                 (x1,phi1),FStar_Syntax_Syntax.Tm_refine (x2,phi2)) ->
                  let uu____18356 =
                    let uu____18361 =
                      head_matches_delta env x1.FStar_Syntax_Syntax.sort
                        x2.FStar_Syntax_Syntax.sort
                       in
                    match uu____18361 with
                    | (FullMatch ,FStar_Pervasives_Native.Some (t11,t21)) ->
                        ((let uu___380_18389 = x1  in
                          {
                            FStar_Syntax_Syntax.ppname =
                              (uu___380_18389.FStar_Syntax_Syntax.ppname);
                            FStar_Syntax_Syntax.index =
                              (uu___380_18389.FStar_Syntax_Syntax.index);
                            FStar_Syntax_Syntax.sort = t11
                          }),
                          (let uu___381_18391 = x2  in
                           {
                             FStar_Syntax_Syntax.ppname =
                               (uu___381_18391.FStar_Syntax_Syntax.ppname);
                             FStar_Syntax_Syntax.index =
                               (uu___381_18391.FStar_Syntax_Syntax.index);
                             FStar_Syntax_Syntax.sort = t21
                           }))
                    | (HeadMatch uu____18392,FStar_Pervasives_Native.Some
                       (t11,t21)) ->
                        ((let uu___380_18406 = x1  in
                          {
                            FStar_Syntax_Syntax.ppname =
                              (uu___380_18406.FStar_Syntax_Syntax.ppname);
                            FStar_Syntax_Syntax.index =
                              (uu___380_18406.FStar_Syntax_Syntax.index);
                            FStar_Syntax_Syntax.sort = t11
                          }),
                          (let uu___381_18408 = x2  in
                           {
                             FStar_Syntax_Syntax.ppname =
                               (uu___381_18408.FStar_Syntax_Syntax.ppname);
                             FStar_Syntax_Syntax.index =
                               (uu___381_18408.FStar_Syntax_Syntax.index);
                             FStar_Syntax_Syntax.sort = t21
                           }))
                    | uu____18409 -> (x1, x2)  in
                  (match uu____18356 with
                   | (x11,x21) ->
                       let t11 = FStar_Syntax_Util.refine x11 phi1  in
                       let t21 = FStar_Syntax_Util.refine x21 phi2  in
                       let uu____18428 = as_refinement false env t11  in
                       (match uu____18428 with
                        | (x12,phi11) ->
                            let uu____18435 = as_refinement false env t21  in
                            (match uu____18435 with
                             | (x22,phi21) ->
                                 ((let uu____18443 =
                                     FStar_TypeChecker_Env.debug env
                                       (FStar_Options.Other "Rel")
                                      in
                                   if uu____18443
                                   then
                                     ((let uu____18445 =
                                         FStar_Syntax_Print.bv_to_string x12
                                          in
                                       let uu____18446 =
                                         FStar_Syntax_Print.term_to_string
                                           x12.FStar_Syntax_Syntax.sort
                                          in
                                       let uu____18447 =
                                         FStar_Syntax_Print.term_to_string
                                           phi11
                                          in
                                       FStar_Util.print3
                                         "ref1 = (%s):(%s){%s}\n" uu____18445
                                         uu____18446 uu____18447);
                                      (let uu____18448 =
                                         FStar_Syntax_Print.bv_to_string x22
                                          in
                                       let uu____18449 =
                                         FStar_Syntax_Print.term_to_string
                                           x22.FStar_Syntax_Syntax.sort
                                          in
                                       let uu____18450 =
                                         FStar_Syntax_Print.term_to_string
                                           phi21
                                          in
                                       FStar_Util.print3
                                         "ref2 = (%s):(%s){%s}\n" uu____18448
                                         uu____18449 uu____18450))
                                   else ());
                                  (let uu____18452 =
                                     mk_t_problem wl [] orig
                                       x12.FStar_Syntax_Syntax.sort
                                       problem.FStar_TypeChecker_Common.relation
                                       x22.FStar_Syntax_Syntax.sort
                                       problem.FStar_TypeChecker_Common.element
                                       "refinement base type"
                                      in
                                   match uu____18452 with
                                   | (base_prob,wl1) ->
                                       let x13 =
                                         FStar_Syntax_Syntax.freshen_bv x12
                                          in
                                       let subst1 =
                                         [FStar_Syntax_Syntax.DB
                                            ((Prims.parse_int "0"), x13)]
                                          in
                                       let phi12 =
                                         FStar_Syntax_Subst.subst subst1
                                           phi11
                                          in
                                       let phi22 =
                                         FStar_Syntax_Subst.subst subst1
                                           phi21
                                          in
                                       let env1 =
                                         FStar_TypeChecker_Env.push_bv env
                                           x13
                                          in
                                       let mk_imp1 imp phi13 phi23 =
                                         let uu____18518 = imp phi13 phi23
                                            in
                                         FStar_All.pipe_right uu____18518
                                           (guard_on_element wl1 problem x13)
                                          in
                                       let fallback uu____18530 =
                                         let impl =
                                           if
                                             problem.FStar_TypeChecker_Common.relation
                                               = FStar_TypeChecker_Common.EQ
                                           then
                                             mk_imp1 FStar_Syntax_Util.mk_iff
                                               phi12 phi22
                                           else
                                             mk_imp1 FStar_Syntax_Util.mk_imp
                                               phi12 phi22
                                            in
                                         let guard =
                                           FStar_Syntax_Util.mk_conj
                                             (p_guard base_prob) impl
                                            in
                                         (let uu____18541 =
                                            let uu____18544 = p_scope orig
                                               in
                                            FStar_List.map
                                              FStar_Pervasives_Native.fst
                                              uu____18544
                                             in
                                          FStar_TypeChecker_Env.def_check_closed_in
                                            (p_loc orig) "ref.1" uu____18541
                                            (p_guard base_prob));
                                         (let uu____18556 =
                                            let uu____18559 = p_scope orig
                                               in
                                            FStar_List.map
                                              FStar_Pervasives_Native.fst
                                              uu____18559
                                             in
                                          FStar_TypeChecker_Env.def_check_closed_in
                                            (p_loc orig) "ref.2" uu____18556
                                            impl);
                                         (let wl2 =
                                            solve_prob orig
                                              (FStar_Pervasives_Native.Some
                                                 guard) [] wl1
                                             in
                                          let uu____18571 =
                                            attempt [base_prob] wl2  in
                                          solve env1 uu____18571)
                                          in
                                       let has_uvars =
                                         (let uu____18575 =
                                            let uu____18576 =
                                              FStar_Syntax_Free.uvars phi12
                                               in
                                            FStar_Util.set_is_empty
                                              uu____18576
                                             in
                                          Prims.op_Negation uu____18575) ||
                                           (let uu____18580 =
                                              let uu____18581 =
                                                FStar_Syntax_Free.uvars phi22
                                                 in
                                              FStar_Util.set_is_empty
                                                uu____18581
                                               in
                                            Prims.op_Negation uu____18580)
                                          in
                                       if
                                         (problem.FStar_TypeChecker_Common.relation
                                            = FStar_TypeChecker_Common.EQ)
                                           ||
                                           ((Prims.op_Negation
                                               env1.FStar_TypeChecker_Env.uvar_subtyping)
                                              && has_uvars)
                                       then
                                         let uu____18584 =
                                           let uu____18589 =
                                             let uu____18596 =
                                               FStar_Syntax_Syntax.mk_binder
                                                 x13
                                                in
                                             [uu____18596]  in
                                           mk_t_problem wl1 uu____18589 orig
                                             phi12
                                             FStar_TypeChecker_Common.EQ
                                             phi22
                                             FStar_Pervasives_Native.None
                                             "refinement formula"
                                            in
                                         (match uu____18584 with
                                          | (ref_prob,wl2) ->
                                              let uu____18611 =
                                                solve env1
                                                  (let uu___382_18613 = wl2
                                                      in
                                                   {
                                                     attempting = [ref_prob];
                                                     wl_deferred = [];
                                                     ctr =
                                                       (uu___382_18613.ctr);
                                                     defer_ok = false;
                                                     smt_ok =
                                                       (uu___382_18613.smt_ok);
                                                     tcenv =
                                                       (uu___382_18613.tcenv);
                                                     wl_implicits =
                                                       (uu___382_18613.wl_implicits)
                                                   })
                                                 in
                                              (match uu____18611 with
                                               | Failed (prob,msg) ->
                                                   if
                                                     ((Prims.op_Negation
                                                         env1.FStar_TypeChecker_Env.uvar_subtyping)
                                                        && has_uvars)
                                                       ||
                                                       (Prims.op_Negation
                                                          wl2.smt_ok)
                                                   then giveup env1 msg prob
                                                   else fallback ()
                                               | Success uu____18623 ->
                                                   let guard =
                                                     let uu____18631 =
                                                       FStar_All.pipe_right
                                                         (p_guard ref_prob)
                                                         (guard_on_element
                                                            wl2 problem x13)
                                                        in
                                                     FStar_Syntax_Util.mk_conj
                                                       (p_guard base_prob)
                                                       uu____18631
                                                      in
                                                   let wl3 =
                                                     solve_prob orig
                                                       (FStar_Pervasives_Native.Some
                                                          guard) [] wl2
                                                      in
                                                   let wl4 =
                                                     let uu___383_18640 = wl3
                                                        in
                                                     {
                                                       attempting =
                                                         (uu___383_18640.attempting);
                                                       wl_deferred =
                                                         (uu___383_18640.wl_deferred);
                                                       ctr =
                                                         (wl3.ctr +
                                                            (Prims.parse_int "1"));
                                                       defer_ok =
                                                         (uu___383_18640.defer_ok);
                                                       smt_ok =
                                                         (uu___383_18640.smt_ok);
                                                       tcenv =
                                                         (uu___383_18640.tcenv);
                                                       wl_implicits =
                                                         (uu___383_18640.wl_implicits)
                                                     }  in
                                                   let uu____18641 =
                                                     attempt [base_prob] wl4
                                                      in
                                                   solve env1 uu____18641))
                                       else fallback ())))))
              | (FStar_Syntax_Syntax.Tm_uvar
                 uu____18643,FStar_Syntax_Syntax.Tm_uvar uu____18644) ->
                  let uu____18669 = destruct_flex_t t1 wl  in
                  (match uu____18669 with
                   | (f1,wl1) ->
                       let uu____18676 = destruct_flex_t t2 wl1  in
                       (match uu____18676 with
                        | (f2,wl2) -> solve_t_flex_flex env orig wl2 f1 f2))
              | (FStar_Syntax_Syntax.Tm_app
                 ({
                    FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                      uu____18683;
                    FStar_Syntax_Syntax.pos = uu____18684;
                    FStar_Syntax_Syntax.vars = uu____18685;_},uu____18686),FStar_Syntax_Syntax.Tm_uvar
                 uu____18687) ->
                  let uu____18732 = destruct_flex_t t1 wl  in
                  (match uu____18732 with
                   | (f1,wl1) ->
                       let uu____18739 = destruct_flex_t t2 wl1  in
                       (match uu____18739 with
                        | (f2,wl2) -> solve_t_flex_flex env orig wl2 f1 f2))
              | (FStar_Syntax_Syntax.Tm_uvar
                 uu____18746,FStar_Syntax_Syntax.Tm_app
                 ({
                    FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                      uu____18747;
                    FStar_Syntax_Syntax.pos = uu____18748;
                    FStar_Syntax_Syntax.vars = uu____18749;_},uu____18750))
                  ->
                  let uu____18795 = destruct_flex_t t1 wl  in
                  (match uu____18795 with
                   | (f1,wl1) ->
                       let uu____18802 = destruct_flex_t t2 wl1  in
                       (match uu____18802 with
                        | (f2,wl2) -> solve_t_flex_flex env orig wl2 f1 f2))
              | (FStar_Syntax_Syntax.Tm_app
                 ({
                    FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                      uu____18809;
                    FStar_Syntax_Syntax.pos = uu____18810;
                    FStar_Syntax_Syntax.vars = uu____18811;_},uu____18812),FStar_Syntax_Syntax.Tm_app
                 ({
                    FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                      uu____18813;
                    FStar_Syntax_Syntax.pos = uu____18814;
                    FStar_Syntax_Syntax.vars = uu____18815;_},uu____18816))
                  ->
                  let uu____18881 = destruct_flex_t t1 wl  in
                  (match uu____18881 with
                   | (f1,wl1) ->
                       let uu____18888 = destruct_flex_t t2 wl1  in
                       (match uu____18888 with
                        | (f2,wl2) -> solve_t_flex_flex env orig wl2 f1 f2))
              | (FStar_Syntax_Syntax.Tm_uvar uu____18895,uu____18896) when
                  problem.FStar_TypeChecker_Common.relation =
                    FStar_TypeChecker_Common.EQ
                  ->
                  let uu____18909 = destruct_flex_t t1 wl  in
                  (match uu____18909 with
                   | (f1,wl1) -> solve_t_flex_rigid_eq env orig wl1 f1 t2)
              | (FStar_Syntax_Syntax.Tm_app
                 ({
                    FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                      uu____18916;
                    FStar_Syntax_Syntax.pos = uu____18917;
                    FStar_Syntax_Syntax.vars = uu____18918;_},uu____18919),uu____18920)
                  when
                  problem.FStar_TypeChecker_Common.relation =
                    FStar_TypeChecker_Common.EQ
                  ->
                  let uu____18953 = destruct_flex_t t1 wl  in
                  (match uu____18953 with
                   | (f1,wl1) -> solve_t_flex_rigid_eq env orig wl1 f1 t2)
              | (uu____18960,FStar_Syntax_Syntax.Tm_uvar uu____18961) when
                  problem.FStar_TypeChecker_Common.relation =
                    FStar_TypeChecker_Common.EQ
                  -> solve_t env (invert problem) wl
              | (uu____18974,FStar_Syntax_Syntax.Tm_app
                 ({
                    FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                      uu____18975;
                    FStar_Syntax_Syntax.pos = uu____18976;
                    FStar_Syntax_Syntax.vars = uu____18977;_},uu____18978))
                  when
                  problem.FStar_TypeChecker_Common.relation =
                    FStar_TypeChecker_Common.EQ
                  -> solve_t env (invert problem) wl
              | (FStar_Syntax_Syntax.Tm_uvar
                 uu____19011,FStar_Syntax_Syntax.Tm_arrow uu____19012) ->
                  solve_t' env
                    (let uu___384_19038 = problem  in
                     {
                       FStar_TypeChecker_Common.pid =
                         (uu___384_19038.FStar_TypeChecker_Common.pid);
                       FStar_TypeChecker_Common.lhs =
                         (uu___384_19038.FStar_TypeChecker_Common.lhs);
                       FStar_TypeChecker_Common.relation =
                         FStar_TypeChecker_Common.EQ;
                       FStar_TypeChecker_Common.rhs =
                         (uu___384_19038.FStar_TypeChecker_Common.rhs);
                       FStar_TypeChecker_Common.element =
                         (uu___384_19038.FStar_TypeChecker_Common.element);
                       FStar_TypeChecker_Common.logical_guard =
                         (uu___384_19038.FStar_TypeChecker_Common.logical_guard);
                       FStar_TypeChecker_Common.logical_guard_uvar =
                         (uu___384_19038.FStar_TypeChecker_Common.logical_guard_uvar);
                       FStar_TypeChecker_Common.reason =
                         (uu___384_19038.FStar_TypeChecker_Common.reason);
                       FStar_TypeChecker_Common.loc =
                         (uu___384_19038.FStar_TypeChecker_Common.loc);
                       FStar_TypeChecker_Common.rank =
                         (uu___384_19038.FStar_TypeChecker_Common.rank)
                     }) wl
              | (FStar_Syntax_Syntax.Tm_app
                 ({
                    FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                      uu____19039;
                    FStar_Syntax_Syntax.pos = uu____19040;
                    FStar_Syntax_Syntax.vars = uu____19041;_},uu____19042),FStar_Syntax_Syntax.Tm_arrow
                 uu____19043) ->
                  solve_t' env
                    (let uu___384_19089 = problem  in
                     {
                       FStar_TypeChecker_Common.pid =
                         (uu___384_19089.FStar_TypeChecker_Common.pid);
                       FStar_TypeChecker_Common.lhs =
                         (uu___384_19089.FStar_TypeChecker_Common.lhs);
                       FStar_TypeChecker_Common.relation =
                         FStar_TypeChecker_Common.EQ;
                       FStar_TypeChecker_Common.rhs =
                         (uu___384_19089.FStar_TypeChecker_Common.rhs);
                       FStar_TypeChecker_Common.element =
                         (uu___384_19089.FStar_TypeChecker_Common.element);
                       FStar_TypeChecker_Common.logical_guard =
                         (uu___384_19089.FStar_TypeChecker_Common.logical_guard);
                       FStar_TypeChecker_Common.logical_guard_uvar =
                         (uu___384_19089.FStar_TypeChecker_Common.logical_guard_uvar);
                       FStar_TypeChecker_Common.reason =
                         (uu___384_19089.FStar_TypeChecker_Common.reason);
                       FStar_TypeChecker_Common.loc =
                         (uu___384_19089.FStar_TypeChecker_Common.loc);
                       FStar_TypeChecker_Common.rank =
                         (uu___384_19089.FStar_TypeChecker_Common.rank)
                     }) wl
              | (uu____19090,FStar_Syntax_Syntax.Tm_uvar uu____19091) ->
                  let uu____19104 =
                    attempt [FStar_TypeChecker_Common.TProb problem] wl  in
                  solve env uu____19104
              | (uu____19105,FStar_Syntax_Syntax.Tm_app
                 ({
                    FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                      uu____19106;
                    FStar_Syntax_Syntax.pos = uu____19107;
                    FStar_Syntax_Syntax.vars = uu____19108;_},uu____19109))
                  ->
                  let uu____19142 =
                    attempt [FStar_TypeChecker_Common.TProb problem] wl  in
                  solve env uu____19142
              | (FStar_Syntax_Syntax.Tm_uvar uu____19143,uu____19144) ->
                  let uu____19157 =
                    attempt [FStar_TypeChecker_Common.TProb problem] wl  in
                  solve env uu____19157
              | (FStar_Syntax_Syntax.Tm_app
                 ({
                    FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                      uu____19158;
                    FStar_Syntax_Syntax.pos = uu____19159;
                    FStar_Syntax_Syntax.vars = uu____19160;_},uu____19161),uu____19162)
                  ->
                  let uu____19195 =
                    attempt [FStar_TypeChecker_Common.TProb problem] wl  in
                  solve env uu____19195
              | (FStar_Syntax_Syntax.Tm_refine uu____19196,uu____19197) ->
                  let t21 =
                    let uu____19205 = base_and_refinement env t2  in
                    FStar_All.pipe_left force_refinement uu____19205  in
                  solve_t env
                    (let uu___385_19231 = problem  in
                     {
                       FStar_TypeChecker_Common.pid =
                         (uu___385_19231.FStar_TypeChecker_Common.pid);
                       FStar_TypeChecker_Common.lhs =
                         (uu___385_19231.FStar_TypeChecker_Common.lhs);
                       FStar_TypeChecker_Common.relation =
                         (uu___385_19231.FStar_TypeChecker_Common.relation);
                       FStar_TypeChecker_Common.rhs = t21;
                       FStar_TypeChecker_Common.element =
                         (uu___385_19231.FStar_TypeChecker_Common.element);
                       FStar_TypeChecker_Common.logical_guard =
                         (uu___385_19231.FStar_TypeChecker_Common.logical_guard);
                       FStar_TypeChecker_Common.logical_guard_uvar =
                         (uu___385_19231.FStar_TypeChecker_Common.logical_guard_uvar);
                       FStar_TypeChecker_Common.reason =
                         (uu___385_19231.FStar_TypeChecker_Common.reason);
                       FStar_TypeChecker_Common.loc =
                         (uu___385_19231.FStar_TypeChecker_Common.loc);
                       FStar_TypeChecker_Common.rank =
                         (uu___385_19231.FStar_TypeChecker_Common.rank)
                     }) wl
              | (uu____19232,FStar_Syntax_Syntax.Tm_refine uu____19233) ->
                  let t11 =
                    let uu____19241 = base_and_refinement env t1  in
                    FStar_All.pipe_left force_refinement uu____19241  in
                  solve_t env
                    (let uu___386_19267 = problem  in
                     {
                       FStar_TypeChecker_Common.pid =
                         (uu___386_19267.FStar_TypeChecker_Common.pid);
                       FStar_TypeChecker_Common.lhs = t11;
                       FStar_TypeChecker_Common.relation =
                         (uu___386_19267.FStar_TypeChecker_Common.relation);
                       FStar_TypeChecker_Common.rhs =
                         (uu___386_19267.FStar_TypeChecker_Common.rhs);
                       FStar_TypeChecker_Common.element =
                         (uu___386_19267.FStar_TypeChecker_Common.element);
                       FStar_TypeChecker_Common.logical_guard =
                         (uu___386_19267.FStar_TypeChecker_Common.logical_guard);
                       FStar_TypeChecker_Common.logical_guard_uvar =
                         (uu___386_19267.FStar_TypeChecker_Common.logical_guard_uvar);
                       FStar_TypeChecker_Common.reason =
                         (uu___386_19267.FStar_TypeChecker_Common.reason);
                       FStar_TypeChecker_Common.loc =
                         (uu___386_19267.FStar_TypeChecker_Common.loc);
                       FStar_TypeChecker_Common.rank =
                         (uu___386_19267.FStar_TypeChecker_Common.rank)
                     }) wl
              | (FStar_Syntax_Syntax.Tm_match
                 (s1,brs1),FStar_Syntax_Syntax.Tm_match (s2,brs2)) ->
                  let by_smt uu____19349 =
                    let uu____19350 = guard_of_prob env wl problem t1 t2  in
                    match uu____19350 with
                    | (guard,wl1) ->
                        let uu____19357 =
                          solve_prob orig
                            (FStar_Pervasives_Native.Some guard) [] wl1
                           in
                        solve env uu____19357
                     in
                  let rec solve_branches wl1 brs11 brs21 =
                    match (brs11, brs21) with
                    | (br1::rs1,br2::rs2) ->
                        let uu____19568 = br1  in
                        (match uu____19568 with
                         | (p1,w1,uu____19593) ->
                             let uu____19610 = br2  in
                             (match uu____19610 with
                              | (p2,w2,uu____19629) ->
                                  let uu____19634 =
                                    let uu____19635 =
                                      FStar_Syntax_Syntax.eq_pat p1 p2  in
                                    Prims.op_Negation uu____19635  in
                                  if uu____19634
                                  then FStar_Pervasives_Native.None
                                  else
                                    (let uu____19651 =
                                       FStar_Syntax_Subst.open_branch' br1
                                        in
                                     match uu____19651 with
                                     | ((p11,w11,e1),s) ->
                                         let uu____19684 = br2  in
                                         (match uu____19684 with
                                          | (p21,w21,e2) ->
                                              let w22 =
                                                FStar_Util.map_opt w21
                                                  (FStar_Syntax_Subst.subst s)
                                                 in
                                              let e21 =
                                                FStar_Syntax_Subst.subst s e2
                                                 in
                                              let scope =
                                                let uu____19719 =
                                                  FStar_Syntax_Syntax.pat_bvs
                                                    p11
                                                   in
                                                FStar_All.pipe_left
                                                  (FStar_List.map
                                                     FStar_Syntax_Syntax.mk_binder)
                                                  uu____19719
                                                 in
                                              let uu____19730 =
                                                match (w11, w22) with
                                                | (FStar_Pervasives_Native.Some
                                                   uu____19753,FStar_Pervasives_Native.None
                                                   ) ->
                                                    FStar_Pervasives_Native.None
                                                | (FStar_Pervasives_Native.None
                                                   ,FStar_Pervasives_Native.Some
                                                   uu____19770) ->
                                                    FStar_Pervasives_Native.None
                                                | (FStar_Pervasives_Native.None
                                                   ,FStar_Pervasives_Native.None
                                                   ) ->
                                                    FStar_Pervasives_Native.Some
                                                      ([], wl1)
                                                | (FStar_Pervasives_Native.Some
                                                   w12,FStar_Pervasives_Native.Some
                                                   w23) ->
                                                    let uu____19813 =
                                                      mk_t_problem wl1 scope
                                                        orig w12
                                                        FStar_TypeChecker_Common.EQ
                                                        w23
                                                        FStar_Pervasives_Native.None
                                                        "when clause"
                                                       in
                                                    (match uu____19813 with
                                                     | (p,wl2) ->
                                                         FStar_Pervasives_Native.Some
                                                           ([p], wl2))
                                                 in
                                              FStar_Util.bind_opt uu____19730
                                                (fun uu____19855  ->
                                                   match uu____19855 with
                                                   | (wprobs,wl2) ->
                                                       let uu____19876 =
                                                         mk_t_problem wl2
                                                           scope orig e1
                                                           FStar_TypeChecker_Common.EQ
                                                           e21
                                                           FStar_Pervasives_Native.None
                                                           "branch body"
                                                          in
                                                       (match uu____19876
                                                        with
                                                        | (prob,wl3) ->
                                                            let uu____19891 =
                                                              solve_branches
                                                                wl3 rs1 rs2
                                                               in
                                                            FStar_Util.bind_opt
                                                              uu____19891
                                                              (fun
                                                                 uu____19915 
                                                                 ->
                                                                 match uu____19915
                                                                 with
                                                                 | (r1,wl4)
                                                                    ->
                                                                    FStar_Pervasives_Native.Some
                                                                    ((prob ::
                                                                    (FStar_List.append
                                                                    wprobs r1)),
                                                                    wl4))))))))
                    | ([],[]) -> FStar_Pervasives_Native.Some ([], wl1)
                    | uu____20000 -> FStar_Pervasives_Native.None  in
                  let uu____20037 = solve_branches wl brs1 brs2  in
                  (match uu____20037 with
                   | FStar_Pervasives_Native.None  ->
                       if wl.smt_ok
                       then by_smt ()
                       else giveup env "Tm_match branches don't match" orig
                   | FStar_Pervasives_Native.Some (sub_probs,wl1) ->
                       let uu____20065 =
                         mk_t_problem wl1 [] orig s1
                           FStar_TypeChecker_Common.EQ s2
                           FStar_Pervasives_Native.None "match scrutinee"
                          in
                       (match uu____20065 with
                        | (sc_prob,wl2) ->
                            let sub_probs1 = sc_prob :: sub_probs  in
                            let formula =
                              let uu____20082 =
                                FStar_List.map (fun p  -> p_guard p)
                                  sub_probs1
                                 in
                              FStar_Syntax_Util.mk_conj_l uu____20082  in
                            let tx =
                              FStar_Syntax_Unionfind.new_transaction ()  in
                            let wl3 =
                              solve_prob orig
                                (FStar_Pervasives_Native.Some formula) [] wl2
                               in
                            let uu____20091 =
                              let uu____20092 =
                                attempt sub_probs1
                                  (let uu___387_20094 = wl3  in
                                   {
                                     attempting = (uu___387_20094.attempting);
                                     wl_deferred =
                                       (uu___387_20094.wl_deferred);
                                     ctr = (uu___387_20094.ctr);
                                     defer_ok = (uu___387_20094.defer_ok);
                                     smt_ok = false;
                                     tcenv = (uu___387_20094.tcenv);
                                     wl_implicits =
                                       (uu___387_20094.wl_implicits)
                                   })
                                 in
                              solve env uu____20092  in
                            (match uu____20091 with
                             | Success (ds,imp) ->
                                 (FStar_Syntax_Unionfind.commit tx;
                                  Success (ds, imp))
                             | Failed uu____20098 ->
                                 (FStar_Syntax_Unionfind.rollback tx;
                                  by_smt ()))))
              | (FStar_Syntax_Syntax.Tm_match uu____20104,uu____20105) ->
                  let head1 =
                    let uu____20129 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____20129
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____20169 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____20169
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____20209 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____20209
                    then
                      let uu____20210 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____20211 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____20212 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____20210 uu____20211 uu____20212
                    else ());
                   (let no_free_uvars t =
                      (let uu____20222 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____20222) &&
                        (let uu____20226 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____20226)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____20242 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____20242 = FStar_Syntax_Util.Equal  in
                    let uu____20243 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____20243
                    then
                      let uu____20244 =
                        let uu____20251 = equal t1 t2  in
                        if uu____20251
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____20261 = mk_eq2 wl orig t1 t2  in
                           match uu____20261 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____20244 with
                      | (guard,wl1) ->
                          let uu____20282 = solve_prob orig guard [] wl1  in
                          solve env uu____20282
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (FStar_Syntax_Syntax.Tm_uinst uu____20284,uu____20285) ->
                  let head1 =
                    let uu____20293 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____20293
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____20333 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____20333
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____20373 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____20373
                    then
                      let uu____20374 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____20375 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____20376 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____20374 uu____20375 uu____20376
                    else ());
                   (let no_free_uvars t =
                      (let uu____20386 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____20386) &&
                        (let uu____20390 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____20390)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____20406 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____20406 = FStar_Syntax_Util.Equal  in
                    let uu____20407 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____20407
                    then
                      let uu____20408 =
                        let uu____20415 = equal t1 t2  in
                        if uu____20415
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____20425 = mk_eq2 wl orig t1 t2  in
                           match uu____20425 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____20408 with
                      | (guard,wl1) ->
                          let uu____20446 = solve_prob orig guard [] wl1  in
                          solve env uu____20446
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (FStar_Syntax_Syntax.Tm_name uu____20448,uu____20449) ->
                  let head1 =
                    let uu____20451 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____20451
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____20491 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____20491
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____20531 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____20531
                    then
                      let uu____20532 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____20533 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____20534 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____20532 uu____20533 uu____20534
                    else ());
                   (let no_free_uvars t =
                      (let uu____20544 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____20544) &&
                        (let uu____20548 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____20548)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____20564 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____20564 = FStar_Syntax_Util.Equal  in
                    let uu____20565 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____20565
                    then
                      let uu____20566 =
                        let uu____20573 = equal t1 t2  in
                        if uu____20573
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____20583 = mk_eq2 wl orig t1 t2  in
                           match uu____20583 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____20566 with
                      | (guard,wl1) ->
                          let uu____20604 = solve_prob orig guard [] wl1  in
                          solve env uu____20604
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (FStar_Syntax_Syntax.Tm_constant uu____20606,uu____20607) ->
                  let head1 =
                    let uu____20609 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____20609
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____20649 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____20649
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____20689 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____20689
                    then
                      let uu____20690 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____20691 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____20692 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____20690 uu____20691 uu____20692
                    else ());
                   (let no_free_uvars t =
                      (let uu____20702 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____20702) &&
                        (let uu____20706 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____20706)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____20722 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____20722 = FStar_Syntax_Util.Equal  in
                    let uu____20723 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____20723
                    then
                      let uu____20724 =
                        let uu____20731 = equal t1 t2  in
                        if uu____20731
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____20741 = mk_eq2 wl orig t1 t2  in
                           match uu____20741 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____20724 with
                      | (guard,wl1) ->
                          let uu____20762 = solve_prob orig guard [] wl1  in
                          solve env uu____20762
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (FStar_Syntax_Syntax.Tm_fvar uu____20764,uu____20765) ->
                  let head1 =
                    let uu____20767 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____20767
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____20807 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____20807
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____20847 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____20847
                    then
                      let uu____20848 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____20849 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____20850 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____20848 uu____20849 uu____20850
                    else ());
                   (let no_free_uvars t =
                      (let uu____20860 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____20860) &&
                        (let uu____20864 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____20864)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____20880 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____20880 = FStar_Syntax_Util.Equal  in
                    let uu____20881 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____20881
                    then
                      let uu____20882 =
                        let uu____20889 = equal t1 t2  in
                        if uu____20889
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____20899 = mk_eq2 wl orig t1 t2  in
                           match uu____20899 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____20882 with
                      | (guard,wl1) ->
                          let uu____20920 = solve_prob orig guard [] wl1  in
                          solve env uu____20920
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (FStar_Syntax_Syntax.Tm_app uu____20922,uu____20923) ->
                  let head1 =
                    let uu____20939 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____20939
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____20979 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____20979
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____21019 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____21019
                    then
                      let uu____21020 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____21021 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____21022 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____21020 uu____21021 uu____21022
                    else ());
                   (let no_free_uvars t =
                      (let uu____21032 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____21032) &&
                        (let uu____21036 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____21036)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____21052 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____21052 = FStar_Syntax_Util.Equal  in
                    let uu____21053 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____21053
                    then
                      let uu____21054 =
                        let uu____21061 = equal t1 t2  in
                        if uu____21061
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____21071 = mk_eq2 wl orig t1 t2  in
                           match uu____21071 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____21054 with
                      | (guard,wl1) ->
                          let uu____21092 = solve_prob orig guard [] wl1  in
                          solve env uu____21092
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (uu____21094,FStar_Syntax_Syntax.Tm_match uu____21095) ->
                  let head1 =
                    let uu____21119 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____21119
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____21159 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____21159
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____21199 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____21199
                    then
                      let uu____21200 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____21201 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____21202 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____21200 uu____21201 uu____21202
                    else ());
                   (let no_free_uvars t =
                      (let uu____21212 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____21212) &&
                        (let uu____21216 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____21216)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____21232 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____21232 = FStar_Syntax_Util.Equal  in
                    let uu____21233 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____21233
                    then
                      let uu____21234 =
                        let uu____21241 = equal t1 t2  in
                        if uu____21241
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____21251 = mk_eq2 wl orig t1 t2  in
                           match uu____21251 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____21234 with
                      | (guard,wl1) ->
                          let uu____21272 = solve_prob orig guard [] wl1  in
                          solve env uu____21272
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (uu____21274,FStar_Syntax_Syntax.Tm_uinst uu____21275) ->
                  let head1 =
                    let uu____21283 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____21283
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____21317 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____21317
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____21351 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____21351
                    then
                      let uu____21352 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____21353 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____21354 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____21352 uu____21353 uu____21354
                    else ());
                   (let no_free_uvars t =
                      (let uu____21364 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____21364) &&
                        (let uu____21368 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____21368)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____21384 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____21384 = FStar_Syntax_Util.Equal  in
                    let uu____21385 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____21385
                    then
                      let uu____21386 =
                        let uu____21393 = equal t1 t2  in
                        if uu____21393
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____21403 = mk_eq2 wl orig t1 t2  in
                           match uu____21403 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____21386 with
                      | (guard,wl1) ->
                          let uu____21424 = solve_prob orig guard [] wl1  in
                          solve env uu____21424
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (uu____21426,FStar_Syntax_Syntax.Tm_name uu____21427) ->
                  let head1 =
                    let uu____21429 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____21429
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____21463 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____21463
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____21497 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____21497
                    then
                      let uu____21498 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____21499 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____21500 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____21498 uu____21499 uu____21500
                    else ());
                   (let no_free_uvars t =
                      (let uu____21510 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____21510) &&
                        (let uu____21514 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____21514)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____21530 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____21530 = FStar_Syntax_Util.Equal  in
                    let uu____21531 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____21531
                    then
                      let uu____21532 =
                        let uu____21539 = equal t1 t2  in
                        if uu____21539
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____21549 = mk_eq2 wl orig t1 t2  in
                           match uu____21549 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____21532 with
                      | (guard,wl1) ->
                          let uu____21570 = solve_prob orig guard [] wl1  in
                          solve env uu____21570
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (uu____21572,FStar_Syntax_Syntax.Tm_constant uu____21573) ->
                  let head1 =
                    let uu____21575 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____21575
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____21609 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____21609
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____21643 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____21643
                    then
                      let uu____21644 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____21645 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____21646 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____21644 uu____21645 uu____21646
                    else ());
                   (let no_free_uvars t =
                      (let uu____21656 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____21656) &&
                        (let uu____21660 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____21660)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____21676 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____21676 = FStar_Syntax_Util.Equal  in
                    let uu____21677 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____21677
                    then
                      let uu____21678 =
                        let uu____21685 = equal t1 t2  in
                        if uu____21685
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____21695 = mk_eq2 wl orig t1 t2  in
                           match uu____21695 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____21678 with
                      | (guard,wl1) ->
                          let uu____21716 = solve_prob orig guard [] wl1  in
                          solve env uu____21716
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (uu____21718,FStar_Syntax_Syntax.Tm_fvar uu____21719) ->
                  let head1 =
                    let uu____21721 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____21721
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____21761 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____21761
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____21801 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____21801
                    then
                      let uu____21802 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____21803 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____21804 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____21802 uu____21803 uu____21804
                    else ());
                   (let no_free_uvars t =
                      (let uu____21814 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____21814) &&
                        (let uu____21818 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____21818)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____21834 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____21834 = FStar_Syntax_Util.Equal  in
                    let uu____21835 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____21835
                    then
                      let uu____21836 =
                        let uu____21843 = equal t1 t2  in
                        if uu____21843
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____21853 = mk_eq2 wl orig t1 t2  in
                           match uu____21853 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____21836 with
                      | (guard,wl1) ->
                          let uu____21874 = solve_prob orig guard [] wl1  in
                          solve env uu____21874
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (uu____21876,FStar_Syntax_Syntax.Tm_app uu____21877) ->
                  let head1 =
                    let uu____21893 = FStar_Syntax_Util.head_and_args t1  in
                    FStar_All.pipe_right uu____21893
                      FStar_Pervasives_Native.fst
                     in
                  let head2 =
                    let uu____21927 = FStar_Syntax_Util.head_and_args t2  in
                    FStar_All.pipe_right uu____21927
                      FStar_Pervasives_Native.fst
                     in
                  ((let uu____21961 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "Rel")
                       in
                    if uu____21961
                    then
                      let uu____21962 =
                        FStar_Util.string_of_int
                          problem.FStar_TypeChecker_Common.pid
                         in
                      let uu____21963 =
                        FStar_Syntax_Print.term_to_string head1  in
                      let uu____21964 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print3
                        ">> (%s)\n>>> head1 = %s\n>>> head2 = %s\n"
                        uu____21962 uu____21963 uu____21964
                    else ());
                   (let no_free_uvars t =
                      (let uu____21974 = FStar_Syntax_Free.uvars t  in
                       FStar_Util.set_is_empty uu____21974) &&
                        (let uu____21978 = FStar_Syntax_Free.univs t  in
                         FStar_Util.set_is_empty uu____21978)
                       in
                    let equal t11 t21 =
                      let t12 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t11
                         in
                      let t22 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Iota] env t21
                         in
                      let uu____21994 = FStar_Syntax_Util.eq_tm t12 t22  in
                      uu____21994 = FStar_Syntax_Util.Equal  in
                    let uu____21995 =
                      (((((FStar_TypeChecker_Env.is_interpreted env head1) ||
                            (FStar_TypeChecker_Env.is_interpreted env head2))
                           &&
                           (problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.EQ))
                          && wl.smt_ok)
                         && (no_free_uvars t1))
                        && (no_free_uvars t2)
                       in
                    if uu____21995
                    then
                      let uu____21996 =
                        let uu____22003 = equal t1 t2  in
                        if uu____22003
                        then (FStar_Pervasives_Native.None, wl)
                        else
                          (let uu____22013 = mk_eq2 wl orig t1 t2  in
                           match uu____22013 with
                           | (g,wl1) ->
                               ((FStar_Pervasives_Native.Some g), wl1))
                         in
                      match uu____21996 with
                      | (guard,wl1) ->
                          let uu____22034 = solve_prob orig guard [] wl1  in
                          solve env uu____22034
                    else rigid_rigid_delta env orig wl head1 head2 t1 t2))
              | (FStar_Syntax_Syntax.Tm_let
                 uu____22036,FStar_Syntax_Syntax.Tm_let uu____22037) ->
                  let uu____22062 = FStar_Syntax_Util.term_eq t1 t2  in
                  if uu____22062
                  then
                    let uu____22063 =
                      solve_prob orig FStar_Pervasives_Native.None [] wl  in
                    solve env uu____22063
                  else giveup env "Tm_let mismatch (%s-%s vs %s-%s)" orig
              | (FStar_Syntax_Syntax.Tm_let uu____22065,uu____22066) ->
                  let uu____22079 =
                    let uu____22084 =
                      let uu____22085 = FStar_Syntax_Print.tag_of_term t1  in
                      let uu____22086 = FStar_Syntax_Print.tag_of_term t2  in
                      let uu____22087 = FStar_Syntax_Print.term_to_string t1
                         in
                      let uu____22088 = FStar_Syntax_Print.term_to_string t2
                         in
                      FStar_Util.format4
                        "Internal error: unexpected flex-flex of %s and %s\n>>> (%s) -- (%s)"
                        uu____22085 uu____22086 uu____22087 uu____22088
                       in
                    (FStar_Errors.Fatal_UnificationNotWellFormed,
                      uu____22084)
                     in
                  FStar_Errors.raise_error uu____22079
                    t1.FStar_Syntax_Syntax.pos
              | (uu____22089,FStar_Syntax_Syntax.Tm_let uu____22090) ->
                  let uu____22103 =
                    let uu____22108 =
                      let uu____22109 = FStar_Syntax_Print.tag_of_term t1  in
                      let uu____22110 = FStar_Syntax_Print.tag_of_term t2  in
                      let uu____22111 = FStar_Syntax_Print.term_to_string t1
                         in
                      let uu____22112 = FStar_Syntax_Print.term_to_string t2
                         in
                      FStar_Util.format4
                        "Internal error: unexpected flex-flex of %s and %s\n>>> (%s) -- (%s)"
                        uu____22109 uu____22110 uu____22111 uu____22112
                       in
                    (FStar_Errors.Fatal_UnificationNotWellFormed,
                      uu____22108)
                     in
                  FStar_Errors.raise_error uu____22103
                    t1.FStar_Syntax_Syntax.pos
              | uu____22113 -> giveup env "head tag mismatch" orig))))

and (solve_c :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp FStar_TypeChecker_Common.problem ->
      worklist -> solution)
  =
  fun env  ->
    fun problem  ->
      fun wl  ->
        let c1 = problem.FStar_TypeChecker_Common.lhs  in
        let c2 = problem.FStar_TypeChecker_Common.rhs  in
        let orig = FStar_TypeChecker_Common.CProb problem  in
        let sub_prob wl1 t1 rel t2 reason =
          mk_t_problem wl1 [] orig t1 rel t2 FStar_Pervasives_Native.None
            reason
           in
        let solve_eq c1_comp c2_comp =
          (let uu____22172 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "EQ")
              in
           if uu____22172
           then
             let uu____22173 =
               let uu____22174 = FStar_Syntax_Syntax.mk_Comp c1_comp  in
               FStar_Syntax_Print.comp_to_string uu____22174  in
             let uu____22175 =
               let uu____22176 = FStar_Syntax_Syntax.mk_Comp c2_comp  in
               FStar_Syntax_Print.comp_to_string uu____22176  in
             FStar_Util.print2
               "solve_c is using an equality constraint (%s vs %s)\n"
               uu____22173 uu____22175
           else ());
          (let uu____22178 =
             let uu____22179 =
               FStar_Ident.lid_equals c1_comp.FStar_Syntax_Syntax.effect_name
                 c2_comp.FStar_Syntax_Syntax.effect_name
                in
             Prims.op_Negation uu____22179  in
           if uu____22178
           then
             let uu____22180 =
               let uu____22181 =
                 FStar_Syntax_Print.lid_to_string
                   c1_comp.FStar_Syntax_Syntax.effect_name
                  in
               let uu____22182 =
                 FStar_Syntax_Print.lid_to_string
                   c2_comp.FStar_Syntax_Syntax.effect_name
                  in
               FStar_Util.format2 "incompatible effects: %s <> %s"
                 uu____22181 uu____22182
                in
             giveup env uu____22180 orig
           else
             (let uu____22184 =
                sub_prob wl c1_comp.FStar_Syntax_Syntax.result_typ
                  FStar_TypeChecker_Common.EQ
                  c2_comp.FStar_Syntax_Syntax.result_typ "effect ret type"
                 in
              match uu____22184 with
              | (ret_sub_prob,wl1) ->
                  let uu____22191 =
                    FStar_List.fold_right2
                      (fun uu____22224  ->
                         fun uu____22225  ->
                           fun uu____22226  ->
                             match (uu____22224, uu____22225, uu____22226)
                             with
                             | ((a1,uu____22262),(a2,uu____22264),(arg_sub_probs,wl2))
                                 ->
                                 let uu____22285 =
                                   sub_prob wl2 a1
                                     FStar_TypeChecker_Common.EQ a2
                                     "effect arg"
                                    in
                                 (match uu____22285 with
                                  | (p,wl3) -> ((p :: arg_sub_probs), wl3)))
                      c1_comp.FStar_Syntax_Syntax.effect_args
                      c2_comp.FStar_Syntax_Syntax.effect_args ([], wl1)
                     in
                  (match uu____22191 with
                   | (arg_sub_probs,wl2) ->
                       let sub_probs = ret_sub_prob :: arg_sub_probs  in
                       let guard =
                         let uu____22314 = FStar_List.map p_guard sub_probs
                            in
                         FStar_Syntax_Util.mk_conj_l uu____22314  in
                       let wl3 =
                         solve_prob orig (FStar_Pervasives_Native.Some guard)
                           [] wl2
                          in
                       let uu____22322 = attempt sub_probs wl3  in
                       solve env uu____22322)))
           in
        let solve_sub c11 edge c21 =
          let r = FStar_TypeChecker_Env.get_range env  in
          let lift_c1 uu____22345 =
            let wp =
              match c11.FStar_Syntax_Syntax.effect_args with
              | (wp1,uu____22348)::[] -> wp1
              | uu____22365 ->
                  let uu____22374 =
                    let uu____22375 =
                      let uu____22376 =
                        FStar_Ident.range_of_lid
                          c11.FStar_Syntax_Syntax.effect_name
                         in
                      FStar_Range.string_of_range uu____22376  in
                    FStar_Util.format1
                      "Unexpected number of indices on a normalized effect (%s)"
                      uu____22375
                     in
                  failwith uu____22374
               in
            let univs1 =
              match c11.FStar_Syntax_Syntax.comp_univs with
              | [] ->
                  let uu____22382 =
                    env.FStar_TypeChecker_Env.universe_of env
                      c11.FStar_Syntax_Syntax.result_typ
                     in
                  [uu____22382]
              | x -> x  in
            let uu____22384 =
              let uu____22393 =
                let uu____22400 =
                  let uu____22401 = FStar_List.hd univs1  in
                  (edge.FStar_TypeChecker_Env.mlift).FStar_TypeChecker_Env.mlift_wp
                    uu____22401 c11.FStar_Syntax_Syntax.result_typ wp
                   in
                FStar_Syntax_Syntax.as_arg uu____22400  in
              [uu____22393]  in
            {
              FStar_Syntax_Syntax.comp_univs = univs1;
              FStar_Syntax_Syntax.effect_name =
                (c21.FStar_Syntax_Syntax.effect_name);
              FStar_Syntax_Syntax.result_typ =
                (c11.FStar_Syntax_Syntax.result_typ);
              FStar_Syntax_Syntax.effect_args = uu____22384;
              FStar_Syntax_Syntax.flags = (c11.FStar_Syntax_Syntax.flags)
            }  in
          if
            problem.FStar_TypeChecker_Common.relation =
              FStar_TypeChecker_Common.EQ
          then let uu____22414 = lift_c1 ()  in solve_eq uu____22414 c21
          else
            (let is_null_wp_2 =
               FStar_All.pipe_right c21.FStar_Syntax_Syntax.flags
                 (FStar_Util.for_some
                    (fun uu___334_22420  ->
                       match uu___334_22420 with
                       | FStar_Syntax_Syntax.TOTAL  -> true
                       | FStar_Syntax_Syntax.MLEFFECT  -> true
                       | FStar_Syntax_Syntax.SOMETRIVIAL  -> true
                       | uu____22421 -> false))
                in
             let uu____22422 =
               match ((c11.FStar_Syntax_Syntax.effect_args),
                       (c21.FStar_Syntax_Syntax.effect_args))
               with
               | ((wp1,uu____22448)::uu____22449,(wp2,uu____22451)::uu____22452)
                   -> (wp1, wp2)
               | uu____22505 ->
                   let uu____22526 =
                     let uu____22531 =
                       let uu____22532 =
                         FStar_Syntax_Print.lid_to_string
                           c11.FStar_Syntax_Syntax.effect_name
                          in
                       let uu____22533 =
                         FStar_Syntax_Print.lid_to_string
                           c21.FStar_Syntax_Syntax.effect_name
                          in
                       FStar_Util.format2
                         "Got effects %s and %s, expected normalized effects"
                         uu____22532 uu____22533
                        in
                     (FStar_Errors.Fatal_ExpectNormalizedEffect, uu____22531)
                      in
                   FStar_Errors.raise_error uu____22526
                     env.FStar_TypeChecker_Env.range
                in
             match uu____22422 with
             | (wpc1,wpc2) ->
                 let uu____22540 = FStar_Util.physical_equality wpc1 wpc2  in
                 if uu____22540
                 then
                   let uu____22543 =
                     problem_using_guard orig
                       c11.FStar_Syntax_Syntax.result_typ
                       problem.FStar_TypeChecker_Common.relation
                       c21.FStar_Syntax_Syntax.result_typ
                       FStar_Pervasives_Native.None "result type"
                      in
                   solve_t env uu____22543 wl
                 else
                   (let uu____22545 =
                      let uu____22552 =
                        FStar_TypeChecker_Env.effect_decl_opt env
                          c21.FStar_Syntax_Syntax.effect_name
                         in
                      FStar_Util.must uu____22552  in
                    match uu____22545 with
                    | (c2_decl,qualifiers) ->
                        let uu____22573 =
                          FStar_All.pipe_right qualifiers
                            (FStar_List.contains
                               FStar_Syntax_Syntax.Reifiable)
                           in
                        if uu____22573
                        then
                          let c1_repr =
                            let uu____22577 =
                              let uu____22578 =
                                let uu____22579 = lift_c1 ()  in
                                FStar_Syntax_Syntax.mk_Comp uu____22579  in
                              let uu____22580 =
                                env.FStar_TypeChecker_Env.universe_of env
                                  c11.FStar_Syntax_Syntax.result_typ
                                 in
                              FStar_TypeChecker_Env.reify_comp env
                                uu____22578 uu____22580
                               in
                            FStar_TypeChecker_Normalize.normalize
                              [FStar_TypeChecker_Normalize.UnfoldUntil
                                 FStar_Syntax_Syntax.delta_constant;
                              FStar_TypeChecker_Normalize.Weak;
                              FStar_TypeChecker_Normalize.HNF] env
                              uu____22577
                             in
                          let c2_repr =
                            let uu____22582 =
                              let uu____22583 =
                                FStar_Syntax_Syntax.mk_Comp c21  in
                              let uu____22584 =
                                env.FStar_TypeChecker_Env.universe_of env
                                  c21.FStar_Syntax_Syntax.result_typ
                                 in
                              FStar_TypeChecker_Env.reify_comp env
                                uu____22583 uu____22584
                               in
                            FStar_TypeChecker_Normalize.normalize
                              [FStar_TypeChecker_Normalize.UnfoldUntil
                                 FStar_Syntax_Syntax.delta_constant;
                              FStar_TypeChecker_Normalize.Weak;
                              FStar_TypeChecker_Normalize.HNF] env
                              uu____22582
                             in
                          let uu____22585 =
                            let uu____22590 =
                              let uu____22591 =
                                FStar_Syntax_Print.term_to_string c1_repr  in
                              let uu____22592 =
                                FStar_Syntax_Print.term_to_string c2_repr  in
                              FStar_Util.format2 "sub effect repr: %s <: %s"
                                uu____22591 uu____22592
                               in
                            sub_prob wl c1_repr
                              problem.FStar_TypeChecker_Common.relation
                              c2_repr uu____22590
                             in
                          (match uu____22585 with
                           | (prob,wl1) ->
                               let wl2 =
                                 solve_prob orig
                                   (FStar_Pervasives_Native.Some
                                      (p_guard prob)) [] wl1
                                  in
                               let uu____22596 = attempt [prob] wl2  in
                               solve env uu____22596)
                        else
                          (let g =
                             if env.FStar_TypeChecker_Env.lax
                             then FStar_Syntax_Util.t_true
                             else
                               if is_null_wp_2
                               then
                                 ((let uu____22607 =
                                     FStar_All.pipe_left
                                       (FStar_TypeChecker_Env.debug env)
                                       (FStar_Options.Other "Rel")
                                      in
                                   if uu____22607
                                   then
                                     FStar_Util.print_string
                                       "Using trivial wp ... \n"
                                   else ());
                                  (let c1_univ =
                                     env.FStar_TypeChecker_Env.universe_of
                                       env c11.FStar_Syntax_Syntax.result_typ
                                      in
                                   let uu____22610 =
                                     let uu____22617 =
                                       let uu____22618 =
                                         let uu____22633 =
                                           FStar_TypeChecker_Env.inst_effect_fun_with
                                             [c1_univ] env c2_decl
                                             c2_decl.FStar_Syntax_Syntax.trivial
                                            in
                                         let uu____22636 =
                                           let uu____22645 =
                                             FStar_Syntax_Syntax.as_arg
                                               c11.FStar_Syntax_Syntax.result_typ
                                              in
                                           let uu____22652 =
                                             let uu____22661 =
                                               let uu____22668 =
                                                 (edge.FStar_TypeChecker_Env.mlift).FStar_TypeChecker_Env.mlift_wp
                                                   c1_univ
                                                   c11.FStar_Syntax_Syntax.result_typ
                                                   wpc1
                                                  in
                                               FStar_All.pipe_left
                                                 FStar_Syntax_Syntax.as_arg
                                                 uu____22668
                                                in
                                             [uu____22661]  in
                                           uu____22645 :: uu____22652  in
                                         (uu____22633, uu____22636)  in
                                       FStar_Syntax_Syntax.Tm_app uu____22618
                                        in
                                     FStar_Syntax_Syntax.mk uu____22617  in
                                   uu____22610 FStar_Pervasives_Native.None r))
                               else
                                 (let c1_univ =
                                    env.FStar_TypeChecker_Env.universe_of env
                                      c11.FStar_Syntax_Syntax.result_typ
                                     in
                                  let c2_univ =
                                    env.FStar_TypeChecker_Env.universe_of env
                                      c21.FStar_Syntax_Syntax.result_typ
                                     in
                                  let uu____22709 =
                                    let uu____22716 =
                                      let uu____22717 =
                                        let uu____22732 =
                                          FStar_TypeChecker_Env.inst_effect_fun_with
                                            [c2_univ] env c2_decl
                                            c2_decl.FStar_Syntax_Syntax.stronger
                                           in
                                        let uu____22735 =
                                          let uu____22744 =
                                            FStar_Syntax_Syntax.as_arg
                                              c21.FStar_Syntax_Syntax.result_typ
                                             in
                                          let uu____22751 =
                                            let uu____22760 =
                                              FStar_Syntax_Syntax.as_arg wpc2
                                               in
                                            let uu____22767 =
                                              let uu____22776 =
                                                let uu____22783 =
                                                  (edge.FStar_TypeChecker_Env.mlift).FStar_TypeChecker_Env.mlift_wp
                                                    c1_univ
                                                    c11.FStar_Syntax_Syntax.result_typ
                                                    wpc1
                                                   in
                                                FStar_All.pipe_left
                                                  FStar_Syntax_Syntax.as_arg
                                                  uu____22783
                                                 in
                                              [uu____22776]  in
                                            uu____22760 :: uu____22767  in
                                          uu____22744 :: uu____22751  in
                                        (uu____22732, uu____22735)  in
                                      FStar_Syntax_Syntax.Tm_app uu____22717
                                       in
                                    FStar_Syntax_Syntax.mk uu____22716  in
                                  uu____22709 FStar_Pervasives_Native.None r)
                              in
                           (let uu____22828 =
                              FStar_All.pipe_left
                                (FStar_TypeChecker_Env.debug env)
                                (FStar_Options.Other "Rel")
                               in
                            if uu____22828
                            then
                              let uu____22829 =
                                let uu____22830 =
                                  FStar_TypeChecker_Normalize.normalize
                                    [FStar_TypeChecker_Normalize.Iota;
                                    FStar_TypeChecker_Normalize.Eager_unfolding;
                                    FStar_TypeChecker_Normalize.Primops;
                                    FStar_TypeChecker_Normalize.Simplify] env
                                    g
                                   in
                                FStar_Syntax_Print.term_to_string uu____22830
                                 in
                              FStar_Util.print1
                                "WP guard (simplifed) is (%s)\n" uu____22829
                            else ());
                           (let uu____22832 =
                              sub_prob wl c11.FStar_Syntax_Syntax.result_typ
                                problem.FStar_TypeChecker_Common.relation
                                c21.FStar_Syntax_Syntax.result_typ
                                "result type"
                               in
                            match uu____22832 with
                            | (base_prob,wl1) ->
                                let wl2 =
                                  let uu____22840 =
                                    let uu____22843 =
                                      FStar_Syntax_Util.mk_conj
                                        (p_guard base_prob) g
                                       in
                                    FStar_All.pipe_left
                                      (fun _0_27  ->
                                         FStar_Pervasives_Native.Some _0_27)
                                      uu____22843
                                     in
                                  solve_prob orig uu____22840 [] wl1  in
                                let uu____22846 = attempt [base_prob] wl2  in
                                solve env uu____22846))))
           in
        let uu____22847 = FStar_Util.physical_equality c1 c2  in
        if uu____22847
        then
          let uu____22848 =
            solve_prob orig FStar_Pervasives_Native.None [] wl  in
          solve env uu____22848
        else
          ((let uu____22851 =
              FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                (FStar_Options.Other "Rel")
               in
            if uu____22851
            then
              let uu____22852 = FStar_Syntax_Print.comp_to_string c1  in
              let uu____22853 = FStar_Syntax_Print.comp_to_string c2  in
              FStar_Util.print3 "solve_c %s %s %s\n" uu____22852
                (rel_to_string problem.FStar_TypeChecker_Common.relation)
                uu____22853
            else ());
           (let uu____22855 =
              let uu____22864 =
                FStar_TypeChecker_Normalize.ghost_to_pure env c1  in
              let uu____22867 =
                FStar_TypeChecker_Normalize.ghost_to_pure env c2  in
              (uu____22864, uu____22867)  in
            match uu____22855 with
            | (c11,c21) ->
                (match ((c11.FStar_Syntax_Syntax.n),
                         (c21.FStar_Syntax_Syntax.n))
                 with
                 | (FStar_Syntax_Syntax.GTotal
                    (t1,uu____22885),FStar_Syntax_Syntax.Total
                    (t2,uu____22887)) when
                     FStar_Syntax_Util.non_informative t2 ->
                     let uu____22904 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2
                         FStar_Pervasives_Native.None "result type"
                        in
                     solve_t env uu____22904 wl
                 | (FStar_Syntax_Syntax.GTotal
                    uu____22905,FStar_Syntax_Syntax.Total uu____22906) ->
                     giveup env "incompatible monad ordering: GTot </: Tot"
                       orig
                 | (FStar_Syntax_Syntax.Total
                    (t1,uu____22924),FStar_Syntax_Syntax.Total
                    (t2,uu____22926)) ->
                     let uu____22943 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2
                         FStar_Pervasives_Native.None "result type"
                        in
                     solve_t env uu____22943 wl
                 | (FStar_Syntax_Syntax.GTotal
                    (t1,uu____22945),FStar_Syntax_Syntax.GTotal
                    (t2,uu____22947)) ->
                     let uu____22964 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2
                         FStar_Pervasives_Native.None "result type"
                        in
                     solve_t env uu____22964 wl
                 | (FStar_Syntax_Syntax.Total
                    (t1,uu____22966),FStar_Syntax_Syntax.GTotal
                    (t2,uu____22968)) ->
                     let uu____22985 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2
                         FStar_Pervasives_Native.None "result type"
                        in
                     solve_t env uu____22985 wl
                 | (FStar_Syntax_Syntax.GTotal
                    uu____22986,FStar_Syntax_Syntax.Comp uu____22987) ->
                     let uu____22996 =
                       let uu___388_22999 = problem  in
                       let uu____23002 =
                         let uu____23003 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c11  in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____23003
                          in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___388_22999.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs = uu____23002;
                         FStar_TypeChecker_Common.relation =
                           (uu___388_22999.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs =
                           (uu___388_22999.FStar_TypeChecker_Common.rhs);
                         FStar_TypeChecker_Common.element =
                           (uu___388_22999.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___388_22999.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.logical_guard_uvar =
                           (uu___388_22999.FStar_TypeChecker_Common.logical_guard_uvar);
                         FStar_TypeChecker_Common.reason =
                           (uu___388_22999.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___388_22999.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___388_22999.FStar_TypeChecker_Common.rank)
                       }  in
                     solve_c env uu____22996 wl
                 | (FStar_Syntax_Syntax.Total
                    uu____23004,FStar_Syntax_Syntax.Comp uu____23005) ->
                     let uu____23014 =
                       let uu___388_23017 = problem  in
                       let uu____23020 =
                         let uu____23021 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c11  in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____23021
                          in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___388_23017.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs = uu____23020;
                         FStar_TypeChecker_Common.relation =
                           (uu___388_23017.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs =
                           (uu___388_23017.FStar_TypeChecker_Common.rhs);
                         FStar_TypeChecker_Common.element =
                           (uu___388_23017.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___388_23017.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.logical_guard_uvar =
                           (uu___388_23017.FStar_TypeChecker_Common.logical_guard_uvar);
                         FStar_TypeChecker_Common.reason =
                           (uu___388_23017.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___388_23017.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___388_23017.FStar_TypeChecker_Common.rank)
                       }  in
                     solve_c env uu____23014 wl
                 | (FStar_Syntax_Syntax.Comp
                    uu____23022,FStar_Syntax_Syntax.GTotal uu____23023) ->
                     let uu____23032 =
                       let uu___389_23035 = problem  in
                       let uu____23038 =
                         let uu____23039 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c21  in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____23039
                          in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___389_23035.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs =
                           (uu___389_23035.FStar_TypeChecker_Common.lhs);
                         FStar_TypeChecker_Common.relation =
                           (uu___389_23035.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs = uu____23038;
                         FStar_TypeChecker_Common.element =
                           (uu___389_23035.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___389_23035.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.logical_guard_uvar =
                           (uu___389_23035.FStar_TypeChecker_Common.logical_guard_uvar);
                         FStar_TypeChecker_Common.reason =
                           (uu___389_23035.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___389_23035.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___389_23035.FStar_TypeChecker_Common.rank)
                       }  in
                     solve_c env uu____23032 wl
                 | (FStar_Syntax_Syntax.Comp
                    uu____23040,FStar_Syntax_Syntax.Total uu____23041) ->
                     let uu____23050 =
                       let uu___389_23053 = problem  in
                       let uu____23056 =
                         let uu____23057 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c21  in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____23057
                          in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___389_23053.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs =
                           (uu___389_23053.FStar_TypeChecker_Common.lhs);
                         FStar_TypeChecker_Common.relation =
                           (uu___389_23053.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs = uu____23056;
                         FStar_TypeChecker_Common.element =
                           (uu___389_23053.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___389_23053.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.logical_guard_uvar =
                           (uu___389_23053.FStar_TypeChecker_Common.logical_guard_uvar);
                         FStar_TypeChecker_Common.reason =
                           (uu___389_23053.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___389_23053.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___389_23053.FStar_TypeChecker_Common.rank)
                       }  in
                     solve_c env uu____23050 wl
                 | (FStar_Syntax_Syntax.Comp
                    uu____23058,FStar_Syntax_Syntax.Comp uu____23059) ->
                     let uu____23060 =
                       (((FStar_Syntax_Util.is_ml_comp c11) &&
                           (FStar_Syntax_Util.is_ml_comp c21))
                          ||
                          ((FStar_Syntax_Util.is_total_comp c11) &&
                             (FStar_Syntax_Util.is_total_comp c21)))
                         ||
                         (((FStar_Syntax_Util.is_total_comp c11) &&
                             (FStar_Syntax_Util.is_ml_comp c21))
                            &&
                            (problem.FStar_TypeChecker_Common.relation =
                               FStar_TypeChecker_Common.SUB))
                        in
                     if uu____23060
                     then
                       let uu____23061 =
                         problem_using_guard orig
                           (FStar_Syntax_Util.comp_result c11)
                           problem.FStar_TypeChecker_Common.relation
                           (FStar_Syntax_Util.comp_result c21)
                           FStar_Pervasives_Native.None "result type"
                          in
                       solve_t env uu____23061 wl
                     else
                       (let c1_comp =
                          FStar_TypeChecker_Env.comp_to_comp_typ env c11  in
                        let c2_comp =
                          FStar_TypeChecker_Env.comp_to_comp_typ env c21  in
                        if
                          problem.FStar_TypeChecker_Common.relation =
                            FStar_TypeChecker_Common.EQ
                        then
                          let uu____23065 =
                            let uu____23070 =
                              FStar_Ident.lid_equals
                                c1_comp.FStar_Syntax_Syntax.effect_name
                                c2_comp.FStar_Syntax_Syntax.effect_name
                               in
                            if uu____23070
                            then (c1_comp, c2_comp)
                            else
                              (let uu____23076 =
                                 FStar_TypeChecker_Env.unfold_effect_abbrev
                                   env c11
                                  in
                               let uu____23077 =
                                 FStar_TypeChecker_Env.unfold_effect_abbrev
                                   env c21
                                  in
                               (uu____23076, uu____23077))
                             in
                          match uu____23065 with
                          | (c1_comp1,c2_comp1) -> solve_eq c1_comp1 c2_comp1
                        else
                          (let c12 =
                             FStar_TypeChecker_Env.unfold_effect_abbrev env
                               c11
                              in
                           let c22 =
                             FStar_TypeChecker_Env.unfold_effect_abbrev env
                               c21
                              in
                           (let uu____23084 =
                              FStar_All.pipe_left
                                (FStar_TypeChecker_Env.debug env)
                                (FStar_Options.Other "Rel")
                               in
                            if uu____23084
                            then
                              FStar_Util.print2 "solve_c for %s and %s\n"
                                (c12.FStar_Syntax_Syntax.effect_name).FStar_Ident.str
                                (c22.FStar_Syntax_Syntax.effect_name).FStar_Ident.str
                            else ());
                           (let uu____23086 =
                              FStar_TypeChecker_Env.monad_leq env
                                c12.FStar_Syntax_Syntax.effect_name
                                c22.FStar_Syntax_Syntax.effect_name
                               in
                            match uu____23086 with
                            | FStar_Pervasives_Native.None  ->
                                let uu____23089 =
                                  let uu____23090 =
                                    FStar_Syntax_Print.lid_to_string
                                      c12.FStar_Syntax_Syntax.effect_name
                                     in
                                  let uu____23091 =
                                    FStar_Syntax_Print.lid_to_string
                                      c22.FStar_Syntax_Syntax.effect_name
                                     in
                                  FStar_Util.format2
                                    "incompatible monad ordering: %s </: %s"
                                    uu____23090 uu____23091
                                   in
                                giveup env uu____23089 orig
                            | FStar_Pervasives_Native.Some edge ->
                                solve_sub c12 edge c22))))))

let (print_pending_implicits : FStar_TypeChecker_Env.guard_t -> Prims.string)
  =
  fun g  ->
    let uu____23098 =
      FStar_All.pipe_right g.FStar_TypeChecker_Env.implicits
        (FStar_List.map
           (fun uu____23126  ->
              match uu____23126 with
              | (uu____23135,tm,uu____23137,uu____23138) ->
                  FStar_Syntax_Print.term_to_string tm))
       in
    FStar_All.pipe_right uu____23098 (FStar_String.concat ", ")
  
let (ineqs_to_string :
  (FStar_Syntax_Syntax.universe Prims.list,(FStar_Syntax_Syntax.universe,
                                             FStar_Syntax_Syntax.universe)
                                             FStar_Pervasives_Native.tuple2
                                             Prims.list)
    FStar_Pervasives_Native.tuple2 -> Prims.string)
  =
  fun ineqs  ->
    let vars =
      let uu____23171 =
        FStar_All.pipe_right (FStar_Pervasives_Native.fst ineqs)
          (FStar_List.map FStar_Syntax_Print.univ_to_string)
         in
      FStar_All.pipe_right uu____23171 (FStar_String.concat ", ")  in
    let ineqs1 =
      let uu____23189 =
        FStar_All.pipe_right (FStar_Pervasives_Native.snd ineqs)
          (FStar_List.map
             (fun uu____23217  ->
                match uu____23217 with
                | (u1,u2) ->
                    let uu____23224 = FStar_Syntax_Print.univ_to_string u1
                       in
                    let uu____23225 = FStar_Syntax_Print.univ_to_string u2
                       in
                    FStar_Util.format2 "%s < %s" uu____23224 uu____23225))
         in
      FStar_All.pipe_right uu____23189 (FStar_String.concat ", ")  in
    FStar_Util.format2 "Solving for {%s}; inequalities are {%s}" vars ineqs1
  
let (guard_to_string :
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Env.guard_t -> Prims.string)
  =
  fun env  ->
    fun g  ->
      match ((g.FStar_TypeChecker_Env.guard_f),
              (g.FStar_TypeChecker_Env.deferred),
              (g.FStar_TypeChecker_Env.univ_ineqs))
      with
      | (FStar_TypeChecker_Common.Trivial ,[],(uu____23252,[])) -> "{}"
      | uu____23277 ->
          let form =
            match g.FStar_TypeChecker_Env.guard_f with
            | FStar_TypeChecker_Common.Trivial  -> "trivial"
            | FStar_TypeChecker_Common.NonTrivial f ->
                let uu____23300 =
                  ((FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                      (FStar_Options.Other "Rel"))
                     ||
                     (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                        FStar_Options.Extreme))
                    || (FStar_Options.print_implicits ())
                   in
                if uu____23300
                then FStar_TypeChecker_Normalize.term_to_string env f
                else "non-trivial"
             in
          let carry =
            let uu____23303 =
              FStar_List.map
                (fun uu____23313  ->
                   match uu____23313 with
                   | (uu____23318,x) -> prob_to_string env x)
                g.FStar_TypeChecker_Env.deferred
               in
            FStar_All.pipe_right uu____23303 (FStar_String.concat ",\n")  in
          let imps = print_pending_implicits g  in
          let uu____23323 =
            ineqs_to_string g.FStar_TypeChecker_Env.univ_ineqs  in
          FStar_Util.format4
            "\n\t{guard_f=%s;\n\t deferred={\n%s};\n\t univ_ineqs={%s};\n\t implicits={%s}}\n"
            form carry uu____23323 imps
  
let (new_t_problem :
  worklist ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_TypeChecker_Common.rel ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
            FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
              FStar_Range.range ->
                (FStar_TypeChecker_Common.prob,worklist)
                  FStar_Pervasives_Native.tuple2)
  =
  fun wl  ->
    fun env  ->
      fun lhs  ->
        fun rel  ->
          fun rhs  ->
            fun elt  ->
              fun loc  ->
                let reason =
                  let uu____23376 =
                    (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       (FStar_Options.Other "ExplainRel"))
                      ||
                      (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "Rel"))
                     in
                  if uu____23376
                  then
                    let uu____23377 =
                      FStar_TypeChecker_Normalize.term_to_string env lhs  in
                    let uu____23378 =
                      FStar_TypeChecker_Normalize.term_to_string env rhs  in
                    FStar_Util.format3 "Top-level:\n%s\n\t%s\n%s" uu____23377
                      (rel_to_string rel) uu____23378
                  else "TOP"  in
                let uu____23380 =
                  new_problem wl env lhs rel rhs elt loc reason  in
                match uu____23380 with
                | (p,wl1) ->
                    (def_check_prob (Prims.strcat "new_t_problem." reason)
                       (FStar_TypeChecker_Common.TProb p);
                     ((FStar_TypeChecker_Common.TProb p), wl1))
  
let (new_t_prob :
  worklist ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_TypeChecker_Common.rel ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
            (FStar_TypeChecker_Common.prob,FStar_Syntax_Syntax.bv,worklist)
              FStar_Pervasives_Native.tuple3)
  =
  fun wl  ->
    fun env  ->
      fun t1  ->
        fun rel  ->
          fun t2  ->
            let x =
              let uu____23438 =
                let uu____23441 = FStar_TypeChecker_Env.get_range env  in
                FStar_All.pipe_left
                  (fun _0_28  -> FStar_Pervasives_Native.Some _0_28)
                  uu____23441
                 in
              FStar_Syntax_Syntax.new_bv uu____23438 t1  in
            let uu____23444 =
              let uu____23449 = FStar_TypeChecker_Env.get_range env  in
              new_t_problem wl env t1 rel t2 (FStar_Pervasives_Native.Some x)
                uu____23449
               in
            match uu____23444 with | (p,wl1) -> (p, x, wl1)
  
let (solve_and_commit :
  FStar_TypeChecker_Env.env ->
    worklist ->
      ((FStar_TypeChecker_Common.prob,Prims.string)
         FStar_Pervasives_Native.tuple2 ->
         (FStar_TypeChecker_Common.deferred,FStar_TypeChecker_Env.implicits)
           FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option)
        ->
        (FStar_TypeChecker_Common.deferred,FStar_TypeChecker_Env.implicits)
          FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun probs  ->
      fun err  ->
        let tx = FStar_Syntax_Unionfind.new_transaction ()  in
        let sol = solve env probs  in
        match sol with
        | Success (deferred,implicits) ->
            (FStar_Syntax_Unionfind.commit tx;
             FStar_Pervasives_Native.Some (deferred, implicits))
        | Failed (d,s) ->
            ((let uu____23522 =
                (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                   (FStar_Options.Other "ExplainRel"))
                  ||
                  (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                     (FStar_Options.Other "Rel"))
                 in
              if uu____23522
              then
                let uu____23523 = explain env d s  in
                FStar_All.pipe_left FStar_Util.print_string uu____23523
              else ());
             (let result = err (d, s)  in
              FStar_Syntax_Unionfind.rollback tx; result))
  
let (simplify_guard :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  =
  fun env  ->
    fun g  ->
      match g.FStar_TypeChecker_Env.guard_f with
      | FStar_TypeChecker_Common.Trivial  -> g
      | FStar_TypeChecker_Common.NonTrivial f ->
          ((let uu____23545 =
              FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                (FStar_Options.Other "Simplification")
               in
            if uu____23545
            then
              let uu____23546 = FStar_Syntax_Print.term_to_string f  in
              FStar_Util.print1 "Simplifying guard %s\n" uu____23546
            else ());
           (let f1 =
              FStar_TypeChecker_Normalize.normalize
                [FStar_TypeChecker_Normalize.Beta;
                FStar_TypeChecker_Normalize.Eager_unfolding;
                FStar_TypeChecker_Normalize.Simplify;
                FStar_TypeChecker_Normalize.Primops;
                FStar_TypeChecker_Normalize.NoFullNorm] env f
               in
            (let uu____23550 =
               FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                 (FStar_Options.Other "Simplification")
                in
             if uu____23550
             then
               let uu____23551 = FStar_Syntax_Print.term_to_string f1  in
               FStar_Util.print1 "Simplified guard to %s\n" uu____23551
             else ());
            (let f2 =
               let uu____23554 =
                 let uu____23555 = FStar_Syntax_Util.unmeta f1  in
                 uu____23555.FStar_Syntax_Syntax.n  in
               match uu____23554 with
               | FStar_Syntax_Syntax.Tm_fvar fv when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.true_lid
                   -> FStar_TypeChecker_Common.Trivial
               | uu____23559 -> FStar_TypeChecker_Common.NonTrivial f1  in
             let uu___390_23560 = g  in
             {
               FStar_TypeChecker_Env.guard_f = f2;
               FStar_TypeChecker_Env.deferred =
                 (uu___390_23560.FStar_TypeChecker_Env.deferred);
               FStar_TypeChecker_Env.univ_ineqs =
                 (uu___390_23560.FStar_TypeChecker_Env.univ_ineqs);
               FStar_TypeChecker_Env.implicits =
                 (uu___390_23560.FStar_TypeChecker_Env.implicits)
             })))
  
let (with_guard :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob ->
      (FStar_TypeChecker_Common.deferred,(Prims.string,FStar_Syntax_Syntax.term,
                                           FStar_Syntax_Syntax.ctx_uvar,
                                           FStar_Range.range)
                                           FStar_Pervasives_Native.tuple4
                                           Prims.list)
        FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option ->
        FStar_TypeChecker_Env.guard_t FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun prob  ->
      fun dopt  ->
        match dopt with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some (deferred,implicits) ->
            let uu____23662 =
              let uu____23663 =
                let uu____23664 =
                  FStar_All.pipe_right (p_guard prob)
                    (fun _0_29  -> FStar_TypeChecker_Common.NonTrivial _0_29)
                   in
                {
                  FStar_TypeChecker_Env.guard_f = uu____23664;
                  FStar_TypeChecker_Env.deferred = deferred;
                  FStar_TypeChecker_Env.univ_ineqs = ([], []);
                  FStar_TypeChecker_Env.implicits = implicits
                }  in
              simplify_guard env uu____23663  in
            FStar_All.pipe_left
              (fun _0_30  -> FStar_Pervasives_Native.Some _0_30) uu____23662
  
let with_guard_no_simp :
  'Auu____23679 .
    'Auu____23679 ->
      FStar_TypeChecker_Common.prob ->
        FStar_TypeChecker_Common.deferred FStar_Pervasives_Native.option ->
          FStar_TypeChecker_Env.guard_t FStar_Pervasives_Native.option
  =
  fun env  ->
    fun prob  ->
      fun dopt  ->
        match dopt with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some d ->
            let uu____23702 =
              let uu____23703 =
                FStar_All.pipe_right (p_guard prob)
                  (fun _0_31  -> FStar_TypeChecker_Common.NonTrivial _0_31)
                 in
              {
                FStar_TypeChecker_Env.guard_f = uu____23703;
                FStar_TypeChecker_Env.deferred = d;
                FStar_TypeChecker_Env.univ_ineqs = ([], []);
                FStar_TypeChecker_Env.implicits = []
              }  in
            FStar_Pervasives_Native.Some uu____23702
  
let (try_teq :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.typ ->
          FStar_TypeChecker_Env.guard_t FStar_Pervasives_Native.option)
  =
  fun smt_ok  ->
    fun env  ->
      fun t1  ->
        fun t2  ->
          (let uu____23741 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Rel")
              in
           if uu____23741
           then
             let uu____23742 = FStar_Syntax_Print.term_to_string t1  in
             let uu____23743 = FStar_Syntax_Print.term_to_string t2  in
             FStar_Util.print2 "try_teq of %s and %s\n" uu____23742
               uu____23743
           else ());
          (let uu____23745 =
             let uu____23750 = FStar_TypeChecker_Env.get_range env  in
             new_t_problem (empty_worklist env) env t1
               FStar_TypeChecker_Common.EQ t2 FStar_Pervasives_Native.None
               uu____23750
              in
           match uu____23745 with
           | (prob,wl) ->
               let g =
                 let uu____23758 =
                   solve_and_commit env (singleton wl prob smt_ok)
                     (fun uu____23776  -> FStar_Pervasives_Native.None)
                    in
                 FStar_All.pipe_left (with_guard env prob) uu____23758  in
               g)
  
let (teq :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.typ -> FStar_TypeChecker_Env.guard_t)
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        let uu____23818 = try_teq true env t1 t2  in
        match uu____23818 with
        | FStar_Pervasives_Native.None  ->
            ((let uu____23822 = FStar_TypeChecker_Env.get_range env  in
              let uu____23823 =
                FStar_TypeChecker_Err.basic_type_error env
                  FStar_Pervasives_Native.None t2 t1
                 in
              FStar_Errors.log_issue uu____23822 uu____23823);
             FStar_TypeChecker_Env.trivial_guard)
        | FStar_Pervasives_Native.Some g ->
            ((let uu____23830 =
                FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                  (FStar_Options.Other "Rel")
                 in
              if uu____23830
              then
                let uu____23831 = FStar_Syntax_Print.term_to_string t1  in
                let uu____23832 = FStar_Syntax_Print.term_to_string t2  in
                let uu____23833 = guard_to_string env g  in
                FStar_Util.print3
                  "teq of %s and %s succeeded with guard %s\n" uu____23831
                  uu____23832 uu____23833
              else ());
             g)
  
let (subtype_fail :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ -> unit)
  =
  fun env  ->
    fun e  ->
      fun t1  ->
        fun t2  ->
          let uu____23855 = FStar_TypeChecker_Env.get_range env  in
          let uu____23856 =
            FStar_TypeChecker_Err.basic_type_error env
              (FStar_Pervasives_Native.Some e) t2 t1
             in
          FStar_Errors.log_issue uu____23855 uu____23856
  
let (sub_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.comp ->
        FStar_TypeChecker_Env.guard_t FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
        let rel =
          if env.FStar_TypeChecker_Env.use_eq
          then FStar_TypeChecker_Common.EQ
          else FStar_TypeChecker_Common.SUB  in
        (let uu____23881 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Rel")
            in
         if uu____23881
         then
           let uu____23882 = FStar_Syntax_Print.comp_to_string c1  in
           let uu____23883 = FStar_Syntax_Print.comp_to_string c2  in
           FStar_Util.print3 "sub_comp of %s --and-- %s --with-- %s\n"
             uu____23882 uu____23883
             (if rel = FStar_TypeChecker_Common.EQ then "EQ" else "SUB")
         else ());
        (let uu____23886 =
           let uu____23893 = FStar_TypeChecker_Env.get_range env  in
           new_problem (empty_worklist env) env c1 rel c2
             FStar_Pervasives_Native.None uu____23893 "sub_comp"
            in
         match uu____23886 with
         | (prob,wl) ->
             let prob1 = FStar_TypeChecker_Common.CProb prob  in
             (def_check_prob "sub_comp" prob1;
              (let uu____23904 =
                 solve_and_commit env (singleton wl prob1 true)
                   (fun uu____23922  -> FStar_Pervasives_Native.None)
                  in
               FStar_All.pipe_left (with_guard env prob1) uu____23904)))
  
let (solve_universe_inequalities' :
  FStar_Syntax_Unionfind.tx ->
    FStar_TypeChecker_Env.env ->
      (FStar_Syntax_Syntax.universe Prims.list,(FStar_Syntax_Syntax.universe,
                                                 FStar_Syntax_Syntax.universe)
                                                 FStar_Pervasives_Native.tuple2
                                                 Prims.list)
        FStar_Pervasives_Native.tuple2 -> unit)
  =
  fun tx  ->
    fun env  ->
      fun uu____23975  ->
        match uu____23975 with
        | (variables,ineqs) ->
            let fail1 u1 u2 =
              FStar_Syntax_Unionfind.rollback tx;
              (let uu____24018 =
                 let uu____24023 =
                   let uu____24024 = FStar_Syntax_Print.univ_to_string u1  in
                   let uu____24025 = FStar_Syntax_Print.univ_to_string u2  in
                   FStar_Util.format2 "Universe %s and %s are incompatible"
                     uu____24024 uu____24025
                    in
                 (FStar_Errors.Fatal_IncompatibleUniverse, uu____24023)  in
               let uu____24026 = FStar_TypeChecker_Env.get_range env  in
               FStar_Errors.raise_error uu____24018 uu____24026)
               in
            let equiv1 v1 v' =
              let uu____24038 =
                let uu____24043 = FStar_Syntax_Subst.compress_univ v1  in
                let uu____24044 = FStar_Syntax_Subst.compress_univ v'  in
                (uu____24043, uu____24044)  in
              match uu____24038 with
              | (FStar_Syntax_Syntax.U_unif v0,FStar_Syntax_Syntax.U_unif
                 v0') -> FStar_Syntax_Unionfind.univ_equiv v0 v0'
              | uu____24063 -> false  in
            let sols =
              FStar_All.pipe_right variables
                (FStar_List.collect
                   (fun v1  ->
                      let uu____24093 = FStar_Syntax_Subst.compress_univ v1
                         in
                      match uu____24093 with
                      | FStar_Syntax_Syntax.U_unif uu____24100 ->
                          let lower_bounds_of_v =
                            FStar_All.pipe_right ineqs
                              (FStar_List.collect
                                 (fun uu____24129  ->
                                    match uu____24129 with
                                    | (u,v') ->
                                        let uu____24138 = equiv1 v1 v'  in
                                        if uu____24138
                                        then
                                          let uu____24141 =
                                            FStar_All.pipe_right variables
                                              (FStar_Util.for_some (equiv1 u))
                                             in
                                          (if uu____24141 then [] else [u])
                                        else []))
                             in
                          let lb =
                            FStar_TypeChecker_Normalize.normalize_universe
                              env
                              (FStar_Syntax_Syntax.U_max lower_bounds_of_v)
                             in
                          [(lb, v1)]
                      | uu____24157 -> []))
               in
            let uu____24162 =
              let wl =
                let uu___391_24166 = empty_worklist env  in
                {
                  attempting = (uu___391_24166.attempting);
                  wl_deferred = (uu___391_24166.wl_deferred);
                  ctr = (uu___391_24166.ctr);
                  defer_ok = false;
                  smt_ok = (uu___391_24166.smt_ok);
                  tcenv = (uu___391_24166.tcenv);
                  wl_implicits = (uu___391_24166.wl_implicits)
                }  in
              FStar_All.pipe_right sols
                (FStar_List.map
                   (fun uu____24184  ->
                      match uu____24184 with
                      | (lb,v1) ->
                          let uu____24191 =
                            solve_universe_eq (~- (Prims.parse_int "1")) wl
                              lb v1
                             in
                          (match uu____24191 with
                           | USolved wl1 -> ()
                           | uu____24193 -> fail1 lb v1)))
               in
            let rec check_ineq uu____24203 =
              match uu____24203 with
              | (u,v1) ->
                  let u1 =
                    FStar_TypeChecker_Normalize.normalize_universe env u  in
                  let v2 =
                    FStar_TypeChecker_Normalize.normalize_universe env v1  in
                  (match (u1, v2) with
                   | (FStar_Syntax_Syntax.U_zero ,uu____24212) -> true
                   | (FStar_Syntax_Syntax.U_succ
                      u0,FStar_Syntax_Syntax.U_succ v0) ->
                       check_ineq (u0, v0)
                   | (FStar_Syntax_Syntax.U_name
                      u0,FStar_Syntax_Syntax.U_name v0) ->
                       FStar_Ident.ident_equals u0 v0
                   | (FStar_Syntax_Syntax.U_unif
                      u0,FStar_Syntax_Syntax.U_unif v0) ->
                       FStar_Syntax_Unionfind.univ_equiv u0 v0
                   | (FStar_Syntax_Syntax.U_name
                      uu____24235,FStar_Syntax_Syntax.U_succ v0) ->
                       check_ineq (u1, v0)
                   | (FStar_Syntax_Syntax.U_unif
                      uu____24237,FStar_Syntax_Syntax.U_succ v0) ->
                       check_ineq (u1, v0)
                   | (FStar_Syntax_Syntax.U_max us,uu____24248) ->
                       FStar_All.pipe_right us
                         (FStar_Util.for_all (fun u2  -> check_ineq (u2, v2)))
                   | (uu____24255,FStar_Syntax_Syntax.U_max vs) ->
                       FStar_All.pipe_right vs
                         (FStar_Util.for_some
                            (fun v3  -> check_ineq (u1, v3)))
                   | uu____24263 -> false)
               in
            let uu____24268 =
              FStar_All.pipe_right ineqs
                (FStar_Util.for_all
                   (fun uu____24283  ->
                      match uu____24283 with
                      | (u,v1) ->
                          let uu____24290 = check_ineq (u, v1)  in
                          if uu____24290
                          then true
                          else
                            ((let uu____24293 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  (FStar_Options.Other "GenUniverses")
                                 in
                              if uu____24293
                              then
                                let uu____24294 =
                                  FStar_Syntax_Print.univ_to_string u  in
                                let uu____24295 =
                                  FStar_Syntax_Print.univ_to_string v1  in
                                FStar_Util.print2 "%s </= %s" uu____24294
                                  uu____24295
                              else ());
                             false)))
               in
            if uu____24268
            then ()
            else
              ((let uu____24299 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                    (FStar_Options.Other "GenUniverses")
                   in
                if uu____24299
                then
                  ((let uu____24301 = ineqs_to_string (variables, ineqs)  in
                    FStar_Util.print1
                      "Partially solved inequality constraints are: %s\n"
                      uu____24301);
                   FStar_Syntax_Unionfind.rollback tx;
                   (let uu____24311 = ineqs_to_string (variables, ineqs)  in
                    FStar_Util.print1
                      "Original solved inequality constraints are: %s\n"
                      uu____24311))
                else ());
               (let uu____24321 = FStar_TypeChecker_Env.get_range env  in
                FStar_Errors.raise_error
                  (FStar_Errors.Fatal_FailToSolveUniverseInEquality,
                    "Failed to solve universe inequalities for inductives")
                  uu____24321))
  
let (solve_universe_inequalities :
  FStar_TypeChecker_Env.env ->
    (FStar_Syntax_Syntax.universe Prims.list,(FStar_Syntax_Syntax.universe,
                                               FStar_Syntax_Syntax.universe)
                                               FStar_Pervasives_Native.tuple2
                                               Prims.list)
      FStar_Pervasives_Native.tuple2 -> unit)
  =
  fun env  ->
    fun ineqs  ->
      let tx = FStar_Syntax_Unionfind.new_transaction ()  in
      solve_universe_inequalities' tx env ineqs;
      FStar_Syntax_Unionfind.commit tx
  
let (try_solve_deferred_constraints :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  =
  fun defer_ok  ->
    fun env  ->
      fun g  ->
        let fail1 uu____24388 =
          match uu____24388 with
          | (d,s) ->
              let msg = explain env d s  in
              FStar_Errors.raise_error
                (FStar_Errors.Fatal_ErrorInSolveDeferredConstraints, msg)
                (p_loc d)
           in
        let wl =
          let uu___392_24409 =
            wl_of_guard env g.FStar_TypeChecker_Env.deferred  in
          {
            attempting = (uu___392_24409.attempting);
            wl_deferred = (uu___392_24409.wl_deferred);
            ctr = (uu___392_24409.ctr);
            defer_ok;
            smt_ok = (uu___392_24409.smt_ok);
            tcenv = (uu___392_24409.tcenv);
            wl_implicits = (uu___392_24409.wl_implicits)
          }  in
        (let uu____24411 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Rel")
            in
         if uu____24411
         then
           let uu____24412 = FStar_Util.string_of_bool defer_ok  in
           let uu____24413 = wl_to_string wl  in
           let uu____24414 =
             FStar_Util.string_of_int
               (FStar_List.length g.FStar_TypeChecker_Env.implicits)
              in
           FStar_Util.print3
             "Trying to solve carried problems (defer_ok=%s): begin\n\t%s\nend\n and %s implicits\n"
             uu____24412 uu____24413 uu____24414
         else ());
        (let g1 =
           let uu____24425 = solve_and_commit env wl fail1  in
           match uu____24425 with
           | FStar_Pervasives_Native.Some
               (uu____24432::uu____24433,uu____24434) when
               Prims.op_Negation defer_ok ->
               failwith "Impossible: Unexpected deferred constraints remain"
           | FStar_Pervasives_Native.Some (deferred,imps) ->
               let uu___393_24459 = g  in
               {
                 FStar_TypeChecker_Env.guard_f =
                   (uu___393_24459.FStar_TypeChecker_Env.guard_f);
                 FStar_TypeChecker_Env.deferred = deferred;
                 FStar_TypeChecker_Env.univ_ineqs =
                   (uu___393_24459.FStar_TypeChecker_Env.univ_ineqs);
                 FStar_TypeChecker_Env.implicits =
                   (FStar_List.append g.FStar_TypeChecker_Env.implicits imps)
               }
           | uu____24468 ->
               failwith "Impossible: should have raised a failure already"
            in
         solve_universe_inequalities env g1.FStar_TypeChecker_Env.univ_ineqs;
         (let uu___394_24476 = g1  in
          {
            FStar_TypeChecker_Env.guard_f =
              (uu___394_24476.FStar_TypeChecker_Env.guard_f);
            FStar_TypeChecker_Env.deferred =
              (uu___394_24476.FStar_TypeChecker_Env.deferred);
            FStar_TypeChecker_Env.univ_ineqs = ([], []);
            FStar_TypeChecker_Env.implicits =
              (uu___394_24476.FStar_TypeChecker_Env.implicits)
          }))
  
let (solve_deferred_constraints :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  = fun env  -> fun g  -> try_solve_deferred_constraints false env g 
let (solve_some_deferred_constraints :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  = fun env  -> fun g  -> try_solve_deferred_constraints true env g 
let (last_proof_ns :
  FStar_TypeChecker_Env.proof_namespace FStar_Pervasives_Native.option
    FStar_ST.ref)
  = FStar_Util.mk_ref FStar_Pervasives_Native.None 
let (maybe_update_proof_ns : FStar_TypeChecker_Env.env -> unit) =
  fun env  ->
    let pns = env.FStar_TypeChecker_Env.proof_ns  in
    let uu____24524 = FStar_ST.op_Bang last_proof_ns  in
    match uu____24524 with
    | FStar_Pervasives_Native.None  ->
        FStar_ST.op_Colon_Equals last_proof_ns
          (FStar_Pervasives_Native.Some pns)
    | FStar_Pervasives_Native.Some old ->
        if old = pns
        then ()
        else
          ((env.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.refresh
             ();
           FStar_ST.op_Colon_Equals last_proof_ns
             (FStar_Pervasives_Native.Some pns))
  
let (discharge_guard' :
  (unit -> Prims.string) FStar_Pervasives_Native.option ->
    FStar_TypeChecker_Env.env ->
      FStar_TypeChecker_Env.guard_t ->
        Prims.bool ->
          FStar_TypeChecker_Env.guard_t FStar_Pervasives_Native.option)
  =
  fun use_env_range_msg  ->
    fun env  ->
      fun g  ->
        fun use_smt  ->
          let debug1 =
            ((FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                (FStar_Options.Other "Rel"))
               ||
               (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                  (FStar_Options.Other "SMTQuery")))
              ||
              (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                 (FStar_Options.Other "Tac"))
             in
          let g1 = solve_deferred_constraints env g  in
          let ret_g =
            let uu___395_24647 = g1  in
            {
              FStar_TypeChecker_Env.guard_f =
                FStar_TypeChecker_Common.Trivial;
              FStar_TypeChecker_Env.deferred =
                (uu___395_24647.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___395_24647.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___395_24647.FStar_TypeChecker_Env.implicits)
            }  in
          let uu____24648 =
            let uu____24649 = FStar_TypeChecker_Env.should_verify env  in
            Prims.op_Negation uu____24649  in
          if uu____24648
          then FStar_Pervasives_Native.Some ret_g
          else
            (match g1.FStar_TypeChecker_Env.guard_f with
             | FStar_TypeChecker_Common.Trivial  ->
                 FStar_Pervasives_Native.Some ret_g
             | FStar_TypeChecker_Common.NonTrivial vc ->
                 (if debug1
                  then
                    (let uu____24657 = FStar_TypeChecker_Env.get_range env
                        in
                     let uu____24658 =
                       let uu____24659 = FStar_Syntax_Print.term_to_string vc
                          in
                       FStar_Util.format1 "Before normalization VC=\n%s\n"
                         uu____24659
                        in
                     FStar_Errors.diag uu____24657 uu____24658)
                  else ();
                  (let vc1 =
                     FStar_TypeChecker_Normalize.normalize
                       [FStar_TypeChecker_Normalize.Eager_unfolding;
                       FStar_TypeChecker_Normalize.Simplify;
                       FStar_TypeChecker_Normalize.Primops] env vc
                      in
                   if debug1
                   then
                     (let uu____24663 = FStar_TypeChecker_Env.get_range env
                         in
                      let uu____24664 =
                        let uu____24665 =
                          FStar_Syntax_Print.term_to_string vc1  in
                        FStar_Util.format1 "After normalization VC=\n%s\n"
                          uu____24665
                         in
                      FStar_Errors.diag uu____24663 uu____24664)
                   else ();
                   (let uu____24668 = FStar_TypeChecker_Env.get_range env  in
                    FStar_TypeChecker_Env.def_check_closed_in_env uu____24668
                      "discharge_guard'" env vc1);
                   (let uu____24669 = FStar_TypeChecker_Env.check_trivial vc1
                       in
                    match uu____24669 with
                    | FStar_TypeChecker_Common.Trivial  ->
                        FStar_Pervasives_Native.Some ret_g
                    | FStar_TypeChecker_Common.NonTrivial vc2 ->
                        if Prims.op_Negation use_smt
                        then
                          (if debug1
                           then
                             (let uu____24676 =
                                FStar_TypeChecker_Env.get_range env  in
                              let uu____24677 =
                                let uu____24678 =
                                  FStar_Syntax_Print.term_to_string vc2  in
                                FStar_Util.format1
                                  "Cannot solve without SMT : %s\n"
                                  uu____24678
                                 in
                              FStar_Errors.diag uu____24676 uu____24677)
                           else ();
                           FStar_Pervasives_Native.None)
                        else
                          (if debug1
                           then
                             (let uu____24683 =
                                FStar_TypeChecker_Env.get_range env  in
                              let uu____24684 =
                                let uu____24685 =
                                  FStar_Syntax_Print.term_to_string vc2  in
                                FStar_Util.format1 "Checking VC=\n%s\n"
                                  uu____24685
                                 in
                              FStar_Errors.diag uu____24683 uu____24684)
                           else ();
                           (let vcs =
                              let uu____24696 = FStar_Options.use_tactics ()
                                 in
                              if uu____24696
                              then
                                FStar_Options.with_saved_options
                                  (fun uu____24716  ->
                                     (let uu____24718 =
                                        FStar_Options.set_options
                                          FStar_Options.Set "--no_tactics"
                                         in
                                      FStar_All.pipe_left (fun a237  -> ())
                                        uu____24718);
                                     (let vcs =
                                        (env.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.preprocess
                                          env vc2
                                         in
                                      FStar_All.pipe_right vcs
                                        (FStar_List.map
                                           (fun uu____24761  ->
                                              match uu____24761 with
                                              | (env1,goal,opts) ->
                                                  let uu____24777 =
                                                    FStar_TypeChecker_Normalize.normalize
                                                      [FStar_TypeChecker_Normalize.Simplify;
                                                      FStar_TypeChecker_Normalize.Primops]
                                                      env1 goal
                                                     in
                                                  (env1, uu____24777, opts)))))
                              else
                                (let uu____24779 =
                                   let uu____24786 = FStar_Options.peek ()
                                      in
                                   (env, vc2, uu____24786)  in
                                 [uu____24779])
                               in
                            FStar_All.pipe_right vcs
                              (FStar_List.iter
                                 (fun uu____24819  ->
                                    match uu____24819 with
                                    | (env1,goal,opts) ->
                                        let uu____24829 =
                                          FStar_TypeChecker_Env.check_trivial
                                            goal
                                           in
                                        (match uu____24829 with
                                         | FStar_TypeChecker_Common.Trivial 
                                             ->
                                             if debug1
                                             then
                                               FStar_Util.print_string
                                                 "Goal completely solved by tactic\n"
                                             else ()
                                         | FStar_TypeChecker_Common.NonTrivial
                                             goal1 ->
                                             (FStar_Options.push ();
                                              FStar_Options.set opts;
                                              maybe_update_proof_ns env1;
                                              if debug1
                                              then
                                                (let uu____24837 =
                                                   FStar_TypeChecker_Env.get_range
                                                     env1
                                                    in
                                                 let uu____24838 =
                                                   let uu____24839 =
                                                     FStar_Syntax_Print.term_to_string
                                                       goal1
                                                      in
                                                   let uu____24840 =
                                                     FStar_TypeChecker_Env.string_of_proof_ns
                                                       env1
                                                      in
                                                   FStar_Util.format2
                                                     "Trying to solve:\n> %s\nWith proof_ns:\n %s\n"
                                                     uu____24839 uu____24840
                                                    in
                                                 FStar_Errors.diag
                                                   uu____24837 uu____24838)
                                              else ();
                                              if debug1
                                              then
                                                (let uu____24843 =
                                                   FStar_TypeChecker_Env.get_range
                                                     env1
                                                    in
                                                 let uu____24844 =
                                                   let uu____24845 =
                                                     FStar_Syntax_Print.term_to_string
                                                       goal1
                                                      in
                                                   FStar_Util.format1
                                                     "Before calling solver VC=\n%s\n"
                                                     uu____24845
                                                    in
                                                 FStar_Errors.diag
                                                   uu____24843 uu____24844)
                                              else ();
                                              (env1.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.solve
                                                use_env_range_msg env1 goal1;
                                              FStar_Options.pop ())))));
                           FStar_Pervasives_Native.Some ret_g)))))
  
let (discharge_guard_no_smt :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  =
  fun env  ->
    fun g  ->
      let uu____24859 =
        discharge_guard' FStar_Pervasives_Native.None env g false  in
      match uu____24859 with
      | FStar_Pervasives_Native.Some g1 -> g1
      | FStar_Pervasives_Native.None  ->
          let uu____24866 = FStar_TypeChecker_Env.get_range env  in
          FStar_Errors.raise_error
            (FStar_Errors.Fatal_ExpectTrivialPreCondition,
              "Expected a trivial pre-condition") uu____24866
  
let (discharge_guard :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  =
  fun env  ->
    fun g  ->
      let uu____24877 =
        discharge_guard' FStar_Pervasives_Native.None env g true  in
      match uu____24877 with
      | FStar_Pervasives_Native.Some g1 -> g1
      | FStar_Pervasives_Native.None  ->
          failwith
            "Impossible, with use_smt = true, discharge_guard' should never have returned None"
  
let (resolve_implicits' :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      Prims.bool ->
        FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  =
  fun env  ->
    fun must_total  ->
      fun forcelax  ->
        fun g  ->
          let unresolved ctx_u =
            let uu____24910 =
              FStar_Syntax_Unionfind.find
                ctx_u.FStar_Syntax_Syntax.ctx_uvar_head
               in
            match uu____24910 with
            | FStar_Pervasives_Native.Some uu____24913 -> false
            | FStar_Pervasives_Native.None  -> true  in
          let rec until_fixpoint acc implicits =
            let uu____24933 = acc  in
            match uu____24933 with
            | (out,changed) ->
                (match implicits with
                 | [] ->
                     if Prims.op_Negation changed
                     then out
                     else until_fixpoint ([], false) out
                 | hd1::tl1 ->
                     let uu____24985 = hd1  in
                     (match uu____24985 with
                      | (reason,tm,ctx_u,r) ->
                          if
                            ctx_u.FStar_Syntax_Syntax.ctx_uvar_should_check =
                              FStar_Syntax_Syntax.Allow_unresolved
                          then until_fixpoint (out, true) tl1
                          else
                            (let uu____24999 = unresolved ctx_u  in
                             if uu____24999
                             then until_fixpoint ((hd1 :: out), changed) tl1
                             else
                               if
                                 ctx_u.FStar_Syntax_Syntax.ctx_uvar_should_check
                                   = FStar_Syntax_Syntax.Allow_untyped
                               then until_fixpoint (out, true) tl1
                               else
                                 (let env1 =
                                    let uu___396_25011 = env  in
                                    {
                                      FStar_TypeChecker_Env.solver =
                                        (uu___396_25011.FStar_TypeChecker_Env.solver);
                                      FStar_TypeChecker_Env.range =
                                        (uu___396_25011.FStar_TypeChecker_Env.range);
                                      FStar_TypeChecker_Env.curmodule =
                                        (uu___396_25011.FStar_TypeChecker_Env.curmodule);
                                      FStar_TypeChecker_Env.gamma =
                                        (ctx_u.FStar_Syntax_Syntax.ctx_uvar_gamma);
                                      FStar_TypeChecker_Env.gamma_sig =
                                        (uu___396_25011.FStar_TypeChecker_Env.gamma_sig);
                                      FStar_TypeChecker_Env.gamma_cache =
                                        (uu___396_25011.FStar_TypeChecker_Env.gamma_cache);
                                      FStar_TypeChecker_Env.modules =
                                        (uu___396_25011.FStar_TypeChecker_Env.modules);
                                      FStar_TypeChecker_Env.expected_typ =
                                        (uu___396_25011.FStar_TypeChecker_Env.expected_typ);
                                      FStar_TypeChecker_Env.sigtab =
                                        (uu___396_25011.FStar_TypeChecker_Env.sigtab);
                                      FStar_TypeChecker_Env.is_pattern =
                                        (uu___396_25011.FStar_TypeChecker_Env.is_pattern);
                                      FStar_TypeChecker_Env.instantiate_imp =
                                        (uu___396_25011.FStar_TypeChecker_Env.instantiate_imp);
                                      FStar_TypeChecker_Env.effects =
                                        (uu___396_25011.FStar_TypeChecker_Env.effects);
                                      FStar_TypeChecker_Env.generalize =
                                        (uu___396_25011.FStar_TypeChecker_Env.generalize);
                                      FStar_TypeChecker_Env.letrecs =
                                        (uu___396_25011.FStar_TypeChecker_Env.letrecs);
                                      FStar_TypeChecker_Env.top_level =
                                        (uu___396_25011.FStar_TypeChecker_Env.top_level);
                                      FStar_TypeChecker_Env.check_uvars =
                                        (uu___396_25011.FStar_TypeChecker_Env.check_uvars);
                                      FStar_TypeChecker_Env.use_eq =
                                        (uu___396_25011.FStar_TypeChecker_Env.use_eq);
                                      FStar_TypeChecker_Env.is_iface =
                                        (uu___396_25011.FStar_TypeChecker_Env.is_iface);
                                      FStar_TypeChecker_Env.admit =
                                        (uu___396_25011.FStar_TypeChecker_Env.admit);
                                      FStar_TypeChecker_Env.lax =
                                        (uu___396_25011.FStar_TypeChecker_Env.lax);
                                      FStar_TypeChecker_Env.lax_universes =
                                        (uu___396_25011.FStar_TypeChecker_Env.lax_universes);
                                      FStar_TypeChecker_Env.phase1 =
                                        (uu___396_25011.FStar_TypeChecker_Env.phase1);
                                      FStar_TypeChecker_Env.failhard =
                                        (uu___396_25011.FStar_TypeChecker_Env.failhard);
                                      FStar_TypeChecker_Env.nosynth =
                                        (uu___396_25011.FStar_TypeChecker_Env.nosynth);
                                      FStar_TypeChecker_Env.uvar_subtyping =
                                        (uu___396_25011.FStar_TypeChecker_Env.uvar_subtyping);
                                      FStar_TypeChecker_Env.tc_term =
                                        (uu___396_25011.FStar_TypeChecker_Env.tc_term);
                                      FStar_TypeChecker_Env.type_of =
                                        (uu___396_25011.FStar_TypeChecker_Env.type_of);
                                      FStar_TypeChecker_Env.universe_of =
                                        (uu___396_25011.FStar_TypeChecker_Env.universe_of);
                                      FStar_TypeChecker_Env.check_type_of =
                                        (uu___396_25011.FStar_TypeChecker_Env.check_type_of);
                                      FStar_TypeChecker_Env.use_bv_sorts =
                                        (uu___396_25011.FStar_TypeChecker_Env.use_bv_sorts);
                                      FStar_TypeChecker_Env.qtbl_name_and_index
                                        =
                                        (uu___396_25011.FStar_TypeChecker_Env.qtbl_name_and_index);
                                      FStar_TypeChecker_Env.normalized_eff_names
                                        =
                                        (uu___396_25011.FStar_TypeChecker_Env.normalized_eff_names);
                                      FStar_TypeChecker_Env.proof_ns =
                                        (uu___396_25011.FStar_TypeChecker_Env.proof_ns);
                                      FStar_TypeChecker_Env.synth_hook =
                                        (uu___396_25011.FStar_TypeChecker_Env.synth_hook);
                                      FStar_TypeChecker_Env.splice =
                                        (uu___396_25011.FStar_TypeChecker_Env.splice);
                                      FStar_TypeChecker_Env.is_native_tactic
                                        =
                                        (uu___396_25011.FStar_TypeChecker_Env.is_native_tactic);
                                      FStar_TypeChecker_Env.identifier_info =
                                        (uu___396_25011.FStar_TypeChecker_Env.identifier_info);
                                      FStar_TypeChecker_Env.tc_hooks =
                                        (uu___396_25011.FStar_TypeChecker_Env.tc_hooks);
                                      FStar_TypeChecker_Env.dsenv =
                                        (uu___396_25011.FStar_TypeChecker_Env.dsenv);
                                      FStar_TypeChecker_Env.dep_graph =
                                        (uu___396_25011.FStar_TypeChecker_Env.dep_graph)
                                    }  in
                                  let tm1 =
                                    FStar_TypeChecker_Normalize.normalize
                                      [FStar_TypeChecker_Normalize.Beta] env1
                                      tm
                                     in
                                  let env2 =
                                    if forcelax
                                    then
                                      let uu___397_25014 = env1  in
                                      {
                                        FStar_TypeChecker_Env.solver =
                                          (uu___397_25014.FStar_TypeChecker_Env.solver);
                                        FStar_TypeChecker_Env.range =
                                          (uu___397_25014.FStar_TypeChecker_Env.range);
                                        FStar_TypeChecker_Env.curmodule =
                                          (uu___397_25014.FStar_TypeChecker_Env.curmodule);
                                        FStar_TypeChecker_Env.gamma =
                                          (uu___397_25014.FStar_TypeChecker_Env.gamma);
                                        FStar_TypeChecker_Env.gamma_sig =
                                          (uu___397_25014.FStar_TypeChecker_Env.gamma_sig);
                                        FStar_TypeChecker_Env.gamma_cache =
                                          (uu___397_25014.FStar_TypeChecker_Env.gamma_cache);
                                        FStar_TypeChecker_Env.modules =
                                          (uu___397_25014.FStar_TypeChecker_Env.modules);
                                        FStar_TypeChecker_Env.expected_typ =
                                          (uu___397_25014.FStar_TypeChecker_Env.expected_typ);
                                        FStar_TypeChecker_Env.sigtab =
                                          (uu___397_25014.FStar_TypeChecker_Env.sigtab);
                                        FStar_TypeChecker_Env.is_pattern =
                                          (uu___397_25014.FStar_TypeChecker_Env.is_pattern);
                                        FStar_TypeChecker_Env.instantiate_imp
                                          =
                                          (uu___397_25014.FStar_TypeChecker_Env.instantiate_imp);
                                        FStar_TypeChecker_Env.effects =
                                          (uu___397_25014.FStar_TypeChecker_Env.effects);
                                        FStar_TypeChecker_Env.generalize =
                                          (uu___397_25014.FStar_TypeChecker_Env.generalize);
                                        FStar_TypeChecker_Env.letrecs =
                                          (uu___397_25014.FStar_TypeChecker_Env.letrecs);
                                        FStar_TypeChecker_Env.top_level =
                                          (uu___397_25014.FStar_TypeChecker_Env.top_level);
                                        FStar_TypeChecker_Env.check_uvars =
                                          (uu___397_25014.FStar_TypeChecker_Env.check_uvars);
                                        FStar_TypeChecker_Env.use_eq =
                                          (uu___397_25014.FStar_TypeChecker_Env.use_eq);
                                        FStar_TypeChecker_Env.is_iface =
                                          (uu___397_25014.FStar_TypeChecker_Env.is_iface);
                                        FStar_TypeChecker_Env.admit =
                                          (uu___397_25014.FStar_TypeChecker_Env.admit);
                                        FStar_TypeChecker_Env.lax = true;
                                        FStar_TypeChecker_Env.lax_universes =
                                          (uu___397_25014.FStar_TypeChecker_Env.lax_universes);
                                        FStar_TypeChecker_Env.phase1 =
                                          (uu___397_25014.FStar_TypeChecker_Env.phase1);
                                        FStar_TypeChecker_Env.failhard =
                                          (uu___397_25014.FStar_TypeChecker_Env.failhard);
                                        FStar_TypeChecker_Env.nosynth =
                                          (uu___397_25014.FStar_TypeChecker_Env.nosynth);
                                        FStar_TypeChecker_Env.uvar_subtyping
                                          =
                                          (uu___397_25014.FStar_TypeChecker_Env.uvar_subtyping);
                                        FStar_TypeChecker_Env.tc_term =
                                          (uu___397_25014.FStar_TypeChecker_Env.tc_term);
                                        FStar_TypeChecker_Env.type_of =
                                          (uu___397_25014.FStar_TypeChecker_Env.type_of);
                                        FStar_TypeChecker_Env.universe_of =
                                          (uu___397_25014.FStar_TypeChecker_Env.universe_of);
                                        FStar_TypeChecker_Env.check_type_of =
                                          (uu___397_25014.FStar_TypeChecker_Env.check_type_of);
                                        FStar_TypeChecker_Env.use_bv_sorts =
                                          (uu___397_25014.FStar_TypeChecker_Env.use_bv_sorts);
                                        FStar_TypeChecker_Env.qtbl_name_and_index
                                          =
                                          (uu___397_25014.FStar_TypeChecker_Env.qtbl_name_and_index);
                                        FStar_TypeChecker_Env.normalized_eff_names
                                          =
                                          (uu___397_25014.FStar_TypeChecker_Env.normalized_eff_names);
                                        FStar_TypeChecker_Env.proof_ns =
                                          (uu___397_25014.FStar_TypeChecker_Env.proof_ns);
                                        FStar_TypeChecker_Env.synth_hook =
                                          (uu___397_25014.FStar_TypeChecker_Env.synth_hook);
                                        FStar_TypeChecker_Env.splice =
                                          (uu___397_25014.FStar_TypeChecker_Env.splice);
                                        FStar_TypeChecker_Env.is_native_tactic
                                          =
                                          (uu___397_25014.FStar_TypeChecker_Env.is_native_tactic);
                                        FStar_TypeChecker_Env.identifier_info
                                          =
                                          (uu___397_25014.FStar_TypeChecker_Env.identifier_info);
                                        FStar_TypeChecker_Env.tc_hooks =
                                          (uu___397_25014.FStar_TypeChecker_Env.tc_hooks);
                                        FStar_TypeChecker_Env.dsenv =
                                          (uu___397_25014.FStar_TypeChecker_Env.dsenv);
                                        FStar_TypeChecker_Env.dep_graph =
                                          (uu___397_25014.FStar_TypeChecker_Env.dep_graph)
                                      }
                                    else env1  in
                                  (let uu____25017 =
                                     FStar_All.pipe_left
                                       (FStar_TypeChecker_Env.debug env2)
                                       (FStar_Options.Other "Rel")
                                      in
                                   if uu____25017
                                   then
                                     let uu____25018 =
                                       FStar_Syntax_Print.uvar_to_string
                                         ctx_u.FStar_Syntax_Syntax.ctx_uvar_head
                                        in
                                     let uu____25019 =
                                       FStar_Syntax_Print.term_to_string tm1
                                        in
                                     let uu____25020 =
                                       FStar_Syntax_Print.term_to_string
                                         ctx_u.FStar_Syntax_Syntax.ctx_uvar_typ
                                        in
                                     let uu____25021 =
                                       FStar_Range.string_of_range r  in
                                     FStar_Util.print5
                                       "Checking uvar %s resolved to %s at type %s, introduce for %s at %s\n"
                                       uu____25018 uu____25019 uu____25020
                                       reason uu____25021
                                   else ());
                                  (let g1 =
                                     try
                                       env2.FStar_TypeChecker_Env.check_type_of
                                         must_total env2 tm1
                                         ctx_u.FStar_Syntax_Syntax.ctx_uvar_typ
                                     with
                                     | e when FStar_Errors.handleable e ->
                                         ((let uu____25032 =
                                             let uu____25041 =
                                               let uu____25048 =
                                                 let uu____25049 =
                                                   FStar_Syntax_Print.uvar_to_string
                                                     ctx_u.FStar_Syntax_Syntax.ctx_uvar_head
                                                    in
                                                 let uu____25050 =
                                                   FStar_TypeChecker_Normalize.term_to_string
                                                     env2 tm1
                                                    in
                                                 let uu____25051 =
                                                   FStar_TypeChecker_Normalize.term_to_string
                                                     env2
                                                     ctx_u.FStar_Syntax_Syntax.ctx_uvar_typ
                                                    in
                                                 FStar_Util.format3
                                                   "Failed while checking implicit %s set to %s of expected type %s"
                                                   uu____25049 uu____25050
                                                   uu____25051
                                                  in
                                               (FStar_Errors.Error_BadImplicit,
                                                 uu____25048, r)
                                                in
                                             [uu____25041]  in
                                           FStar_Errors.add_errors
                                             uu____25032);
                                          FStar_Exn.raise e)
                                      in
                                   let g2 =
                                     if env2.FStar_TypeChecker_Env.is_pattern
                                     then
                                       let uu___400_25065 = g1  in
                                       {
                                         FStar_TypeChecker_Env.guard_f =
                                           FStar_TypeChecker_Common.Trivial;
                                         FStar_TypeChecker_Env.deferred =
                                           (uu___400_25065.FStar_TypeChecker_Env.deferred);
                                         FStar_TypeChecker_Env.univ_ineqs =
                                           (uu___400_25065.FStar_TypeChecker_Env.univ_ineqs);
                                         FStar_TypeChecker_Env.implicits =
                                           (uu___400_25065.FStar_TypeChecker_Env.implicits)
                                       }
                                     else g1  in
                                   let g' =
                                     let uu____25068 =
                                       discharge_guard'
                                         (FStar_Pervasives_Native.Some
                                            (fun uu____25078  ->
                                               let uu____25079 =
                                                 FStar_Syntax_Print.term_to_string
                                                   tm1
                                                  in
                                               let uu____25080 =
                                                 FStar_Range.string_of_range
                                                   r
                                                  in
                                               let uu____25081 =
                                                 FStar_Range.string_of_range
                                                   tm1.FStar_Syntax_Syntax.pos
                                                  in
                                               FStar_Util.format4
                                                 "%s (Introduced at %s for %s resolved at %s)"
                                                 uu____25079 uu____25080
                                                 reason uu____25081)) env2 g2
                                         true
                                        in
                                     match uu____25068 with
                                     | FStar_Pervasives_Native.Some g3 -> g3
                                     | FStar_Pervasives_Native.None  ->
                                         failwith
                                           "Impossible, with use_smt = true, discharge_guard' should never have returned None"
                                      in
                                   until_fixpoint
                                     ((FStar_List.append
                                         g'.FStar_TypeChecker_Env.implicits
                                         out), true) tl1)))))
             in
          let uu___401_25091 = g  in
          let uu____25092 =
            until_fixpoint ([], false) g.FStar_TypeChecker_Env.implicits  in
          {
            FStar_TypeChecker_Env.guard_f =
              (uu___401_25091.FStar_TypeChecker_Env.guard_f);
            FStar_TypeChecker_Env.deferred =
              (uu___401_25091.FStar_TypeChecker_Env.deferred);
            FStar_TypeChecker_Env.univ_ineqs =
              (uu___401_25091.FStar_TypeChecker_Env.univ_ineqs);
            FStar_TypeChecker_Env.implicits = uu____25092
          }
  
let (resolve_implicits :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  = fun env  -> fun g  -> resolve_implicits' env true false g 
let (resolve_implicits_tac :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  = fun env  -> fun g  -> resolve_implicits' env false true g 
let (force_trivial_guard :
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Env.guard_t -> unit) =
  fun env  ->
    fun g  ->
      let g1 =
        let uu____25142 = solve_deferred_constraints env g  in
        FStar_All.pipe_right uu____25142 (resolve_implicits env)  in
      match g1.FStar_TypeChecker_Env.implicits with
      | [] ->
          let uu____25151 = discharge_guard env g1  in
          FStar_All.pipe_left (fun a238  -> ()) uu____25151
      | (reason,e,ctx_u,r)::uu____25156 ->
          let uu____25175 =
            let uu____25180 =
              let uu____25181 =
                FStar_Syntax_Print.uvar_to_string
                  ctx_u.FStar_Syntax_Syntax.ctx_uvar_head
                 in
              let uu____25182 =
                FStar_TypeChecker_Normalize.term_to_string env
                  ctx_u.FStar_Syntax_Syntax.ctx_uvar_typ
                 in
              FStar_Util.format3
                "Failed to resolve implicit argument %s of type %s introduced for %s"
                uu____25181 uu____25182 reason
               in
            (FStar_Errors.Fatal_FailToResolveImplicitArgument, uu____25180)
             in
          FStar_Errors.raise_error uu____25175 r
  
let (universe_inequality :
  FStar_Syntax_Syntax.universe ->
    FStar_Syntax_Syntax.universe -> FStar_TypeChecker_Env.guard_t)
  =
  fun u1  ->
    fun u2  ->
      let uu___402_25193 = FStar_TypeChecker_Env.trivial_guard  in
      {
        FStar_TypeChecker_Env.guard_f =
          (uu___402_25193.FStar_TypeChecker_Env.guard_f);
        FStar_TypeChecker_Env.deferred =
          (uu___402_25193.FStar_TypeChecker_Env.deferred);
        FStar_TypeChecker_Env.univ_ineqs = ([], [(u1, u2)]);
        FStar_TypeChecker_Env.implicits =
          (uu___402_25193.FStar_TypeChecker_Env.implicits)
      }
  
let (discharge_guard_nosmt :
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Env.guard_t -> Prims.bool) =
  fun env  ->
    fun g  ->
      let uu____25208 =
        discharge_guard' FStar_Pervasives_Native.None env g false  in
      match uu____25208 with
      | FStar_Pervasives_Native.Some uu____25214 -> true
      | FStar_Pervasives_Native.None  -> false
  
let (teq_nosmt :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ -> Prims.bool)
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        let uu____25230 = try_teq false env t1 t2  in
        match uu____25230 with
        | FStar_Pervasives_Native.None  -> false
        | FStar_Pervasives_Native.Some g -> discharge_guard_nosmt env g
  
let (check_subtyping :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        (FStar_Syntax_Syntax.bv,FStar_TypeChecker_Env.guard_t)
          FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        (let uu____25264 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Rel")
            in
         if uu____25264
         then
           let uu____25265 =
             FStar_TypeChecker_Normalize.term_to_string env t1  in
           let uu____25266 =
             FStar_TypeChecker_Normalize.term_to_string env t2  in
           FStar_Util.print2 "check_subtyping of %s and %s\n" uu____25265
             uu____25266
         else ());
        (let uu____25268 =
           new_t_prob (empty_worklist env) env t1
             FStar_TypeChecker_Common.SUB t2
            in
         match uu____25268 with
         | (prob,x,wl) ->
             let g =
               let uu____25287 =
                 solve_and_commit env (singleton wl prob true)
                   (fun uu____25305  -> FStar_Pervasives_Native.None)
                  in
               FStar_All.pipe_left (with_guard env prob) uu____25287  in
             ((let uu____25333 =
                 (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                    (FStar_Options.Other "Rel"))
                   && (FStar_Util.is_some g)
                  in
               if uu____25333
               then
                 let uu____25334 =
                   FStar_TypeChecker_Normalize.term_to_string env t1  in
                 let uu____25335 =
                   FStar_TypeChecker_Normalize.term_to_string env t2  in
                 let uu____25336 =
                   let uu____25337 = FStar_Util.must g  in
                   guard_to_string env uu____25337  in
                 FStar_Util.print3
                   "check_subtyping succeeded: %s <: %s\n\tguard is %s\n"
                   uu____25334 uu____25335 uu____25336
               else ());
              (match g with
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
               | FStar_Pervasives_Native.Some g1 ->
                   FStar_Pervasives_Native.Some (x, g1))))
  
let (get_subtyping_predicate :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.typ ->
        FStar_TypeChecker_Env.guard_t FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        let uu____25371 = check_subtyping env t1 t2  in
        match uu____25371 with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some (x,g) ->
            let uu____25390 =
              let uu____25391 = FStar_Syntax_Syntax.mk_binder x  in
              FStar_TypeChecker_Env.abstract_guard uu____25391 g  in
            FStar_Pervasives_Native.Some uu____25390
  
let (get_subtyping_prop :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.typ ->
        FStar_TypeChecker_Env.guard_t FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        let uu____25409 = check_subtyping env t1 t2  in
        match uu____25409 with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some (x,g) ->
            let uu____25428 =
              let uu____25429 =
                let uu____25430 = FStar_Syntax_Syntax.mk_binder x  in
                [uu____25430]  in
              FStar_TypeChecker_Env.close_guard env uu____25429 g  in
            FStar_Pervasives_Native.Some uu____25428
  
let (subtype_nosmt :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ -> Prims.bool)
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        (let uu____25459 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Rel")
            in
         if uu____25459
         then
           let uu____25460 =
             FStar_TypeChecker_Normalize.term_to_string env t1  in
           let uu____25461 =
             FStar_TypeChecker_Normalize.term_to_string env t2  in
           FStar_Util.print2 "try_subtype_no_smt of %s and %s\n" uu____25460
             uu____25461
         else ());
        (let uu____25463 =
           new_t_prob (empty_worklist env) env t1
             FStar_TypeChecker_Common.SUB t2
            in
         match uu____25463 with
         | (prob,x,wl) ->
             let g =
               let uu____25476 =
                 solve_and_commit env (singleton wl prob false)
                   (fun uu____25494  -> FStar_Pervasives_Native.None)
                  in
               FStar_All.pipe_left (with_guard env prob) uu____25476  in
             (match g with
              | FStar_Pervasives_Native.None  -> false
              | FStar_Pervasives_Native.Some g1 ->
                  let g2 =
                    let uu____25523 =
                      let uu____25524 = FStar_Syntax_Syntax.mk_binder x  in
                      [uu____25524]  in
                    FStar_TypeChecker_Env.close_guard env uu____25523 g1  in
                  discharge_guard_nosmt env g2))
  