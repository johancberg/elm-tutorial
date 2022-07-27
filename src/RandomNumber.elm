module RandomNumber exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Random
import Html.Styled.Events exposing (onClick)
import Browser

type alias Model =
    Int

init : () -> ( Model, Cmd Msg )
init _ =
    ( 0, Cmd.none )

view : Model -> Html Msg
view model =
    div [ css [ textAlign center, backgroundColor (hex "#f2f2f2") ] ]
        [ button [ onClick GenerateRandomNumber ] [ text "Generate Random Number " ]
        , text (String.fromInt model)
        ]

type Msg
    = GenerateRandomNumber
    | NewRandomNumber Int

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GenerateRandomNumber ->
            ( model, Random.generate NewRandomNumber (Random.int 0 100) )
        NewRandomNumber number ->
            ( number, Cmd.none )

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = \_ -> Sub.none
        }