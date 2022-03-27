import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/cubit/cubit.dart';
import 'package:flutter_projects/home/cubit/state.dart';
import 'package:flutter_projects/models/categories.dart';
import 'package:flutter_projects/models/home.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/colors.dart';


class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
           listener: (context,state)
           {
              if(state is ChangeFavoritesSuccessStates)
              {
                if(!state.model.status)
                {
                  ShowToast(
                      text: state.model.message,
                      state: ToastStates.ERROR,
                  );
                }
              }
           },
           builder: (context,state)
           {
             return ConditionalBuilder(
                 condition: HomeCubit.get(context).homeModel != null &&  HomeCubit.get(context).categoriesModel != null,
                 builder:(context)=> productsBuilder(HomeCubit.get(context).homeModel,HomeCubit.get(context).categoriesModel,context),
               fallback: (context)=> Center(child: CircularProgressIndicator()),
             );
             },
    );
  }


  Widget productsBuilder (HomeModel model , CategoriesModel categoriesModel , context)=> SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        CarouselSlider(
            items: model.data.banners.map((e) => Image(
                image: NetworkImage('${e.image}'),
                width: double.infinity,
                fit: BoxFit.cover,
            ),
            ).toList(),
            options: CarouselOptions(
              height: 250.0,
              enableInfiniteScroll: true,
              reverse: false,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1.0,
              enlargeCenterPage: false,

            ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=> CategoriesItem(categoriesModel.data.data[index],context),
                  separatorBuilder: (context,index)=> SizedBox(width: 10.0,),
                    itemCount: categoriesModel.data.data.length,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'New Products',
                style:  Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 20.0,
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 2,
                children: List.generate(model.data.products.length, (index) => GridProducts(model.data.products[index],context), ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget CategoriesItem (DataModel model , context) => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(model.image),
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        color: Colors.black.withOpacity(0.5),
        width: 100.0,
        child: Text(
          model.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,


          ),
        ),
      ),
    ],
  );

  Widget GridProducts (Products model , context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Image(
            image: NetworkImage (model.image,),
            width: double.infinity ,
            height: 200.0,
          ),
          if(model.discount !=0)
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
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(height: 1.5),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  '${model.price.round()}',
                  style: TextStyle(
                      color: defaultColor,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                if(model.discount != 0)
                Text(
                  '${model.oldPrice.round()}',
                  style: TextStyle(
                      color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: HomeCubit.get(context).favorites[model.id] ? Colors.red : Colors.grey[300],
                  child: IconButton(
                    onPressed: ()
                    {
                      HomeCubit.get(context).ChangeFavorites(model.id);
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
  );
}
