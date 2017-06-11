module Resources.Common.Models exposing (SortOrder(..), orderOptions)


type SortOrder
    = Asc
    | Desc


orderOptions : List SortOrder
orderOptions =
    [ Asc, Desc ]
