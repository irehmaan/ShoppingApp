import 'package:dio/dio.dart';
import 'package:groceryapp/infra/services/ApiClient.dart';
import 'package:groceryapp/models/products.dart';

class ProductsService {
  // 1. Make N/w call
  // 2. API gets hit
  // 3. Grab the JSON
  // 4. Convert Json to Object
  ApiClient apiClient = ApiClient();

  Future<List<Products>> getProducts() async {
    Response response =
        await apiClient.get('https://fakestoreapi.com/products');
    print('Response is: ');
    print(response.data.runtimeType);

    List<dynamic> list = response.data;
    List<Products> products = list.map((m) => Products.fromJSON(m)).toList();
    print(products.runtimeType);
    return products;
    /*return [
    / Products(
          price: 299,
          id: 100,
          label: "Earphones",
          url:
              "https://5.imimg.com/data5/FK/HU/MY-44140202/apple-iphone-earphone-1000x1000.jpg"),
      Products(
          price: 49.999,
          id: 101,
          label: "Laptops",
          url: "https://www.asus.com/media/Odin/Websites/global/Series/9.png"),
      Products(
          price: 1999,
          id: 102,
          label: "Watches",
          url:
              "http://cdn.shopify.com/s/files/1/0266/1371/0884/products/Ice_Blue_3_f44256ba-0851-4631-817a-f86413f2d736-sw_grande.png?v=1667996101"),
      Products(
          price: 10.999,
          id: 104,
          label: "Smartphones",
          url:
              "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61NoYt2pvpS._SX679_.jpg"),
      Products(
          price: 20.000,
          id: 105,
          label: "Electronics",
          url: "https://www.pngall.com/wp-content/uploads/1/Electronic.png"),
    ]; */
  }
}
