module FunctorExcercise exposing (..)

type Tree node
    = Node node (List (Tree node))

test : Tree String
test =
    Node "Root"
        [ Node "1 Level 1" []
        , Node "2 Level 1" []
        , Node "3 Level 1"
            [ Node "1 Level 2" []
            , Node "2 Level 2" []
            , Node "4 Level 2" []
            ]
        ]

-- Functor
map : (a -> b) -> Tree a -> Tree b

-- Monad
andThen : (a -> Tree b) -> Tree a -> Tree b

--Traversable
fold : (a -> b -> b) -> b -> Tree a -> b