import 'package:codia_adv/config/utils/appImages.dart';
import 'package:flutter/material.dart';

import '../../../config/utils/appColors.dart';
import '../../mobileApplication/presentation/widgets/mobileApplicationItem.dart';
import '../domain/models/menuModel.dart';

const Color primaryColor = Color(0xFFfc012a);
const Color textColor = Colors.white;

class CustomHeader extends StatefulWidget {
  const CustomHeader({super.key});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  int _hoverIndex = -1; // للتحكم في Hover لأزرار القائمة

  @override
  Widget build(BuildContext context) {
    final List<MenuModel> pages = MenuModel.getItems(context);

    Widget buildPages(){
      return Row(
        children: [

          ... List.generate(
            pages.length,
                (index) => MouseRegion(
              onEnter: (_) => setState(() => _hoverIndex = index),
              onExit: (_) => setState(() => _hoverIndex = -1),
              child: InkWell(
                onTap: () {

                  pages[index].navigate(); // ✅
                },
                child: AnimatedDefaultTextStyle(

                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _hoverIndex == index
                        ? AppColors.primaryColor
                        : const Color(0xFF252c49), // لون هادئ واحترافي

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(pages[index].pageName),
                  ),
                ),
              ),
            ),
          ) ],
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color:      Colors.white,
      child: Row(
        children: [
          buildCodiaName(),

          const Spacer(),

          buildPages(),

          const Spacer(),


          InkWell(
            onTap: () {
              // Action هنا
            },
            borderRadius: BorderRadius.circular(100),
            hoverColor: Colors.grey.withOpacity(0.1), // لو Web
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFF252c49),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.settings,
                  size: 22,
                  color: Color(0xFF252c49),
                ),
              ),
            ),
          )

          // زر الحجز,
          ,
          SizedBox(width: 20),


          SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFdf0a0a),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 6,
                shadowColor: Color(0xFFb30f0f),
              ),
              child: Text(
                "Request Callback",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
          SizedBox(width: 30),

          Container(
            width: 1,
            height: 60,
            color: const Color(0xFF8d99af).withOpacity(0.4),
          ),
            SizedBox(width: 30),

          // معلومات الاتصال
          buildCallItem(),
        ],
      ),
    );

  }


  Widget buildCodiaName(){
  return  Row(
      children: [
        Image.asset(AppImages.codia,
          height: 50,
          width: 50,
        ),
        // الشعار
        Text(
          'CodiaAdv',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252c49),
            letterSpacing: 1.2,
          ),
        ),

      ],
    );
  }

  Widget buildCallItem() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,

           color: AppColors.primaryColor
          ),
          child: Icon(
            Icons.phone_callback_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Call Any Time",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF1a1827),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "+201022491465",
              style: TextStyle(
                color: Color(0xFF1a1827),

                fontSize: 14,
                 fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// const List<String> menuItems = [
//   'Home',
//   'About Us',
//   'Services',
//   'Contact',
// ];
