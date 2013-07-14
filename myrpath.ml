open Ocamlbuild_plugin
 
let rpath_flags path = S [A "-cclib"; A ("-Wl,-rpath," ^ path)]

let () = dispatch begin function
    | After_rules ->
      pflag ["ocaml"; "link"; "program"] "rpath" rpath_flags;
      pflag ["ocaml"; "link"; "library"] "rpath" rpath_flags
    | _ -> ()
  end
