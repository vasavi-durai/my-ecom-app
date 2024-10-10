class Products {
  final String title;
  final String description;
  final String image1;
  final String price;
  final String category;

  Products({
    required this.title,
    required this.description,
    required this.image1,
    required this.price,
    required this.category,
  });
}

final List<Products> products = [
  Products(
    title: "Men's Tshirt",
    description:
        "Comfortable cotton T-shirt perfect for casual wear.",
    image1: "assets/images/men-tshirt.jpeg",
    price: "559",
    category: "Men",
  ),
  Products(
    title: "Crop Top",
    description:
        "Elegant and stylish dress for women.",
    image1: "assets/images/croptop.jpg",
    price: "300",
    category: "Women",
  ),
  Products(
    title: "Western Saree",
    description:
        "Elegant and stylish dress for women.",
    image1: "assets/images/saree.jpg",
    price: "300",
    category: "Women",
  ),
  Products(
    title: "Toy Car",
    description:
        "Fun and exciting toy car for kids.",
    image1: "assets/images/acid.jpg",
    price: "200",
    category: "Toys",
  ),
  Products(
    title: "Jeans",
    description:
        "Comfortable and durable jeans for men.",
    image1: "assets/images/jeans.jpg",
    price: "900",
    category: "Men",
  ),
  Products(
    title: "Olay Moisturizer",
    description:
        "Hydrating and revitalizing moisturizer.",
    image1: "assets/images/olay.jpg",
    price: "349",
    category: "Cosmetics",
  ),
  Products(
    title: "Hair Straightener",
    description:
        "Straighten and style your hair effortlessly.",
    image1: "assets/images/hairstraight.jpg",
    price: "999",
    category: "Electronics",
  ),
  Products(
    title: "Hair Dryer",
    description:
        "Dry your hair quickly and efficiently.",
    image1: "assets/images/hairdryer.jpg",
    price: "655",
    category: "Electronics",
  ),
];
