module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Models exposing (Model)
import Repository.Models exposing (SortRepositories(..), SortOrder(..), RepositoryRecord)
import Msgs exposing (Msg(..))
import String exposing (concat)
import Select
import Repository.Api exposing (requestRepositoriesData)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.LoginRoute ->
            mainView model

        Models.NotFoundRoute ->
            notFoundView



-- LOGIN VIEW


mainView : Model -> Html Msg
mainView model =
    let
        sortRepositoriesOptions =
            [ Stars, Forks, Updated ]

        orderRepositoriesOptions =
            [ Asc, Desc ]
    in
        div []
            [ p [] [ text "Welcome to GitHub trends" ]
            , p [] [ text model.name ]
            , img [ src model.avatar ] []
            , h3 [] [ text "Repositories:" ]
            , input [ placeholder "2016-01-01", onInput NewCreatedRepositories ] []
            , input [ placeholder "Ruby", onInput NewLanguageRepositories ] []
            , Select.from sortRepositoriesOptions NewSortRepositoriesOption
            , Select.from orderRepositoriesOptions NewOrderRepositoriesOption
            , button [ onClick FetchRepositories ] [ text "Submit" ]
            , listRepositories model.repositories
            ]


listRepositories : List RepositoryRecord -> Html Msg
listRepositories repositories =
    ul [] (List.map displayRepository repositories)


displayRepository : RepositoryRecord -> Html Msg
displayRepository repository =
    div []
        [ h4 [] [ text repository.full_name ]
        , li [] [ text <| "Description: " ++ repository.description ]
        , li [] [ text <| "Repository url: " ++ repository.html_url ]
        , li [] [ text <| "Language: " ++ repository.language ]
        , li [] [ text <| "Watchers: " ++ (toString repository.watchers) ]
        , li [] [ text <| "Stargazers: " ++ (toString repository.stargazers_count) ]
        , li [] [ text <| "Forks count: " ++ (toString repository.forks_count) ]
        ]


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found"
        ]
