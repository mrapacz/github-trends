module Resources.Repository.Msgs exposing (..)

import Http
import Resources.Common.Models exposing (SortOrder)
import Resources.Repository.Models exposing (RepositoryRecord, SortRepositories)


type RepositoriesMessage
    = LoadRepositoriesData (Result Http.Error (List RepositoryRecord))
    | NewCreatedRepositories String
    | NewLanguageRepositories String
    | NewSortRepositoriesOption SortRepositories
    | NewOrderRepositoriesOption SortOrder
    | FetchRepositories
