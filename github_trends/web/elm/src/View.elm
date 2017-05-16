module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Models exposing (Model, SortRepositories(..), SortOrder(..), RepositoryRecord)
import Msgs exposing (Msg(..))
import String exposing (concat)
import Select
import Api exposing (requestRepositoriesData)


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
            , input [ placeholder "created", onInput NewCreatedRepositories ] []
            , input [ placeholder "language", onInput NewLanguageRepositories ] []
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
        [ li [] [ text repository.full_name ]
        , ul []
            [ li [] [ text <| toString <| repository.watchers ]
            , li [] [ text <| toString <| repository.stargazers_count ]
            , li [] [ text repository.language ]
            , li [] [ text repository.html_url ]
            , li [] [ text <| toString <| repository.forks_count ]
            , li [] [ text repository.description ]
            ]
        ]


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found"
        ]
