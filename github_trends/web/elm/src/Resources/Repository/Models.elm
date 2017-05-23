module Resources.Repository.Models exposing (RepositoryRecord, RepositoriesParams, SortRepositories(..), sortRepositoriesOptions)

import Resources.Common.Models exposing (SortOrder)


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


type SortRepositories
    = Stars
    | Forks
    | Updated


sortRepositoriesOptions =
    [ Stars, Forks, Updated ]
