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
void ex4() {
  var qtd = 0, aprovados = 0;
  double somaMedias = 0;
  String? matM, matF;
  double maiorM = -1, maiorF = -1;
  double somaF = 0;
  var qtdF = 0;

  while (true) {
    final mat = lerTexto('\nMatrícula (00000 para encerrar): ');
    if (mat == '00000') break;
    final nome = lerTexto('Nome: ');
    final sexo = lerSexo('Sexo (M/F): ');
    final n1 = lerDouble('Nota 1: ');
    final n2 = lerDouble('Nota 2: ');
    final n3 = lerDouble('Nota 3: ');
    final faltas = lerInt('Faltas: ');

    final media = (n1 + n2 + n3) / 3;
    final aprovado = media >= 7.0 && faltas <= 18;

    qtd++;
    somaMedias += media;
    if (aprovado) aprovados++;

    if (sexo == 'F') {
      somaF += media;
      qtdF++;
      if (aprovado && media > maiorF) {
        maiorF = media;
        matF = mat;
      }
    } else if (aprovado && media > maiorM) {
      maiorM = media;
      matM = mat;
    }
    print('$nome -> média ${media.toStringAsFixed(2)} (${aprovado ? 'aprovado' : 'reprovado'})');
  }

  if (qtd == 0) {
    print('Nenhum aluno lido.');
    return;
  }
  print('\n--- Resultados ---');
  print('a) Média da turma: ${(somaMedias / qtd).toStringAsFixed(2)}');
  print('b) Percentual de aprovados: ${(aprovados * 100 / qtd).toStringAsFixed(1)}%');
  print('c) Maior média aprovado(a) - masculino: ${matM ?? 'nenhum aprovado'}');
  print('   Maior média aprovado(a) - feminino: ${matF ?? 'nenhuma aprovada'}');
  print('d) Média das alunas: ${qtdF == 0 ? 'sem alunas' : (somaF / qtdF).toStringAsFixed(2)}');
}

void main() => ex4();
