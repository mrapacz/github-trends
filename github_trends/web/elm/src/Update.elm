module Update exposing (..)

import Debug exposing (log)
import Models exposing (Model, FetchedResources(..))
import Msgs exposing (Msg(..))
import Resources.Issue.Api exposing (requestIssuesData)
import Routing exposing (parseLocation)
import Resources.Repository.Api exposing (requestRepositoriesData)
import Resources.User.Api exposing (requestUsersData)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        LoadUserInfo (Ok userData) ->
            ( { model
                | name = userData.name
                , avatar = userData.avatar
              }
            , Cmd.none
            )

        LoadUserInfo (Err message) ->
            ( model, Cmd.none )

        -- REPOSITORIES LOAD
        LoadRepositoriesData (Ok repositories) ->
            ( { model | fetchedResources = RepositoryRecordList repositories }, Cmd.none )

        LoadRepositoriesData (Err message) ->
            let
                debugMessage =
                    Debug.log "err repositories" message
            in
                ( model, Cmd.none )

        -- REPOSITORIES FETCH
        FetchRepositories ->
            ( model, requestRepositoriesData model.host model.repositoriesParams )

        -- REPOSITORIES UPDATE
        NewCreatedRepositories created ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    log "repositories created" { oldRepositoriesParams | created = created }
            in
                ( { model | repositoriesParams = newRepositoriesParams }, Cmd.none )

        NewLanguageRepositories language ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    log "repositories language" { oldRepositoriesParams | language = language }
            in
                ( { model | repositoriesParams = newRepositoriesParams }, Cmd.none )

        NewSortRepositoriesOption sortOption ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    log "repositories sort" { oldRepositoriesParams | sort = sortOption }
            in
                ( { model | repositoriesParams = newRepositoriesParams }, Cmd.none )

        NewOrderRepositoriesOption orderOption ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    log "repositories order" { oldRepositoriesParams | order = orderOption }
            in
                ( { model | repositoriesParams = newRepositoriesParams }, Cmd.none )

        -- USERS LOAD
        LoadUsersData (Ok users) ->
            ( { model | fetchedResources = UserRecordList users }, Cmd.none )

        LoadUsersData (Err message) ->
            let
                debugMessage =
                    Debug.log "err users" message
            in
                ( model, Cmd.none )

        -- USERS FETCH
        FetchUsers ->
            ( model, requestUsersData model.host model.usersParams )

        -- USERS UPDATE
        NewReposUsers repos ->
            let
                oldUsersParams =
                    model.usersParams

                newUsersParams =
                    log "users repos" { oldUsersParams | repos = repos }
            in
                ( { model | usersParams = newUsersParams }, Cmd.none )

        NewFollowersUsers followers ->
            let
                oldUsersParams =
                    model.usersParams

                newUsersParams =
                    log "users followers" { oldUsersParams | followers = followers }
            in
                ( { model | usersParams = newUsersParams }, Cmd.none )

        NewSortUsersOption sortOption ->
            let
                oldUsersParams =
                    model.usersParams

                newUsersParams =
                    log "users sort" { oldUsersParams | sort = sortOption }
            in
                ( { model | usersParams = newUsersParams }, Cmd.none )

        NewOrderUsersOption orderOption ->
            let
                oldUsersParams =
                    model.usersParams

                newUsersParams =
                    log "users order" { oldUsersParams | order = orderOption }
            in
                ( { model | usersParams = newUsersParams }, Cmd.none )

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
                    log "issues comments" { oldIssuesParams | comments = comments }
            in
                ( { model | issuesParams = newIssuesParams }, Cmd.none )

        NewLanguageIssues language ->
            let
                oldIssuesParams =
                    model.issuesParams

                newIssuesParams =
                    log "issues language" { oldIssuesParams | language = language }
            in
                ( { model | issuesParams = newIssuesParams }, Cmd.none )

        NewSortIssuesOption sortOption ->
            let
                oldIssuesParams =
                    model.issuesParams

                newIssuesParams =
                    log "issues sort" { oldIssuesParams | sort = sortOption }
            in
                ( { model | issuesParams = newIssuesParams }, Cmd.none )

        NewOrderIssuesOption orderOption ->
            let
                oldIssuesParams =
                    model.issuesParams

                newIssuesParams =
                    log "issues order" { oldIssuesParams | order = orderOption }
            in
                ( { model | issuesParams = newIssuesParams }, Cmd.none )
