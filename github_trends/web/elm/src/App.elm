module App exposing (..)

import Navigation exposing (Location)
import Routing
import Update exposing (update)
import View exposing (view)
import Models exposing (Flags, Model, initialModel)
import Msgs exposing (Msg)
import User.Api exposing (requestUserInfo)


init : Flags -> Location -> ( Model, Cmd Msg )
init flags location =
    let
        currentRoute =
            Routing.parseLocation location

        deb =
            Debug.log "Flags" flags
    in
        ( initialModel currentRoute, requestUserInfo )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Flags Model Msg
main =
    Navigation.programWithFlags Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
