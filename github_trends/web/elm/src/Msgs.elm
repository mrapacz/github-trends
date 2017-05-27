module Msgs exposing (..)

import Http
import Resources.Repository.Models exposing (SortRepositories, RepositoryRecord)
import Resources.Repository.Msgs exposing (RepositoriesMessage)
import Resources.User.Models exposing (SortUsers, UserRecord)
import Resources.Common.Models exposing (SortOrder)
import User.Models exposing (UserRecord)
import Navigation exposing (Location)
import Resources.Issue.Models exposing (IssueRecord, SortIssues)
import Resources.Issue.Msgs exposing (IssuesMessage)
import Resources.User.Msgs exposing (UsersMessage)


type Msg
    = OnLocationChange Location
    | MkUserInfoMsg
    | MkRepositoriesMsg RepositoriesMessage
    | MkUsersMsg UsersMessage
    | MkIssuesMsg IssuesMessage
