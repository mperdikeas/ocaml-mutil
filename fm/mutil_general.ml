let new_step_counter start step = 
  let i = ref start in
  let rv = fun () -> (let rv = (!i)*step in i:=(!i+1) ; rv)
  in rv



let in_range n n0 n1 = 
    (n >= n0) && (n < n1)

let max3 a b c = max a (max b c)
let max4 a b c d = max (max a b) (max c d)

let min3 a b c = min a (min b c)
let min4 a b c d = min (min a b) (min c d)

let median a b c = a+b+c-(max3 a b c)-(min3 a b c)



