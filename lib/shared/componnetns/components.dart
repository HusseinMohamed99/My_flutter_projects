import 'package:flutter/material.dart';
import 'package:flutter_projects/home/cubit/cubit.dart';
import 'package:flutter_projects/modules/on_boarding/on_boardingScreen.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';
import 'package:flutter_projects/shared/styles/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';



Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  @required Function function,
  @required String text,
  Function onTap,
}) =>     Container(

  width: width,
  height: 50.0,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: background,
  ),
);


Widget defaultTextButton({
  @required Function function,
  @required String text,
}) => TextButton(
  onPressed: function,
  child: Text(text.toUpperCase()),
);

Widget defaultTextFormField({

@required TextEditingController controller,
@required TextInputType type,
Function onSubmit,
Function onChange,
Function onTap,
@required  Function  validate,
@required String label,
@required IconData prefix,
bool isPassword = false,
bool isClickable = true,
  IconData  suffix,
  Function suffixPressed,
  InputDecoration decoration ,

}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  enabled: isClickable,
  onTap: onTap,
  validator:validate,
  decoration: InputDecoration(

    labelText : label ,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,
      ),
    ) : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
          10.0,
      ),
    ),
  ),

);

Widget myDivider () => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

void navigateTo(context,Widget)=>  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Widget,
  ),
);

void navigateAndFinish(context,Widget)=>  Navigator.pushAndRemoveUntil(

    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
        (route)
    {
      return false;
    }
);

void logOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigateAndFinish(context, onBoardingScreen());
    }
  });
}



void ShowToast ({
  @required String text,
  @required ToastStates state,
})=>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 10,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum  كذا اختيار من حاجة

enum ToastStates {SUCCESS , ERROR , WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch (state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERROR:
      color = Colors.red;
      break;

    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
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
                      color: defaultColor,
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
    ),
  ),
);








