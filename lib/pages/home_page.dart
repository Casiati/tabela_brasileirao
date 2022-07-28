import 'package:flutter/material.dart';
import '../models/time.dart';
import 'home_controller.dart';
import 'time_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brasileirão'),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int time) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[time].brasao),
            title: Text(tabela[time].nome),
            trailing: Text(
              tabela[time].pontos.toString(),
            ),
            onTap: () {
              Navigator.push(
                contexto,
                MaterialPageRoute(
                  builder: (_) => TimePage(
                    key: Key(tabela[time].nome),
                    time: tabela[time],
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
