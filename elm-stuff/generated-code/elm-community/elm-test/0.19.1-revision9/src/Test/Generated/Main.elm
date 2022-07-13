module Test.Generated.Main exposing (main)

import FuzzTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 119957184706041
        , processes = 8
        , globs =
            [ "tests/FuzzTests.elm"
            ]
        , paths =
            [ "/home/johan/Documents/elm-tutorial/tests/FuzzTests.elm"
            ]
        }
        [ ( "FuzzTests"
          , [ Test.Runner.Node.check FuzzTests.addOneTests
            , Test.Runner.Node.check FuzzTests.addTests
            ]
          )
        ]