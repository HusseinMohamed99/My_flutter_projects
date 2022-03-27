import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/cubit/cubit.dart';
import 'package:flutter_projects/home/cubit/state.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';


class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: state is! FavoritesLoadingStates,
          builder:(context)=> ListView.separated(
            itemBuilder: (context, index) => BuildListProduct(HomeCubit.get(context).favoritesModel.data.data[index].product,context) ,
            separatorBuilder: (context , index) => myDivider(),
            itemCount: HomeCubit.get(context).favoritesModel.data.data.length ,
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),

        );
      },
    );
  }

}
