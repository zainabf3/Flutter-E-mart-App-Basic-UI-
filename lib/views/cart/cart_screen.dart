import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/customization.dart';

import 'cart_details.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});


  @override
  State<CartScreen> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen>
  {
    @override
    Widget build(BuildContext context) {
      return bgWidget(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(cart,
              style: TextStyle(
                color: Colors.white,
                fontSize:25,
                fontFamily: bold,
              ) ,),
            automaticallyImplyLeading: false,
          ),
      body: CartDetails(),




      )
      );
    }

  }








