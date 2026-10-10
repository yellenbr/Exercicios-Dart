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
void ex11() {
  const valorHora = 12.30;
  double somaM = 0, somaF = 0;
  var qtdM = 0, qtdF = 0;

  print('\nCódigo | Nome | Salário bruto | Salário líquido');
  while (true) {
    final cod = lerTexto('\nCódigo (9999 para encerrar): ');
    if (cod == '9999') break;
    final nome = lerTexto('Nome: ');
    final sexo = lerSexo('Sexo (M/F): ');
    final horas = lerInt('Horas de aula no mês: ');

    final bruto = horas * valorHora;
    final desconto = sexo == 'M' ? 0.10 : 0.05;
    final liquido = bruto * (1 - desconto);

    if (sexo == 'M') {
      somaM += liquido;
      qtdM++;
    } else {
      somaF += liquido;
      qtdF++;
    }
    print('$cod | $nome | R\$ ${bruto.toStringAsFixed(2)} | R\$ ${liquido.toStringAsFixed(2)}');
  }
  print('\nMédia dos salários líquidos (homens): '
      '${qtdM == 0 ? 'sem dados' : 'R\$ ${(somaM / qtdM).toStringAsFixed(2)}'}');
  print('Média dos salários líquidos (mulheres): '
      '${qtdF == 0 ? 'sem dados' : 'R\$ ${(somaF / qtdF).toStringAsFixed(2)}'}');
}

void main() => ex11();
