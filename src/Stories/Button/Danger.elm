module Stories.Button.Danger exposing (main)

import Html exposing (Html)
import Storybook.Story exposing (Story)
import Ui.Button


main : Story () Msg
main =
    Storybook.Story.stateless
        { view = view
        }


type Msg
    = UserClickedDeleteAccount


view : Html Msg
view =
    Ui.Button.new { label = "Delete account" }
        |> Ui.Button.withDangerStyle
        |> Ui.Button.onClick UserClickedDeleteAccount
        |> Ui.Button.view
