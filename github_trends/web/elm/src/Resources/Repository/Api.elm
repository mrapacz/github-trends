module Resources.Repository.Api exposing (..)

import Http
import Json.Decode as Decode exposing (null, oneOf)
import Models exposing (Hostname, getHost)
import Resources.Common.Api exposing (buildUrl)
import String exposing (toLower)
import Resources.Repository.Models exposing (RepositoriesParams, RepositoryRecord)
import Resources.Repository.Msgs exposing (RepositoriesMessage(LoadRepositoriesData))


getRepositoriesData : Hostname -> RepositoriesParams -> Http.Request (List RepositoryRecord)
getRepositoriesData hostname params =
    let
        paramsList =
            [ ( "language", params.language )
            , ( "created", params.created )
            , ( "sort", toLower <| toString <| params.sort )
            , ( "order", toLower <| toString <| params.order )
            ]

        url =
            buildUrl hostname "repositories" paramsList
    in
        Http.get url decodeRepositoriesList


decodeRepositoryRecord : Decode.Decoder RepositoryRecord
decodeRepositoryRecord =
    Decode.map7 RepositoryRecord
        (Decode.field "watchers" Decode.int)
        (Decode.field "stargazers_count" Decode.int)
        (Decode.field "language" Decode.string)
        (Decode.field "html_url" Decode.string)
        (Decode.field "full_name" Decode.string)
        (Decode.field "forks_count" Decode.int)
        (Decode.field "description" (oneOf [ Decode.string, null "" ]))


decodeRepositoriesList : Decode.Decoder (List RepositoryRecord)
decodeRepositoriesList =
    Decode.list decodeRepositoryRecord


requestRepositoriesData : Hostname -> RepositoriesParams -> Cmd RepositoriesMessage
requestRepositoriesData hostname params =
    Http.send LoadRepositoriesData (getRepositoriesData hostname params)
