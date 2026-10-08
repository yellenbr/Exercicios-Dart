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
void ex8() {
  final ccAcima2500 = <String>[];
  String? nomeMenorM;
  var menorM = 5001;
  String? codMaiorSI;
  var maiorSI = -1;
  var qtdM = 0, qtdF = 0;

  while (true) {
    final cod = lerTexto('\nCódigo (0000 para encerrar): ');
    if (cod == '0000') break;
    String curso;
    while (true) {
      curso = lerTexto('Curso (CC ou SI): ').toUpperCase();
      if (curso == 'CC' || curso == 'SI') break;
      print('Digite CC ou SI.');
    }
    final nome = lerTexto('Nome: ');
    final sexo = lerSexo('Sexo (M/F): ');
    int pontos;
    while (true) {
      pontos = lerInt('Pontuação (0-5000): ');
      if (pontos >= 0 && pontos <= 5000) break;
      print('Pontuação fora do intervalo.');
    }

    if (sexo == 'M') {
      qtdM++;
      if (pontos < menorM) {
        menorM = pontos;
        nomeMenorM = nome;
      }
      if (curso == 'SI' && pontos > maiorSI) {
        maiorSI = pontos;
        codMaiorSI = cod;
      }
    } else {
      qtdF++;
    }
    if (curso == 'CC' && pontos > 2500) {
      ccAcima2500.add('Código: $cod | Nome: $nome | Pontuação: $pontos');
    }
  }

  final total = qtdM + qtdF;
  if (total == 0) {
    print('Nenhum candidato lido.');
    return;
  }
  print('\n--- Resultados ---');
  print('a) Ciência da Computação com mais de 2500 pontos:');
  if (ccAcima2500.isEmpty) print('   nenhum');
  for (final l in ccAcima2500) {
    print('   $l');
  }
  print('b) Homem com a menor pontuação: ${nomeMenorM ?? 'nenhum homem inscrito'}');
  print('c) Código do homem com maior pontuação em SI: ${codMaiorSI ?? 'nenhum'}');
  print('d) Masculino: ${(qtdM * 100 / total).toStringAsFixed(1)}% | '
      'Feminino: ${(qtdF * 100 / total).toStringAsFixed(1)}%');
}

void main() => ex8();
