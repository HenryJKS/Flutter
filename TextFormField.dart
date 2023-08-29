import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
        child: ListView(
      padding: const EdgeInsets.all(32),
      children: <Widget>[
        buildEmail(),
        const SizedBox(
          height: 24,
        ),
        buildPassword(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: () {
            // Acessar o form e verificar se está valido
            final bool valido = _key.currentState!.validate();
            
            if (valido) {
              print('Email: ${emailController.text} ');
              print('Password: ${senhaController.text}');
            }
           
          },
          child: const Text('Submit'),
        )
      ],
    ));
  }

  Widget buildEmail() => TextFormField(
    validator: (value) {
      if(value == null || value.isEmpty) {
        return 'Email Obrigatorio';
      }
      return null;
    },
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'name@example.com',
          labelText: 'E-mail',
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.email),
          suffixIcon: emailController.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    emailController.clear();
                    // 1 Limpar o valor do campo email
                    // 2 somente exibir o botao quando email tive algum valor
                  },
                ),
        ),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildPassword() => TextFormField(
    validator: (value) {
      if(value == null || value.isEmpty) {
        return 'Minimo 5 Caracteres';
      }
      return null;
    },
        controller: senhaController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Your Password...',
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
      );
}
