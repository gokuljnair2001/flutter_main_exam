import 'package:flutter/material.dart';
import 'package:flutter_main_exam/controller/product_screen_controller.dart';
import 'package:flutter_main_exam/view/Single_products_screen/Single_products_screen.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<ProductScreenController>().fetchData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prowatch = context.watch<ProductScreenController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "You & Me Shop",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.shop_sharp,
            color: Colors.black,
          )
        ],
      ),
      body: Builder(builder: (context) {
        if (prowatch.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: prowatch.productModel.length,
              itemBuilder: (context, index) {
                final product = prowatch.productModel[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleProductsScreen(
                            id: prowatch.productModel[index].id.toString(),
                          ),
                        ));
                  },
                  child: Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            prowatch.productModel[index].name.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            prowatch.productModel[index].data.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            prowatch.productModel[index].data.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: Text('Buy'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
