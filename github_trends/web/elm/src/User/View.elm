module User.View exposing (..)

import Html exposing (Html, div, img, p, text)
import Html.Attributes exposing (class, src)
import Models exposing (Model)
import Msgs exposing (Msg)


userInfoView : Model -> Html Msg
userInfoView model =
    div [ class "user-section" ]
        [ img [ class "user-avatar", src model.avatar ] []
        , p [ class "user-name" ] [ text model.name ]
        ]
