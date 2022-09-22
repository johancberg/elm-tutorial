module Animals exposing (..)

import Html exposing (Html)
import Browser
import Counter exposing (Model)

type alias AnimalArgs item =
    { items : List item
    , animalLabel : item -> String
    , animalId : item -> String
    , isAnimal : item -> Bool
    }

init : AnimalArgs Pets
init =
    { items = [Cat, Dog, Fish]
    , animalLabel = fromPet
    , animalId = toPetId
    , isAnimal = isPet
    }

type Animals
    = WildAnimals WildAnimals
    | Pets Pets

type WildAnimals
    = Lion
    | Giraffe
    | Dinosaur

type Pets
    = Cat
    | Dog
    | Fish

fromAnimal : Animals -> String
fromAnimal a =
    case a of
        WildAnimals b ->
            case b of
                Lion -> "Lion"
                Giraffe -> "Giraffe"
                Dinosaur -> "Dinosaur"
        Pets b ->
            case b of
                Dog -> "Dog"
                Cat -> "Cat"
                Fish -> "Fish"


fromPet : Pets -> String
fromPet a =
    case a of
        Dog -> "Dog"
        Cat -> "Cat"
        Fish -> "Fish"

toPetId : Pets -> String
toPetId a =
    case a of
        Dog -> "2"
        Cat -> "1"
        Fish -> "3"


isPet : Pets -> Bool
isPet _ = True

animals : AnimalArgs item -> Html Msg
animals args =
    let
        animal a =
            Html.div
                []
                [ Html.p [] [ Html.text (args.animalLabel a)]
                , Html.p [] [ Html.text (args.animalId a)]
                ]
    in
    
    Html.div
        []
        (List.map animal args.items)

type Msg = Nothing

update : Msg -> Model -> Model
update a model =
    case a of
        Nothing -> model