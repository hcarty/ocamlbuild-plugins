open Ocamlbuild_plugin
 
let rpath_flags file =
  let rpaths = string_list_of_file file in
  S (
    List.map (
      fun path ->
        S [A "-cclib"; A ("-Wl,-rpath," ^ path)]
    ) rpaths
  )

let () = dispatch begin function
    | After_rules ->
      pflag ["ocaml"; "link"; "program"] "rpathfile" rpath_flags;
      pflag ["ocaml"; "link"; "library"] "rpathfile" rpath_flags
    | _ -> ()
  end
