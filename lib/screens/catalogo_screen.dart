import 'package:flutter/material.dart';

class CatalogoScreen extends StatelessWidget{
  const CatalogoScreen({super.key});

  // final indica que a variavel produtos não recebera outra lista depois de criada
  final List<String> produtos = const [
    'Notebook',
    'Smartphone',
    'Tablet',
    'Monitor',
    'Teclado',
    'Mouse',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categoria'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(16),
        // organizar os widgets verticalmente, de cima para baixo
        child: Column(
          // faz os filhos ocuparem toda a largura disponivel no eixo horizontal da coluna (Column)
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // lista os widgets que serão exibidos na coluna
          children: [
            const Text(
              'Lista de produtos',
              style: TextStyle(
                fontSize: 18, //define o tamanhoo da fonte
                fontWeight: FontWeight.bold //
              ),
              ),
              // Cria um espaço vertical
              const SizedBox(height: 8),
              // Faz a lista ocupar o espaço vertical disponivel dentro da column
              Expanded(
                // Cria uma lista vertical com rolagem.
                // builder constroi os itens conforme necessário
                // Sendo útil para a lista que podem ter muitos elementros
                child: ListView.builder(
                  // definindo a quantidade de itens
                  // produto.length retorna a 6 nesta exemplo
                  itemCount: produtos.length,
                  // Função chamada pelo ListView para contruir cada item da lista
                  // index representa a posição do item, começando em 0
                  itemBuilder: (context, index) {
                    return Card(
                      // Adiciona 4 pixel acima e abaixo do cartão
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      // Cria uma linha pronta para listas
                      // com espaço para icone, titulo e informações adicionais
                      child: ListTile(
                        // exibe um icone de sacola no inicio da linha 
                        leading: const Icon(Icons.shopping_bag),
                        // Exibe o nome do produto
                        title: Text(produtos[index]),
                        // Exibe uma descrição abaixo do nome 
                        // ${index+1} interpola o valor calculado 
                        // como o inice começa em 0, os numeros começam em 1
                        subtitle: Text('Produto ${index + 1}'),

                        trailing: const Icon(Icons.chevron_right),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
              const Text('Grade de produtos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              ),

              const SizedBox(height: 8),
              // Faz a grade ocupar a parte do espaço vertical restante
              // Como há dois expanded na mesma column, o espaço flexivel é dividido igualmente entre eles, apos descontar os demais elementos e os espaçamentos 
              Expanded(
                // Cria uma grande com rolagem, organizando os itens em linhas e colunas
                child: GridView.builder(
                  itemCount: produtos.length,

                  // Define que seram exibidos 6 itens na grade
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // Exibe 2 colunas por linhas
                    crossAxisCount: 2,
                    // Define 10 pixels logicos de espaço horizontal entre as colunas 
                    crossAxisSpacing: 10,
                    // Define 10 pixels logicos de espaço horizontal entre as colunas 
                    mainAxisSpacing: 10,
                    // Define a proporção entre largura e altura de cada item
                    // 1.6 significa que cada item será aproximadamente 1,6 vezes mais largo do que a alto 
                    childAspectRatio: 1.6,
                    ),
                    // Cria uma caixa que pode receber alinhamento, cor, bordas, margens internas e outros estilos
                    itemBuilder: (context,index){
                      return Container(
                        // centraliza o conteudo dentro da caixa,
                        // tanto vertical quanto horizontal
                        alignment: Alignment.center,
                        // define a aparencia visual do container 
                        decoration: BoxDecoration(
                          // define uma cor roxa bem clara para o fundo 
                          color: Colors.deepPurple.shade50,
                          // arredonda os cantos da caixa com raio de 12 pixels logicos
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(
                          // exibe o nome do produto correspondente ao indice
                          produtos[index],
                          // centraliza o texto horizontalmente
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                ), 

              )
          ],
      ),
      ),

    );
  }
}