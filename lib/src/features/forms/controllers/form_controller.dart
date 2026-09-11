import 'package:signals/signals.dart';

class FormController {
  final _userName = signal<String>('');
  final _email = signal<String>('');

  final _itens = signal<List<String>>([]);

  String get name => _userName.value;
  String get email => _email.value;
  List<String> get itens => _itens.value;


  late final totalItens = computed(() => _itens.value.length);

  void updateInformations(String name, String email, String address) {
  batch(() {
    _userName.value = name;
    _email.value = email;
  });
  }

  void clearInformations() {
    batch(() {
      _userName.value = '';
      _email.value = '';
      _itens.value = [];
    });
  }

}
