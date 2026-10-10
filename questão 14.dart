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
List<int> lerVetorOrdenado(String nome) {
  while (true) {
    final v = lerVetor(nome);
    var ok = true;
    for (var i = 1; i < v.length; i++) {
      if (v[i] < v[i - 1]) ok = false;
    }
    if (ok) return v;
    print('O vetor $nome precisa estar em ordem crescente. Digite novamente.');
  }
}

void ex14() {
  final a = lerVetorOrdenado('A');
  final b = lerVetorOrdenado('B');
  final c = <int>[];
  var i = 0, j = 0;
  while (i < a.length && j < b.length) {
    c.add(a[i] <= b[j] ? a[i++] : b[j++]);
  }
  while (i < a.length) {
    c.add(a[i++]);
  }
  while (j < b.length) {
    c.add(b[j++]);
  }
  print('Vetor C ordenado: $c');
}

void main() => ex14();
