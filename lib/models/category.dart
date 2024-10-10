class Category{

  final String title;
  final String image;


Category({required this.title,
required this.image});
}

final List<Category> categories =[
  Category(
    title: "Men",
    image: "assets/images/men.jpeg",
  ),
  Category(
    title: "Women",
    image: "assets/images/profile.jpeg",
  ),
  Category(
    title: "Toys",
    image: "assets/images/toys.jpeg",
  ),
  Category(
    title: "Cosmetics",
    image: "assets/images/lipstick.jpg",
  ),
  Category(
    title: "Electronics",
    image: "assets/images/elec.jpeg",
  ),


  
];