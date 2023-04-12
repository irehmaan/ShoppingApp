import 'package:flutter/material.dart';
import 'package:groceryapp/models/products.dart';
import 'package:groceryapp/services/service_to_get_products.dart';
import 'package:groceryapp/widgets/item.dart';

class ShoppingApp extends StatefulWidget {
  ShoppingApp() {}

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  ProductsService service = ProductsService();

  // Bring Data from service using api which made n/w call which gives a json.

  List<Products> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<List<Products>> future = service.getProducts();
    future.then((List<Products> products) {
      this.products = products;
      setState(() {});
    }).catchError((err) => print("Erros is $err"));
  }

  @override
  Widget build(BuildContext context) {
    const url1 =
        'https://www.mynokia.com/sites/default/files/styles/aspect_16_9_1200px/public/2022-08/Fold%204_0.png?itok=vyGwtRhR';
    const url2 =
        'https://www.ishopping.pk/media/wysiwyg/CMS_Blocks/electronics/Electronic.jpg';
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.cyan.shade300,
        title: const Text("Indirapuram"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 243, 233, 233),
              margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
              // ignore: prefer_const_constructors
              child: TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search for Prodcuts'),
              ),
            ),
            Divider(),
            Container(
              child: Image.network(url1),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 2,
            ),
            Container(
              child: Image.network(url2),
            ),
            Wrap(
              children: products
                  .map((singeProduct) => Item(
                      url: singeProduct.url,
                      label: singeProduct.label.substring(0, 12)))
                  .toList(),
              /*children: service
                    .getProducts()
                    .map((e) => Item(url: e.url, label: e.label))
                    .toList() */
            )
          ],
        ),
      ),
    );
  }
}
