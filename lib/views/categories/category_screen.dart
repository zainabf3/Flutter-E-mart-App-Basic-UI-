import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/categories/category_details.dart';

import 'package:emart_app/widgets_common/customization.dart';

import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          cat,
          style: TextStyle(fontFamily: bold, fontSize: 25, color: whiteColor),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              //grid mesurement
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                //grid desing
                return Column(
                  children: [
                    Image.asset(
                      categoryImages[index],
                      height: 130,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    categoriesList[index]
                        .text
                        .color(darkFontGrey)
                        .align(TextAlign.center)
                        .make()
                        .onTap(() {
                      Get.to(
                          () => CategoryDetails(title: categoriesList[index]));
                    })
                  ],
                ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make();
              })),
    ));
  }
}
