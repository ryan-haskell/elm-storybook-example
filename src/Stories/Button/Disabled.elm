module Stories.Button.Disabled exposing (main)

import Html exposing (Html)
import Storybook.Story exposing (Story)
import Ui.Button


main : Story () Msg
main =
    Storybook.Story.stateless
        { view = view
        }


type Msg
    = UserClickedSignUp


view : Html Msg
view =
    Ui.Button.new { label = "Sign up" }
        |> Ui.Button.onClick UserClickedSignUp
        |> Ui.Button.withDisabledIf True
        |> Ui.Button.view
