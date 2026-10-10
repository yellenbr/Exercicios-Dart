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
List<int> somaVetores(List<int> a, List<int> b) =>
    [for (var i = 0; i < a.length; i++) a[i] + b[i]];

int somaElementos(List<int> v) => v.fold(0, (acc, e) => acc + e);

void ex17() {
  final n = lerInt('Tamanho dos vetores: ');
  final a = lerVetor('A', tamanho: n);
  final b = lerVetor('B', tamanho: n);
  final c = somaVetores(a, b);
  print('Vetor soma: $c');
  print('Soma dos elementos do vetor soma: ${somaElementos(c)}');
}

void main() => ex17();
