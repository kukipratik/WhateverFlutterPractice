class Product {
// This class helps us to acess the specific attribute of the single specific product...

  final int id;
  final String name;
  final String description;
  final String img;
  final String price;

// this is a construtior....
  Product(this.id, this.name, this.description, this.img, this.price);
}

class ProductsInfo {
// This class helps us to acess the list containing product info (as a whole) as its element....

  static var imgUrl =
      "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-family-hero?wid=470&hei=556&fmt=png-alpha&.v=1631220221000";
  // Making the list of the product info...
  static final products = [
    // calling the constructor of the "Item" class...
    Product(
        1,
        "iphone 13 pro max",
        "iPhone 13 Pro and 13 Pro Max. Huge camera upgrades. New OLED display with ProMotion. Fastest smartphone chip ever. Breakthrough battery life.",
        imgUrl,
        "\$700")
  ];
}
