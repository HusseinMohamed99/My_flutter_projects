import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/Products_Home/product_Home.dart';
import 'package:flutter_projects/Screens/product_detalis/product_details.dart';
import 'package:flutter_projects/cubit/cubit.dart';
import 'package:flutter_projects/cubit/state.dart';
import 'package:flutter_projects/model/cart/get_cart_model.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';

class CartScreen extends StatelessWidget {
  TextEditingController counterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CartModel cartModel = MainCubit.get(context).cartModel;
        cartLength = MainCubit.get(context).cartModel.data.cartItems.length;
        return MainCubit.get(context).cartModel.data.cartItems.length == 0 ? Center(
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined,size: 70,color: Colors.greenAccent,),
                SizedBox(height: 10,),
                Text('Your Cart is empty',style: TextStyle(fontWeight: FontWeight.bold),),
                Text('Be Sure to fill your cart with something you like',style: TextStyle(fontSize: 15 ))
              ],
          ),
             )
            : Scaffold(
              body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount:cartLength,
                ),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children:
                    [
                      Row(
                        children: [
                          Text('Subtotal'+'($cartLength Items)',style: TextStyle(color: Colors.grey)),
                          Spacer(),
                          Text('EGP '+'${cartModel.data.subTotal}',style: TextStyle(color: Colors.grey))
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Text('Shipping Fee'),
                          Spacer(),
                          Text('Free',style: TextStyle(color: Colors.green),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text('TOTAL',style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(' Inclusive of VAT',style: TextStyle(fontSize: 10,color: Colors.grey,fontStyle: FontStyle.italic),),
                          Spacer(),
                          Text('EGP '+'${cartModel.data.total}',style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),

                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,),
          ]),

              ),
            );
      },
    );
  }

  Widget cartProducts(CartItems model, context,)
  {
    counterController.text = '${model.quantity}';
    return InkWell(
      onTap: () {
        MainCubit.get(context).getProductData(model.product.id);
        navigateTo(context, ProductDetailsScreen());
      },
      child: Container(
        height: 500,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Image(
              image: NetworkImage('${model.product.image}'),
              width: double.infinity,
              height: 250,
            ),
            Text(
              '${model.product.name}',
              style: TextStyle(
                fontSize: 15,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  'EGP ' + '${model.product.price}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                if (model.product.discount != 0)
                  Text(
                    'EGP' + '${model.product.oldPrice}',
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
                      int quantity = model.quantity - 1;
                      if (quantity != 0)
                        MainCubit.get(context).updateCartData(model.id,quantity);
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
                  '${model.quantity}',
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
                      int quantity = model.quantity + 1;
                      if (quantity <= 5)
                        MainCubit.get(context).updateCartData(model.id,quantity);
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
                    MainCubit.get(context).changeCart(model.product.id);
                    MainCubit.get(context).changeFavorites(model.product.id);
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
                    MainCubit.get(context).changeCart(model.product.id);
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
                      Text(
                          'Remove',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
