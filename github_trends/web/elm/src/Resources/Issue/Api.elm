module Resources.Issue.Api exposing (..)

import Http
import Json.Decode as Decode exposing (null, oneOf)
import Models exposing (Hostname(Host), getHost)
import Resources.Common.Api exposing (buildUrl)
import Resources.Issue.Msgs exposing (IssuesMessage(LoadIssuesData))
import String exposing (toLower)
import Resources.Issue.Models exposing (IssueParams, IssueRecord)


getIssuesData : Hostname -> IssueParams -> Http.Request (List IssueRecord)
getIssuesData hostname params =
    let
        paramsList =
            [ ( "language", params.language )
            , ( "comments", params.comments )
            , ( "sort", toLower <| toString <| params.sort )
            , ( "order", toLower <| toString <| params.order )
            ]

        url =
            buildUrl hostname "issues" paramsList
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


requestIssuesData : Hostname -> IssueParams -> Cmd IssuesMessage
requestIssuesData hostname params =
    Http.send LoadIssuesData (getIssuesData hostname params)
