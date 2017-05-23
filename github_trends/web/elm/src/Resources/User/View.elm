module Resources.User.View exposing (listUsers)

import Html exposing (..)
import Html.Attributes exposing (class, href, src)
import Msgs exposing (Msg)
import Resources.User.Models exposing (UserRecord)


listUsers : List UserRecord -> Html Msg
listUsers users =
    ul [] (List.map displayUser users)


displayUser : UserRecord -> Html Msg
displayUser user =
    div [ class "list-element" ]
        [ h4 [] [ text user.login ]
        , li [] [ text <| "User url: ", a [ href user.html_url ] [ text user.html_url ] ]
        , li [] [ img [ src user.avatar_url ] [] ]
        , li [] [ text <| "User score: " ++ (toString user.score) ]
        ]
