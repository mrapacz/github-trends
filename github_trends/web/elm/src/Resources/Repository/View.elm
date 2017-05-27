module Resources.Repository.View exposing (listRepositories, repositoriesView)

import Html exposing (..)
import Html.Attributes exposing (class, href, placeholder)
import Html.Events exposing (onClick, onInput)
import Msgs exposing (Msg(FetchRepositories, NewCreatedRepositories, NewLanguageRepositories, NewOrderRepositoriesOption, NewSortRepositoriesOption))
import Resources.Common.Models exposing (orderOptions)
import Resources.Repository.Models exposing (RepositoryRecord, sortRepositoriesOptions)
import Select


listRepositories : List RepositoryRecord -> Html Msg
listRepositories repositories =
    ul [] (List.map displayRepository repositories)


displayRepository : RepositoryRecord -> Html Msg
displayRepository repository =
    div [ class "list-element" ]
        [ h4 [] [ text repository.full_name ]
        , li [] [ text <| "Description: " ++ repository.description ]
        , li [] [ text <| "Repository url: ", a [ href repository.html_url ] [ text repository.html_url ] ]
        , li [] [ text <| "Language: " ++ repository.language ]
        , li [] [ text <| "Watchers: " ++ (toString repository.watchers) ]
        , li [] [ text <| "Stargazers: " ++ (toString repository.stargazers_count) ]
        , li [] [ text <| "Forks count: " ++ (toString repository.forks_count) ]
        ]


repositoriesView : Html Msg
repositoriesView =
    div [ class "content-section" ]
        [ h3 [] [ text "Repositories:" ]
        , input [ placeholder "Date, eg: 2016-01-01", onInput NewCreatedRepositories ] []
        , input [ placeholder "Language", onInput NewLanguageRepositories ] []
        , Select.from sortRepositoriesOptions NewSortRepositoriesOption
        , Select.from orderOptions NewOrderRepositoriesOption
        , button [ onClick FetchRepositories ] [ text "Submit" ]
        ]
