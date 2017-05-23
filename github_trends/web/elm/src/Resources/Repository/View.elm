module Resources.Repository.View exposing (listRepositories)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Resources.Repository.Models exposing (RepositoryRecord)


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
