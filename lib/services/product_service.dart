import 'package:firebase_database/firebase_database.dart';

class ProductService {
  final DatabaseReference _database= FirebaseDatabase.instance.ref().child('product_list');

  Stream<Map<String, String>>getProductList(){
    return _database.onValue.map((event) {
      final Map<String, String> items = {};
      DataSnapshot snapshot = event.snapshot;

      if(snapshot.value !=null){
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          items[key] = 'Kode Produk : ${value['kode']} \nNama Barang : ${value['nama']}';
        });
      }

      return items;

      });
    }
    
    void addProductItem(String itemCode, String itemName){
        _database.push().set({
          'kode': itemCode,
          'nama': itemName,
    });
  }
  Future<void>removeProductItem(String key)async{
        await _database.child(key).remove();
  }
}