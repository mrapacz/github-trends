module Msgs exposing (..)

import Http
import Resources.Repository.Models exposing (SortRepositories, RepositoryRecord)
import Resources.User.Models exposing (SortUsers, UserRecord)
import Resources.Common.Models exposing (SortOrder)
import User.Models exposing (UserRecord)
import Navigation exposing (Location)
import Resources.Issue.Models exposing (IssueRecord, SortIssues)


type Msg
    = OnLocationChange Location
    | LoadUserInfo (Result Http.Error User.Models.UserRecord)
    | LoadRepositoriesData (Result Http.Error (List RepositoryRecord))
    | NewCreatedRepositories String
    | NewLanguageRepositories String
    | NewSortRepositoriesOption SortRepositories
    | NewOrderRepositoriesOption SortOrder
    | FetchRepositories
    | LoadUsersData (Result Http.Error (List Resources.User.Models.UserRecord))
    | NewReposUsers String
    | NewFollowersUsers String
    | NewSortUsersOption SortUsers
    | NewOrderUsersOption SortOrder
    | FetchUsers
    | LoadIssuesData (Result Http.Error (List IssueRecord))
    | NewLanguageIssues String
    | NewCommentsIssues String
    | NewSortIssuesOption SortIssues
    | NewOrderIssuesOption SortOrder
    | FetchIssues
