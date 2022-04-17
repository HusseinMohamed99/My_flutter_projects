import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/model/category_model.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/Screens/home/cubit/cubit.dart';
import 'package:flutter_projects/Screens/home/cubit/state.dart';



class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ListView.separated(
          itemBuilder: (context, index) => CatList(MainCubit.get(context).categoriesModel.data.data[index],context) ,
          separatorBuilder: (context , index) => myDivider(),
          itemCount: MainCubit.get(context).categoriesModel.data.data.length ,
        );
      },
    );

  }

  Widget CatList(DataModel model , context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Image(
          image: NetworkImage(model.image),
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width:20.0,
        ),
        Text(
          model.name,
          style:  Theme.of(context).textTheme.headline6,
        ),
        Spacer(),
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ],
    ),
  );
}