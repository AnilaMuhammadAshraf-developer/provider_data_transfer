import 'package:flutter/material.dart';
import 'package:provider_data_transfer/utils/app_assets.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class ProductData{
  static final List<Map<String,dynamic>> products=[
    {
      "title":"Modelo Especial",
      "description":"Size 35.5 cl / 355ml",
      "price":3.55,
      "image":AppAssets.productImage1

    },
    {
      "title":"Bai Coconut Flavored",
      "description":"Size 25.5 cl / 355ml",
      "price":5.55,
      "image":AppAssets.productImage2

    },
    {
      "title":"neuroSLEEP Mango",
      "description":"Size 15.5 cl / 355ml",
      "price":1.225,
      "image":AppAssets.productImage3

    },
    {
      "title":"Surely Non Alcoholic",
      "description":"Size 95.5 cl / 355ml",
      "price":1.55,
      "image":AppAssets.productImage4

    },
  ];

  static final List<Map<String,dynamic>> choiceList=[
    {
      'title':AppStrings.drink,
      'icon':Icons.local_drink_sharp
    },
     {
      'title':AppStrings.food,
      'icon':Icons.food_bank
    },
     {
      'title':AppStrings.health,
      'icon':Icons.health_and_safety
    },
     {
      'title':AppStrings.gaming,
      'icon':Icons.games
    }
  ];
}