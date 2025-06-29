import 'package:flutter/material.dart';
import 'package:provider_data_transfer/utils/app_assets.dart';
import 'package:provider_data_transfer/utils/app_colors.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class ProductDetailScreen extends StatelessWidget{
  final Map<String,dynamic> productList;
  const ProductDetailScreen({super.key, required this.productList});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        title: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(child: Image.asset(AppAssets.userImage)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.helloText,
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        AppStrings.userName,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
      ),
      body:Center(
        child: Text("Detail Product Screen $productList"),
      )
    );
  }
}