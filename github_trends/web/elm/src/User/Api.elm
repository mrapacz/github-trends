module User.Api exposing (requestUserInfo)

import Http
import Json.Decode as Decode
import Models exposing (Hostname, getHost)
import User.Models exposing (UserRecord)
import User.Msgs exposing (UserInfoMessage(LoadUserInfo))


getUserInfo : Hostname -> Http.Request UserRecord
getUserInfo hostname =
    let
        host =
            getHost hostname

        url =
            host ++ "/api/me"
    in
        Http.get url decodeUserRecord


decodeUserRecord : Decode.Decoder UserRecord
decodeUserRecord =
    Decode.map2 UserRecord
        (Decode.field "name" Decode.string)
        (Decode.field "avatar" Decode.string)


requestUserInfo : Hostname -> Cmd UserInfoMessage
requestUserInfo hostname =
    Http.send LoadUserInfo (getUserInfo hostname)
