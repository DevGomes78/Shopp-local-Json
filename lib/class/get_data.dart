import 'dart:convert';
import 'package:teste_json_loja/model/produto.dart';
import 'package:flutter/services.dart' as dadosJson;

Future<List<Produto>?> GetData () async{
  try {
    final response = await dadosJson.rootBundle.loadString(
        'jsonFile/productlist.json');
    final list = jsonDecode(response) as List<dynamic>;
    return list.map((e) => Produto.fromJson(e)).toList();
  }catch(e){
    print('erro ao acessar as infor,açoes $e');
  }
}
