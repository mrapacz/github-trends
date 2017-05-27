module Update exposing (..)

import Models exposing (Model, FetchedResources(..))
import Msgs exposing (Msg(..))
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

        -- REPOSITORIES LOAD
        LoadRepositoriesData _ ->
            repositoryUpdate msg model

        FetchRepositories ->
            repositoryUpdate msg model

        NewCreatedRepositories _ ->
            repositoryUpdate msg model

        NewLanguageRepositories _ ->
            repositoryUpdate msg model

        NewSortRepositoriesOption _ ->
            repositoryUpdate msg model

        NewOrderRepositoriesOption _ ->
            repositoryUpdate msg model

        -- USERS LOAD
        LoadUsersData data ->
            userUpdate msg model

        FetchUsers ->
            userUpdate msg model

        NewReposUsers repos ->
            userUpdate msg model

        NewFollowersUsers followers ->
            userUpdate msg model

        NewSortUsersOption sortOption ->
            userUpdate msg model

        NewOrderUsersOption orderOption ->
            userUpdate msg model

        --ISSUES LOAD
        LoadIssuesData data ->
            issueUpdate msg model

        FetchIssues ->
            issueUpdate msg model

        NewCommentsIssues comments ->
            issueUpdate msg model

        NewLanguageIssues language ->
            issueUpdate msg model

        NewSortIssuesOption sortOption ->
            issueUpdate msg model

        NewOrderIssuesOption _ ->
            issueUpdate msg model
