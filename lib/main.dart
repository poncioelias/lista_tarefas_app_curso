import 'package:flutter/material.dart';
import 'Tarefa.dart';

void main() {
  runApp(new ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ListaScreen()
    );
  }

}

class ListaScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  
  List<Tarefa> tarefas = new List<Tarefa>();
  TextEditingController controller =  new TextEditingController();

  void adicionaTarefa(String nome) {

    setState(() {
      tarefas.add(Tarefa(nome));
    });

    controller.clear(); 
  }

  Widget getItem(Tarefa tarefa) {
      return new Row(children: [
          IconButton(
            icon: new Icon(tarefa.concluida ? Icons.check_box : Icons.check_box_outline_blank, color: Colors.green,),
            iconSize: 42.0,
            onPressed: () {
              setState((){
                tarefa.concluida = true;
              });
            },
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tarefa.nome),
              Text(tarefa.data.toIso8601String())
            ],
          )
        ],
      );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Lista de tarefas")
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                onSubmitted: adicionaTarefa,
              )
            ),
            Expanded (child: 
            ListView.builder(
              itemCount: tarefas.length, 
              itemBuilder: (_, indice) {
                return getItem(tarefas[indice]);
              },
              )
            ,)
          ]
        )
      );

  }

}