import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:provider_data_transfer/constants/product_data.dart';
import 'package:provider_data_transfer/providers/product_provider.dart';
import 'package:provider_data_transfer/utils/app_assets.dart';
import 'package:provider_data_transfer/utils/app_colors.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context,listen: false);
    print("rebuild check k kitni bar rebuild hota h .");
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
      body: Expanded(child: 
      Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:AppColors.appMainColor
        ),
      child:Column(
        children: [
          SizedBox(height:10),
          Form(
            child:Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        
                  decoration: InputDecoration(
                    fillColor: AppColors.appWhiteColor,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    hintText:AppStrings.searchProducts,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7)
                    )
                  ),
                      ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:AppColors.appBlueColor,
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Icon(Icons.tune,color: AppColors.appWhiteColor,),
                  ),
                )
                  ],
                )
               
              ],
            )
          ),
          SizedBox(height:20),
         Consumer<ProductProvider>(builder: (context,provider,child){ 
          return SizedBox(
           
            height: 50,
           
            child: ListView.builder(
              scrollDirection:Axis.horizontal,
            itemCount: ProductData.choiceList.length,
            itemBuilder:(context,index){
              var item=ProductData.choiceList;

               final isSelected = index==productProvider.selectedIndex;
              return GestureDetector(
                onTap: ()=>productProvider.onSelection(index),
               child:Container(
              
                margin: EdgeInsets.symmetric(horizontal: 6),
                 width: 100,
                 decoration: BoxDecoration(
                  color:isSelected ? AppColors.appBlueColor :AppColors.appWhiteColor,
                  borderRadius: BorderRadius.circular(10)
                 ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item[index]['icon'], color:isSelected ? AppColors.appWhiteColor : AppColors.appBlueColor),
                  SizedBox(width: 5,),
                  Text(item[index]['title'],style: TextStyle(color:isSelected ? AppColors.appWhiteColor : AppColors.appBlueColor),)
                ],
              )
               ),
              );
              
            }
          ),
          );
         
         }),
          
        ],
      )),)
    );
  }
}
