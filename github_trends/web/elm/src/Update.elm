module Update exposing (..)

import Debug exposing (log)
import Models exposing (Model)
import Msgs exposing (Msg(..))
import Routing exposing (parseLocation)
import Repository.Api exposing (requestRepositoriesData)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        FetchRepositories ->
            ( model, requestRepositoriesData model.repositoriesParams )

        LoadUserInfo (Ok userData) ->
            ( { model
                | name = userData.name
                , avatar = userData.avatar
              }
            , Cmd.none
            )

        LoadUserInfo (Err message) ->
            ( model, Cmd.none )

        LoadRepositoriesData (Ok repositories) ->
            ( { model | repositories = repositories }, Cmd.none )

        LoadRepositoriesData (Err message) ->
            let
                debugMessage =
                    Debug.log "err" message
            in
                ( model, Cmd.none )

        NewCreatedRepositories created ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    log "Nowy created" { oldRepositoriesParams | created = created }
            in
                ( { model | repositoriesParams = newRepositoriesParams }, Cmd.none )

        NewLanguageRepositories language ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    log "Nowy language" { oldRepositoriesParams | language = language }
            in
                ( { model | repositoriesParams = newRepositoriesParams }, Cmd.none )

        NewSortRepositoriesOption sortOption ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    log "Nowy sort" { oldRepositoriesParams | sort = sortOption }
            in
                ( { model | repositoriesParams = newRepositoriesParams }, Cmd.none )

        NewOrderRepositoriesOption orderOption ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    log "Nowy order" { oldRepositoriesParams | order = orderOption }
            in
                ( { model | repositoriesParams = newRepositoriesParams }, Cmd.none )
