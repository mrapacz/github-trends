module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Models exposing (Model, FetchedResources(..))

import Resources.Repository.Models exposing (SortRepositories(..), RepositoryRecord)
import Resources.Repository.View exposing (listRepositories)

import Resources.User.Models exposing (SortUsers(..), UserRecord)
import Resources.User.View exposing (listUsers)

import Resources.Common.Models exposing (SortOrder(..))

import Msgs exposing (Msg(..))
import String exposing (concat)
import Select
import Resources.Repository.Api exposing (requestRepositoriesData)


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
            [ p [] [ text "Welcome to GitHub trends" ]
            , p [] [ text model.name ]
            , img [ src model.avatar ] []

            , h3 [] [ text "Repositories:" ]
            , input [ placeholder "2016-01-01", onInput NewCreatedRepositories ] []
            , input [ placeholder "Ruby", onInput NewLanguageRepositories ] []
            , Select.from sortRepositoriesOptions NewSortRepositoriesOption
            , Select.from orderOptions NewOrderRepositoriesOption
            , button [ onClick FetchRepositories ] [ text "Submit" ]

            , h3 [] [ text "Users:" ]
            , input [ placeholder "repos number", onInput NewReposUsers ] []
            , input [ placeholder "followers number", onInput NewFollowersUsers ] []
            , Select.from sortUsersOptions NewSortUsersOption
            , Select.from orderOptions NewOrderUsersOption
            , button [ onClick FetchUsers ] [ text "Submit" ]


            , displayFetchedResouces model.fetchedResources
            ]


displayFetchedResouces: FetchedResources -> Html Msg
displayFetchedResouces fetchedResources =
    case fetchedResources of
        RepositoryRecordList repositories ->
          listRepositories repositories

        UserRecordList users ->
           listUsers users


-- NOT FOUND
notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found"
        ]
