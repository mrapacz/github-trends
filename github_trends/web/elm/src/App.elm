module App exposing (..)

import Api exposing (requestUserInfo)
import Json.Decode as Decode
import Html exposing (..)
import Http
import Models exposing (Model, initialModel, UserRecord)
import Msgs exposing (Msg)
import Navigation exposing (Location)
import Routing
import Update exposing (update)
import View exposing (view)


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
