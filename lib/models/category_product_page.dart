import 'package:flutter/material.dart';
import 'category.dart'; 
import 'products_model.dart'; 
class CategoryProductPage extends StatefulWidget {
  const CategoryProductPage({super.key});

  @override
  CategoryProductPageState createState() => CategoryProductPageState();
  
}

class CategoryProductPageState extends State<CategoryProductPage> {
  String selectedCategory = "Men"; 

  @override
  Widget build(BuildContext context) {
   
    List<Products> filteredProducts = products
        .where((product) => product.category.toLowerCase() == selectedCategory.toLowerCase())
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Products'),
      ),
      body: Column(
        children: [
        
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index].title; 
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(categories[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          categories[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: categories[index].title == selectedCategory
                                ? const Color.fromARGB(255, 187, 57, 137) 
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(child: Text('No products found'))
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Image.asset(
                              filteredProducts[index].image1,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              filteredProducts[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '\$${filteredProducts[index].price}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
