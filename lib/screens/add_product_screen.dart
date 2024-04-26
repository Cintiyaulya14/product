import 'package:product/screens/homescreen.dart';
import 'package:product/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen>{
  final TextEditingController _controllerKode = TextEditingController();
  final TextEditingController _controllerNama = TextEditingController();
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Input barang'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controllerKode,
                    decoration: const InputDecoration(hintText: 'Masukkan kode barang ...'),
                  )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controllerNama,
                    decoration: const InputDecoration(hintText: 'Masukkan nama barang ...'),
                  )
                ),
              ],
            ),
          ),
          const SizedBox(height: 16,),
          ElevatedButton(
            onPressed: () {
              _productService.addProductItem(_controllerKode.text, _controllerNama.text);
              _controllerKode.clear();
              _controllerNama.clear();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }, 
            child: const Text('Tambah'),
          )
        ],
      ),
    );
    
  }
}