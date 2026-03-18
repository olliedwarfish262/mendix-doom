// Mendix Studio Pro property panel configuration
// Defines getProperties, check, getPreview, etc.

import glendix/editor_config.{type Properties}
import glendix/mendix.{type JsProps}

/// Property panel configuration - controls widget property visibility in Studio Pro
pub fn get_properties(
  _values: JsProps,
  default_properties: Properties,
  _platform: String,
) -> Properties {
  default_properties
}
