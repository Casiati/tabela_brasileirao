import 'package:aula01_tabela_de_pontos/controllers/theme_controller.dart';
import 'package:aula01_tabela_de_pontos/repositories/times_repository.dart';
import 'package:aula01_tabela_de_pontos/widgets/brasao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/time.dart';
import 'home_controller.dart';
import 'time_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ThemeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brasileirão'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: ListTile(
                leading: Obx(() => controller.isDark.value
                    ? Icon(Icons.brightness_7)
                    : Icon(Icons.brightness_2)),
                title: Obx(() =>
                    controller.isDark.value ? Text('Light') : Text('Dark')),
                onTap: () => controller.changeTheme(),
              )),
            ],
          ),
        ],
      ),
      body: Consumer<TimesRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.times.length,
            itemBuilder: (BuildContext contexto, int time) {
              final List<Time> tabela = repositorio.times;
              return ListTile(
                leading: Brasao(
                  image: tabela[time].brasao,
                  width: 40,
                ),
                title: Text(tabela[time].nome),
                subtitle: Text('Titulos ${tabela[time].titulos!.length}'),
                trailing: Text(
                  tabela[time].pontos.toString(),
                ),
                onTap: () {
                  Get.to(
                    () => TimePage(
                      key: Key(tabela[time].nome),
                      time: tabela[time],
                    ),
                  );
                },
              );
            },
            separatorBuilder: (_, __) => Divider(),
            padding: EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
