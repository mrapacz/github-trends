module Msgs exposing (..)

import Http
import Models exposing (SortRepositories, SortOrder, RepositoryRecord)
import User.Models exposing (UserRecord)
import Navigation exposing (Location)


type Msg
    = OnLocationChange Location
    | LoadUserInfo (Result Http.Error UserRecord)
    | LoadRepositoriesData (Result Http.Error (List RepositoryRecord))
    | NewCreatedRepositories String
    | NewLanguageRepositories String
    | NewSortRepositoriesOption SortRepositories
    | NewOrderRepositoriesOption SortOrder
    | FetchRepositories
