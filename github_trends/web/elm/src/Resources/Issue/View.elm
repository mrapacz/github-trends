module Resources.Issue.View exposing (listIssues, issuesView)

import Html exposing (..)
import Html.Attributes exposing (class, href, placeholder)
import Html.Events exposing (onClick, onInput)
import Msgs exposing (Msg(MkIssuesMsg))
import Resources.Common.Models exposing (orderOptions)
import Resources.Issue.Models exposing (IssueRecord, sortIssuesOptions)
import Resources.Issue.Msgs exposing (IssuesMessage(FetchIssues, NewCommentsIssues, NewLanguageIssues, NewOrderIssuesOption, NewSortIssuesOption))
import Select


listIssues : List IssueRecord -> Html Msg
listIssues issues =
    ul [] (List.map displayIssue issues)


displayIssue : IssueRecord -> Html Msg
displayIssue issue =
    div [ class "list-element" ]
        [ h4 [] [ text issue.title ]
        , li [] [ text <| "State: " ++ issue.state ]
        , li [] [ text <| "Issue url: ", a [ href issue.html_url ] [ text issue.html_url ] ]
        , li [] [ text <| "Comments: " ++ (toString <| issue.comments) ]
        ]


issuesInputView : Html Msg
issuesInputView =
    let
        inputList =
            [ input [ placeholder "Comments number", onInput NewCommentsIssues ] []
            , input [ placeholder "Language", onInput NewLanguageIssues ] []
            , Select.from sortIssuesOptions NewSortIssuesOption
            , Select.from orderOptions NewOrderIssuesOption
            , button [ onClick FetchIssues ] [ text "Submit" ]
            ]
    in
        div [] (List.map (Html.map MkIssuesMsg) inputList)


issuesView : Html Msg
issuesView =
    div [ class "content-section" ]
        [ h3 [] [ text "Issues:" ]
        , issuesInputView
        ]
