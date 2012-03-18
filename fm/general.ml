let new_step_counter start step = 
  let i = ref start in
  let rv = fun () -> (let rv = (!i)*step in i:=(!i+1) ; rv)
  in rv



let in_range n n0 n1 = 
    (n >= n0) && (n < n1)



