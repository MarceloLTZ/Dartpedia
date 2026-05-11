class DartpediaParser {
  final String version;

  DartpediaParser(this.version);

  void handleCommand(List<String> args, Function(List<String>?) onWikipediaSearch) {
    if (args.isEmpty || args.first == 'help') {
      printUsage();
    } else if (args.first == 'version') {
      print('Dartpedia CLI version $version');
    } else if (args.first == 'wikipedia') {
      final searchArgs = args.length > 1 ? args.sublist(1) : null;
      onWikipediaSearch(searchArgs);
    } else {
      printUsage();
    }
  }

  void printUsage() {
    print('''
Dartpedia CLI - Ajuda
Comandos disponíveis:
  help                Mostra esta mensagem
  version             Exibe a versão atual
  wikipedia <titulo>  Busca resumo de um artigo na Wikipedia
    ''');
  }
}
