import 'dart:io';
import 'dart:math';

String lerTexto(String msg) {
  stdout.write(msg);
  return (stdin.readLineSync() ?? '').trim();
}

int lerInt(String msg) {
  while (true) {
    final v = int.tryParse(lerTexto(msg));
    if (v != null) return v;
    print('Valor inválido, tente novamente.');
  }
}

double lerDouble(String msg) {
  while (true) {
    final v = double.tryParse(lerTexto(msg).replaceAll(',', '.'));
    if (v != null) return v;
    print('Valor inválido, tente novamente.');
  }
}

String lerSexo(String msg) {
  while (true) {
    final s = lerTexto(msg).toUpperCase();
    if (s == 'M' || s == 'F') return s;
    print('Digite M ou F.');
  }
}

int fat(int n) {
  var r = 1;
  for (var i = 2; i <= n; i++) {
    r *= i;
  }
  return r;
}

List<int> lerVetor(String nome, {int? tamanho}) {
  final n = tamanho ?? lerInt('Tamanho do vetor $nome: ');
  return [for (var i = 0; i < n; i++) lerInt('$nome[$i]: ')];
}
String desenhaForca(int erros) {
  final cabeca = erros >= 1 ? 'O' : ' ';
  final corpo = erros >= 2 ? '|' : ' ';
  final bracoE = erros >= 3 ? '/' : ' ';
  final bracoD = erros >= 4 ? '\\' : ' ';
  final pernaE = erros >= 5 ? '/' : ' ';
  final pernaD = erros >= 6 ? '\\' : ' ';
  return '''
  +---+
  |   |
  $cabeca   |
 $bracoE$corpo$bracoD  |
 $pernaE $pernaD  |
      |
=========''';
}

void ex18() {
  const palavras = ['dart', 'flutter', 'algoritmo', 'computador', 'variavel', 'funcao'];
  final palavra = palavras[Random().nextInt(palavras.length)];
  final tentadas = <String>{};
  var erros = 0;
  const maxErros = 6;

  while (true) {
    final mostrada = palavra.split('').map((l) => tentadas.contains(l) ? l : '_').join(' ');
    print('\n${desenhaForca(erros)}');
    print('Palavra: $mostrada');
    print('Letras usadas: ${tentadas.join(', ')}');

    if (!mostrada.contains('_')) {
      print('Parabéns, você acertou! A palavra era "$palavra".');
      break;
    }
    if (erros >= maxErros) {
      print('Fim de jogo! A palavra era "$palavra".');
      break;
    }

    final entrada = lerTexto('Digite uma letra: ').toLowerCase();
    if (entrada.length != 1 || !RegExp(r'[a-z]').hasMatch(entrada)) {
      print('Digite apenas uma letra.');
      continue;
    }
    if (tentadas.contains(entrada)) {
      print('Você já tentou essa letra.');
      continue;
    }
    tentadas.add(entrada);
    if (!palavra.contains(entrada)) erros++;
  }
}

void main() => ex18();
