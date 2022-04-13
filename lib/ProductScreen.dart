import 'package:flutter/material.dart';
import 'package:flutter_projects/Services/Get_Products.dart';
import 'package:flutter_projects/UpdateProductScreen.dart';
import 'package:flutter_projects/model/product_Model.dart';
import 'package:flutter_projects/shared/style/icon_broken.dart';

ProductModel product;

class ProductScreen extends StatelessWidget {
  static String id = 'HomePAge';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            MyDrawerHeader(),
            MenuItem(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: Text(
          'Store App',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconBroken.Search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(IconBroken.Notification),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 65,
          left: 16,
          right: 16,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data;
              return GridView.builder(
                  clipBehavior: Clip.none,
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return Grid_Product(product: products[index]);
                  });
            }
              return Center(
                child: CircularProgressIndicator(),
              );

          },
        ),
      ),
    );
  }

  Widget MenuItem() => Column(
        children: [
          Text(
            'Category',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              backgroundColor: Colors.teal,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image(
                image: AssetImage(
                  'assets/images/clothes.png',
                ),
              ),
              title: Text(
                'Electronics',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image(
                image: AssetImage(
                  'assets/images/clothes.png',
                ),
              ),
              title: Text(
                'Jewelery',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image(
                image: AssetImage(
                  'assets/images/clothes.png',
                ),
              ),
              title: Text(
                'men\'s clothing',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image(
                image: AssetImage(
                  'assets/images/clothes.png',
                ),
              ),
              title: Text(
                'women\'s clothing',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      );
}

class MyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.teal,
        image: DecorationImage(
            image: AssetImage(
              'assets/images/clothes.png',
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}


class Grid_Product extends StatelessWidget {
  ProductModel product;
  Grid_Product({this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments: product);

      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  spreadRadius: 20,
                  offset: Offset(1, 1),
                  color: Colors.grey.withOpacity(0.1),
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.none,
              elevation: 10,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     product.title.substring(0,9),
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            left: 65,
            child: Image(
              image: NetworkImage(
                product.image,
              ),
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
