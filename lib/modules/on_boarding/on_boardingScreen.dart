import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/modules/login/login_screen.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel ({
    @required this.image,
    @required this.title,
    @required this.body,
  });

}

class onBoardingScreen extends StatefulWidget {

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var pageController = PageController();


  List <BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/on_boarding1.png',
      title: 'You aren\'t alone in this',
      body: 'We are here for you ',
    ),
    BoardingModel(
      image: 'assets/images/Olline.png',
      title: 'You aren\'t alone in this',
      body: 'We are here for you ',
    ),
    BoardingModel(
      image: 'assets/images/shop2.png',
      title: 'You aren\'t alone in this',
      body: 'We are here for you ',
    ),
  ];
  bool isLast = false;

  void submit(){
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value)
    {
      if(value)
      {
        navigateAndFinish(context, LoginScreen(),);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          defaultTextButton(
              function:submit,
              text:'Skip',
          ),
        ],
      ),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Expanded(
             child: PageView.builder(
               physics: BouncingScrollPhysics(),
               onPageChanged: (int index)
               {
                 if (index == boarding.length - 1 )
                 {
                   setState(() {
                     isLast = true;
                   });
                 }else setState(() {
                   isLast = false;
                 });
               },
               controller: pageController,
               itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
               itemCount: boarding.length,
             ),
           ),
           SizedBox(
             height: 50.0,
           ),
           Row(
             children: [
               SmoothPageIndicator(
                   controller: pageController,
                   count: boarding.length,
                   effect: ExpandingDotsEffect(
                     dotWidth: 10.0,
                     dotHeight: 10.0,
                     dotColor: Colors.grey,
                     activeDotColor: Colors.blue,
                     radius: 20.0,
                     spacing: 6,
                     expansionFactor: 4.0,
                   ),
               ),
               Spacer(),
               FloatingActionButton(
                 child: Icon(
                   Icons.play_arrow_outlined,
                   size: 35.0,
                 ),
                 onPressed: ()
                 {
                   if (isLast)
                   {
                     submit();
                   }else
                   {
                     pageController.nextPage(
                       duration: Duration(
                         milliseconds: 780,
                       ),
                       curve: Curves.bounceInOut,
                     );
                   }
                 },
               ),
             ],
           ),
         ],
       ),
     ),



    );
  }
           
  Widget buildBoardingItem(BoardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(
              '${model.image}',

          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${model.title}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  );
}
