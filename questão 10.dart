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
void ex10() {
  var qtdF = 0, qtdM = 0;
  var somaIdadeMExp = 0, qtdMExp = 0;
  var qtdM45 = 0;
  var qtdF30Exp = 0;
  String? nomeMaisNova;
  var menorIdade = 1000;

  while (true) {
    final nome = lerTexto('\nNome (FIM para encerrar): ');
    if (nome.toUpperCase() == 'FIM') break;
    final sexo = lerSexo('Sexo (M/F): ');
    final idade = lerInt('Idade: ');
    String r;
    while (true) {
      r = lerTexto('Tem experiência no serviço? (S/N): ').toUpperCase();
      if (r == 'S' || r == 'N') break;
    }
    final exp = r == 'S';

    if (sexo == 'M') {
      qtdM++;
      if (exp) {
        somaIdadeMExp += idade;
        qtdMExp++;
      }
      if (idade > 45) qtdM45++;
    } else {
      qtdF++;
      if (exp && idade < 30) qtdF30Exp++;
      if (exp && idade < menorIdade) {
        menorIdade = idade;
        nomeMaisNova = nome;
      }
    }
  }

  print('\n--- Resultados ---');
  print('a) Mulheres: $qtdF | Homens: $qtdM');
  print('b) Idade média dos homens com experiência: '
      '${qtdMExp == 0 ? 'nenhum' : (somaIdadeMExp / qtdMExp).toStringAsFixed(1)}');
  print('c) Homens com mais de 45 anos: '
      '${qtdM == 0 ? 0 : (qtdM45 * 100 / qtdM).toStringAsFixed(1)}% do total de homens');
  print('d) Mulheres com menos de 30 anos e com experiência: $qtdF30Exp');
  print('e) Candidata mais nova com experiência: ${nomeMaisNova ?? 'nenhuma'}');
}

void main() => ex10();
