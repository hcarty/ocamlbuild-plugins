open Ocamlbuild_plugin
 
let () = dispatch begin function
    | After_rules ->
      flag ["ocaml"; "link"; "program"; "static"]
        (S [A "-cclib"; A "-static"]);
    | _ -> ()
  end
