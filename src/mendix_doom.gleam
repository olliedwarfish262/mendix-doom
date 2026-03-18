// Mendix Pluggable Widget - DOOM
// React functional component: fn(JsProps) -> Element

import components/game
import glendix/mendix.{type JsProps}
import redraw.{type Element}

/// Main widget function - called by Mendix runtime as a React component
pub fn widget(_props: JsProps) -> Element {
  game.render()
}
