#!/usr/bin/env dart
// This file will be run as the main entrypoint to your action.
// Put any logic here, and use the `core` import to interact with GitHub actions.

import 'package:actions_toolkit_dart/core.dart' as core;

void main() {
  {{ #inputs }}final {{ name.camelCase() }} = core.getInput(name: '{{ name }}');
  {{ /inputs }}
  core.setFailed('Action unimplemented.');

  {{ #has_outputs }}
  // TODO
  {{ #outputs }}//core.setOutput(name: '{{ name }}', value: ...);
  {{ /outputs }}{{ /has_outputs }}
}
