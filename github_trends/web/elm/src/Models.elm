module Models exposing (..)

import Resources.Repository.Models exposing (RepositoriesParams, RepositoryRecord, SortRepositories(..))
import Resources.User.Models exposing (UserParams, UserRecord, SortUsers(..))
import Resources.Common.Models exposing (SortOrder(..))


type alias Model =
    { name : String
    , avatar : String
    , route : Route
    , fetchedResources : FetchedResources
    , repositoriesParams : RepositoriesParams
    , usersParams : UserParams
    }


initialModel : Route -> Model
initialModel route =
    { name = ""
    , avatar = ""
    , route = route
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
    }


-- DISPLAY

type FetchedResources
    = RepositoryRecordList (List RepositoryRecord)
    | UserRecordList (List UserRecord)


-- ROUTING

type Route
    = LoginRoute
    | NotFoundRoute
