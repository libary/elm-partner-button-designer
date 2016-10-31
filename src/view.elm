module View exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (..)
import Exts.Html exposing (..)

import Type exposing (..)
import Helpers exposing (..)

view : Model -> Html Msg
view model =
  div [class "row"]
    [div [class "col-sm-5"
         ,style [("border-right", "1px solid lightgrey")]] [
        Html.form []
          [titleView model
          ,colorView model
          ,sizeView model
          ,fontView model
          ,cornerView model
          ,linkView model]
        -- ,text (toString model)
      ]
      ,div [class "col-sm-7"]
        [preView model
        ,codeView model]
    ]

preView : Model -> Html Msg
preView model =
  div [class "form-group"] [
    label [] [text "Так будет выглядеть кнопка"]
    ,div [] [
      a [classList [
          ("r100-button", True),
          (colorClass model.color, True)]
        ,style [
          ("border-radius", borderRadius model.corner),
          ("font-size", textSize model.size),
          ("font-weight", fontWeight model.font)]
        ,target "_blank"
        ,title model.flags.title
        ,href (urlLink model)] [text model.text]
    ]
  ]

codeView : Model -> Html Msg
codeView model =
  div [class "form-group"] [
    label [] [text "Код кнопки"]
    ,div [] [
      textarea [class "form-control"
                ,rows 6
                ,attribute "onclick" "this.select();"] [
        text (codeStr model)
      ]
    ]
  ]

titleView : Model -> Html Msg
titleView model =
  div [class "form-group"] [
    label [] [text "Текст"]
    ,input [type' "text"
            ,class "form-control"
            ,placeholder "напишите текст для кнопки"
            ,onInput ChangeText
            ,value model.text] []
    ]

colorView : Model -> Html Msg
colorView model =
  div [class "form-group"] [
    label [] [text "Цвет"]
    ,div [class "radio"] [
      button [classList [
                ("r100-button", True),
                ("r100-button-primary", True),
                ("r100-button-ss", True),
                ("r100-button-active", model.color == Primary)]
              ,type' "button"
              ,onClick (ChangeColor Primary)] []
      ,text nbsp
      ,button [classList [
                ("r100-button", True),
                ("r100-button-success", True),
                ("r100-button-ss", True),
                ("r100-button-active", model.color == Success)]
              ,type' "button"
              ,onClick (ChangeColor Success)] []
      ,text nbsp
      ,button [classList [
                ("r100-button", True),
                ("r100-button-info", True),
                ("r100-button-ss", True),
                ("r100-button-active", model.color == Info)]
              ,type' "button"
              ,onClick (ChangeColor Info)] []
      ,text nbsp
      ,button [classList [
                ("r100-button", True),
                ("r100-button-warning", True),
                ("r100-button-ss", True),
                ("r100-button-active", model.color == Warning)]
              ,type' "button"
              ,onClick (ChangeColor Warning)] []
      ,text nbsp
      ,button [classList [
                ("r100-button", True),
                ("r100-button-danger", True),
                ("r100-button-ss", True),
                ("r100-button-active", model.color == Danger)]
              ,type' "button"
              ,onClick (ChangeColor Danger)] []
      ,text nbsp
      ,button [classList [
                ("r100-button", True),
                ("r100-button-default", True),
                ("r100-button-ss", True),
                ("r100-button-active", model.color == Default)]
              ,type' "button"
              ,onClick (ChangeColor Default)] []
      ,text nbsp
      ,button [classList [
                ("r100-button", True),
                ("r100-button-white", True),
                ("r100-button-ss", True),
                ("r100-button-active", model.color == White)]
              ,type' "button"
              ,onClick (ChangeColor White)] []
    ]
  ]

sizeView : Model -> Html Msg
sizeView model =
  div [class "form-group"] [
    label [] [text "Размер"]
    ,input [type' "range"
            ,Attr.min "10"
            ,Attr.max "50"
            ,onInput ChangeSize
            ,value model.size] []
  ]

fontView : Model -> Html Msg
fontView model =
  div [class "form-group"] [
    label [] [text "Шрифт"]
    ,div [class "radio"] [
      label [] [
        input [ type' "radio"
                ,name "font"
                ,checked (model.font == Normal)
                ,onClick (ChangeFont Normal) ] []
        ,text "нормальный"]
    ]
    ,div [class "radio"] [
      label [] [
        input [ type' "radio"
                ,name "font"
                ,checked (model.font == Bold)
                ,onClick (ChangeFont Bold) ] []
        ,text "жирный"]
    ]
  ]

cornerView : Model -> Html Msg
cornerView model =
  div [class "form-group"] [
    label [] [text "Углы"]
    ,div [class "radio"] [
      label [] [
        input [ type' "radio"
                ,name "corner"
                ,checked (model.corner == Sharp)
                ,onClick (ChangeCorner Sharp) ] []
        ,text "острые"]
    ]
    ,div [class "radio"] [
      label [] [
        input [ type' "radio"
                ,name "corner"
                ,checked (model.corner == Round)
                ,onClick (ChangeCorner Round) ] []
        ,text "круглые"]
    ]
  ]

linkView : Model -> Html Msg
linkView model =
  div [class "form-group"] [
    label [] [text "Ссылка на страницу"]
    ,div [class "radio"] [
      label [] [
        input [ type' "radio"
                ,name "link"
                ,checked (model.link == HomePage)
                ,onClick (ChangeLink HomePage)] []
        ,text "главная страница"]
    ]
    ,div [class "radio"] [
      label [] [
        input [ type' "radio"
                ,name "link"
                ,checked (model.link == CreatePage)
                ,onClick (ChangeLink CreatePage)] []
        ,text "страница подачи объявления"]
    ]
  ]
