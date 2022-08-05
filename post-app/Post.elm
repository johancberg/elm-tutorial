module Post exposing (Post, PostId, idParser, idToString, postDecoder, postsDecoder)

import Json.Decode as Decode exposing (Decoder, int, list, string)
import Json.Decode.Pipeline exposing (required)
import Url.Parser exposing (Parser, custom)


type alias Post =
    { id : PostId
    , title : String
    , authorName : String
    , authorUrl : String
    }


type PostId
    = PostId Int


postsDecoder : Decoder (List Post)
postsDecoder =
    list postDecoder


idDecoder : Decoder PostId
idDecoder =
    Decode.map PostId int


postDecoder : Decoder Post
postDecoder =
    Decode.succeed Post
        |> required "id" idDecoder
        |> required "title" string
        |> required "authorName" string
        |> required "authorUrl" string


idToString : PostId -> String
idToString (PostId id) =
    String.fromInt id


idParser : Parser (PostId -> a) a
idParser =
    custom "POSTID" <|
        \postId ->
            Maybe.map PostId (String.toInt postId)
