module Stories.Button.Secondary exposing (main)

import Html exposing (Html)
import Storybook.Story exposing (Story)
import Ui.Button


main : Story () Msg
main =
    Storybook.Story.stateless
        { view = view
        }


type Msg
    = UserClickedCancel


view : Html Msg
view =
    Ui.Button.new { label = "Cancel" }
        |> Ui.Button.withSecondaryStyle
        |> Ui.Button.onClick UserClickedCancel
        |> Ui.Button.view
