import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_json_loja/components/app_text.dart';
import 'package:teste_json_loja/model/produto.dart';

class Details extends StatelessWidget {
  Produto produto;

  Details({required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Detalhes do Produto',
          style: AppTexStyle.TextFont20,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(produto.imageURL.toString()),
            ),
            SizedBox(height: 30),
            Text(
              produto.name.toString(),
              style: AppTexStyle.TextFont24,
            ),
            SizedBox(height: 20),
            Text(
               NumberFormat('R\$ #.00', 'pt-BR').format (double.parse ( produto.price.toString()))
                , style: AppTexStyle.TextFont24_OranG,

            ),
            SizedBox(height: 60),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
              ),
              child: Center(
                  child: Text(
                'Adicionar ao Carrinho',
                style: AppTexStyle.TextFont20,
              )),
            )
          ],
        ),
      ),
    );
  }
}
