module Resources.Issue.View exposing (listIssues)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Resources.Issue.Models exposing (IssueRecord)


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
