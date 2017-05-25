module Resources.Issue.Api exposing (..)

import Http
import Json.Decode as Decode exposing (null, oneOf)
import String exposing (toLower)
import Tuple exposing (first, second)
import Msgs exposing (Msg)
import Resources.Issue.Models exposing (IssueParams, IssueRecord)
import User.Models exposing (UserRecord)


getIssuesData : IssueParams -> Http.Request (List IssueRecord)
getIssuesData params =
    let
        paramsList =
            [ ( "language", params.language )
            , ( "comments", params.comments )
            , ( "sort", toLower <| toString <| params.sort )
            , ( "order", toLower <| toString <| params.order )
            ]

        parsedParamsList =
            (String.join "&") <| List.map (\record -> first record ++ "=" ++ second record) paramsList

        url =
            "https://githubtrends.herokuapp.com/api/issues/most_popular?" ++ parsedParamsList
    in
        Http.get url decodeIssuesList


decodeIssueRecord : Decode.Decoder IssueRecord
decodeIssueRecord =
    Decode.map4 IssueRecord
        (Decode.field "title" Decode.string)
        (Decode.field "state" Decode.string)
        (Decode.field "html_url" Decode.string)
        (Decode.field "comments" Decode.int)


decodeIssuesList : Decode.Decoder (List IssueRecord)
decodeIssuesList =
    Decode.list decodeIssueRecord


requestIssuesData : IssueParams -> Cmd Msg
requestIssuesData params =
    Http.send Msgs.LoadIssuesData (getIssuesData params)
