module App exposing (..)

import Navigation exposing (Location)
import Routing
import Update exposing (update)
import View exposing (view)
import Models exposing (Flags, Hostname(Host), Model, initialModel)
import Msgs exposing (Msg(OnLocationChange))
import User.Api exposing (requestUserInfo)


init : Flags -> Location -> ( Model, Cmd Msg )
init flags location =
    let
        currentRoute =
            Routing.parseLocation location

        host =
            Host flags.host
    in
        ( initialModel host currentRoute, requestUserInfo host )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Flags Model Msg
main =
    Navigation.programWithFlags OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
