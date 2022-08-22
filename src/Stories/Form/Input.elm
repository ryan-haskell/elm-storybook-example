module Stories.Form.Input exposing (main)

import Html exposing (Html)
import Storybook.Story exposing (Story)
import Ui.Button
import Ui.Input


main : Story Model Msg
main =
    Storybook.Story.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    { value : String
    }


init : Model
init =
    { value = ""
    }



-- UPDATE


type Msg
    = UserChangedInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UserChangedInput newValue ->
            { model | value = newValue }



-- VIEW


view : Model -> Html Msg
view model =
    Ui.Input.new
        { label = "Name"
        , value = model.value
        , onChange = UserChangedInput
        }
        |> Ui.Input.withLabelAbove
        |> Ui.Input.view
