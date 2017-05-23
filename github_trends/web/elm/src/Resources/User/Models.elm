module Resources.User.Models exposing (
    UserRecord, UserParams, SortUsers(..)
  )

import Resources.Common.Models exposing (SortOrder)


type alias UserRecord =
  { score: Int
  , login: String
  , html_url: String
  , avatar_url: String
  }


type alias UserParams =
  { repos: String
  , followers: String
  , sort: SortUsers
  , order: SortOrder
  }


type SortUsers
    = Repositories
    | Followers
