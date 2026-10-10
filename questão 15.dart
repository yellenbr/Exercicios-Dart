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
void ex15() {
  final n = lerInt('Quantidade de bois: ');
  final numeros = <int>[];
  final pesos = <double>[];
  for (var i = 0; i < n; i++) {
    numeros.add(lerInt('Número do boi ${i + 1}: '));
    pesos.add(lerDouble('Peso do boi ${i + 1} (kg): '));
  }

  final continuar = ['s'];
  while (continuar[0] == 's') {
    final min = lerDouble('\nPeso mínimo: ');
    final max = lerDouble('Peso máximo: ');
    var achou = false;
    for (var i = 0; i < n; i++) {
      if (pesos[i] >= min && pesos[i] <= max) {
        print('Boi ${numeros[i]} - ${pesos[i]} kg');
        achou = true;
      }
    }
    if (!achou) print('Nenhum boi nesse intervalo.');
    continuar[0] = lerTexto('Nova pesquisa? (s/n): ').toLowerCase();
  }
}

void main() => ex15();
