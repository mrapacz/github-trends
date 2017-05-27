module Resources.User.Update exposing (..)

import Models exposing (FetchedResources(UserRecordList), Model)
import Msgs exposing (Msg(FetchUsers, LoadUsersData, NewFollowersUsers, NewOrderUsersOption, NewReposUsers, NewSortUsersOption))
import Resources.User.Api exposing (requestUsersData)


userUpdate : Msg -> Model -> ( Model, Cmd Msg )
userUpdate msg model =
    case msg of
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
                    Debug.log "users repos" { oldUsersParams | repos = repos }
            in
                ( { model | usersParams = newUsersParams }, Cmd.none )

        NewFollowersUsers followers ->
            let
                oldUsersParams =
                    model.usersParams

                newUsersParams =
                    Debug.log "users followers" { oldUsersParams | followers = followers }
            in
                ( { model | usersParams = newUsersParams }, Cmd.none )

        NewSortUsersOption sortOption ->
            let
                oldUsersParams =
                    model.usersParams

                newUsersParams =
                    Debug.log "users sort" { oldUsersParams | sort = sortOption }
            in
                ( { model | usersParams = newUsersParams }, Cmd.none )

        NewOrderUsersOption orderOption ->
            let
                oldUsersParams =
                    model.usersParams

                newUsersParams =
                    Debug.log "users order" { oldUsersParams | order = orderOption }
            in
                ( { model | usersParams = newUsersParams }, Cmd.none )

        _ ->
            ( model, Cmd.none )
