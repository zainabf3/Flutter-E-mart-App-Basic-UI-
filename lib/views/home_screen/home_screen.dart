import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widgets_common/buttons.dart';
import 'package:emart_app/widgets_common/customization.dart';
// import 'package:get/get_navigation/src/routes/default_transitions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: SafeArea(
          child: Column(
        children: [
          20.heightBox,
          const Row(
            children: [
              Padding(padding: EdgeInsets.all(3)),
              Text(
                home,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: bold, fontSize: 28, color: whiteColor),
              )
            ],
          ),

          // AppBar(
          //   title: const Text("Home",
          //       style: TextStyle(fontFamily: bold, color: Colors.white)),
          //   automaticallyImplyLeading: false, // to disable back button
          // ),

          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: search,
                  hintStyle: TextStyle(color: textfieldGrey)),
            ),
          ),
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //swipper Brands
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make(); // make slider banner square rounded
                      }),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // even space between today'sDeal and
                    children: List.generate(
                        2,
                        (index) => homeButtons(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 2.5,
                              icon: index == 0 ? icTodaysDeal : icFlashDeal,
                              title: index == 0 ? todaydeal : flashsale,
                            )),
                  ),
                  //2nd swipper
                  10.heightBox,
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make(); // make slider banner square rounded
                      }),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => homeButtons(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 3.5,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            title: index == 0
                                ? topcategories
                                : index == 1
                                    ? brand
                                    : topSellers)),
                  ),
                  //featured categories
                  20.heightBox,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCat.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make()),
                  20.heightBox,
                  // Row(
                  //   children: List.generate(3, (index) => Column(
                  //     children: [],
                  //   ),),
                  // )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
