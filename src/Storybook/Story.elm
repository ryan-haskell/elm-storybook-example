port module Storybook.Story exposing (Story, sandbox, stateless)

import Browser
import Html exposing (Html)


port logAction : String -> Cmd msg


type alias Story model msg =
    Platform.Program () model msg


stateless : { view : Html msg } -> Story () msg
stateless options =
    Browser.element
        { init = \() -> ( (), Cmd.none )
        , update = \msg model -> ( model, logAction (Debug.toString msg) )
        , view = \_ -> options.view
        , subscriptions = \_ -> Sub.none
        }


sandbox :
    { init : model
    , update : msg -> model -> model
    , view : model -> Html msg
    }
    -> Story model msg
sandbox options =
    Browser.element
        { init = \() -> ( options.init, Cmd.none )
        , update = \msg model -> ( options.update msg model, logAction (Debug.toString msg) )
        , view = \model -> options.view model
        , subscriptions = \_ -> Sub.none
        }
