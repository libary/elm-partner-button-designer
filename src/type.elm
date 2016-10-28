module Type exposing (..)

type Color
  = Default
  |Primary
  |Success
  |Info
  |Warning
  |Danger

type Corner
  = Sharp
  |Round

type alias Size = String

type Link
  = HomePage
  |CreateAdvPage

type alias Model =
  {
    text : String,
    color : Color,
    corner : Corner,
    size : Size,
    link : Link,
    ref : String
}

type Msg
  = ChangeText String
  | ChangeColor Color
  | ChangeCorner Corner
  | ChangeSize Size
  | ChangeLink Link

type alias Flags =
  { ref : String }
