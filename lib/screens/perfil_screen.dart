import 'package:flutter/material.dart';

// Tela de Perfil que representa o perfil

// StatelessWidget é usando quando as informações do proprio widget não precisa mudar durante a interação
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold fornece a estrutura basica de uma tela Material Design
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu perfil',
          // estilizando o nosso titulo
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        // Criando um espaço interno nos 4 lados
        padding: const EdgeInsets.all(16),
        //Padding apenas 1 unico filho.

        //Column será o filho por que precisamos organizar varios elementos vertical
        child: Column(
          // Em column, o eixo principal é VERTICAL
          // start coloca os filhos no inicio desse eixo: no topo.
          mainAxisAlignment: MainAxisAlignment.start,

          // O eixo transversal fica perpendicular.
          // Em column, ele deixa HORIZONTAL
          // stretch tenta ocupar a largura disponivel
          crossAxisAlignment: .stretch,
          children: [
            const CircleAvatar(
              // radius que controla o raio do circulo
              radius: 48,

              //cor de fundo do avatar
              backgroundColor: Colors.deepPurple,

              // recebe o conteudo interno
              child: Icon(
                // Recebe o Icone
                Icons.person,
                // Tamanho do Icone
                size: 48,
                // Cor do icone.
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
