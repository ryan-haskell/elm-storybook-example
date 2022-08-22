module Ui.Input exposing
    ( Settings, new
    , withLabelAbove
    , view
    )

{-|

@docs Settings, new
@docs withLabelAbove
@docs view

-}

import Html exposing (Html)
import Html.Attributes
import Html.Events
import Ui



-- NEW


type Settings msg
    = Settings (Internals msg)


new :
    { label : String
    , value : String
    , onChange : String -> msg
    }
    -> Settings msg
new options =
    Settings
        { value = options.value
        , onChange = options.onChange
        , label = options.label
        , hasLabelAbove = False
        }



-- MODIFIERS


withLabelAbove : Settings msg -> Settings msg
withLabelAbove (Settings internals) =
    Settings { internals | hasLabelAbove = True }



-- VIEW


view : Settings msg -> Html msg
view (Settings internals) =
    let
        viewInput : Html msg
        viewInput =
            Html.input
                [ Html.Attributes.class "input"
                , Html.Attributes.type_ "text"
                , Html.Events.onInput internals.onChange
                , Html.Attributes.value internals.value
                , Html.Attributes.attribute "aria-label" internals.label
                ]
                []
    in
    if internals.hasLabelAbove then
        Html.label []
            [ Ui.col [ Ui.gap.px5 ]
                [ Ui.text internals.label
                , viewInput
                ]
            ]

    else
        viewInput



-- INTERNALS


type alias Internals msg =
    { value : String
    , onChange : String -> msg
    , label : String
    , hasLabelAbove : Bool
    }
