import 'package:add_cart_app/models/category.dart';
import 'package:add_cart_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:add_cart_app/screens/home/app_bar.dart'; 
import 'package:add_cart_app/screens/home/myslider_app.dart';
import 'package:add_cart_app/screens/home/search_bar.dart';

import 'product_detail_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "Men"; 
  List<Products> filteredProducts = []; 
  String searchQuery = ''; 

  @override
  void initState() {
    super.initState();
    filteredProducts = products; 
  }

  void _filterProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredProducts = products; 
      });
    } else {
      setState(() {
        filteredProducts = products.where((product) {
         
          return product.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
   
    List<Products> displayedProducts = filteredProducts
        .where((product) => product.category.toLowerCase() == selectedCategory.toLowerCase())
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),  
        child: MyAppBar(), 
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MySearchBar(onSearch: _filterProducts), 
          const SizedBox(height: 5),
          const MysliderApp(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 225, 28, 110),
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
       
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
                      searchQuery = ''; 
                      filteredProducts = products; 
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
                                ? Colors.blue  
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
            child: displayedProducts.isEmpty
                ? const Center(child: Text('No products found'))
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: displayedProducts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                         
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(product: displayedProducts[index]),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                displayedProducts[index].image1,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                displayedProducts[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '\$${displayedProducts[index].price}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],

                          ),
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
