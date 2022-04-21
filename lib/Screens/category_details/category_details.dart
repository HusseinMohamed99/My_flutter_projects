import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/product_detalis/product_details.dart';
import 'package:flutter_projects/cubit/cubit.dart';
import 'package:flutter_projects/cubit/state.dart';
import 'package:flutter_projects/model/category/category_details_model.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/colors.dart';


class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;
  CategoryProductsScreen(this.categoryName);
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state)
      {
        if(state is ChangeFavoritesSuccessStates)
        {
          if(state.model.status)
          {
            ShowToast(
              text: state.model.message,
              state: ToastStates.SUCCESS,
            );
          }else{
            ShowToast(
              text: state.model.message,
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context,state){

        return Scaffold(
          body: state is CategoryDetailsLoadingStates ?
          Center(child: CircularProgressIndicator(),) :  MainCubit.get(context).categoriesDetailModel.data.productData.length == 0 ?
          Scaffold(body: Center(child: Text('Coming Soon',style: TextStyle(fontSize: 50),),)) :

            SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      GridView.count(
                        crossAxisCount: 1,
                        mainAxisSpacing: 0.1,
                        crossAxisSpacing: .1,
                        childAspectRatio: 1 / 1.1,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(
                            MainCubit.get(context).categoriesDetailModel.data.productData.length,
                                (index) => MainCubit.get(context).categoriesDetailModel.data.productData.length == 0 ?
                            Center(child: Text('Soon',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),) :
                            productItemBuilder(MainCubit.get(context).categoriesDetailModel.data.productData[index],context)
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

  Widget productItemBuilder (ProductData model,context) => InkWell(
    onTap: (){
      MainCubit.get(context).getProductData(model.id);
      navigateTo(context, ProductDetailsScreen());
    },
    child: Container(
          color: Colors.white,
          padding: EdgeInsetsDirectional.only(start: 8,bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Stack(
                  alignment:AlignmentDirectional.bottomEnd,
                  children:[
                    Image(
                      image: NetworkImage(
                          '${model.image}'
                      ),
                      height: 250,
                      width: double.infinity,),
                    if(model.discount != 0 )
                      Container(
                          color: DColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child:  Container(
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
                          )
                      ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CircleAvatar(
                        backgroundColor: MainCubit.get(context).favorites[model.id] ? Colors.red : Colors.grey[300],
                        child: IconButton(
                          onPressed: ()
                          {
                            MainCubit.get(context).changeFavorites(model.id);
                          },
                          icon: Icon(
                            Icons.star_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),

              Text('${model.name}',maxLines: 3, overflow: TextOverflow.ellipsis,),
             SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Text('${model.price}\ LE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,

                    ),),
                  SizedBox(width: 10,),
                  if(model.discount != 0 )
                  Text('${model.oldPrice}\ LE',
                    style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  ),
                 Spacer(),
                  Text('${model.discount}\ % OFF',style: TextStyle(color: Colors.red,fontSize: 11),)
                ],
              )
            ],
          ),

      ),
  );
  }

