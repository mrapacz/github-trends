module Update exposing (..)

import Models exposing (Model, FetchedResources(..))
import Msgs exposing (Msg(..))
import Platform.Cmd exposing (map)
import Resources.Issue.Update exposing (issueUpdate)
import Resources.Repository.Update exposing (repositoryUpdate)
import Routing exposing (parseLocation)
import Resources.User.Update exposing (userUpdate)
import User.Update exposing (userInfoUpdate)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        LoadUserInfo _ ->
            userInfoUpdate msg model

        MkRepositoriesMsg repositoriesMessage ->
            case repositoryUpdate repositoriesMessage model of
                ( model, cmd ) ->
                    ( model, map MkRepositoriesMsg cmd )

        MkUsersMsg usersMessage ->
            case userUpdate usersMessage model of
                ( model, cmd ) ->
                    ( model, map MkUsersMsg cmd )

        MkIssuesMsg issuesMessage ->
            case issueUpdate issuesMessage model of
                ( model, cmd ) ->
                    ( model, map MkIssuesMsg cmd )
