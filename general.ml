let new_counter () = 
  let i = ref 0 in
  let rv = fun x -> (let rv = !i in i:=(!i+1) ; rv)
  in rv
