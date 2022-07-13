module Signup exposing (User)

import Html exposing (..)
import Html.Attributes exposing (id, type_, style)

type alias User =
    { name : String
    , email : String
    , password : String
    , loggedIn : Bool
    }

initialModel : User
initialModel =
    { name = ""
    , email = ""
    , password = ""
    , loggedIn = False
    }


view : User -> Html msg
view user =
    div []
        [ h1 [ style "padding-left" "3cm" ] [ text "Sign up" ]
        , Html.form formStyle
            [ div []
                [ text "Name" 
                , input ([ id "name", type_ "text" ] ++ inputStyle) []
                ]
            , div []
                [ text "Email"
                , input ([ id "email", type_ "email" ] ++ inputStyle) []
                ]
            , div []
                [ text "Password"
                , input ([ id "password", type_ "password" ] ++ inputStyle) []
                ]
            , div []
                [ button ([ type_ "submit" ] ++ buttonStyle)
                    [ text "Create my account" ]
                ]
            ]
        ]

formStyle : List (Attribute msg)
formStyle =
    [ style "border-radius" "5px"
    , style "background-color" "#f2f2f2"
    , style "padding" "20px"
    , style "width" "300px"
    ]


inputStyle : List (Attribute msg)
inputStyle =
    [ style "display" "block"
    , style "width" "260px"
    , style "padding" "12px 20px"
    , style "margin" "8px 0"
    , style "border" "none"
    , style "border-radius" "4px"
    ]


buttonStyle : List (Attribute msg)
buttonStyle =
    [ style "width" "300px"
    , style "background-color" "#397cd5"
    , style "color" "white"
    , style "padding" "14px 20px"
    , style "margin-top" "10px"
    , style "border" "none"
    , style "border-radius" "4px"
    , style "font-size" "16px"
    ]

main : Html msg
main =
    view initialModel