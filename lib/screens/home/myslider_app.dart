import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MysliderApp());
}

class MysliderApp extends StatelessWidget {
  const MysliderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ImageSlider();
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  final List<String> imgList = [
    'assets/images/bridal-ad-banner.jpg',
    'assets/images/hair-cut-ad-banner.jpg',
    'assets/images/product-ad-banner.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index, realIdx) {
          return GestureDetector(
            onTap: () {
              // ignore: avoid_print
              print("Tapped on image $index");
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ColorFiltered(
                colorFilter: _currentIndex == index
                    ? const ColorFilter.mode(
                        Colors.transparent, BlendMode.multiply)
                    : const ColorFilter.mode(
                        Colors.grey, BlendMode.saturation),
                child: Image.asset(
                  imgList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 150.0, 
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.7,
          aspectRatio: 9/ 4,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
  }

