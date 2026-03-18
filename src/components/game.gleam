// DOOM game component
// Loads js-dos v8 from CDN and runs the embedded DOOM bundle

import gleam/dynamic
import gleam/option.{Some}
import glendix/classic
import glendix/js/object
import redraw.{type Element}
import redraw/dom/attribute
import redraw/dom/html
import redraw/ref

const jsdos_js = "https://v8.js-dos.com/latest/js-dos.js"

const jsdos_css = "https://v8.js-dos.com/latest/js-dos.css"

// Embedded in .mpk — served from same origin, no CORS issues
const default_bundle = "/widgets/ggobp/doom/doom.jsdos"

pub fn render() -> Element {
  let container_ref = redraw.use_ref()
  let dos_ref = redraw.use_ref_(dynamic.nil())
  let ready_ref = redraw.use_ref_(False)

  redraw.use_effect_(
    fn() {
      let assert Some(container) = ref.current(container_ref)
      let doc = object.get(container, "ownerDocument")
      let head = object.get(doc, "head")
      let window = object.get(doc, "defaultView")

      // Initialize DOOM via js-dos Dos(element, { url, autoStart })
      let start = fn() {
        let options =
          object.object([
            #("url", dynamic.string(default_bundle)),
            #("autoStart", dynamic.bool(True)),
          ])
        let dos = object.call_method(window, "Dos", [container, options])
        ref.assign(dos_ref, dos)
        ref.assign(ready_ref, True)
        Nil
      }

      // Load js-dos CSS
      let link =
        object.call_method(doc, "createElement", [dynamic.string("link")])
      let link = object.set(link, "rel", dynamic.string("stylesheet"))
      let link = object.set(link, "href", dynamic.string(jsdos_css))
      let _ = object.call_method(head, "appendChild", [link])

      // Load js-dos JS (skip if already loaded)
      let _ = case object.has(window, "Dos") {
        True -> start()
        False -> {
          let script =
            object.call_method(doc, "createElement", [dynamic.string("script")])
          let script = object.set(script, "src", dynamic.string(jsdos_js))
          let _ =
            object.set(script, "onload", classic.to_dynamic(fn() { start() }))
          let _ = object.call_method(head, "appendChild", [script])
          Nil
        }
      }

      // Cleanup: stop emulator on unmount
      fn() {
        case ref.current(ready_ref) {
          True -> {
            let dos = ref.current(dos_ref)
            let _ = object.call_method(dos, "stop", [])
            Nil
          }
          False -> Nil
        }
      }
    },
    Nil,
  )

  html.div(
    [
      attribute.ref(container_ref),
      attribute.class("mendix-doom-container"),
      attribute.style([#("width", "640px"), #("height", "400px")]),
    ],
    [],
  )
}
