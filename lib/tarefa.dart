class Tarefa {

  //atributos
  String nome;
  DateTime data;
  bool concluida;

  // construtor
  Tarefa(String nome) {
    this.nome = nome;
    data = DateTime.now();
    concluida = false;
  }

}

// tarefa t = new Tarefa("Lavar o carro");

