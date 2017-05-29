module User.Msgs exposing (..)

import Http
import User.Models exposing (UserInfoRecord)


type UserInfoMessage
    = LoadUserInfo (Result Http.Error UserInfoRecord)
