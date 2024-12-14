import 'package:flutter/material.dart';
import 'package:flutter_main_exam/controller/product_screen_controller.dart';
import 'package:provider/provider.dart';

class SingleProductsScreen extends StatefulWidget {
  const SingleProductsScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<SingleProductsScreen> createState() => _SingleProductsScreenState();
}

class _SingleProductsScreenState extends State<SingleProductsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<ProductScreenController>().getProductDetails(widget.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final proWatch = context.watch<ProductScreenController>();

    if (proWatch.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Product Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (proWatch.selectedProduct == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Product Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text(
            "Product details not found.",
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                proWatch.selectedProduct!.name.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Color: ${proWatch.selectedProduct!.data.toString()}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
