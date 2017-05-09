module Models exposing (..)


type alias Model =
  { name : String
  , avatar : String
  , route : Route
  }


initialModel : Route -> Model
initialModel route =
  { name = ""
  , avatar = ""
  , route = route
  }


-- API

type alias UserRecord =
  { name: String
  , avatar: String
  }


-- ROUTING

type Route
  = LoginRoute
  | NotFoundRoute
