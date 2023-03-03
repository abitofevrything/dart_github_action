import 'package:mason/mason.dart';

void run(HookContext context) {
  final inputs = [];

  while (true) {
    final name = context.logger.prompt(
      'Enter the name of an input for your action, or leave blank to continue:',
    );

    if (name.isEmpty) {
      break;
    }

    final description = context.logger.prompt('Enter a description for $name:');
    final required = context.logger.chooseOne('Is this input required?', choices: [true, false]);

    final String? realDefault;
    if (!required) {
      final rawDefault = context.logger.prompt(
        'Enter a default value for $name, or leave blank for no default:',
      );
      realDefault = rawDefault.isEmpty ? null : rawDefault;
    } else {
      realDefault = null;
    }

    inputs.add({
      'name': name,
      'description': description,
      'required': required,
      'default': realDefault,
    });
  }

  context.vars['has_inputs'] = inputs.isNotEmpty;
  context.vars['inputs'] = inputs;

  final outputs = [];

  while (true) {
    final name = context.logger.prompt(
      'Enter the name of an output for your action, or leave blank to continue:',
    );

    if (name.isEmpty) {
      break;
    }

    final description = context.logger.prompt('Enter a description for $name:');

    outputs.add({
      'name': name,
      'description': description,
    });
  }

  context.vars['has_outputs'] = outputs.isNotEmpty;
  context.vars['outputs'] = outputs;
}
