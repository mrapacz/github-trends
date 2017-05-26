module Models exposing (..)

import Resources.Issue.Models exposing (IssueParams, IssueRecord, SortIssues(..))
import Resources.Repository.Models exposing (RepositoriesParams, RepositoryRecord, SortRepositories(..))
import Resources.User.Models exposing (UserParams, UserRecord, SortUsers(..))
import Resources.Common.Models exposing (SortOrder(..))


type alias Model =
    { name : String
    , avatar : String
    , route : Route
    , host : Hostname
    , fetchedResources : FetchedResources
    , repositoriesParams : RepositoriesParams
    , usersParams : UserParams
    , issuesParams : IssueParams
    }


initialModel : Hostname -> Route -> Model
initialModel host route =
    { name = ""
    , avatar = ""
    , route = route
    , host = host
    , fetchedResources = RepositoryRecordList []
    , repositoriesParams =
        { created = ""
        , language = ""
        , sort = Stars
        , order = Desc
        }
    , usersParams =
        { repos = ""
        , followers = ""
        , sort = Repositories
        , order = Desc
        }
    , issuesParams =
        { language = ""
        , comments = ""
        , sort = Comments
        , order = Desc
        }
    }



-- DISPLAY


type FetchedResources
    = RepositoryRecordList (List RepositoryRecord)
    | UserRecordList (List UserRecord)
    | IssueRecordList (List IssueRecord)



-- FLAGS


type Hostname
    = Host String


getHost : Hostname -> String
getHost hostname =
    case hostname of
        Host name ->
            name


type alias Flags =
    { host : String
    }



-- ROUTING


type Route
    = LoginRoute
    | NotFoundRoute
