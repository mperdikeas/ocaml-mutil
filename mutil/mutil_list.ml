open Mutil_general

exception Exception of string
exception Bug



let tl_nth l n = 
  let rec tl_nth0 n accum = match n, accum with
    | 0, _     -> accum
    | _, h::tl -> tl_nth0 (n-1) tl
    | _, [] -> raise Bug
  in
  let len = List.length l
  in if (n > len) then raise (Exception (Printf.sprintf "tail: l has length %d which is > %d" len n))
    else tl_nth0 n l


let every_nth l n offset = (* start on zero-indexed offset and pick every nth element from l *)
  let rec every_nth0 l m accum = match l with
    | h::tl -> 
        if (m==n) then every_nth0 tl 1 (h::accum)
        else           every_nth0 tl (m+1) accum
    | [] -> accum
  in List.rev (every_nth0 (tl_nth l offset) n [])



let split l n = 
if n <= 0 then raise (Invalid_argument (Printf.sprintf "split n=%d; can't do" n))
else
  let rec split0 l i accum = match l, i with
    | _, 0 -> accum
    | [], _    -> split0 [] (i-1) ([]::accum)
    | h::tl, _ -> split0 tl (i-1) ((every_nth l n 0)::accum)
  in List.rev (split0 l n [])


let create n a = 
  let rec create0 n accum = match n with
    | 0 -> accum
    | _ -> create0 (n-1) (a::accum)
  in create0 n []

let create_step n a step = 
  let c = new_step_counter 0 step
  in List.map (fun x -> c()) (create n a)

let slice l n0 n1 = 
  let rec slice0 l i accum = match l with
    | h::tl when (i>=n0) && (i<n1) -> slice0 tl (i+1) (h::accum)
    | h::tl                        -> slice0 tl (i+1) accum
    | []                           -> accum
  in List.rev (slice0 l 0 [])

let string_of_intlist intlist = 
  let rv = ref "" in
  List.iter (fun x -> rv := !rv^","^(string_of_int x)) intlist ;
  let len = String.length (!rv) in
  String.sub !rv 1 (len -1)

let string_of_intlist2 intlist = 
  let rv = List.fold_left (fun x y -> x^","^(string_of_int y)) "" intlist in
  let len = String.length rv in
  String.sub rv 1 (len-1)



