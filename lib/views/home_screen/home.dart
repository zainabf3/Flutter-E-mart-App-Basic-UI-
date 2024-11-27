import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/home_controller.dart';
import 'package:emart_app/views/cart/cart_screen.dart';
import 'package:emart_app/views/categories/category_screen.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
import 'package:emart_app/views/profile/profile_screen.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(HomeController());
    var navBarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: cat),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account)
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen()
    ];

    return Scaffold(
        body: Column(
          children: [
            Obx(
              () => Expanded(
                  child: navBody.elementAt(controller.currentNavIndex.value)),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: whiteColor,
            selectedLabelStyle: const TextStyle(fontFamily: bold),
            backgroundColor: redColor,
            type: BottomNavigationBarType.fixed,
            items: navBarItem,
            // on tap highight navbar icons
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ));
  }
}
