module Style exposing (viewStyle)

import Html exposing (Attribute)
import Html.Attributes exposing (style)


viewStyle : List (Attribute msg)
viewStyle =
    [ style "display" "inline-block"
    , style "position" "relative"
    , style "top" "15vh"
    , style "left" "50%"
    , style "transform" "translateX(-50%)"
    , style "text-align" "center"
    ]
