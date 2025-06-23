
import 'package:codia_adv/features/addBlog/presentation/widgets/addBlogItem.dart';
import 'package:flutter/material.dart';

import '../addApplication/presentation/pages/addApplication.dart';
import '../addBlog/presentation/pages/addBlogScreen.dart';

class BottomNavViewModel extends ChangeNotifier {


  int _selectedIndex = 0;
  String? _name;
  String? _phone;

  String? get  name=>_name;
  String? get  phone=>_phone;
  int get selectedIndex => _selectedIndex;

  updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }


  List<Widget> adminPages=[
    const AddBlogScreen(),
    const AddApplication(),
  ];

}