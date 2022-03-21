import 'dart:math';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../Model/model.dart';

class HomePage extends StatelessWidget {
  Faker faker = Faker();

  List<Product> dummyData = List.generate(50, (index) {
    return Product("Title", 'https://picsum.photos/id/$index/200',
        10000 + Random().nextInt(100000), "Deskripsi");
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marketplace"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(dummyData[index].imageUrl),
            footer: Column(
              children: [
                Text(dummyData[index].judul),
                Text(dummyData[index].harga.toString()),
                Text(dummyData[index].deskripsi)
              ],
            ),
          );
        },
        itemCount: 50,
      ),
    );
  }
}
