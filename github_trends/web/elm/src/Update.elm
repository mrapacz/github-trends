module Update exposing (..)

import Models exposing (Model)
import Msgs exposing (Msg(..))
import Routing exposing (parseLocation)
import Debug


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    OnLocationChange location ->
      let
        newRoute = parseLocation location
      in
        ({ model | route = newRoute }, Cmd.none)

    LoadUserInfo (Ok userData) ->
      ({ model |
        name = userData.name,
        avatar = userData.avatar },
       Cmd.none)

    LoadUserInfo (Err message) ->
      (model, Cmd.none)
