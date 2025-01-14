import 'package:allpay/src/constant/app_setting.dart';
import 'package:allpay/src/module/my_card/controller/map_controller.dart';
import 'package:allpay/src/module/my_card/screen/choose_location_address.dart';
import 'package:allpay/src/widget/custom_dot_contianer.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../widget/home/custom_buttons.dart';
import '../../home/widgets/custom_email_cart.dart';
import '../../home/widgets/custom_payment_method.dart';
import '../../home/widgets/custom_text_lable.dart';
import 'order_detail.dart';

class CheckOutMyCart extends StatelessWidget {
  const CheckOutMyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = Get.put(AddressController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Check Out",
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Information",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // CustomEmailCart(
                    //   title: 'Angkeasel',
                    //   subTitle: 'UserName',
                    //   onTap: () {},
                    //   icons: 'assets/svg/email.svg',
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomEmailCart(
                      title: '+85593339596',
                      subTitle: 'Phone',
                      onTap: () {
                        // context.push('');
                      },
                      icons: 'assets/svg/call.svg',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Address",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    mapController.address.value.isEmpty
                        ? CustomContainDotted(
                            // final location = GoRouter.of(context).location;
                            // context.push('/choose-location-address');
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ChooseLocationAddress();
                              }));
                            },
                            icon: Icons.add_circle_outline,
                            title: 'Add Address',
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: Text(
                                  mapController.address.value,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return const ChooseLocationAddress();
                                    }),
                                  );
                                },
                                child: SvgPicture.asset('assets/svg/edit.svg'),
                              ),
                            ],
                          ),
                    Text(
                      "Payment Method",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.backgroundColor),
                      child: const CustomPaymentMethod(
                        title: 'Cash',
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              // width: MediaQuery.of(context).size.width,

              child: SafeArea(
                top: false,
                minimum: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomTextLable(
                      text: 'Subtotal',
                      lablePrice: 100,
                    ),
                    const SizedBox(height: 8),
                    const CustomTextLable(
                      text: 'Delivery',
                      lablePrice: 150,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: DottedDecoration(
                        color: const Color(0xFF9E9E9E),
                        shape: Shape.line,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTextLable(
                      text: 'Total Cost',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: const Color(0xff2B2B2B)),
                      lablePrice: 250,
                      styleLable: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              color: AppColor.primaryColor,
                              fontFamily: 'poppins-regular'),
                    ),
                    const SizedBox(height: 20),
                    CustomButtons(
                      title: 'Place Order',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const OrderDetail();
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
