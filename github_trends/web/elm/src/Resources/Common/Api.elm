module Resources.Common.Api exposing (..)

import Models exposing (Hostname, getHost)
import Tuple exposing (first, second)


buildUrl : Hostname -> String -> List ( String, String ) -> String
buildUrl hostname resource paramsList =
    let
        parsedParamsList =
            (String.join "&") <| List.map (\record -> first record ++ "=" ++ second record) paramsList

        host =
            getHost hostname
    in
        host ++ "/api/" ++ resource ++ "/most_popular?" ++ parsedParamsList
