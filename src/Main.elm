module Main exposing (main)

import Browser exposing (sandbox)
import Cipher exposing (fromCaesar, toCaesar)
import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput)


type alias State =
    { decrypted : String
    , encrypted : String
    }


init : State
init =
    State "" ""


type Action
    = Encode String
    | Decode String


reducer : Action -> State -> State
reducer action _ =
    case action of
        Encode str ->
            State str (toCaesar str)

        Decode str ->
            State (fromCaesar str) str


view : State -> Html Action
view { encrypted, decrypted } =
    div []
        [ h1 [] [ text "Elm Caesar Cipher" ]
        , input [ placeholder "Encrypt your message!", value decrypted, onInput Encode ] []
        , input [ placeholder "Decrypt your nmessage!", value encrypted, onInput Decode ] []
        ]


main : Program () State Action
main =
    sandbox
        { view = view
        , init = init
        , update = reducer
        }
