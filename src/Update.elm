module Update exposing (..)

import Msgs exposing (Msg(..))
import Models exposing (Model, Route(..))
import Routing exposing (parseLocation)
import Commands exposing (fetchRivers)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchLSLeaders response ->
            ( { model | lsLeaders = response }, Cmd.none )

        Msgs.OnFetchRSLeaders response ->
            ( { model | rsLeaders = response }, Cmd.none )

        Msgs.OnFetchRivers response ->
            ( { model | rivers = response }, Cmd.none )

        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, loadRouteData newRoute )


loadRouteData : Route -> Cmd Msg
loadRouteData route =
    case route of
        Models.LeadersRoute ->
            Cmd.none

        Models.StateCrimesRoute ->
            Cmd.none

        Models.CityAccidentsRoutes ->
            Cmd.none

        Models.RiversRoute ->
            fetchRivers

        Models.NotFoundRoute ->
            Cmd.none
