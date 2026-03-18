// Mendix Studio Pro design view preview
// Shows a static DOOM placeholder in the designer

import glendix/mendix.{type JsProps}
import redraw.{type Element}
import redraw/dom/attribute
import redraw/dom/html

/// Studio Pro design view preview - static DOOM placeholder
pub fn preview(_props: JsProps) -> Element {
  html.div(
    [
      attribute.class("mendix-doom-container"),
      attribute.style([
        #("width", "640px"),
        #("height", "400px"),
        #("background", "#000"),
        #("display", "flex"),
        #("align-items", "center"),
        #("justify-content", "center"),
        #("color", "#b91c1c"),
        #("font-size", "48px"),
        #("font-weight", "bold"),
        #("font-family", "monospace"),
        #("letter-spacing", "8px"),
      ]),
    ],
    [html.text("DOOM")],
  )
}
