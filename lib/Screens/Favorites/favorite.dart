import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/cubit/cubit.dart';
import 'package:flutter_projects/shared/cubit/state.dart';
import 'package:flutter_projects/shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: state is! FavoritesLoadingStates,
          builder:(context)=> ListView.separated(
            itemBuilder: (context, index) => BuildListProduct(MainCubit.get(context).favoritesModel.data.data[index].product,context) ,
            separatorBuilder: (context , index) => myDivider(),
            itemCount: MainCubit.get(context).favoritesModel.data.data.length ,
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),

        );
      },
    );
  }
  Widget BuildListProduct ( model , context , {isOldPrice = true,})=>  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        children:
        [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Image(
                image: NetworkImage (model.image,),
                width: 120.0,
                height: 120.0,
              ),
              if(model.discount !=0 && isOldPrice)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0,),
                  color: Colors.red,
                  child: Text(
                    'OFFERS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
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
                Text(
                  model.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(height: 1.5),
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
                    if(model.discount != 0 && isOldPrice)
                      Text(
                        '${model.oldPrice.round()}',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: MainCubit.get(context).favorites[model.id] ? Colors.red : Colors.grey[300],
                      child: IconButton(
                        onPressed: ()
                        {
                          MainCubit.get(context).ChangeFavorites(model.id);
                        },
                        icon: Icon(
                          Icons.star_border,
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

