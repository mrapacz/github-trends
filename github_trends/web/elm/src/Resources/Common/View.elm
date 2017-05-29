module Resources.Common.View exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Models exposing (FetchedResources(IssueRecordList, RepositoryRecordList, UserRecordList), Model)
import Msgs exposing (Msg)
import Resources.Issue.View exposing (listIssues)
import Resources.Repository.View exposing (listRepositories)
import Resources.User.View exposing (listUsers)


displayFetchedResources : FetchedResources -> Html Msg
displayFetchedResources fetchedResources =
    case fetchedResources of
        RepositoryRecordList repositories ->
            listRepositories repositories

        UserRecordList users ->
            listUsers users

        IssueRecordList issues ->
            listIssues issues


fetchedResourcesView : FetchedResources -> Html Msg
fetchedResourcesView resources =
    div [ class "content-section" ]
        [ div [ class "results-section" ]
            [ displayFetchedResources resources
            ]
        ]
