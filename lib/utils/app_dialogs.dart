import 'package:flutter/material.dart';
import 'package:provider_data_transfer/utils/app_colors.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class AppDialogs{

  Future showCustomDialog(BuildContext context,heading,message,onTapFunction,circleColor){
    return   showDialog(
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
                  Icon(Icons.check_circle, color: circleColor, size: 60),
                  SizedBox(height: 12),
                  Text(
                   heading,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(message),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appBlueColor,
                    ),
                    onPressed: onTapFunction,
                
                    child: Text(
                      AppStrings.okText,
                      style: TextStyle(color: AppColors.appWhiteColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  
}