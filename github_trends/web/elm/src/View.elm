module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Models exposing (Model)
import Msgs exposing (Msg(..))
import String exposing (concat)


view : Model -> Html Msg
view model =
  div []
    [ page model ]


page : Model -> Html Msg
page model =
  case model.route of
    Models.LoginRoute ->
      mainView model

    Models.NotFoundRoute ->
      notFoundView


-- LOGIN VIEW

mainView : Model -> Html Msg
mainView model =
  div []
    [ p [] [ text "Welcome to GitHub trends" ]
    , p [] [ text model.name ]
    , img [ src model.avatar ] []
    ]


notFoundView : Html Msg
notFoundView =
  div []
    [ text "Not found"
    ]
