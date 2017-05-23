module Update exposing (..)

import Debug exposing (log)
import Models exposing (Model, FetchedResources(..))
import Msgs exposing (Msg(..))
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
            ( model, requestRepositoriesData model.repositoriesParams )

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
            (model, requestUsersData model.usersParams)

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
