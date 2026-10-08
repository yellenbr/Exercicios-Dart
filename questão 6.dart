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
void ex6() {
  final alvo = Random().nextInt(100) + 1;
  var inf = 0, sup = 100;
  while (true) {
    final palpite = lerInt('Chute um número entre 1 e 100: ');
    if (palpite == alvo) {
      print('Você acertou! O número era $alvo.');
      break;
    }
    if (palpite > alvo && palpite < sup) sup = palpite;
    if (palpite < alvo && palpite > inf) inf = palpite;
    print('O número está entre $inf e $sup');
  }
}

void main() => ex6();
