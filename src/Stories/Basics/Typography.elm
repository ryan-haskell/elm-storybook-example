module Stories.Basics.Typography exposing (main)

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
    Ui.col [ Ui.width.px420, Ui.gap.px25, Ui.align.left ]
        [ Ui.h1 [] "Heading 1"
        , Ui.h2 [] "Heading 2"
        , Ui.h3 [] "Heading 3"
        , Ui.h4 [] "Heading 4"
        , Ui.h5 [] "Heading 5"
        , Ui.h6 [] "Heading 6"
        , Ui.p [] "Paragraph"
        , Ui.p [] """
                  Another paragraph that includes a longer sentence. 
                  Now you can see how the line height ensures our text
                  remains spaced out as it wraps to the next line.
                  """
        ]
