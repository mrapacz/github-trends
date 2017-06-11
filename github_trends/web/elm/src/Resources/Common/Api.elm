module Resources.Common.Api exposing (..)

import Models exposing (getHost)
import Tuple exposing (first, second)


buildUrl hostname resource paramsList =
    let
        parsedParamsList =
            (String.join "&") <| List.map (\record -> first record ++ "=" ++ second record) paramsList

        host =
            getHost hostname
    in
        host ++ "/api/" ++ resource ++ "/most_popular?" ++ parsedParamsList
