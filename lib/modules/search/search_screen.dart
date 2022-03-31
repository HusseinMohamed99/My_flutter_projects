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
                child: Card(
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator: (String value)
                    {
                      if (value.isEmpty)
                      {
                        return 'search must not be empty';
                      }return null ;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                          Icons.search,
                        color: Colors.grey,
                      ),
                      label: Text(
                        'Search',
                      ),
                    ),



                  ),
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
