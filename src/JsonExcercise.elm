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


decoder : Decoder User
decoder =
    Decode.fail "Not implemented"
