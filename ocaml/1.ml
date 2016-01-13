(*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*)

let
  isM3 x = (x mod 3) = 0 and
  isM5 x = (x mod 5) = 0
in
  let
    rec sumM x acc
      = match isM3 x || isM5 x with
          true -> sumM (x - 1) (acc + x)
        | false -> match x > 0 with
            true -> sumM (x - 1) acc
          | false -> acc
  in print_int (sumM 999 0) ;;
