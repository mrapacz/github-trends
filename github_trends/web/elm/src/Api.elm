module Api exposing (..)

import Http
import Json.Decode as Decode
import Models exposing (UserRecord, RepositoryRecord)
import Msgs exposing (Msg)


getUserInfo : Http.Request UserRecord
getUserInfo =
    let
        url =
            "http://localhost:4000/api/me"
    in
        Http.get url decodeUserRecord


getRepositoriesData : Http.Request (List RepositoryRecord)
getRepositoriesData =
    let
        url =
            "http://localhost:4000/api/repositories/most_popular?language=JavaScript&sort=stars&order=desc&created=2017-05-01"
    in
        Http.get url decodeRepositoriesList



--


decodeUserRecord : Decode.Decoder UserRecord
decodeUserRecord =
    Decode.map2 UserRecord
        (Decode.field "name" Decode.string)
        (Decode.field "avatar" Decode.string)


decodeRepositoryRecord : Decode.Decoder RepositoryRecord
decodeRepositoryRecord =
    Decode.map7 RepositoryRecord
        (Decode.field "watchers" Decode.int)
        (Decode.field "stargazers_count" Decode.int)
        (Decode.field "language" Decode.string)
        (Decode.field "html_url" Decode.string)
        (Decode.field "full_name" Decode.string)
        (Decode.field "forks_count" Decode.int)
        (Decode.field "description" Decode.string)


decodeRepositoriesList : Decode.Decoder (List RepositoryRecord)
decodeRepositoriesList =
    Decode.list decodeRepositoryRecord



--


requestUserInfo : Cmd Msg
requestUserInfo =
    Http.send Msgs.LoadUserInfo getUserInfo


requestRepositoriesData : Cmd Msg
requestRepositoriesData =
    Http.send Msgs.LoadRepositoriesData getRepositoriesData
