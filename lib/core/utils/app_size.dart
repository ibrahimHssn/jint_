 import 'package:flutter/material.dart';

class AppSize{
    double height({required context})=>MediaQuery.of(context).size.height;
    double width({required context})=>MediaQuery.of(context).size.width;



}