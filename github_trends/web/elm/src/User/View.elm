module User.View exposing (..)

import Html exposing (Html, div, img, p, text)
import Html.Attributes exposing (class, src)
import Msgs exposing (Msg)
import User.Models exposing (UserRecord)


userInfoView : UserRecord -> Html Msg
userInfoView userInfo =
    div [ class "user-section" ]
        [ img [ class "user-avatar", src userInfo.avatar ] []
        , p [ class "user-name" ] [ text userInfo.name ]
        ]
