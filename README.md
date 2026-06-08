# Command Runner

Um pacote Dart simples para criação e gerenciamento de comandos de linha de comando (CLI), utilizando uma hierarquia de argumentos baseada em orientação a objetos.

## Funcionalidades

* Criação de comandos personalizados.
* Suporte a opções (`--option`) e flags (`--flag`).
* Sistema de ajuda integrado.
* Estrutura extensível para aplicações CLI.
* Execução síncrona e assíncrona através de `FutureOr`.

---

## Estrutura do Projeto

```text
command_runner/
├── lib/
│   ├── command_runner.dart
│   └── src/
│       ├── arguments.dart
│       ├── command_runner_base.dart
│       └── help_command.dart
```

---

## Hierarquia de Classes

### Argument

Classe abstrata base para todos os argumentos.

Propriedades:

* `name`
* `help`
* `defaultValue`
* `valueHelp`
* `usage`

### Option

Representa uma opção de linha de comando.

Exemplos:

```bash
--verbose
--output=arquivo.txt
```

Tipos suportados:

* `OptionType.flag`
* `OptionType.option`

### Command

Representa um comando executável.

Funcionalidades:

* Registro de opções.
* Registro de flags.
* Execução através do método `run()`.

### ArgResults

Armazena os resultados do processamento dos argumentos.

Métodos:

```dart
flag(String name)
hasOption(String name)
getOption(String name)
```

---

## CommandRunner

Responsável por:

* Registrar comandos.
* Interpretar argumentos.
* Executar comandos.
* Gerar informações de uso.

Exemplo:

```dart
var commandRunner = CommandRunner();
commandRunner.addCommand(HelpCommand());
```

---

## HelpCommand

Comando responsável por exibir informações de uso do programa.

Comando:

```bash
dart run bin/cli.dart help
```

Saída:

```text
Usage: dart bin/cli.dart <command> [commandArg?] [...options?]
 help:  Prints usage information to the command line.
```

---

## Como Utilizar

### Adicionando um comando

```dart
class HelloCommand extends Command {
  @override
  String get name => 'hello';

  @override
  String get description => 'Exibe uma mensagem de saudação';

  @override
  FutureOr<Object?> run(ArgResults args) {
    return 'Olá Mundo!';
  }
}
```

Registrar:

```dart
var runner = CommandRunner();
runner.addCommand(HelloCommand());
```

Executar:

```bash
dart run bin/cli.dart hello
```

---

## Executando o Projeto

Dentro da pasta `cli`:

```bash
dart run bin/cli.dart help
```

---

## Tecnologias

* Dart SDK
* Programação Orientada a Objetos (POO)
* CLI (Command Line Interface)

---

## Versão

```text
0.0.1
```

---

## Autor

Brayan Albuquerque Biazini




## Resumo do Projeto Dartpedia

O **Dartpedia** é um projeto desenvolvido na linguagem **Dart** com o objetivo de aplicar conceitos de **Programação Orientada a Objetos (POO)**, organização de código e desenvolvimento de aplicações de linha de comando (CLI).

Nesta etapa do projeto, foi implementado um sistema chamado **Command Runner**, responsável por gerenciar comandos, argumentos e opções fornecidos pelo usuário através do terminal. Para isso, foi criada uma hierarquia de classes composta por **Argument**, **Option**, **Command** e **ArgResults**, permitindo uma estrutura organizada e reutilizável para o processamento de comandos.

O projeto também conta com a classe **CommandRunner**, que registra e executa comandos, além do **HelpCommand**, responsável por exibir informações de uso e auxiliar o usuário na utilização da aplicação.

Durante o desenvolvimento foram utilizados conceitos importantes da linguagem Dart, como:

* Classes abstratas;
* Herança;
* Encapsulamento;
* Enumerações (Enums);
* Coleções imutáveis;
* Métodos assíncronos com `FutureOr`;
* Organização modular de arquivos.

O Dartpedia busca fornecer uma base sólida para a criação de aplicações CLI em Dart, promovendo boas práticas de desenvolvimento, reutilização de código e facilidade de manutenção.
