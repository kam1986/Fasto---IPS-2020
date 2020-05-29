(* A polymorphic symbol table. *)

module SymTab

open System

(*
A symbol table is just a list of tuples identifiers and values. This allows for
easy shadowing, as a shadowing binding can be quickly placed at the head of the
list.
*)
type SymTab<'a> = SymTab of Map<string, 'a>

let empty () = SymTab Map.empty

let rec lookup n (SymTab tab) =
    Map.tryFind n tab
    

let bind n i (SymTab stab) = 
  Map.add n i stab
  |> SymTab

let remove n (SymTab stab) =
    Map.remove n stab
    |> SymTab

let removeMany ns (SymTab stab) =
  SymTab (Map.filter (fun x _ ->
            not (List.exists (fun y -> y = x) ns)) stab)

let combine (SymTab t1) (SymTab t2) =
  Map.fold (fun tab n i -> Map.add n i tab) t2 t1
  |> SymTab

let fromList l = 
  Map.ofList l
  |> SymTab

let toList (SymTab tab) = Map.toList tab
