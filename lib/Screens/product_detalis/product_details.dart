import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/home/cubit/cubit.dart';
import 'package:flutter_projects/Screens/home/cubit/state.dart';
import 'package:flutter_projects/model/cart_model.dart';
import 'package:flutter_projects/model/product_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  dynamic id;

  ProductDetailsScreen(this.id);

  var SmoothController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            MainCubit.get(context)..getProductData(id.toString()),
        child: BlocConsumer<MainCubit, MainStates>(
            builder: (context, state) => Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.deepPurple),
                  ),
                  body: state is ProductLoadingState
                      ? Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: LinearProgressIndicator(
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        )
                      : Scaffold(
                        body: bodyBuild(
                            context,
                            MainCubit.get(context).productDetailsModel,
                            SmoothController,
                            MainCubit.get(context).cartModel,
                            MainCubit.get(context).cart,
                            id),
                      ),
                ),
            listener: (context, state) {
              if (state is GetCartSuccessStates) {
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.cart.message.toString()),backgroundColor: Colors.green,duration: Duration(milliseconds: 350),));
              }
            }));
  }
}

Widget bodyBuild(context, ProductDetailsModel model, SmoothController,
    CartModel cartModel, cart, id) {
  List<Widget> images = [];
  model.data.images.forEach((element) {
    images.add(Container(
      child: Image.network(element, fit: BoxFit.contain),
    ));
  });
  return MainCubit.get(context).productDetailsModel == null
      ? Center(child: CircularProgressIndicator())
      : Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Text(
                  model.data.name,
                  style: TextStyle(fontSize: 25),
                ),
                CarouselSlider(
                    items: images,
                    options: CarouselOptions(
                        height: 300,
                        onPageChanged: (x, reason) {
                          MainCubit.get(context).changeVal(x);
                        })),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: AnimatedSmoothIndicator(
                        activeIndex: MainCubit.get(context).value,
                        count: images.length),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "${model.data.price.toString()} EGP",
                      style: TextStyle(
                          fontSize: 20, color: Colors.deepPurpleAccent),
                    ),
                    Spacer(),
                    CircleAvatar(
                      child: IconButton(
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          MainCubit.get(context).ChangeCart(model.data.id);
                        },
                      ),
                      backgroundColor: (MainCubit.get(context).cart[id] ?? true)
                          ? Colors.deepOrangeAccent
                          : Colors.grey[200],
                      minRadius: 26,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Divider(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                    endIndent: 10,
                    indent: 10,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(model.data.description)
              ],
            ),
          ),
        );
}
