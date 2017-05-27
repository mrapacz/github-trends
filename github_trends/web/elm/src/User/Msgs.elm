module User.Msgs exposing (..)

import Http
import User.Models


type UserInfoMessage
    = LoadUserInfo (Result Http.Error User.Models.UserRecord)
