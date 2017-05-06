module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Msgs exposing (Msg(..))
import Models exposing (Model)
import String exposing (concat)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.LoginRoute ->
            loginView model

        Models.NotFoundRoute ->
            notFoundView



-- LOGIN VIEW


loginView : Model -> Html Msg
loginView model =
    div []
        [ p [] [ text "Welcome to Github Trends!" ]
        ]


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found"
        ]
