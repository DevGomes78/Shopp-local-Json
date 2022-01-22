import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_json_loja/class/get_data.dart';
import 'package:teste_json_loja/components/app_text.dart';
import 'package:teste_json_loja/model/produto.dart';
import 'package:teste_json_loja/screens/details.dart';

Widget GridScreen() {
  return FutureBuilder(
    future: GetData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        var items = snapshot.data as List<Produto>;
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //  mainAxisSpacing: 5,
                childAspectRatio: 5 / 6,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Details(produto: items[index])));
                  },
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 100,
                            child: Image.network(
                              items[index].imageURL.toString(),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            items[index].name.toString(),
                            style: AppTexStyle.TextFont16,
                          ),
                          SizedBox(height: 10),
                          Text(
                            NumberFormat('R\$ #.00', 'pt-BR')
                                .format(double.parse(items[index].price.toString())),
                            style: AppTexStyle.TextFont16_OranG,
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart_outlined),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
