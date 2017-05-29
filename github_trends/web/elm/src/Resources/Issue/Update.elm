module Resources.Issue.Update exposing (..)

import Models exposing (FetchedResources(IssueRecordList), Model)
import Resources.Issue.Api exposing (requestIssuesData)
import Resources.Issue.Msgs exposing (IssuesMessage(FetchIssues, LoadIssuesData, NewCommentsIssues, NewLanguageIssues, NewOrderIssuesOption, NewSortIssuesOption))


issueUpdate : IssuesMessage -> Model -> ( Model, Cmd IssuesMessage )
issueUpdate msg model =
    case msg of
        -- ISSUES LOAD
        LoadIssuesData (Ok issues) ->
            ( { model | fetchedResources = IssueRecordList issues }, Cmd.none )

        LoadIssuesData (Err message) ->
            let
                debugMessage =
                    Debug.log "err issues" message
            in
                ( model, Cmd.none )

        -- ISSUES FETCH
        FetchIssues ->
            ( model, requestIssuesData model.host model.issuesParams )

        -- ISSUES UPDATE
        NewCommentsIssues comments ->
            let
                oldIssuesParams =
                    model.issuesParams

                newIssuesParams =
                    Debug.log "issues comments" { oldIssuesParams | comments = comments }
            in
                ( { model | issuesParams = newIssuesParams }, Cmd.none )

        NewLanguageIssues language ->
            let
                oldIssuesParams =
                    model.issuesParams

                newIssuesParams =
                    Debug.log "issues language" { oldIssuesParams | language = language }
            in
                ( { model | issuesParams = newIssuesParams }, Cmd.none )

        NewSortIssuesOption sortOption ->
            let
                oldIssuesParams =
                    model.issuesParams

                newIssuesParams =
                    Debug.log "issues sort" { oldIssuesParams | sort = sortOption }
            in
                ( { model | issuesParams = newIssuesParams }, Cmd.none )

        NewOrderIssuesOption orderOption ->
            let
                oldIssuesParams =
                    model.issuesParams

                newIssuesParams =
                    Debug.log "issues order" { oldIssuesParams | order = orderOption }
            in
                ( { model | issuesParams = newIssuesParams }, Cmd.none )
