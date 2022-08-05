import 'dart:collection';
import 'package:provider/provider.dart';

import '../database/db.dart';
import '../models/time.dart';
import 'package:flutter/material.dart';
import '../models/titulos.dart';

class TimesRepository extends ChangeNotifier {
  final List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(_times);

  void addTitulo({required Time time, required Titulo titulo}) async {
    var db = await DB.get();
    int id = await db.insert('titulos', {
      'campeonato': titulo.campeonato,
      'ano': titulo.ano,
      'time_id': time.id
    });
    titulo.id = id;
    time.titulos!.add(titulo);
    notifyListeners();
  }

  void editTitulo({Titulo? titulo, String? ano, String? campeonato}) async {
    var db = await DB.get();
    await db.update(
      'titulos',
      {
        'campeonato': campeonato,
        'ano': ano,
      },
      where: 'id = ?',
      whereArgs: [titulo?.id],
    );
    titulo?.campeonato = campeonato!;
    titulo?.ano = ano!;
    notifyListeners();

  }

  static setupTimes() {
    return [
      Time(
        nome: 'Flamengo',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png',
        cor: Colors.red[900]!,
        id: 18,
      ),
      Time(
        nome: 'Internacional',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/internacional/logo-internacional-256.png',
        cor: Colors.red[900]!,
        id: 44,
      ),
      Time(
        nome: 'Atlético-MG',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png',
        cor: Colors.grey[800]!,
        id: 30,
      ),
      Time(
        nome: 'São Paulo',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
        cor: Colors.red[900]!,
        id: 57,
      ),
      Time(
        nome: 'Fluminense',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
        cor: Colors.teal[800]!,
        id: 26,
      ),
      Time(
        nome: 'Grêmio',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
        cor: Colors.blue[900]!,
        id: 45,
      ),
      Time(
        nome: 'Palmeiras',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
        cor: Colors.green[800]!,
        id: 56,
      ),
      Time(
        nome: 'Santos',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/santos/logo-santos-256.png',
        cor: Colors.grey[800]!,
        id: 63,
      ),
      Time(
        nome: 'Athletico-PR',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png',
        cor: Colors.red[900]!,
        id: 185,
      ),
      Time(
        nome: 'Corinthians',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
        cor: Colors.grey[800]!,
        id: 65,
      ),
      Time(
        nome: 'Bragantino',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png',
        cor: Colors.grey[800]!,
        id: 64,
      ),
      Time(
        nome: 'Ceará',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/ceara/logo-ceara-256.png',
        cor: Colors.grey[800]!,
        id: 105,
      ),
      Time(
        nome: 'Atlético-GO',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-256.png',
        cor: Colors.red[900]!,
        id: 98,
      ),
      Time(
        nome: 'Sport',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/sport-recife/logo-sport-recife-256.png',
        cor: Colors.red[900]!,
        id: 79,
      ),
      Time(
        nome: 'Bahia',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/bahia/logo-bahia-256.png',
        cor: Colors.blue[900]!,
        id: 68,
      ),
      Time(
        nome: 'Fortaleza',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
        cor: Colors.red[900]!,
        id: 131,
      ),
      Time(
        nome: 'Vasco',
        pontos: 0,
        brasao:
            'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png',
        cor: Colors.grey[800]!,
        id: 23,
      ),
      Time(
        nome: 'Goiás',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/goias/logo-goias-esporte-clube-256.png',
        cor: Colors.green[900]!,
        id: 115,
      ),
      Time(
        nome: 'Coritiba',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/coritiba/logo-coritiba-5.png',
        cor: Colors.green[900]!,
        id: 84,
      ),
      Time(
        nome: 'Botafogo',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png',
        cor: Colors.grey[800]!,
        id: 22,
      ),
    ];
  }

  TimesRepository() {
    initRepository();
  }

  initRepository() async {
    var db = await DB.get(); // explicar que aqui irá iniciar o DB

    List ts = await db.query('times', orderBy: 'pontos DESC');
    //Equivalente a db.rawQuery('SELECT * FROM times');

    for (var t in ts) {
      var time = Time(
          id: t['id'],
          nome: t['nome'],
          brasao: t['brasao'],
          pontos: t['pontos'],
          //idAPI: t['idAPI'],
          cor: Color(int.parse(t['cor'])),
          titulos: await getTitulos(t['id']));
      _times.add(time);
    }

    notifyListeners();
  }
  getTitulos(timeId) async {
    var db = await DB.get();
    var results =
    await db.query('titulos', where: 'time_id = ?', whereArgs: [timeId]);
    List<Titulo> titulos = [];
    for (var titulo in results) {
      titulos.add(Titulo(
        id: titulo['id'],
        campeonato: titulo['campeonato'],
        ano: titulo['ano'],
      ));
    }
    return titulos;
  }
}
