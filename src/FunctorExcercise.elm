module FunctorExcercise exposing (..)
import Html.Attributes exposing (list)
import List exposing (head)

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
map func tree =
    case tree of
        Node str list ->
            case List.head list of
                Nothing -> Node (func str) []
                Just edge  -> map func edge

-- Monad
--andThen : (a -> Tree b) -> Tree a -> Tree b

--Traversable
fold : (a -> b -> b) -> b -> Tree a -> b
fold func node tree =
    case tree of
        Node str list ->
            case (List.head list, List.tail list) of
                (Nothing, _) -> node
                (Just (Node head _), Nothing) -> fold func (func head node) (Node str [])
                (Just (Node head _), Just tail) -> fold func (func head node) (Node str tail)