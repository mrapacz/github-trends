module Resources.Repository.Update exposing (..)

import Models exposing (FetchedResources(RepositoryRecordList), Model)
import Resources.Repository.Api exposing (requestRepositoriesData)
import Resources.Repository.Msgs exposing (RepositoriesMessage(FetchRepositories, LoadRepositoriesData, NewCreatedRepositories, NewLanguageRepositories, NewOrderRepositoriesOption, NewSortRepositoriesOption))


repositoryUpdate : RepositoriesMessage -> Model -> ( Model, Cmd RepositoriesMessage )
repositoryUpdate msg model =
    case msg of
        LoadRepositoriesData (Ok repositories) ->
            { model | fetchedResources = RepositoryRecordList repositories } ! []

        LoadRepositoriesData (Err message) ->
            let
                debugMessage =
                    Debug.log "err repositories" message
            in
                model ! []

        -- REPOSITORIES FETCH
        FetchRepositories ->
            model ! [ requestRepositoriesData model.host model.repositoriesParams ]

        -- REPOSITORIES UPDATE
        NewCreatedRepositories created ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    Debug.log "repositories created" { oldRepositoriesParams | created = created }
            in
                { model | repositoriesParams = newRepositoriesParams } ! []

        NewLanguageRepositories language ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    Debug.log "repositories language" { oldRepositoriesParams | language = language }
            in
                { model | repositoriesParams = newRepositoriesParams } ! []

        NewSortRepositoriesOption sortOption ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    Debug.log "repositories sort" { oldRepositoriesParams | sort = sortOption }
            in
                { model | repositoriesParams = newRepositoriesParams } ! []

        NewOrderRepositoriesOption orderOption ->
            let
                oldRepositoriesParams =
                    model.repositoriesParams

                newRepositoriesParams =
                    Debug.log "repositories order" { oldRepositoriesParams | order = orderOption }
            in
                { model | repositoriesParams = newRepositoriesParams } ! []
