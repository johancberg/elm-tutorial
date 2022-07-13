module TestJuly exposing (..)

import List

{-
type Node a = a

type Tree a =
  Node a (List (Tree a))

map : (a -> b) -> Tree a -> Tree b
map a tree =
  case tree of
    []  -> (Node a) []
    _   -> (Node a) map (List.head tree)
-}
{--

type Test a b
      One a
      Two b

1 Test - Typnamnet (Typkonstruktor)
2 & 3 Parametrar (Typparameter)
4 Noder ((Värde)konstruktor)eii
5 Variabel (Värde/Argument)
--} 


-- Definiera typen (Rätt)
test : List Int -> List String
test list =
  List.map String.fromInt list

-- Skapa en typ med en typparameter där Changed har två värden och Unchanged 1, och Deleted ingen.
type Status a =
  Deleted
  | Changed a a
  | Unchanged a
  

-- En tree-typ ska vara lika lätt att skriva som Record-typ