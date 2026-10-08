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
String classificaPeso(double kg) {
  if (kg <= 2) return 'Baixo Peso';
  if (kg <= 4) return 'Normal';
  return 'Alto Peso';
}

void ex5() {
  final n = lerInt('Quantidade de recém-nascidos: ');
  final contagem = {'Baixo Peso': 0, 'Normal': 0, 'Alto Peso': 0};
  String? nomeF;
  double maiorPesoF = -1;

  for (var i = 1; i <= n; i++) {
    print('\nRecém-nascido $i');
    final nome = lerTexto('Nome: ');
    final sexo = lerSexo('Sexo (M/F): ');
    final peso = lerDouble('Peso (kg): ');
    final cls = classificaPeso(peso);
    contagem[cls] = contagem[cls]! + 1;
    print('a) $nome | $sexo | $cls');
    if (sexo == 'F' && peso > maiorPesoF) {
      maiorPesoF = peso;
      nomeF = nome;
    }
  }
  print('\nb) Recém-nascida com maior peso: ${nomeF ?? 'nenhuma menina cadastrada'}');
  print('c) Percentual por classificação:');
  contagem.forEach((cls, qtd) {
    print('   $cls: ${n == 0 ? 0 : (qtd * 100 / n).toStringAsFixed(1)}%');
  });
}

void main() => ex5();
