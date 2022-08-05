import 'package:flutter/material.dart';
import 'titulos.dart';

class Time {
 int? id;
 String nome;
 String brasao;
 int pontos;
 Color cor;
 List<Titulo>? titulos = [];

 Time({this.id, required this.nome, required this.brasao, required this.pontos, required this.cor, this.titulos});
}

