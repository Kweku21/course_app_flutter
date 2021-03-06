import 'package:course_app/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'detail_screen.dart';
import 'model/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(

      ),
      home:DetailScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 70,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/menu.svg"),
                Image.asset("assets/images/user.png")

              ],
            ),
            SizedBox(height: 30,),

            Text(
              "Hey Alex,",
              style: kHeadingextStyle,
            ),
            Text(
              "Find a course you want to learn",
              style: kSubheadingextStyle,
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/search.svg"),
                  Text(
                      "Search for anything",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54
                    ),
                  )
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: kTitleTextStyle,
                ),
                Text(
                  "See All",
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor)
                  ,)
              ],
            ),
            SizedBox(height: 10,),

            Expanded(
                child: StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(0),
                  crossAxisCount: 2,
                  itemCount: categories.length,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kBlueColor,
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories[index].name,
                            style:kTitleTextStyle ,
                          ),

                          Text(
                            '${categories[index].numberOfCourse} Courses',
                            style: TextStyle(
                              color: kTextColor.withOpacity(0.5)
                            ),
                          )
                        ],
                      ),
                  );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),

                  )
            )
          ],
        ),
      ),
    );
  }
}
