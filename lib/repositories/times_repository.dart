import '../models/time.dart';
import 'package:flutter/material.dart';
import '../models/titulos.dart';

class TimesRepository {
  final List<Time> _times = [];

  get times => this._times;

  void addTitulo({required Time time, required Titulo titulo}) {
    time.titulos.add(titulo);
  }

  TimesRepository() {
    _times.addAll(
      [
        Time(
          nome: 'Flamengo',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png',
          cor: Colors.red[900]!,
        ),
        Time(
          nome: 'Internacional',
          pontos: 0,
          brasao:
              'https://e.imguol.com/futebol/brasoes/40x40/internacional.png',
          cor: Colors.red[900]!,
        ),
        Time(
          nome: 'Atlético-MG',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-mg.png',
          cor: Colors.grey[800]!,
        ),
        Time(
          nome: 'São Paulo',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/sao-paulo.png',
          cor: Colors.red[900]!,
        ),
        Time(
          nome: 'Fluminense',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/fluminense.png',
          cor: Colors.teal[800]!,
        ),
        Time(
          nome: 'Grêmio',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/gremio.png',
          cor: Colors.blue[900]!,
        ),
        Time(
          nome: 'Palmeiras',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/palmeiras.png',
          cor: Colors.green[900]!,
        ),
        Time(
          nome: 'Santos',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/santos.png',
          cor: Colors.grey[800]!,
        ),
        Time(
          nome: 'Athletico-PR',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-pr.png',
          cor: Colors.red[800]!,
        ),
        Time(
          nome: 'Corinthians',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/corinthians.png',
          cor: Colors.grey[900]!,
        ),
        Time(
          nome: 'Bragantino',
          pontos: 0,
          brasao:
              'https://e.imguol.com/futebol/brasoes/40x40/red-bull-bragantino.png',
          cor: Colors.grey[800]!,
        ),
        Time(
          nome: 'Ceará',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/ceara.png',
          cor: Colors.grey[800]!,
        ),
        Time(
          nome: 'Atlético-GO',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-go.png',
          cor: Colors.red[900]!,
        ),
        Time(
          nome: 'Sport',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/sport.png',
          cor: Colors.red[900]!,
        ),
        Time(
          nome: 'Bahia',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/bahia.png',
          cor: Colors.blue[900]!,
        ),
        Time(
          nome: 'Fortaleza',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/fortaleza.png',
          cor: Colors.red[900]!,
        ),
        Time(
          nome: 'Vasco',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/vasco.png',
          cor: Colors.grey[800]!,
        ),
        Time(
          nome: 'Goiás',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/goias.png',
          cor: Colors.green[900]!,
        ),
        Time(
          nome: 'Coritiba',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/coritiba.png',
          cor: Colors.green[800]!,
        ),
        Time(
          nome: 'Botafogo',
          pontos: 0,
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/botafogo.png',
          cor: Colors.grey[800]!,
        ),
      ],
    );
  }
}
