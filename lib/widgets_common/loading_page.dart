import 'package:emart_app/consts/consts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitCircle(
          size: 100,
            color: Colors.red,
          //duration: Duration(seconds: 2),
        ),
      ),
    );
  }

}