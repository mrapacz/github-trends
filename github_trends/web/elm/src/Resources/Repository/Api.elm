module Resources.Repository.Api exposing (..)

import Http
import Json.Decode as Decode exposing (null, oneOf)
import Models exposing (Hostname, getHost)
import String exposing (toLower)
import Tuple exposing (first, second)
import Resources.Repository.Models exposing (RepositoriesParams, RepositoryRecord)
import User.Models exposing (UserRecord)
import Msgs exposing (Msg)
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

        parsedParamsList =
            (String.join "&") <| List.map (\record -> first record ++ "=" ++ second record) paramsList

        host =
            getHost hostname

        url =
            host ++ "/api/repositories/most_popular?" ++ parsedParamsList
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
