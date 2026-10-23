import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() {
    return _PreferenceScreenState();
  }
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  String nome = '';
  String? linguagem;
  String nivel = 'Iniciante';
  bool estudarFlutter =  false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferências'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Configure suas preferências',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                onChanged: (novoValor) {
                  setState(() {
                    nome = novoValor;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Menu suspenso para escolher uma
              DropdownButton<String>(
                value: linguagem,
                isExpanded: true,
                hint: const Text('Escolha uma linguagem'),
                items: const [
                  DropdownMenuItem(value: 'Flutter', child: Text('Flutter'),),
                  DropdownMenuItem(value: 'Javascript', child: Text('Javascript'),),
                  DropdownMenuItem(value: 'Python', child: Text('Python'),),
                  DropdownMenuItem(value: 'Node.js', child: Text('Node.js'),),
                ],
                onChanged: (novoValor) {
                  setState(() {
                    linguagem = novoValor;
                  });
                },
              ),
              const SizedBox(height: 20,),
              const Text(
                'Nivel de conhecimento',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              RadioListTile<String>(
                title: const Text('Iniciante'),
                // valor atualmente selecionado no grupo
                value: 'Iniciante',
                groupValue: nivel,
                onChanged: (novoValor){
                  setState(() {
                    nivel =  novoValor ?? nivel;
                  });
                },
                
              ), 
              RadioListTile<String>(
                title: const Text('Intermediário'),
                // valor atualmente selecionado no grupo
                value: 'Intermediário',
                groupValue: nivel,
                onChanged: (novoValor){
                  setState(() {
                    nivel =  novoValor ?? nivel;
                  });
                },

                
                
              ),

              RadioListTile<String>(
                title: const Text('Avançado'),
                // valor atualmente selecionado no grupo
                value: 'Avançado',
                groupValue: nivel,
                onChanged: (novoValor){
                  setState(() {
                    nivel =  novoValor ?? nivel;
                  });
                },

              ),

              const Divider(),

              SwitchListTile(
                title: const Text('Quero estudar Flutter'),

                value: estudarFlutter,

                onChanged: (novoValor) {
                  setState(() {
                    estudarFlutter = novoValor;
                  });
                },
              ),

              const SizedBox(height: 20),
              // Botão para motrar as preferências 
              ElevatedButton(
                // Função executada quando o botão é pressionado
                onPressed: () {
                  showDialog(
                  context: context, 
                  builder: (context){
                    return AlertDialog(
                      title: const Text('Suas preferências'),
                      content: Text(
                        'Nome: $nome\n'
                        'Linguagem: ${linguagem?? "Não selecionada\n"}'
                        'Nível: $nivel\n',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Fechar'),
                          ),
                      ],
                    );
                  },
                  );
                },  
                child: const Text('Mostrar preferências'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}