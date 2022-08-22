module Stories.Layout.Row exposing (main)

import Html exposing (Html)
import Storybook.Story exposing (Story)
import Ui


main : Story () msg
main =
    Storybook.Story.stateless
        { view = view
        }


view : Html msg
view =
    Ui.row [ Ui.pad.px25, Ui.gap.px25, Ui.bg.blue800 ]
        [ square [ Ui.bg.red400 ]
        , square [ Ui.bg.blue400 ]
        , square [ Ui.bg.green400 ]
        ]


square : List (Html.Attribute msg) -> Html msg
square attrs =
    Ui.row (Ui.width.px50 :: Ui.height.px50 :: attrs) []
