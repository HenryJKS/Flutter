Os campos de texto permitem que os usuários digitem texto em um aplicativo. Eles são usados ​​para criar formulários, enviar mensagens, criar experiências de pesquisa e muito mais.

Como executar uma função de retorno toda vez que o texto muda? Com o Flutter, você tem duas opções:

* onChanged callback

```dart
TextField(
	Onchanged: (text) {
		print('First text field: $text');
	},
),
```

* TextEditingController
```dart
// Define a custom form widget
class MyCustomForm extends StatefulWidget {
	const MyCustomForm({super.key});
	@override
	State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class
// This class holds data related to the form
class _MyCustomFormState extends State<MyCustomForm> {
	//Create a text controller. Later, use it to retrieve the
	//current value of the textField
	final myController() = TextEditingController();

	@override
	void dispose() {
		//Clean up the controller when the widget is removed from the widget tree
		myController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		//Fill this out in the next step.
	}
}
```