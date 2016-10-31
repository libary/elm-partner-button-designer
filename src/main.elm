module PartnerButtonDesigner exposing (..)

import Html.App as App

import Type exposing (..)
import View exposing (..)

main : Program Flags
main =
  App.programWithFlags { init = init, update = update, subscriptions = subscriptions , view = view }

init : Flags -> ( Model, Cmd Msg )
init flags =
  ({
    text = "+ Подать объявление",
    color = Primary,
    size = "15",
    font = Normal,
    corner = Sharp,
    link = HomePage,
    flags = {
              title = flags.title,
              homePageUrl = flags.homePageUrl,
              createPageUrl = flags.createPageUrl,
              refName = flags.refName,
              refValue = flags.refValue,
              cssUrl = flags.cssUrl
            }
  }, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ChangeText newText ->
      ({ model | text = newText }, Cmd.none)

    ChangeColor newColor ->
      ({ model | color = newColor }, Cmd.none)

    ChangeSize newSize ->
      ({ model | size = newSize }, Cmd.none)

    ChangeFont newFont ->
      ({ model | font = newFont }, Cmd.none)

    ChangeCorner newCorner ->
      ({ model | corner = newCorner}, Cmd.none)

    ChangeLink newLink ->
      ({ model | link = newLink }, Cmd.none)
