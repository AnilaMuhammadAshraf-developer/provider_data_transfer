import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_data_transfer/providers/product_provider.dart';
import 'package:provider_data_transfer/utils/app_assets.dart';
import 'package:provider_data_transfer/utils/app_colors.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> productList;
 
  const ProductDetailScreen({super.key, required this.productList});
  @override
  Widget build(BuildContext context) {
     
     final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,

        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
      ),
      body: Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.appGreenColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Image.asset(productList['image'],height: 200,)),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  
                    Expanded(
                 child: Text(
                    productList['title'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 5, 
                  
                  ),
                    ),
                 
                  Align(
                   alignment: Alignment.topLeft,
                    child: Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: AppColors.appBlueColor,
                        );
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(thickness: 3),
              Text(
                AppStrings.description,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                productList['description'],
                style: TextStyle(fontSize: 13, color: AppColors.appGreyColor),
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom:10),
             
                height:100,
                decoration: BoxDecoration(
                  color:AppColors.appBlueColor,
                  borderRadius: BorderRadius.circular(30)
                ),
                child:Row(
                  
                  children: [
                    SizedBox(width: 20,),
                   Text("\$${productList['price'].toString()}",style: TextStyle(color:AppColors.appWhiteColor,fontWeight: FontWeight.bold,fontSize: 22),),
               SizedBox(width:30),
                   Flexible(child:Container(
                width:130,
                
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:AppColors.appWhiteColor
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    
                      children: [
                         IconButton(onPressed:productProvider.decrementCount, icon:Icon(Icons.remove,color: AppColors.appWhiteColor,)),
                       
                        Consumer<ProductProvider>(builder: (BuildContext context, value, Widget? child) {
                          return  Text(
                        "${productProvider.cartCount.toString()}",style: TextStyle(color:AppColors.appWhiteColor),
                        );
                          },),
                        IconButton(onPressed:productProvider.incrementCount, icon:Icon(Icons.add,color: AppColors.appWhiteColor,)),
                       
                      ],
                    ) ,
                   )),
                   SizedBox(width:20),
                 Container(
                    
                       width: 70,
                       height:30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:AppColors.appWhiteColor
                      ),
                      child:Center(child:Text(AppStrings.cartBtn,style: TextStyle(color: AppColors.appBlueColor,fontWeight: FontWeight.bold),)),
                    )
             
                    
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
