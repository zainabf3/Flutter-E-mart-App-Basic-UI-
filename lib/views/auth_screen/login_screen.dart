import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/auth_screen/signup_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widgets_common/customization.dart';
// import 'package:emart_app/widgets_common/bg_widget.dart';
// import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/buttons.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Column(
              //call the textfield widget
              children: [
                customTextField(title: email, hint: emailHint),
                customTextField(title: password, hint: passHint),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgetPassword.text.make()),
                ),
                5.heightBox,
                // ourButton().box.width(context.screenWidth - 50).make(),
                ourButton(
                    color: redColor,
                    title: login,
                    textcolor: whiteColor,
                    onPress: () {
                      // launchUrl('http://www.facebook.com');
                      Get.to(() => const Home());
                    }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNew.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                    color: golden,
                    title: signup,
                    textcolor: redColor,
                    onPress: () {
                      Get.to(() => const SignupScreen());
                    }).box.width(context.screenWidth - 50).make(),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
            10.heightBox,
            loginWith.text.color(fontGrey).make(),
            5.heightBox,
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                               onTap: () async {
                                 final String url = "https://www.facebook.com/";
                                 final Uri uri = Uri.parse(url);
                                 if (await canLaunchUrl(uri)) {
                                   await launchUrl(uri,
                                       mode: LaunchMode.externalApplication);
                                 } else {
                                   throw 'Could not launch $uri';
                                 }
                               },


                             //async {
                            //   // final String url = socialLinks[index]['url'];
                            //
                            //  // launchUrl('http://www.facebook.com');
                            //
                            //
                            // },
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialLinks[index]['icon'],
                                width: 30,
                              ),
                            ),
                          ),
                        )))
          ],
        ),
      ),
    )
    );
  }
  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $url');
    }
  }
}
