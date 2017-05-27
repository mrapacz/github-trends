module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model, FetchedResources(..))
import Msgs exposing (Msg(..))
import Resources.Common.View exposing (fetchedResourcesView)
import Resources.Issue.View exposing (issuesView, listIssues)
import Resources.Repository.View exposing (listRepositories, repositoriesView)
import Resources.User.View exposing (listUsers, usersView)
import User.View exposing (userInfoView)


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
        [ userInfoView model
        , h2 [] [ text "Welcome to GitHub trends" ]
        , repositoriesView
        , usersView
        , issuesView
        , fetchedResourcesView model.fetchedResources
        ]



-- NOT FOUND


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found"
        ]
