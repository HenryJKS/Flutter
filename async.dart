// Neste exercício, você irá executar uma função assíncrona que simula o login de um usuário
// e a consulta de seu saldo bancário

// 1 execute o método de login informando o e-mail e a senha
// 2 caso o email e senha sejão válidos, consulte o saldo do usuário informando o token e printando o resultado no console
// 3 caso o email ou senha sejão inválidos, printe a mensagem de erro.

void asyncCallback() {
  Future<String> future = login('email@email.com', '123');

  future
      .then((token) => {
            consultarSaldo(token).then((valor) => {print('Saldo é $valor')})
          })
      .catchError((erro) {
    print('Erro ao achar o Token $erro');
  });
}

void main() async {
  try {
    String token = await login('email@email.com', '123');

    print(await consultarSaldo(token));
  } catch (error) {
    print(error);
  }
}

Future<String> login(String email, String senha) async {
  // Simulando um atraso de download de 2 segundos
  await Future.delayed(Duration(seconds: 2));

  if (email != 'email@email.com' || senha != '123') {
    throw Exception('email ou senha inválida');
  }

  // Simulando informações de token de acesso do usuário
  final token = 'bas89e8ahdkkdassd';

  return token;
}

Future<num> consultarSaldo(String token) async {
  // Simulando um atraso de download de 3 segundos
  await Future.delayed(Duration(seconds: 3));

  return 2000;
}
