import 'dart:convert';

class ProductsInfo {
// This class helps us to acess the list containing product info (as a whole) as its element....

// Making the list of the product info...
  static List<Product> products = [];

//this will return us the element of products list using their id...
 static Product getById(int id) =>
      (products.firstWhere((product) => product.id == id /*, orElse:*/));

// this will return the element of products list using index...
 static  Product getByIndex(int index) => (products[index]);
}

class Product {
// This class helps us to acess the specific attribute of the single specific product...

  int? id;
  String? name;
  String? desc;
  int? price;
  String? color;
  String? image;
  Product({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
  });

// these are created by extension "Dart data class generator" for perfection....
  Product copyWith({
    int? id,
    String? name,
    String? desc,
    int? price,
    String? color,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt(),
      name: map['name'],
      desc: map['desc'],
      price: map['price']?.toInt(),
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
