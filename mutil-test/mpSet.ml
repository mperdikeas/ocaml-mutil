type comparison = Less | Equal | Greater

module type ORDERED_TYPE =
sig
  type t
  val compare : t -> t -> comparison
end

module Set = 
functor (Elt: ORDERED_TYPE) ->
struct
  type element = Elt.t
  type set = element list
  let empty = []
  let rec add x s = match s with
    | [] -> [x]
    | hd::tl -> match Elt.compare x hd with
        | Equal   -> s
        | Less    -> x :: s
        | Greater -> hd :: add x tl

  let rec member x s = match s with
    | [] -> false
    | h::tl -> match Elt.compare x h with
        | Equal -> true
        | Less -> false 
        | Greater -> member x tl
end
