module Resources.User.Api exposing (..)

import Http
import Json.Decode as Decode exposing (null, oneOf)
import Resources.User.Models exposing (UserParams, UserRecord)
import Msgs exposing (Msg)
import String exposing (toLower)
import Tuple exposing (first, second)


getUsersData : UserParams -> Http.Request (List UserRecord)
getUsersData params =
    let
        paramsList =
            [ ( "repos", params.repos )
            , ( "followers", params.followers )
            , ( "sort", toLower <| toString <| params.sort )
            , ( "order", toLower <| toString <| params.order )
            ]

        parsedParamsList =
            (String.join "&") <| List.map (\record -> first record ++ "=" ++ second record) paramsList

        url =
            "http://localhost:4000/api/users/most_popular?" ++ parsedParamsList
    in
        Http.get url decodeUsersList


decodeUsersRecord : Decode.Decoder UserRecord
decodeUsersRecord =
  Decode.map4 UserRecord
    (Decode.field "score" Decode.int)
    (Decode.field "login" Decode.string)
    (Decode.field "html_url" Decode.string)
    (Decode.field "avatar_url" Decode.string)


decodeUsersList : Decode.Decoder (List UserRecord)
decodeUsersList =
  Decode.list decodeUsersRecord


requestUsersData : UserParams -> Cmd Msg
requestUsersData params =
    Http.send Msgs.LoadUsersData (getUsersData params)
