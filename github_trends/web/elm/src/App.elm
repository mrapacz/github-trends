module App exposing (..)

import Html exposing (..)
import Http
import Json.Decode as Decode
import Msgs exposing (Msg)
import Models exposing (Model, initialModel, UserRecord)
import Update exposing (update)
import View exposing (view)
import Navigation exposing (Location)
import Routing
import Api exposing (requestUserInfo)


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
