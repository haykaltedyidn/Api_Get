import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageApiTwo extends StatefulWidget {
  const PageApiTwo({super.key});

  @override
  State<PageApiTwo> createState() => _PageApiTwoState();
}

class _PageApiTwoState extends State<PageApiTwo> {
  List<dynamic> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Product List', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // Keep the 5 items per row
          crossAxisSpacing: 10, 
          mainAxisSpacing: 10, 
          childAspectRatio: 0.65, // Adjusted aspect ratio to fit image without cutting
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final name = product['title'];
          final price = product['price'].toString();
          final imageUrl = product['image'];

          return GridTile(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain, // Use 'contain' to prevent cutting the image
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$' + price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchProducts,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.download, color: Colors.white),
      ),
    );
  }

  void fetchProducts() async {
    const url = 'https://fakestoreapi.com/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      setState(() {
        products = json;
      });
    }
  }
}
