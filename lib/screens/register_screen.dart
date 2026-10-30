import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

// Essa class ela guarda o estado da tela
class _RegisterScreenState extends State<RegisterScreen> {
  // GlobalKey cria uma chave que permite acessar um widget e o seu estado associado
  // <FormState> informa que essa chave será usada especificamente para acessar o estado de um form
  // final significa que _formKey receberá esta chave uma unica vez e não será substituido por outra
  final _formKey = GlobalKey<FormState>();

  // Variável para armazenar a senha digitada
  String _senha = '';
  bool _ocultarSenha = true; // Informa que a senha começa oculta
  bool _ocultarConfirmacao = true; // Controla separadamente a confirmação de senha 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: SingleChildScrollView(
        child: Padding(
          // Espaçamento interno em todos os lados 16px
          padding: const EdgeInsets.all(16.0),

          // Form agrupa os campos que serão validados
          child: Form(
            key: _formKey,
            child: Column(
              // Em Column o eixo transversal é o horizontal
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Crie sua conta',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Divider(),

                const Text('Preencha os campos abaixo para continuar.'),

                const SizedBox(height: 24),

                TextFormField(
                  // Decoration recebe o InputDecoration responsável pela aparência do campo
                  decoration: const InputDecoration(
                    labelText: 'Nome Completo',
                    hintText: 'Digite seu nome',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),

                  // Validator recebe uma função, e value representa o texto atual do campo 
                  validator: (value) {
                    // Validação dos campos null vazios
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu nome';
                    }

                    // Validação de quantidade de caracteres
                    if (value.trim().length < 3) {
                      return 'Digitar pelo menos 3 caracteres';
                    }

                    // Null significa que nenhum erro foi encontrado
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'nome@exemplo.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),

                  // Sugere um teclado adequado para email
                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu e-mail corretamente';
                    }

                    // contains('@') verifica se existe o @
                    if (!value.contains('@')) {
                      return 'Digite um e-mail válido.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarSenha
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _ocultarSenha = !_ocultarSenha;
                        });
                      },
                    ),
                  ),

                  obscureText: _ocultarSenha,

                  // Armazena a senha na variável conforme o usuário digita
                  onChanged: (value) {
                    setState(() {
                      _senha = value;
                    });
                  },

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe sua senha';
                    }

                    if (value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Campo corrigido para confirmar a senha digitada anteriormente
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    hintText: 'Digite sua senha novamente',
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: const OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarConfirmacao
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _ocultarConfirmacao = !_ocultarConfirmacao;
                        });
                      },
                    ),
                  ),

                  obscureText: _ocultarConfirmacao,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Confirme a sua senha';
                    }

                    if (value != _senha) {
                      return 'As senhas não coincidem';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final formularioValidado = _formKey.currentState?.validate() ?? false;

                      if (formularioValidado) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cadastro realizado com sucesso!'),
                          ),
                        );
                      }
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}