module Models exposing (..)

import Repository.Models exposing (RepositoriesParams, RepositoryRecord, SortOrder(..), SortRepositories(..))


type alias Model =
    { name : String
    , avatar : String
    , route : Route
    , repositoriesParams : RepositoriesParams
    , repositories : List RepositoryRecord
    }


initialModel : Route -> Model
initialModel route =
    { name = ""
    , avatar = ""
    , route = route
    , repositoriesParams =
        { created = ""
        , language = ""
        , sort = Stars
        , order = Desc
        }
    , repositories = []
    }



-- ROUTING


type Route
    = LoginRoute
    | NotFoundRoute
