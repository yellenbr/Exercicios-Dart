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
void ex16() {
  final v = [for (var k = 1; k <= 4; k++) lerVetor('V$k')];

  final quinto = [for (final x in v) ...x]..sort();
  print('a) Quinto vetor (todos ordenados): $quinto');

  final intersecao = v[0]
      .toSet()
      .where((e) => v[1].contains(e) && v[2].contains(e) && v[3].contains(e))
      .toList()
    ..sort();
  print('b) Interseção dos 4 vetores: $intersecao');
}

void main() => ex16();
