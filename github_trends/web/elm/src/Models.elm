module Models exposing (..)


type alias Model =
    { name : String
    , avatar : String
    , route : Route
    , repositoriesParams : RepositoriesParams
    , repositories : List RepositoryRecord
    }


type alias RepositoriesParams =
    { created : String
    , language : String
    , sort : SortRepositories
    , order : SortOrder
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


type alias RepositoryRecord =
    { watchers : Int
    , stargazers_count : Int
    , language : String
    , html_url : String
    , full_name : String
    , forks_count : Int
    , description : String
    }



-- SELECT OPTIONS


type SortOrder
    = Asc
    | Desc


type SortRepositories
    = Stars
    | Forks
    | Updated



-- API


-- ROUTING


type Route
    = LoginRoute
    | NotFoundRoute
