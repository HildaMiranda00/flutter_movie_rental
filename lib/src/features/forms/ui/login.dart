import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_hadmc/src/core/di/injection.dart';
import 'package:project_hadmc/src/features/forms/controllers/user_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isHoveringForgotPassword = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final loginController = getIt<LoginController>();
   
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Workshop_flutter',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 27, 32),
        
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/image.png',
              repeat: ImageRepeat.repeat,
            ),
          ),
          Positioned.fill(
          child: Container(
            color: const Color.fromARGB(123, 0, 0, 0),
          ),
        ),

          Center(
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(172, 110, 16, 126),
                borderRadius: BorderRadius.circular(15),
              ),
              
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _userNameController,
                      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: const Color.fromARGB(0, 255, 255, 255),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 54, 0, 69),
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    TextField(
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: const Color.fromARGB(0, 255, 255, 255),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 54, 0, 69),
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    const SizedBox(width: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _isHoveringForgotPassword = true),
                        onExit: (_) => setState(() => _isHoveringForgotPassword = false),
                        child: TextButton(
                          onPressed: () {
                            context.go('/homePage');
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: _isHoveringForgotPassword ? const Color.fromARGB(255, 34, 0, 43) : Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                  ElevatedButton(
                  onPressed: () {
                    final isValidLogin = loginController.login(
                      _userNameController.text,
                      _passwordController.text,
                    );

                    if (isValidLogin) {
                      context.go('/homePage');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Usuário ou senha inválidos.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                  fixedSize: const Size(175, 25),
                  ),
                  child: const Text('Entrar'),
                ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//a