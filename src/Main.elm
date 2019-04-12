module Main exposing (Model, Msg(..), init, main, update, view)

import Browser exposing (sandbox)
import Cipher exposing (toCaesar)
import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput)


type alias Model =
    { message : String }


init : Model
init =
    { message = "" }


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change str ->
            { model | message = str }


view : Model -> Html Msg
view { message } =
    div []
        [ h1 [] [ text "Elm Caesar Cipher" ]
        , input [ placeholder "Encrypt your message!", value message, onInput Change ] []
        , div [] [ text <| toCaesar message ]
        ]


main : Program () Model Msg
main =
    sandbox
        { view = view
        , init = init
        , update = update
        }
