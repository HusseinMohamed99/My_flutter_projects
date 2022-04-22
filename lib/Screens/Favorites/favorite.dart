import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/cubit/cubit.dart';
import 'package:flutter_projects/cubit/state.dart';

import 'package:flutter_projects/model/favorite/favorite_model.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/colors.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        FavoritesModel favoritesModel = MainCubit.get(context).favoritesModel;
        return MainCubit.get(context).favoritesModel.data.data.length == 0
            ? Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 70,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your Favorites is empty',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'Be sure to fill your favorite with something you like',
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
              )
            : Scaffold(
                body: ConditionalBuilder(
                  condition: state is! FavoritesLoadingStates,
                  builder: (context) => ListView.separated(
                    itemBuilder: (context, index) => BuildListProduct(
                        MainCubit.get(context)
                            .favoritesModel
                            .data
                            .data[index]
                            .product,
                        context),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount:
                        MainCubit.get(context).favoritesModel.data.data.length,
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              );
      },
    );
  }

  Widget BuildListProduct(
    model,
    context, {
    isOldPrice = true,
  }) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 400.0,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image(
                    image: NetworkImage(
                      model.image,
                    ),
                    height: 250.0,
                    width: double.infinity,
                  ),
                  if (model.discount != 0 && isOldPrice)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      color: Colors.red,
                      child: Text(
                        'OFFERS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: MainCubit.get(context).cart[model.id]
                          ? Colors.deepOrangeAccent
                          : Colors.grey[300],
                      child: IconButton(
                        onPressed: (){
                          MainCubit.get(context).changeCart(model.id);

                        },
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        model.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(height: 1.5),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.price.round()}',
                          style: TextStyle(
                            color: DColor,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        if (model.discount != 0 && isOldPrice)
                          Text(
                            '${model.oldPrice.round()}',
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor:
                              MainCubit.get(context).favorites[model.id]
                                  ? Colors.deepOrangeAccent
                                  : Colors.grey[300],
                          child: IconButton(
                            onPressed: () {
                              MainCubit.get(context).changeFavorites(model.id);
                            },
                            icon: Icon(
                              IconBroken.Delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
