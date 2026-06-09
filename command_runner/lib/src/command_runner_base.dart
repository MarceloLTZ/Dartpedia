/*class CommandRunner {
  /// Runs the command-line application logic with the given arguments.
  Future<void> run(List<String> input) async {
    print('CommandRunner received arguments: $input');
  }
}*/

//ATUALIZACAO COMMAND_RUNNER_BASE.DART


import 'dart:async'; // Add this line
import 'dart:collection';
import 'dart:io';

import 'arguments.dart';
import 'exceptions.dart'; // Add this line



class CommandRunner {
  CommandRunner({this.onError});

  final Map<String, Command> _commands = <String, Command>{};

  FutureOr<void> Function(Object)? onError;

  UnmodifiableSetView<Command> get commands =>
      UnmodifiableSetView<Command>(
        <Command>{..._commands.values},
      );

  Future<void> run(List<String> input) async {
  try {
    final ArgResults results = parse(input);

    if (results.command != null) {
      Object? output = await results.command!.run(results);
      print(output.toString());
    }
  } on Exception catch (exception) {
    if (onError != null) {
      onError!(exception);
    } else {
      rethrow;
    }
  }
}

  void addCommand(Command command) {
    _commands[command.name] = command;
    command.runner = this;
  }

  ArgResults parse(List<String> input) {
    String _removeDash(String input) {
  if (input.startsWith('--')) {
    return input.substring(2);
  }
  if (input.startsWith('-')) {
    return input.substring(1);
  }
  return input;
}
}
