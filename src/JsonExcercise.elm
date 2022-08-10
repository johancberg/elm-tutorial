module JsonExcercise exposing (..)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Set exposing (Set)


type alias User =
    { name : String
    , articles : Dict String Article
    , interests : List Interest
    }


type Interest
    = Food
    | Sport Sport


type Sport
    = Football
    | Basketball


type alias Article =
    { id : String
    , content : String
    , tag : Set String
    }


decoder : Decoder User
decoder =
    Decode.fail "Not implemented"


decodeName : Decoder String
decodeName =
    Decode.field "name" Decode.string


decodeInterest : Decoder Interest
decodeInterest =
    Decode.field "name" Decode.string
        |> Decode.andThen
            (\name ->
                case name of
                    "Food" ->
                        Decode.succeed Food

                    "Sport" ->
                        Decode.succeed (Sport decodeSport)

                    _ ->
                        Decode.fail "Not a valid interest, lol"
            )


decodeSport : Decoder Sport
decodeSport =
    Decode.field "sport" Decode.string
        |> Decode.andThen
            (\sport ->
                case sport of
                    "Football" ->
                        Decode.succeed Football

                    "Basketball" ->
                        Decode.succeed Basketball

                    _ ->
                        Decode.fail (sport ++ " is not a sport, trololol")
            )


testJson : String
testJson =
    """
{
    "name": "Albert",
    "articles": [
        {
            "id": "1",
            "content": "This is an article about Json decoders",
            "tags": [ "#thisisanarticle", "#jsondecodersarefun" ]
        },
        {
            "id": "2",
            "content": "This is an article about monads",
            "tags": [ "#thisisanarticle", "#myheadhurts", "#wtfisamonad" ]
        }
    ],
    "interests": [
        {
            "name": "Food"
        },
        {
            "name": "Sport",
            "sport": "Football"
        }
    ]
}
"""
