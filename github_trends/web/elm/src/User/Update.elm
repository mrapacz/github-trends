module User.Update exposing (..)

import Models exposing (Model)
import Msgs exposing (Msg(LoadUserInfo))


userInfoUpdate : Msg -> Model -> ( Model, Cmd Msg )
userInfoUpdate msg model =
    case msg of
        LoadUserInfo (Ok userData) ->
            ( { model
                | name = userData.name
                , avatar = userData.avatar
              }
            , Cmd.none
            )

        LoadUserInfo (Err message) ->
            ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )
