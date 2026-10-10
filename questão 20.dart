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
void ex20() {
  const desenho = [
    '##########',
    '#@   #   #',
    '# ## # # #',
    '# #    # #',
    '# # ## # #',
    '#   #   S#',
    '##########',
  ];
  final mapa = [for (final l in desenho) l.split('')];
  var lin = 1, col = 1;

  while (true) {
    print('\n${mapa.map((l) => l.join()).join('\n')}');
    final cmd = lerTexto('Mover (w=cima, s=baixo, a=esquerda, d=direita, q=sair): ').toLowerCase();
    if (cmd == 'q') {
      print('Você desistiu.');
      return;
    }
    var nl = lin, nc = col;
    switch (cmd) {
      case 'w':
        nl--;
      case 's':
        nl++;
      case 'a':
        nc--;
      case 'd':
        nc++;
      default:
        print('Comando inválido.');
        continue;
    }
    if (mapa[nl][nc] == '#') {
      print('Bateu na parede!');
      continue;
    }
    final chegou = mapa[nl][nc] == 'S';
    mapa[lin][col] = ' ';
    lin = nl;
    col = nc;
    mapa[lin][col] = '@';
    if (chegou) {
      print('\n${mapa.map((l) => l.join()).join('\n')}');
      print('Você encontrou a saída!');
      return;
    }
  }
}

void main() => ex20();
