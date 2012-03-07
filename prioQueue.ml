   let empty () = ref (Hashtbl.create 0)
   
   let insert p n (a:'a) = 
     let l = try Hashtbl.find p n with Not_found -> let l = ref [] in ((Hashtbl.add p n l); l)
     in l := a::!l
   
   let rec insertl p = function
     | [] -> ()
     | h::tl -> insert p (fst h) (snd h); insertl p tl
   
   let peek p = 
     let maxn = Hashtbl.fold (fun x y z -> (max x z)) p min_int
     in let l = Hashtbl.find p maxn
     in List.nth !l (List.length !l -1)
   
   exception Bug
   let rec cut_tail = function
     | _::[]    -> []
     | h::tl    -> h::(cut_tail tl)
     | _        -> raise Bug (* this shouldn't happen in the universe of this module *)
   
   let pop p = 
   try
     let maxn = Hashtbl.fold (fun x y z -> match !y with [] -> z | _ -> (max x z)) p min_int
     in 
        let l = Hashtbl.find p maxn
        in
          match !l with
            | [] -> None
            | _  -> 
               let rv = List.nth !l (List.length !l -1)
               in l := cut_tail !l;Some (maxn, rv)
   with Not_found -> None
   
   let rec popl p = match pop p with
     | None -> []
     | Some x  -> x::(popl p)




