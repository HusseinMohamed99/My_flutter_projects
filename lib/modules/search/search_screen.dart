import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/shared/components/componentes.dart';
import 'package:flutter_projects/shared/cubit/states.dart';
import '../../shared/cubit/cubit.dart';




class SearchScreen extends StatelessWidget
{
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context, state) {} ,
      builder: (context,state)
      {
         var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(

                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value)
                  {
                    if (value.isEmpty)
                    {
                      return 'search must not be empty';
                    }return null ;
                  },
                  label: 'Search',
                  prefix: Icons.search,


                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true,),),

            ],

          ),


        );
      },

    );
  }
}
