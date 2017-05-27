module User.Update exposing (..)

import Models exposing (Model)
import Msgs exposing (Msg(LoadUserInfo))
import User.Msgs exposing (UserInfoMessage(LoadUserInfo))


userInfoUpdate : UserInfoMessage -> Model -> ( Model, Cmd UserInfoMessage )
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
