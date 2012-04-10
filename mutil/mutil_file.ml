

let input_lines chan = 
    let lines = ref [] in
    try
      while true; do
        lines := int_of_string (input_line chan) :: !lines
      done;[]
    with End_of_file ->
      close_in chan;
    List.rev !lines

