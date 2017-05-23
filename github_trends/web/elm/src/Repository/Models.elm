module Repository.Models exposing (RepositoryRecord, RepositoriesParams, SortOrder(..), SortRepositories(..))


type alias RepositoryRecord =
    { watchers : Int
    , stargazers_count : Int
    , language : String
    , html_url : String
    , full_name : String
    , forks_count : Int
    , description : String
    }


type alias RepositoriesParams =
    { created : String
    , language : String
    , sort : SortRepositories
    , order : SortOrder
    }


type SortOrder
    = Asc
    | Desc


type SortRepositories
    = Stars
    | Forks
    | Updated
