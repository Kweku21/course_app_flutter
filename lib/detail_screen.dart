import 'package:course_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white30,
          image: DecorationImage(
            image: AssetImage("assets/images/ux_big.png"),
            alignment: Alignment.topRight
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 70, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/icons/arrow-left.svg"),
                  SvgPicture.asset("assets/icons/more-vertical.svg"),
                ],
              ),

              SizedBox(height: 30,),
              ClipPath(
                clipper: BestSellerClipper(),
                child: Container(
                  color: kBestSellerColor,
                  padding: EdgeInsets.only(left: 10,top: 5, right: 20, bottom: 5),
                  child: Text(
                    "Best Seller".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16,),

              Text(
                "Design Thinking",
                style: kHeadingextStyle,
              ),
              SizedBox(height: 16,),
              
              Row(
                children: [
                  SvgPicture.asset("assets/icons/person.svg"),
                  SizedBox(width: 5,),
                  Text(
                    "18k"
                  ),
                  SizedBox(width: 20,),
                  SvgPicture.asset("assets/icons/star.svg"),
                  SizedBox(width: 5,),
                  Text("4.6")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
   var path = Path();

   path.lineTo(size.width - 20, 0);
   path.lineTo(size.width , size.height/2);
   path.lineTo(size.width - 20 , size.height);
   path.lineTo(0 , size.height);
   path.lineTo(0 , 0);
   path.close();

   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {

    return false;
  }
}
