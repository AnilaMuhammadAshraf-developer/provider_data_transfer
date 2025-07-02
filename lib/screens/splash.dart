import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_data_transfer/screens/product.dart';
import 'package:provider_data_transfer/utils/app_colors.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 0.8;
  double _opacity = 0.0;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBlueColor,
      body:AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: AnimatedScale(
            scale: _scale,
            duration: Duration(seconds: 2),
           child:Center(
            child:Container(
              width: 200,
              height:200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.appWhiteColor
              ),
             child:Center(child:Text(AppStrings.appTitle,style: TextStyle(color:AppColors.appBlueColor,fontSize: 30),))
            ), ),
          ),
          
        
      ),
    );
  }
}
