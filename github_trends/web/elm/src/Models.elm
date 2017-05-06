module Models exposing (..)


type alias Model =
    { name : String
    , avatar : String
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { name = "HelloName"
    , avatar = "avatar.jpg"
    , route = route
    }



-- ROUTING


type Route
    = LoginRoute
    | NotFoundRoute
