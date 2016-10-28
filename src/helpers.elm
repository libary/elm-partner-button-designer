module Helpers exposing(..)

import String

import Type exposing (..)

codeStr : Model -> String
codeStr model =
  String.concat[
    "<a class=\"r100-button "
    ,colorClass model.color
    ,"\" style=\"border-radius:"
    ,borderRadius model.corner
    ,";font-size:"
    ,textSize model.size
    ,";\" href=\""
    ,urlLink model
    ,"\" title=\"Подать объявление о продаже или сдаче в аренду недвижимости сразу на 100 сайтов\">"
    ,model.text
    ,"</a>"]

colorClass : Color -> String
colorClass color =
  case color of
    Primary ->
      "r100-button-primary"
    Success ->
      "r100-button-success"
    Info ->
      "r100-button-info"
    Warning ->
      "r100-button-warning"
    Danger ->
      "r100-button-danger"
    Default ->
      "r100-button-default"

borderRadius : Corner -> String
borderRadius corner =
  case corner of
    Sharp ->
      "0"
    Round ->
      "7px"

textSize : Size -> String
textSize size =
  size ++ "px"

urlLink : Model -> String
urlLink model =
  case model.link of
    HomePage ->
      "http://razmestim100.ru/?ref=" ++ model.ref
    CreateAdvPage ->
      "http://razmestim100.ru/add?ref=" ++ model.ref
