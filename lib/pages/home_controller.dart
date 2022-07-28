import '../repositories/times_repository.dart';
import 'package:aula01_tabela_de_pontos/models/time.dart';
import '../models/titulos.dart';


class HomeController {
  late TimesRepository timesRepository;


   List<Time>? get tabela => timesRepository.times;

 HomeController(){
   timesRepository = TimesRepository();
 }
}
