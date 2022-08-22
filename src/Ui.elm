module Ui exposing
    ( Html
    , none, text
    , row, col
    , h1, h2, h3, h4, h5, h6, p
    , Attribute
    , pad, gap, align
    , width, height
    , color, bg
    , radius
    )

{-|

@docs Html
@docs none, text
@docs row, col
@docs h1, h2, h3, h4, h5, h6, p

@docs Attribute
@docs pad, gap, align
@docs width, height
@docs color, bg
@docs border, radius

-}

import Html
import Html.Attributes



-- HTML


type alias Html msg =
    Html.Html msg


{-| Render nothing. Useful when working with if/else or other conditional expressions.
-}
none : Html msg
none =
    Html.text ""


{-| Render a String as HTML.
-}
text : String -> Html msg
text str =
    Html.span [] [ Html.text str ]


{-| Lay out items horizontally across the screen, from left to right.
-}
row : List (Attribute msg) -> List (Html msg) -> Html msg
row attrs children =
    Html.div (Html.Attributes.class "row" :: attrs) children


{-| Stack items vertically down the screen, from top to bottom.
-}
col : List (Attribute msg) -> List (Html msg) -> Html msg
col attrs children =
    Html.div (Html.Attributes.class "col" :: attrs) children


{-| Create an element with all the styles of your custom "h1" font
-}
h1 : List (Attribute msg) -> String -> Html msg
h1 attrs str =
    Html.h1 (Html.Attributes.class "font-h1" :: attrs) [ Html.text str ]


{-| Create an element with all the styles of your custom "h2" font
-}
h2 : List (Attribute msg) -> String -> Html msg
h2 attrs str =
    Html.h2 (Html.Attributes.class "font-h2" :: attrs) [ Html.text str ]


{-| Create an element with all the styles of your custom "h3" font
-}
h3 : List (Attribute msg) -> String -> Html msg
h3 attrs str =
    Html.h3 (Html.Attributes.class "font-h3" :: attrs) [ Html.text str ]


{-| Create an element with all the styles of your custom "h4" font
-}
h4 : List (Attribute msg) -> String -> Html msg
h4 attrs str =
    Html.h4 (Html.Attributes.class "font-h4" :: attrs) [ Html.text str ]


{-| Create an element with all the styles of your custom "h5" font
-}
h5 : List (Attribute msg) -> String -> Html msg
h5 attrs str =
    Html.h5 (Html.Attributes.class "font-h5" :: attrs) [ Html.text str ]


{-| Create an element with all the styles of your custom "h6" font
-}
h6 : List (Attribute msg) -> String -> Html msg
h6 attrs str =
    Html.h6 (Html.Attributes.class "font-h6" :: attrs) [ Html.text str ]


{-| Create an element with all the styles of your custom "p" font
-}
p : List (Attribute msg) -> String -> Html msg
p attrs str =
    Html.p (Html.Attributes.class "font-p" :: attrs) [ Html.text str ]



-- ATTRIBUTES


type alias Attribute msg =
    Html.Attribute msg


{-| Control the spacing around an element
-}
pad :
    { px25 : Attribute msg
    , px50 : Attribute msg
    }
pad =
    { px25 = Html.Attributes.class "pad-px25"
    , px50 = Html.Attributes.class "pad-px50"
    }


{-| Control the spacing between children within an element
-}
gap :
    { px5 : Attribute msg
    , px25 : Attribute msg
    , px50 : Attribute msg
    }
gap =
    { px5 = Html.Attributes.class "gap-px5"
    , px25 = Html.Attributes.class "gap-px25"
    , px50 = Html.Attributes.class "gap-px50"
    }


{-| Determine how an element should align children
-}
align : { left : Attribute msg }
align =
    { left = Html.Attributes.class "align-left"
    }


{-| Define an element's width.
-}
width : { px50 : Attribute msg, px420 : Attribute msg }
width =
    { px50 = Html.Attributes.class "width-px50"
    , px420 = Html.Attributes.class "width-px420"
    }


{-| Define an element's height.
-}
height : { px50 : Attribute msg }
height =
    { px50 = Html.Attributes.class "height-px50"
    }


{-| Define the text color of an element.
-}
color : { blue600 : Attribute msg }
color =
    { blue600 = Html.Attributes.class "color-blue600"
    }


{-| Define the background color for an element.
-}
bg :
    { red400 : Attribute msg
    , green400 : Attribute msg
    , blue400 : Attribute msg
    , blue600 : Attribute msg
    , blue700 : Attribute msg
    , blue800 : Attribute msg
    }
bg =
    { red400 = Html.Attributes.class "bg-red400"
    , green400 = Html.Attributes.class "bg-green400"
    , blue400 = Html.Attributes.class "bg-blue400"
    , blue600 = Html.Attributes.class "bg-blue600"
    , blue700 = Html.Attributes.class "bg-blue700"
    , blue800 = Html.Attributes.class "bg-blue800"
    }


radius : { px4 : Attribute msg }
radius =
    { px4 = Html.Attributes.class "radius-px4"
    }
