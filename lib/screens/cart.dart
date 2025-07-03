import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_data_transfer/providers/cart_provider.dart';
import 'package:provider_data_transfer/providers/product_provider.dart';
import 'package:provider_data_transfer/utils/app_colors.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context){
    final cartProvider = Provider.of<CartProvider>(
      context,
      listen: false,
    );
    return Scaffold(
       backgroundColor: AppColors.appWhiteColor,
      appBar: AppBar(
        centerTitle:true,
        backgroundColor: AppColors.appMainColor,
     title:Text(AppStrings.myCart,style: TextStyle(fontWeight: FontWeight.bold),) ,
        actions: [
          Padding(padding: EdgeInsets.only(right:30),
          child: Text("(${AppStrings.remove} ${cartProvider.cartList.length})",style: TextStyle(color: AppColors.appRedColor,fontWeight: FontWeight.bold),),
          ),
          
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
                ...List.generate(cartProvider.cartList.length, (index){
                  var item=cartProvider.cartList[index];
                  return Column(
                    children: [
                      Padding(padding: EdgeInsets.only(left:20,right: 20,top:10),
                      child:  cartContainer(context,item),
                      ),
                          
                    
                    ],
                  );
                 
                })
            ],
          ),
        
      ),
    );

    
  }
  Widget cartContainer(BuildContext context,item){
    return Container(
      width: 500,
      height: 100,
      decoration: BoxDecoration(
        color:AppColors.appCreamColor,
       
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
         
              Padding(padding: EdgeInsets.all(10),
              child:  Container(
                   width: 90,
                   height:90,
                decoration: BoxDecoration(
                  color:AppColors.appWhiteColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child:Padding(padding:EdgeInsets.all(5),
                child:  Image.asset(item['image'],fit: BoxFit.cover,),
                )
               
              )
              ,),
              Expanded(
            child:Padding(padding: EdgeInsets.only(top:10,right:10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(item['title'],style: TextStyle(fontWeight: FontWeight.bold),maxLines:3,
                 overflow: TextOverflow.ellipsis,),
          Text(item['description'],maxLines:3,
                 overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:10),),
              Text("\$${item['price'].toString()}",style: TextStyle(color: AppColors.appBlueColor,fontWeight: FontWeight.bold),)
            
          
              ],
            )
            )
            ,),
          
              
             
              
             
        
       
          
       
         
          
        ],
      ),
    );
  }
}