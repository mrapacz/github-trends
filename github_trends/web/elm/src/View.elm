module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model, FetchedResources(..))
import Msgs exposing (Msg(..))
import Resources.Issue.View exposing (issuesView, listIssues)
import Resources.Repository.View exposing (listRepositories, repositoriesView)
import Resources.User.View exposing (listUsers, usersView)


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
        [ div [ class "user-section" ]
            [ img [ class "user-avatar", src model.avatar ] []
            , p [ class "user-name" ] [ text model.name ]
            ]
        , h2 [] [ text "Welcome to GitHub trends" ]
        , repositoriesView
        , usersView
        , issuesView
        , div [ class "content-section" ]
            [ div [ class "results-section" ]
                [ displayFetchedResources model.fetchedResources
                ]
            ]
        ]


displayFetchedResources : FetchedResources -> Html Msg
displayFetchedResources fetchedResources =
    case fetchedResources of
        RepositoryRecordList repositories ->
            listRepositories repositories

        UserRecordList users ->
            listUsers users

        IssueRecordList issues ->
            listIssues issues



-- NOT FOUND


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found"
        ]
