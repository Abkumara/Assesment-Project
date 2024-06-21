import 'package:assesmnet_project/Model/productmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.snapshot, required this.index});
  final AsyncSnapshot<List<ProductModel>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    var product = snapshot.data![index];
    var dummyImage = 'https://dummyimage.com/700x500/ff6600/fff';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            CarouselSlider.builder(
              itemCount: product.images.length,
              itemBuilder: (context, imgIndex, realIndex) {
                (product.images[imgIndex].isNotEmpty)
                    ? product.images[imgIndex]
                    : dummyImage;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(
                      product.images[imgIndex],
                      fit: BoxFit.cover,
                      width: 1000.0,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          dummyImage,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        );
                      },
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 2),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating: ${product.rating}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Price: \$${product.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
