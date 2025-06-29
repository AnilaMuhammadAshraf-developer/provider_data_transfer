import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:provider_data_transfer/constants/product_data.dart';
import 'package:provider_data_transfer/providers/product_provider.dart';
import 'package:provider_data_transfer/screens/product_detail.dart';
import 'package:provider_data_transfer/utils/app_assets.dart';
import 'package:provider_data_transfer/utils/app_colors.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
  
    print("rebuild check k kitni bar rebuild hota h .");
   void moveToNextScreen(BuildContext context, Map<String,dynamic> product){
    Navigator.push(context,MaterialPageRoute(builder:(context)=>ProductDetailScreen(productList:product)));
   }
    void _showModal() {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 60),
                  SizedBox(height: 12),
                  Text(
                    "Success!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("We are going to next screen."),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appBlueColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      "Okay",
                      style: TextStyle(color: AppColors.appWhiteColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

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
      body: Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: AppColors.appMainColor),
          child: Column(
            children: [
              SizedBox(height: 10),
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                             onChanged: (value) {
                                productProvider.setSearchQuery(value);
                              },
                            decoration: InputDecoration(
                              fillColor: AppColors.appWhiteColor,
                              filled: true,
                              prefixIcon: Icon(Icons.search),
                              hintText: AppStrings.searchProducts,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.appBlueColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(
                              Icons.tune,
                              color: AppColors.appWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  return SizedBox(
                    height: 50,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ProductData.choiceList.length,
                      itemBuilder: (context, index) {
                        var item = ProductData.choiceList;

                        final isSelected =
                            index == productProvider.selectedIndex;
                        return GestureDetector(
                          onTap: () => productProvider.onSelection(index),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 6),
                            width: 100,
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? AppColors.appBlueColor
                                      : AppColors.appWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  item[index]['icon'],
                                  color:
                                      isSelected
                                          ? AppColors.appWhiteColor
                                          : AppColors.appBlueColor,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  item[index]['title'],
                                  style: TextStyle(
                                    color:
                                        isSelected
                                            ? AppColors.appWhiteColor
                                            : AppColors.appBlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    AppStrings.findResults,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Consumer<ProductProvider>(builder: (context,provider,child){
                    return   Text(
                    "(${productProvider.totalCount} ${AppStrings.items})",
                    style: TextStyle(
                      color: AppColors.appGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                  }),
                
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: _showModal,
                      child: Text("(${AppStrings.seeAll})",style: TextStyle(color:AppColors.appBlueColor),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Consumer<ProductProvider>(builder:(context,provider,child){
                return  Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: productProvider.filteredProducts.length,
                   shrinkWrap: true,
                     
                  itemBuilder: (context, index) {
                     final product = productProvider.filteredProducts[index];
                    return InkWell(
                      onTap:()=>moveToNextScreen(context,product),
                    child:Container(
                    
                       padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(color:AppColors.appMainColor),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Center(child:Container(
                                width: 120,
                                height: 150,
                       decoration: BoxDecoration(color: AppColors.appWhiteColor,borderRadius: BorderRadius.circular(10)),
                    
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         
                       Image.asset(
                           product['image'],height: 60,
                          ),
                        
                         
                         
                        ],
                      ),
                              ),
                      ),
                      SizedBox(height:10),
                
                      
                   Text(product['title'],overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
                     
                  
                    Text(product['description'] ,overflow: TextOverflow.ellipsis,style: TextStyle(color:AppColors.appGreyColor),),
                    Text("\$${product['price'].toString()}",style: TextStyle(fontWeight: FontWeight.bold,color:AppColors.appBlueColor),),
                        ],
                      ),
                    ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2 / 3, 
                  ),
                ),
              );
              }),
             
            ],
          ),
        ),
      ),
    );
  }
}
