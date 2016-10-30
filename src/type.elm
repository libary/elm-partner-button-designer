module Type exposing (..)

type Color
  = Primary
  | Success
  | Info
  | Warning
  | Danger
  | Default
  | White

type alias Size = String

type Font
  = Normal
  | Bold

type Corner
  = Sharp
  | Round

type Link
  = HomePage
  | CreateAdvPage

type alias Model =
  {
    text : String,
    color : Color,
    size : Size,
    font : Font,
    corner : Corner,
    link : Link,
    ref : String
}

type Msg
  = ChangeText String
  | ChangeColor Color
  | ChangeSize Size
  | ChangeFont Font
  | ChangeCorner Corner
  | ChangeLink Link

type alias Flags =
  {
    ref : String
  }
