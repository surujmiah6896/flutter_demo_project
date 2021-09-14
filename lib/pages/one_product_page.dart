import 'package:flutter/material.dart';
import 'package:flutter_demo_project/Data/product_data.dart';
import 'package:auto_size_text/auto_size_text.dart';

class One_Product extends StatefulWidget {
  final Product product;

  One_Product({
    required this.product,
  });

  @override
  _One_ProductState createState() => _One_ProductState();
}

class _One_ProductState extends State<One_Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd0ebf7),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Product Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(widget.product.imageUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff76cfef),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: FittedBox(
                      child: Text(
                        widget.product.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Color(0xFF016626),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SingleChildScrollView(
                      child: AutoSizeText(
                        widget.product.price,
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,

                          color: Color(0xFF020000),
                        ),
                        minFontSize: 16,
                        maxFontSize: 30,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
