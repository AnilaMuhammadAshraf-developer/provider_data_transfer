import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:provider_data_transfer/providers/cart_provider.dart';
import 'package:provider_data_transfer/providers/product_provider.dart';
import 'package:provider_data_transfer/utils/app_colors.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context){
    print("yh b again rebuild honi chaiye.");
    final cartProvider = Provider.of<CartProvider>(
      context,
      listen: false
     
    );
      final productProvider = Provider.of<ProductProvider>(
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
          child: 
          Consumer<CartProvider>(builder:(context,value,child){
                   return InkWell(
                    onTap:cartProvider.cartProductDelete,
                    child:Text("(${AppStrings.remove} ${cartProvider.totalCheckedCount})",style: TextStyle(color: AppColors.appRedColor,fontWeight: FontWeight.bold),)
                   );  
          }),
        
          ),
          
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
                ...List.generate(cartProvider.cartList.length, (index){
                  var item=cartProvider.cartList[index];
                  return Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                    
                      child:Row(children: [
                        
                            Consumer<CartProvider>(builder: (BuildContext context,value,Widget? child){
                        return   Checkbox(value:item['isChecked'], onChanged:(bool? value){cartProvider.updateIsChecked(item['id']);},checkColor: AppColors.appWhiteColor,activeColor: AppColors.appBlueColor,);
                      }),
                      
                   
                     Expanded(child:Padding(padding: EdgeInsets.only(left:3,right:10,top:10),
                      child:cartContainer(context,item,productProvider),
                      ),
                     ),
                      ],)),
                   
                  
                      
                          
                    
                    ],
                  );
                 
                }),
                 Padding(padding: EdgeInsets.all(10),
                  child:promoCodeContainer(context),
                 )
            ],
          ),
        
      ),
    );

    
  }
  Widget promoCodeContainer(BuildContext context){
     return Container(
        width: MediaQuery.of(context).size.width,

        height:70,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:AppColors.appGreyColor
          )
        ),
        child:Form(child: Row(
          children: [
               Expanded(
            child:TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.promoCodeHint,
               border: InputBorder.none
              ),
            ),
               ),
            GestureDetector(onTap: (){}, child:Container(
              width: 100,
              height:40,
              decoration: BoxDecoration(
                color:AppColors.appBlueColor,
                borderRadius: BorderRadius.circular(10)

              ),
              child:Center(
                child:Text(AppStrings.apply,style:TextStyle(color:AppColors.appWhiteColor,fontWeight: FontWeight.bold)),
                ),
            ),
            ),
          ]
         
        )),
     );
  }
  Widget cartContainer(BuildContext context,item,productProvider){
    return Container(
      width: 500,
    
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
            
           Row(
          
            children: [
                Text("\$${item['price'].toString()}",style: TextStyle(color: AppColors.appBlueColor,fontWeight: FontWeight.bold),),
                SizedBox(width:15),
                Align(
                  alignment: Alignment.bottomRight,
              child:Container(
                margin: EdgeInsets.all(10),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color:AppColors.appBlackColor
                  )
                ),
                child: Row(
                  children: [
                     IconButton(onPressed:productProvider.decrementCount, icon:Icon(Icons.remove,color: AppColors.appBlackColor,size: 10,)),
                       
                        Consumer<ProductProvider>(builder: (BuildContext context, value, Widget? child) {
                          return  Text(
                        "${item['productTotal']}",style: TextStyle(color:AppColors.appBlackColor),
                        );
                          },),
                        IconButton(onPressed:productProvider.incrementCount, icon:Icon(Icons.add,color: AppColors.appBlackColor,size:10)),
                  ],
                ),
              ),
                )
            ],)
            
              ],
            )
            )
            ,),
          
              
             
              
             
        
       
          
       
         
          
        ],
      ),
    );
  }
}