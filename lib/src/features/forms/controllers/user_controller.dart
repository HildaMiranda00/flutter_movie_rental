import 'package:signals/signals.dart';

class LoginController {
  final _userName = signal<String>('');
  final _password = signal<String>('');
  final _user = signal<String>('');

  final _itens = signal<List<String>>([]);
  final _savedUser = 'jose';
  final _savedPassword = 'admin321';

  String get username => _userName.value;
  String get password => _password.value;
  List<String> get itens => _itens.value;
  String get user => _user.value;

  late final totalItens = computed(() => _itens.value.length);

  bool login(String username, String password) {
    final normalizedUsername = username.trim();
    final normalizedPassword = password.trim();

    final isValidCredentials =
        normalizedUsername == _savedUser && normalizedPassword == _savedPassword;

    batch(() {
      _userName.value = normalizedUsername;
      _password.value = normalizedPassword;
      if (isValidCredentials) {
        _user.value = normalizedUsername;
      }
    });

    return isValidCredentials;
  }

  void updateInformations(String username, String password) {
    batch(() {
      _userName.value = username;
      _password.value = password;
    });
  }

  void clearInformations() {
    batch(() {
      _userName.value = '';
      _password.value = '';
      _itens.value = [];
    });
  }
}
//a