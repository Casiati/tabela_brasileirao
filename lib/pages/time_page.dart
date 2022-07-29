// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aula01_tabela_de_pontos/repositories/times_repository.dart';
import 'package:aula01_tabela_de_pontos/widgets/brasao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/time.dart';
import 'add_tittulo_page.dart';
import 'package:get/get.dart';

import 'edit_titulo_page.dart';

class TimePage extends StatefulWidget {
  Time time;

  TimePage({required Key key, required this.time}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  tituloPage() {
    Get.to(
      () => AddTituloPage(time: widget.time),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: tituloPage,
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatísticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Títulos',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Brasao(
                    image: widget.time.brasao,
                    width: (250),
                  ),
                ),
                Text(
                  'Pontos ${widget.time.pontos}',
                  style: TextStyle(
                    fontSize: 22,
                    color: widget.time.cor,
                  ),
                )
              ],
            ),
            titulos(),
          ],
        ),
      ),
    );
  }

  Widget titulos() {
    final time = Provider.of<TimesRepository>(context)
        .times
        .firstWhere((t) => t.nome == widget.time.nome);

    final quantidade = time.titulos.length;

    return quantidade == 0
        ? Container(
            child: Center(
              child: Text(
                'Nenhum Titulo Ainda!',
                style: TextStyle(
                  fontSize: 22,
                  color: widget.time.cor,
                ),
              ),
            ),
          )
        : ListView.separated(
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return ListTile(
                leading: Icon(Icons.emoji_events),
                title: Text(time.titulos[index].campeonato),
                trailing: Text(time.titulos[index].ano),
                onTap: () {
                  Get.to(
                    EditTituloPage(
                      titulo: time.titulos[index],
                    ),
                    fullscreenDialog: true,
                  );
                },
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade,
          );
  }
}
