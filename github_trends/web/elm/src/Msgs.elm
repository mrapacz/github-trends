module Msgs exposing (..)

import Navigation exposing (Location)
import Http
import Models exposing (UserRecord)


type Msg
  = OnLocationChange Location
  | LoadUserInfo (Result Http.Error UserRecord)
