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
      backgroundColor: AppColors.appMainColor,
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
    
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
      ),
      body:Expanded(child:Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              decoration: BoxDecoration(
                color:AppColors.appGreenColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child:Center(child:Image.asset(productList['image'])),
             ),
             SizedBox(height:20),
             Row(
              children: [
                   Text(productList['title'],style: TextStyle(fontSize:16,fontWeight: FontWeight.bold), maxLines: 2,          // Allow 2 lines max
      overflow: TextOverflow.ellipsis),
                   Spacer(),
                  Padding(padding: EdgeInsets.only(right:10),
                  child:Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < 4 ? Icons.star : Icons.star_border,
                    color: AppColors.appBlueColor,
                  );
                }),
              )
                  )
                   
              ],
             ),
             SizedBox(height:20),
             Divider(thickness: 3,),
             Text(AppStrings.description,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
             SizedBox(height:10),
               Text(productList['description'],style: TextStyle(fontSize:13,color:AppColors.appGreyColor),),
          ],
        
      )))
     
    );
  }
}