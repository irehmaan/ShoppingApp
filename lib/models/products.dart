class Products {
  late int id;
  late String label;
  late double price;
  late String url;
  Products(
      {required this.price,
      required this.id,
      required this.label,
      required this.url});

  static Products fromJSON(dynamic map) {
    return Products(
        price: double.parse(map['price'].toString()),
        id: map['id'],
        label: map['title'],
        url: map['image']);
  }
}
