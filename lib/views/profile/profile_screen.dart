import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widgets_common/customization.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile ',
          style: TextStyle(fontFamily: bold, fontSize: 25, color: whiteColor),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              //edit profile button
              const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                  )).onTap(() {}),

              //user details section

              Row(
                children: [
                  Image.asset(imgProfile, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  10.heightBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(semibold).white.make(),
                      "User@example.com".text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(10, 40),
                          side: const BorderSide(
                            color: whiteColor,
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: "Log Out".text.fontFamily(semibold).white.make()),
                ],
              ),
              20.heightBox,
              const Column(
                children: [],
              )
                  .box
                  .white
                  .rounded
                  .width(context.screenWidth / 4)
                  .padding(const EdgeInsets.all(4))
                  .make(),

              //buttons section
              22.heightBox,

              ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: lightGrey,
                        );
                      },
                      itemCount: profileButtonslist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.asset(
                            profilebuttonsIcon[index],
                            width: 20,
                          ),
                          title: profileButtonslist[index]
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                        );
                      })
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.symmetric(horizontal: 16))
                  .make()
            ],
          ),
        ),
      ),
    ));
  }
}
