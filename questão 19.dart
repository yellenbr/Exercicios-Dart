import 'dart:io';

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
void ex19() {
  const linhas = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6],
  ];
  final t = List.filled(9, ' ');

  void mostra() {
    print('');
    for (var r = 0; r < 3; r++) {
      print(' ${t[r * 3]} | ${t[r * 3 + 1]} | ${t[r * 3 + 2]} ');
      if (r < 2) print('---+---+---');
    }
  }

  String? vencedor() {
    for (final l in linhas) {
      if (t[l[0]] != ' ' && t[l[0]] == t[l[1]] && t[l[1]] == t[l[2]]) return t[l[0]];
    }
    return null;
  }

  print('Posições: 1 2 3 / 4 5 6 / 7 8 9');
  var jogador = 'X';
  for (var jogada = 0; jogada < 9; jogada++) {
    mostra();
    int pos;
    while (true) {
      pos = lerInt('Jogador $jogador, escolha a posição (1-9): ') - 1;
      if (pos >= 0 && pos < 9 && t[pos] == ' ') break;
      print('Posição inválida ou ocupada.');
    }
    t[pos] = jogador;
    final v = vencedor();
    if (v != null) {
      mostra();
      print('\nJogador $v venceu!');
      return;
    }
    jogador = jogador == 'X' ? 'O' : 'X';
  }
  mostra();
  print('\nEmpate!');
}

void main() => ex19();
