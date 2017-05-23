module Resources.Issue.Models exposing (IssueRecord, IssueParams, SortIssues(..), sortIssuesOptions)

import Resources.Common.Models exposing (SortOrder)


type alias IssueRecord =
    { title : String
    , state : String
    , html_url : String
    , comments : Int
    }


type alias IssueParams =
    { language : String
    , comments : String
    , sort : SortIssues
    , order : SortOrder
    }


type SortIssues
    = Comments
    | Created
    | Updated


sortIssuesOptions =
    [ Comments, Created, Updated ]
