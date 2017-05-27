module Resources.User.Msgs exposing (..)

import Http
import Resources.Common.Models exposing (SortOrder)
import Resources.User.Models exposing (SortUsers)


type UsersMessage
    = LoadUsersData (Result Http.Error (List Resources.User.Models.UserRecord))
    | NewReposUsers String
    | NewFollowersUsers String
    | NewSortUsersOption SortUsers
    | NewOrderUsersOption SortOrder
    | FetchUsers
