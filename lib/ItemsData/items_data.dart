class Product {
// This class helps us to acess the specific attribute of the single specific product...

  final int id;
  final String name;
  final String desc;
  final String price;
  final String color;
  final String image;

// this is a construtior....
  Product(this.id, this.name, this.desc, this.price, this.color, this.image);

// this is self made constructor...
  factory Product.formMap(Map<String, dynamic> map) {
    return Product(map["id"], map["name"], map["desc"], map["price"],
        map["color"], map["image"]);
  }
}

class ProductsInfo {
// This class helps us to acess the list containing product info (as a whole) as its element....

  // Making the list of the product info...
  static List<Product> products = [];
}
