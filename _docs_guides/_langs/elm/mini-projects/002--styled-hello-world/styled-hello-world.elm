module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


astyledMessage =
    div
        [ Html.Attributes.style
            [ ( "font-style", "bold" )
            , ( "font-size", "50px" )
            , ( "color", "blue" )
            ]
        ]
        [ text "Hello World" ]


main =
    astyledMessage
