module Resources.Issue.Msgs exposing (..)

import Http
import Resources.Common.Models exposing (SortOrder)
import Resources.Issue.Models exposing (IssueRecord, SortIssues)


type IssuesMessage
    = LoadIssuesData (Result Http.Error (List IssueRecord))
    | NewLanguageIssues String
    | NewCommentsIssues String
    | NewSortIssuesOption SortIssues
    | NewOrderIssuesOption SortOrder
    | FetchIssues
