import 'package:emart_app/consts/consts.dart';

Widget applogoWidget() {
  //using velocity X here
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackground), fit: BoxFit.fill)),
    child: child,
  );
}

Widget customTextField({String? title, String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
          // controller: controller,
          decoration: InputDecoration(
              hintStyle: const TextStyle(
                fontFamily: semibold,
                color: textfieldGrey,
              ),
              hintText: hint,
              isDense: true, // text field will become lil small
              fillColor: lightGrey,
              filled: true,
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: redColor)))),
      5.heightBox
    ],
  );
}
