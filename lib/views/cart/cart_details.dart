import 'package:emart_app/consts/consts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Models/product_list.dart';
import '../../widgets_common/customization.dart';
import '../../widgets_common/extentions.dart';


class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() {
    return CartDetailState();
  }
}
  class CartDetailState extends State<CartDetails> {
  List<ShProduct> list = []; // List to hold cart products.


  @override
  void initState() {

    super.initState();
    fetchData(); // Load cart data when widget initializes.

  }

  fetchData() async { // fetchData loads cart products asynchronously.
    var products = await loadCartProducts(); //Load products
    setState(() {
      list.clear(); // Clear existing list.
      list.addAll(products); // Add fetched products.
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final List<ShProduct> visibleItems = list.take(3).toList(); //loading only 3 items from the list
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var cartList = ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: visibleItems.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: spacing_standard_new),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
           
            child: IntrinsicHeight(
             
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      "assets/images/products${visibleItems[index].images![0].src!}",
                      // cartImages + list[index].images![0].src!,
                      //"assets/images/products/dress/dress_8.jpeg",
                      width: width * 0.3,
                      height: width * 0.3,
                      fit: BoxFit.fill,
                    ),
                
                
                Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                8.height,
                                Text(visibleItems[index].name.toString(), style: boldTextStyle()).paddingOnly(left: 16),
                                4.height,
                                Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                                      padding: const EdgeInsets.all(spacing_control_half),
                                      child: const Icon(Icons.done, color: sh_white, size: 12),
                                    ),
                                    8.width,
                                    Text("M", style: boldTextStyle()),
                                    8.width,
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.fromLTRB(spacing_standard, 1, spacing_standard, 1),
                                      decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("Qty: 5", style: secondaryTextStyle()).paddingOnly(left: 8),
                                          const Icon(Icons.arrow_drop_down, color: sh_textColorPrimary, size: 16),
                                        ],
                                      ),
                                    )
                                  ],
                                ).paddingOnly(left: 16.0, top: spacing_xlarge),
                                8.height,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      visibleItems[index].on_sale! ? visibleItems[index].sale_price.toString().toCurrencyFormat().toString() : visibleItems[index].price.toString().toCurrencyFormat().toString(),
                                      style: primaryTextStyle(),
                                    ),
                                    4.width,
                                    Text(
                                      visibleItems[index].regular_price.toString().toCurrencyFormat()!,
                                      style: const TextStyle(color: sh_textColorSecondary, fontFamily: regular, fontSize: 14.0, decoration: TextDecoration.lineThrough),
                                    ),
                                  ],
                                ).paddingOnly(left: 16.0),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.bookmark_border,
                                      color: Colors.lightGreen,
                                      size: 16,
                                    ),
                                    4.width,
                                    const Text(
                                      "Next time buy",
                                      style: TextStyle(
                                        fontFamily: bold,


                                      ),

                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ).expand()
                                  ],
                                ),
                              ),
                              Container(width: 1, color: sh_view_color, height: 35),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.delete_outline,
                                      color: Colors.redAccent,
                                      size: 16,
                                    ),
                                    4.width,
                                    const Text(sh_lbl_remove, style: TextStyle(
                                      fontFamily: bold
                                    )),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),

            ),
          );
          // return Chats(mListings[index], index);
        });
    var paymentDetail = Container(
      margin: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_standard_new, spacing_standard_new, 80),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 0.7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: Text(sh_lbl_payment_details, style: boldTextStyle()),
          ),
          const Divider(height: 3, color: Colors.blue),
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: Column(
              children: [
                Row(
                  children: [
                    text(sh_lbl_offer),
                    5.width,
                    Text(sh_text_offer_not_available, style: primaryTextStyle()),
                  ],
                ),
                8.height,
                Row(
                  children: [
                    text(sh_lbl_shipping_charge),
                    text(sh_lbl_free, textColor: Colors.green, fontFamily: bold),
                  ],
                ),
                8.height,
                Row(
                  children: [
                    text(sh_lbl_total_amount),
                    text("₹70", textColor: sh_colorPrimary, fontFamily: bold, fontSize: 16.0),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

    var bottomButtons = Container(
      height: 65,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: sh_shadow_color, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 3)),
      ], color: sh_white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: sh_colorPrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("₹70", style: boldTextStyle()),
                const Text(sh_lbl_see_price_detail, style: TextStyle(color: Colors.white)),
              ],
            ),
          ).expand(),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            height: double.infinity,
            child: text(sh_lbl_continue, textColor: sh_white, fontSize: 18.0, fontFamily: medium),
          ).onTap(
                () {
              // ShOrderSummaryScreen().launch(context);
            },
          ).expand()
        ],
      ),
    );
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Column(
                  children: [
                    cartList,
                     paymentDetail,
                  ],
                ),

              ),
            ),


            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 10),

              child: bottomButtons,
            )
          ],

        ),

      ),
    );
  }


  }


