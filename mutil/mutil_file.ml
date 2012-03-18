let input_lines_of1int chan = 
    let lines = ref [] in
    try
      while true; do
        lines := int_of_string (input_line chan) :: !lines
      done;[]
    with End_of_file ->
      close_in chan;
    List.rev !lines

let input_lines_ofstring chan = 
    let lines = ref [] in
    try
      while true; do
        lines := input_line chan :: !lines
      done;[]
    with End_of_file ->
      close_in chan;
    List.rev !lines

