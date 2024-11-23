import 'package:emart_app/consts/consts.dart';

Widget ourButton({onPress, color, textcolor, title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(color: textcolor, fontFamily: bold),
      ));
}
