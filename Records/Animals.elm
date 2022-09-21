module Animals exposing (WildAnimals(..), Pets(..), animals)

import Html exposing (Html)

type alias AnimalArgs item =
    { order : WildAnimals
    , animalLabel : item -> String
    , animalId : item -> String
    , isAnimal : item -> Bool
    }

type WildAnimals
    = Wild (List WildAnimals)
    | Pets (List Pets)

type WildAnimals
    = Lion
    | Giraffe
    | Dinosaur

type Pets
    = Cat
    | Dog
    | Fish

animals : AnimalArgs item -> Html msg
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
        [ animal.order ]