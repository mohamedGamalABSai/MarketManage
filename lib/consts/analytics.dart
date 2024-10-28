import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


String? currentCustomerUID = FirebaseAuth.instance.currentUser?.uid;
List <Map<String,dynamic>> analytics = [
  {
    'tileName' : 'Total Orders',
    'tileSubName' : '4,923',
    'tileIcon' : const Icon(IconlyBroken.buy, color: Colors.white,size: 30,),
    'color' : Colors.deepOrange
  },
  {
    'tileName' : 'Total Customers',
    'tileSubName' : '12,548',
    'tileIcon' : const Icon(IconlyBroken.profile, color: Colors.white,size: 30),
    'color' : Colors.pink
  },
  {
    'tileName' : 'Total Categories',
    'tileSubName' : '123',
    'tileIcon' : const Icon(IconlyBroken.category, color: Colors.white,size: 30),
    'color' : Colors.blue[900]
  },
  {
    'tileName' : 'Total Revenue',
    'tileSubName' : '\$53,923',
    'tileIcon' : const Icon(IconlyBroken.buy, color: Colors.white,size: 30),
    'color' : Colors.green[900]
  },
];