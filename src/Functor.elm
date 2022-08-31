module Functor exposing (..)
import Html.Attributes exposing (list)
import List exposing (head)

type Tree a
    = Node a (List (Tree a))

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

type alias Maybes a = List (Maybe a)

-- Maybes.map : (a -> b) -> (Maybes a -> Maybes b)
-- Maybes.map func = List.map (Maybe.map func)
--

-- func : (a -> b)
-- items : List (Maybe a)
-- resultat : List (Maybe a) -> List (Maybe b)
-- resultat = List.map (Maybe.map func)

-- List.map : (a -> b) -> List a -> List b
-- Maybe.map : (a -> b) -> Maybe a -> Maybe b
-- fisk : (Maybe a) -> (Maybe b)
-- fisk = Maybe.map func


-- Functor
map : (a -> b) -> Tree a -> Tree b -- === (a -> b) -> (Tree a -> Tree b)
map func (Node str list) =
    Node (func str) (List.map (map func) list)

    {- EARLIER WORK
        case tree of
        Node str list ->
            case List.head list of
                Nothing -> Node (func str) []
                Just edge  -> map func edge
    -}

    -- str: a
    -- list: List (Tree a)
    -- func: (a -> b)

    -- hej: List (Tree a) -> List (Tree b)
    -- hej = List.map (map func)

    -- Node (func str) (List.map (map func) list)

-- List.map : ((Tree a) -> (Tree b)) -> List (Tree a) -> List (Tree b)

-- Monad
--andThen : (a -> Tree b) -> Tree a -> Tree b

--Traversable
fold : (a -> b -> b) -> b -> Tree a -> b
fold func node (Node str list) =
    {-
    let
        elem =
            case list of
                [] -> []
                [x] -> [x]
                x::_ -> [x]
    in
    
    fold func node (List.foldl func node elem)
    -}
    
    case (List.head list, List.tail list) of
        (Just (Node head []), Nothing) ->
            fold func (func head node) (Node str [])
        
        (Just (Node head child), Just tail) ->
            fold func (func head node) (Node str (List.append child tail))
        
        _ ->
            func str node
-- Använd List.fold!


{--
toTuple : List a -> Maybe (a,a)
toPair : List a -> List (a,a) 

case list of
    [] ->
    [x] ->
    head::heas2::tail -> 



--}