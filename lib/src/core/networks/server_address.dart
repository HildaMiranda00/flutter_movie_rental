
import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiUrl = dotenv.get('API_URL');
final port = dotenv.getInt('PORT');
final userToken = dotenv.get('TOKEN');

final serverAdress = '$apiUrl:$port';

final showInformationsRoute = '$serverAdress/show-informations';
final updateInformationsRoute = '$serverAdress/update-informations';
//a