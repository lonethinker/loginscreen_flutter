import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color.fromARGB(127, 124, 77, 255)]),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            title: const Text(
              "Login Screen",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          body: const LoginScreen(),
        ),
      ),
    ),
  );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 100,
        ),
        const Text("💜 from Spandan"),
        const SizedBox(
          height: 82,
        ),
        TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            hoverColor: Colors.deepPurpleAccent,
            focusColor: Colors.white,
            label: Text(
              "Enter Username",
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            label: Text(
              "Enter Password",
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 40,
        ),
        SubmitButton(
          usernameController: _usernameController,
          passwordController: _passwordController,
        ),
      ],
    );
  }
}

class SubmitButton extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const SubmitButton({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  State<SubmitButton> createState() {
    return _SubmitButtonState();
  }
}

class _SubmitButtonState extends State<SubmitButton> {
  var buttonColor = const Color.fromARGB(255, 124, 77, 255);
  var buttontextColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: () {
        String username = widget.usernameController.text;
        String password = widget.passwordController.text;
        print('Username: $username, Password: $password');
        if (username != '' && password != '') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Successful Login',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.greenAccent,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Check Username or Password',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
        setState(
          () {
            buttonColor = const Color.fromARGB(255, 255, 255, 255);
            buttontextColor = const Color.fromARGB(255, 124, 77, 255);
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
      ),
      child: Text(
        "Submit",
        style: TextStyle(
          fontSize: 20,
          color: buttontextColor,
        ),
      ),
    );
  }
}
