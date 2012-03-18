exception Exception of string
exception Bug
val tl_nth : 'a list -> int -> 'a list
val every_nth : 'a list -> int -> int -> 'a list
val split : 'a list -> int -> 'a list list
val create : int -> 'a -> 'a list
val create_step : int -> 'a -> int -> int list
val slice : 'a list -> int -> int -> 'a list
val string_of_intlist : int list -> string
val string_of_intlist2 : int list -> string
val topn_passequals : 'a list -> int -> 'a list
val firstn : 'a list -> int -> 'a list
val topn_strict : 'a list -> int -> 'a list
