module View exposing (..)

import String exposing (concat)
import Select
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Models exposing (Model, FetchedResources(..))
import Msgs exposing (Msg(..))
import Resources.Issue.Models exposing (SortIssues, sortIssuesOptions)
import Resources.Issue.View exposing (listIssues)
import Resources.Repository.Models exposing (SortRepositories(..), sortRepositoriesOptions)
import Resources.Repository.View exposing (listRepositories)
import Resources.User.Models exposing (SortUsers(..), sortUsersOptions)
import Resources.User.View exposing (listUsers)
import Resources.Common.Models exposing (SortOrder(..), orderOptions)


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
    let
        sortRepositoriesOptions =
            [ Stars, Forks, Updated ]

        sortUsersOptions =
            [ Repositories, Followers ]

        orderOptions =
            [ Asc, Desc ]
    in
        div []
            [ div [ class "user-section" ]
                [ img [ class "user-avatar", src model.avatar ] []
                , p [ class "user-name" ] [ text model.name ]
                ]
            , h2 [] [ text "Welcome to GitHub trends" ]
            , div [ class "content-section" ]
                [ h3 [] [ text "Repositories:" ]
                , input [ placeholder "Date, eg: 2016-01-01", onInput NewCreatedRepositories ] []
                , input [ placeholder "Language", onInput NewLanguageRepositories ] []
                , Select.from sortRepositoriesOptions NewSortRepositoriesOption
                , Select.from orderOptions NewOrderRepositoriesOption
                , button [ onClick FetchRepositories ] [ text "Submit" ]
                , h3 [] [ text "Users:" ]
                , input [ placeholder "Repos number", onInput NewReposUsers ] []
                , input [ placeholder "Followers number", onInput NewFollowersUsers ] []
                , Select.from sortUsersOptions NewSortUsersOption
                , Select.from orderOptions NewOrderUsersOption
                , button [ onClick FetchUsers ] [ text "Submit" ]
                , h3 [] [ text "Issues:" ]
                , input [ placeholder "Comments number", onInput NewCommentsIssues ] []
                , input [ placeholder "Language", onInput NewLanguageIssues ] []
                , Select.from sortIssuesOptions NewSortIssuesOption
                , Select.from orderOptions NewOrderIssuesOption
                , button [ onClick FetchIssues ] [ text "Submit" ]
                , div [ class "results-section" ]
                    [ displayFetchedResouces model.fetchedResources
                    ]
                ]
            ]


displayFetchedResouces : FetchedResources -> Html Msg
displayFetchedResouces fetchedResources =
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
