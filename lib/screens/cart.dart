import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_data_transfer/providers/cart_provider.dart';
import 'package:provider_data_transfer/screens/product.dart';
import 'package:provider_data_transfer/utils/app_colors.dart';
import 'package:provider_data_transfer/utils/app_dialogs.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    print("yh b again rebuild honi chaiye.");
    final cartProvider = Provider.of<CartProvider>(context);
    double totalAmount = cartProvider.subTotal + cartProvider.shipping;
    
     void onDialogTap(){
    cartProvider.clearCartList();
    Navigator.of(context).pop(); 
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
                    
  }
    void onCheckOutTap(){
       AppDialogs().showCustomDialog(context, "Success Checkout!","Thank You For Shopping.",onDialogTap,AppColors.appGreenColor);
    }
    
    return Scaffold(
      backgroundColor: AppColors.appWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appMainColor,
        title: Text(
          AppStrings.myCart,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: InkWell(
              onTap: cartProvider.cartProductDelete,
              child: Text(
                "(${AppStrings.remove} ${cartProvider.totalCheckedCount})",
                style: TextStyle(
                  color: AppColors.appRedColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: cartProvider.cartList.length,
              itemBuilder: (context, index) {
                var item = cartProvider.cartList[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: item['isChecked'],
                          onChanged: (bool? value) {
                            cartProvider.updateIsChecked(item['id']);
                          },
                          checkColor: AppColors.appWhiteColor,
                          activeColor: AppColors.appBlueColor,
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 3,
                              right: 10,
                              top: 10,
                            ),
                            child: cartContainer(context, item, cartProvider),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: promoCodeContainer(context),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Row(
              children: [
                Text(AppStrings.subTotal),
                Spacer(),
                Text("\$ ${cartProvider.subTotal.toString()}"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 7),
            child: Row(
              children: [
                Text(AppStrings.shipping),
                Spacer(),
                Text("\$ ${cartProvider.shipping.toString()}"),
              ],
            ),
          ),

          Spacer(),
          cheeckOutContainer(context, cartProvider, totalAmount,onCheckOutTap),
        ],
      ),
    );
  }

  Widget cheeckOutContainer(BuildContext context, cartProvider, totalAmount,onCheckOutTap) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.appBlueColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20, height: 10),
              Text(
                "${AppStrings.total}  (${cartProvider.cartList.length} ${AppStrings.items})",
                style: TextStyle(color: AppColors.appWhiteColor),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 20, height: 10),
              Text(
                "\$ ${totalAmount.toStringAsFixed(2)}",
                style: TextStyle(
                  color: AppColors.appWhiteColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20),
                GestureDetector(
                onTap:onCheckOutTap,
              child:checkOutBtn(context,onCheckOutTap),
                ),
            ],
          ),
        ],
      ),
    );
  }



Widget checkOutBtn(BuildContext context,onCheckOutTap){
  return Container(
    width:175,
    height:50,
    decoration: BoxDecoration(
      color:AppColors.appWhiteColor,
      borderRadius: BorderRadius.circular(30)
    ),
   
      child:Center(child:Text(
        AppStrings.proceedToCheckout,style: TextStyle(color:AppColors.appBlueColor,fontWeight: FontWeight.bold),
      ),
      ),
     
  );
}




  Widget promoCodeContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,

      height: 70,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.appGreyColor),
      ),
      child: Form(
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: AppStrings.promoCodeHint,
                  border: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.appBlueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    AppStrings.apply,
                    style: TextStyle(
                      color: AppColors.appWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cartContainer(BuildContext context, item, cartProvider) {
    return Container(
      width: 500,

      decoration: BoxDecoration(
        color: AppColors.appCreamColor,

        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.appWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Image.asset(item['image'], fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item['description'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10),
                  ),

                  Row(
                    children: [
                      Text(
                        "\$${item['price'].toString()}",
                        style: TextStyle(
                          color: AppColors.appBlueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 15),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.appBlackColor),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  color: AppColors.appBlackColor,
                                  size: 10,
                                ),
                              ),

                              Text(
                                "${item['productTotal']}",
                                style: TextStyle(
                                  color: AppColors.appBlackColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: AppColors.appBlackColor,
                                  size: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
