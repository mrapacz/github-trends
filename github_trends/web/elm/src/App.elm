module App exposing (..)

import Json.Decode as Decode
import Html exposing (..)
import Http
import Navigation exposing (Location)
import Routing
import Update exposing (update)
import View exposing (view)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import User.Api exposing (requestUserInfo)


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, requestUserInfo )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
