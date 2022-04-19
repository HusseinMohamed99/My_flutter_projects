import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/home/cubit/cubit.dart';
import 'package:flutter_projects/Screens/home/cubit/state.dart';
import 'package:flutter_projects/model/cart_model.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';

class CartScreen extends StatelessWidget {
  var counterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CartModel cartModel = MainCubit.get(context).cartModel;
        return MainCubit.get(context).cartModel.data.cartItems.length == 0
            ? Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 70,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your Cart is empty',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text('Be Sure to fill your cart with something you like',
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
              )
            :  Scaffold(
                appBar: AppBar(),
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => cartProducts(
                              MainCubit.get(context)
                                  .cartModel
                                  .data
                                  .cartItems[index],
                              context,
                              index,
                            ),
                            separatorBuilder: (context, index) => myDivider(),
                            itemCount: MainCubit.get(context)
                                .cartModel
                                .data
                                .cartItems
                                .length),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Total Price :',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  Spacer(),
                                  Text('EGP ' + '${cartModel.data.subTotal}',
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),



            );
      },
    );
  }

  Widget cartProducts(CartItems models, index, context) {
    counterController.text = '${models.quantity}';
    return InkWell(
      onTap: () {
        MainCubit.get(context).getProductData(models.product.id);
      },
      child: Container(
        height: 500,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Image(
              image: NetworkImage('${models.product.image}'),
              width: double.infinity,
              height: 250,
            ),
            Text(
              '${models.product.name}',
              style: TextStyle(
                fontSize: 15,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  'EGP ' + '${models.product.price}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                if (models.product.discount != 0)
                  Text(
                    'EGP' + '${models.product.oldPrice}',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: MaterialButton(
                    onPressed: () {
                      int quantity = models.quantity - 1;
                      if (quantity != 0)
                        MainCubit.get(context).updateCart(models.id, quantity);
                    },
                    child: Icon(
                      Icons.remove,
                      size: 17,
                      color: Colors.deepOrange,
                    ),
                    minWidth: 20,
                    //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${models.quantity}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 20,
                  height: 20,
                  child: MaterialButton(
                    onPressed: () {
                      int quantity = models.quantity + 1;
                      if (quantity <= 5)
                        MainCubit.get(context).updateCart(models.id, quantity);
                    },
                    child: Icon(
                      Icons.add,
                      size: 17,
                      color: Colors.green[500],
                    ),
                    minWidth: 10,
                    //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.zero,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    MainCubit.get(context).ChangeCart(models.product.id);
                    MainCubit.get(context).ChangeFavorites(models.product.id);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(
                        width: 2.5,
                      ),
                      Text(
                        'Move to Wishlist',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 20,
                  width: 1,
                  color: Colors.grey[300],
                ),
                TextButton(
                    onPressed: () {
                      MainCubit.get(context).ChangeCart(models.product.id);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        SizedBox(
                          width: 2.5,
                        ),
                        Text('Remove',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            )),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}


