open Ocamlbuild_plugin

let () = dispatch begin function
    | After_rules ->
      rule "atdgen: .atd -> _t.ml*, _j.ml*, _v.ml*"
        ~prods:["%_t.ml";"%_t.mli";"%_j.ml";"%_j.mli";"%_v.ml";"%_v.mli";]
        ~dep:"%.atd"   
        (begin fun env build ->
           let atdgen = "atdgen" in
           Seq [          
             Cmd (S [A atdgen; A "-t"; P (env "%.atd")]);
             Cmd (S [A atdgen; A "-j"; A "-j-std"; P (env "%.atd")]);
             Cmd (S [A atdgen; A "-v"; P (env "%.atd")]);
           ]              
         end);
    | _ -> ()
  end
