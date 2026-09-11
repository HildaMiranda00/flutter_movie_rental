import 'package:http/http.dart' as http;

class EngineDataSource {
  final http.Client client;
  EngineDataSource(this.client);
}