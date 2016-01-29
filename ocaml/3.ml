(*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*)

(* we know the largest prime factor Q of N < square root of N *)
(* so we need to find the first prime Q where N mod Q == 0 *)

#use "topfind";;
Toploop.use_silently
  Format.err_formatter (
    Filename.concat (
      Findlib.package_directory "batteries") "battop.ml");;

open Batteries;;

let n = 600851475143 and
    isOdd x = (x mod 2) != 0
in let pMax = sqrt (float_of_int n)
  in let ps = List.filter isOdd (List.of_enum (2 -- int_of_float pMax))
    in let rec checkPrime y d
          = if d = 1 then true else match (y mod d) = 0 with
              true -> false
            | _ -> checkPrime y (d - 1)
      in let
          isPrime p = checkPrime p (p - 1) and
          divisibleBy p n = n mod p = 0
        in let criteria n p = divisibleBy p n && isPrime p
          in print_int (List.hd (List.rev (List.filter (criteria n) ps)));;
