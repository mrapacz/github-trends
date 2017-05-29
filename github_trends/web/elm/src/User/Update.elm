module User.Update exposing (..)

import Models exposing (Model)
import User.Msgs exposing (UserInfoMessage(LoadUserInfo))


userInfoUpdate : UserInfoMessage -> Model -> ( Model, Cmd UserInfoMessage )
userInfoUpdate msg model =
    case msg of
        LoadUserInfo (Ok userData) ->
            let
                newUserInfo =
                    { name = userData.name
                    , avatar = userData.avatar
                    }
            in
                ( { model | userInfo = newUserInfo }, Cmd.none )

        LoadUserInfo (Err message) ->
            ( model, Cmd.none )
