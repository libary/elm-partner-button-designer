module Helpers exposing(..)

import String
import Http

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
    ,";font-weight:"
    ,fontWeight model.font
    ,";\" href=\""
    ,urlLink model
    ,"\" title=\""
    ,model.flags.title
    ,"\">"
    ,model.text
    ,"</a><link rel=\"stylesheet\" type=\"text/css\" href=\""
    ,model.flags.cssUrl
    ,"\" />"]

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
    White ->
      "r100-button-white"

fontWeight : Font -> String
fontWeight font =
  case font of
    Normal ->
      "normal"
    Bold ->
      "bold"

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
  let
    refs = [(model.flags.refName, model.flags.refValue)]
  in
    case model.link of
      HomePage ->
        Http.url model.flags.homePageUrl refs
      CreatePage ->
        Http.url model.flags.createPageUrl refs
