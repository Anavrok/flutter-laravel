import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _emailController,
                  validator: (value) => value?.isEmpty ?? true
                      ? 'please enter valid email'
                      : null),
              TextFormField(
                  controller: _passwordController,
                  validator: (value) => value?.isEmpty ?? true
                      ? 'please enter valid password'
                      : null),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple),
                ),
                child: Text('Login'),
                onPressed: () {
                  Map creds = {
                    'email': _emailController.text,
                    'password': _passwordController.text,
                    'device_name': 'mobile',
                  };
                  if (_formKey.currentState!.validate()) {
                    Provider.of<Auth>(context, listen: false)
                        .login(creds: creds);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
