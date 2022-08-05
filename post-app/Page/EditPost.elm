module Page.EditPost exposing (EditPageMsg, Model, init)

import Browser.Navigation as Nav
import Http
import Post exposing (Post, PostId, postDecoder)
import RemoteData exposing (WebData)


type alias Model =
    { navKey : Nav.Key
    , post : WebData Post
    }


type Msg
    = PostReceived (WebData Post)


init : PostId -> Nav.Key -> ( Model, Cmd Msg )
init postId navKey =
    ( initialModel navKey, fetchPost postId )


initialModel : Nav.Key -> Model
initialModel navKey =
    { navKey = navKey
    , post = RemoteData.Loading
    }


fetchPost : PostId -> Cmd Msg
fetchPost postId =
    Http.get
        { url = "http://localhost:5019/posts/" ++ Post.idToString postId
        , expect =
            postDecoder
                |> Http.expectJson (RemoteData.fromResult >> PostReceived)
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PostReceived post ->
            ( { model | post = post }, Cmd.none )
