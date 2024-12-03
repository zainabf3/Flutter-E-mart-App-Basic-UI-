import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/customization.dart';


import '../../widgets_common/loading_page.dart';
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

    Future<void> _loadData() async {
      await Future.delayed(const Duration(seconds: 3)); // Simulate async operation.
    }
    // late bool isLoading;  // set loading to false initially


  //   @override
  // void initState() {
  //
  //   super.initState();
  //   dataLoadFunc();
  // }
  //
  // dataLoadFunc() async {
  //     setState(() {
  //       isLoading = true; // start the loader
  //     });
  //     //const CartDetails();
  //     setState(() {
  //       isLoading = false; // once data is loaded stop the loader
  //     });
  // }
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
            body: FutureBuilder<void>
              (future: _loadData(),
                builder: (context,snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: LoadingPage(),
                  );

                } else if (snapshot.connectionState == ConnectionState.done){
                  return const Center(
                    child: CartDetails(),
                  );
                }
                return const Center (
                  child: Text("No Data Found"),
                );

                }),
            // body: isLoading ? const LoadingPage() :
            // const CartDetails(),





          )
      );
    }
    }










