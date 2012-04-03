    val empty : unit -> ('a, 'b) Hashtbl.t ref
    val insert : ('a, 'b list ref) Hashtbl.t -> 'a -> 'b -> unit
    val insertl : ('a, 'b list ref) Hashtbl.t -> ('a * 'b) list -> unit
    val peek : (int, 'a list ref) Hashtbl.t -> 'a
    val pop : (int, 'a list ref) Hashtbl.t -> (int * 'a) option
    val popl : (int, 'a list ref) Hashtbl.t -> (int * 'a) list
  
