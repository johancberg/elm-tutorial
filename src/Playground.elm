module Playground exposing (main)

import Html
import String
import Regex

escapeEarth myVelocity mySpeed =
    if myVelocity > 11.186 then
        "Godspeed"

    else if mySpeed == 7.67 then
        "Stay in orbit"

    else
        "Come back"

computeSpeed distance time =
    distance / time


computeTime startTime endTime =
    endTime - startTime

filterFunction numbers =
    String.filter (\char -> char /= '-') numbers
    --String.filter isValid numbers

isValid char = char /= '-'

pattern = "\\d\\d:\\d\\d (a\\.m\\.|p\\.m\\.)"

maybeRegex = Regex.fromString pattern

regex = Maybe.withDefault Regex.never maybeRegex

apollo11 = """
    On July 16, 1969, the massive Saturn V rocket
    lifted off from NASA's Kennedy Space Center at
    09:32 a.m. EDT. Four days later, on July 20, Neil
    Armstrong and Buzz Aldrin landed on the Moon.
    """
stringFromBool : Bool -> String
stringFromBool value =
  if value then
    "True"

  else
    "False"


main =
    Html.div []
    [   Html.p []
        [
        Html.text
            <| escapeEarth 11
            <| computeSpeed 7.67
            <| computeTime 2 3
        ],
        Html.p []
        [   
        Html.text
            <| "Call us at " ++ filterFunction "012-2345-678"
        ],
        Html.text
            <| stringFromBool (Regex.contains regex apollo11)
    ]

{-
    computeTime 2 3
        |> computeSpeed 7.67
        |> escapeEarth 11
        |> Html.text
-}