module User.Api exposing (requestUserInfo)

import Http
import Json.Decode as Decode
import User.Models exposing (UserRecord)
import Msgs exposing (Msg)


getUserInfo : Http.Request UserRecord
getUserInfo =
    let
        url =
            "https://githubtrends.herokuapp.com/api/me"
    in
        Http.get url decodeUserRecord


decodeUserRecord : Decode.Decoder UserRecord
decodeUserRecord =
    Decode.map2 UserRecord
        (Decode.field "name" Decode.string)
        (Decode.field "avatar" Decode.string)


requestUserInfo : Cmd Msg
requestUserInfo =
    Http.send Msgs.LoadUserInfo getUserInfo
