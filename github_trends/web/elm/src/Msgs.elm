module Msgs exposing (..)

import Http
import Models exposing (UserRecord)
import Navigation exposing (Location)


type Msg
  = OnLocationChange Location
  | LoadUserInfo (Result Http.Error UserRecord)
