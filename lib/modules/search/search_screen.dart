import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/modules/search/cubit/cubit.dart';
import 'package:flutter_projects/modules/search/cubit/state.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';

class SearchScreen extends StatelessWidget {

  var formkey = GlobalKey<FormState>();
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> SearchCubit(),
      child:BlocConsumer<SearchCubit,SearchStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          return  Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                    defaultTextFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        validate: (String value)
                        {
                          if(value.isEmpty)
                          {
                            return 'Enter Text to get Search';
                          }return null;
                        },
                      onSubmit: (String text)
                      {
                        SearchCubit.get(context).Search(text);
                      },
                        label: 'Search',
                        prefix: Icons.search,
                    ),
                    SizedBox(
                    height: 20.0,
                  ),
                    if(state is SearchLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    if(state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => BuildListProduct(SearchCubit.get(context).searchModel.data.data[index],context,isOldPrice: false) ,
                        separatorBuilder: (context , index) => myDivider(),
                        itemCount: SearchCubit.get(context).searchModel.data.data.length ,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
