import 'dart:async';
import 'dart:io';

import 'package:allpay/src/module/profile/model/user_gender_model/user_gender_model.dart';
import 'package:allpay/src/module/profile/model/user_profile_model/user_profile_model.dart';
import 'package:allpay/src/module/profile/model/view_order_model/view_order_model.dart';
import 'package:allpay/src/util/api_base_herper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  final _apiBaseHelper = ApiBaseHelper();
  final indexGen = 0.obs;
  final titleGen = ''.obs;
  List<String> genderList = [
    'Male',
    'Female',
  ];

  final formattedDate = ''.obs;
  final dateOfBirth = DateTime(2023, 2, 1).obs;
  final userProfileModel = UserProfileModel().obs;

  final isLoadingProfile = false.obs;
  Future fecthUserProfile() async {
    isLoadingProfile(true);
    try {
      await _apiBaseHelper
          .onNetworkRequesting(
        url: 'profile',
        methode: METHODE.get,
        isAuthorize: true,
      )
          .then((response) {
        debugPrint('response: $response');
        userProfileModel.value = UserProfileModel.fromJson(response);

        // format Date
        final dateTime = userProfileModel.value.dateOfBirth;
        final date = DateTime.parse(dateTime!);
        formattedDate.value = DateFormat('MM/dd/yyyy').format(date);
        debugPrint('hi: $formattedDate');
      });
    } catch (e) {
      debugPrint('------- fecthUserProfile Error: $e');
      isLoadingProfile(false);
    }
    isLoadingProfile(false);
    return userProfileModel.value;
  }

  @override
  void onInit() async {
    await fecthUserProfile();
    await fecthUserGender();
    super.onInit();
  }

  // final userGenderList = <UserGenderModel>[].obs;
  final userGendermodel = UserGenderModel().obs;
  final isLoadingGender = false.obs;
  Future fecthUserGender() async {
    isLoadingGender(true);
    try {
      await _apiBaseHelper
          .onNetworkRequesting(
        url: 'gender',
        methode: METHODE.get,
        isAuthorize: true,
      )
          .then((response) {
        var responseJson = response[0];
        userGendermodel.value = UserGenderModel.fromJson(responseJson);
        debugPrint('e: ${userGendermodel.value}');
      });
    } catch (e) {
      isLoadingGender(false);
      debugPrint('------- fecthUserGender Error: ${e.toString()}');
    }
    isLoadingGender(false);
    return userGendermodel.value;
  }

  Future<void> onSubmitUserGender({int? id}) async {
    debugPrint('UserId: $id');
    try {
      await _apiBaseHelper.onNetworkRequesting(
          url: 'gender/$id',
          methode: METHODE.update,
          isAuthorize: true,
          body: {
            "value": titleGen.value,
          }).then((response) {
        // var message = response;
        // debugPrint('onSubmit: $message');
      });
    } catch (e) {
      debugPrint('------- onSubmitUserGender Error: ${e.toString()}');
    }
  }

  final isLoadingOnSubmittedDOB = false.obs;
  Future<void> onSubmitUserDOB() async {
    isLoadingOnSubmittedDOB(true);
    try {
      await _apiBaseHelper.onNetworkRequesting(
          url: 'profile',
          methode: METHODE.update,
          isAuthorize: true,
          body: {
            "date_of_birth": "${dateOfBirth.value}",
          }).then((response) {
        debugPrint('zzzz$response');
        // var message = response;
        // debugPrint('onSubmit: $message');
      });
      isLoadingOnSubmittedDOB(false);
    } catch (e) {
      debugPrint('------- onSubmitUserDOB Error: ${e.toString()}');
    }
    isLoadingOnSubmittedDOB(false);
  }

  File? image;
  final imagePath = ''.obs;
  XFile? imageFile;
  final _picker = ImagePicker().obs;
  final isLoadingPickedImage = false.obs;

  Future pickedImage(ImageSource? imageSource) async {
    try {
      isLoadingPickedImage(true);
      final pickedFile = await _picker.value.pickImage(
        source: imageSource!,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        imageQuality: 100,
      );
      if (pickedFile != null) {
        image = File(pickedFile.path);
        imagePath.value = pickedFile.path;

        debugPrint('Picked: $imagePath');
        isLoadingPickedImage(false);
      } else {
        debugPrint('No image selected.');
        isLoadingPickedImage(false);
      }
    } catch (e) {
      debugPrint('Image Picker error = = = = = $e');
      isLoadingPickedImage(false);
    }
    return imagePath.value;
  }

  // Future onSubmitProfileImage() async {
  //   try {
  //     debugPrint('image ${imagePath.value}');
  //     await _apiBaseHelper.onNetworkRequesting(
  //       url: 'profile',
  //       methode: METHODE.post,
  //       isAuthorize: true,
  //       body: {
  //         "imageprofile": imagePath.value,
  //       },
  //     ).then((response) {
  //       debugPrint('Upload profile photo: $response');
  //     });
  //   } catch (e) {
  //     debugPrint('------- onSubmitUserProfileImage Error: ${e.toString()}');
  //   }
  // }

  final viewOrderList = <ViewOrderModel>[].obs;
  final isLoadingOrderProduct = false.obs;

  Future<List<ViewOrderModel>> fetchOrderProducts() async {
    try {
      isLoadingOrderProduct(true);
      await _apiBaseHelper
          .onNetworkRequesting(
        url: 'order',
        methode: METHODE.get,
        isAuthorize: true,
      )
          .then((response) {
        response.map((e) {
          viewOrderList.add(ViewOrderModel.fromJson(e));
        }).toList();
      });
      debugPrint('fetchOrder: $viewOrderList');
      isLoadingOrderProduct(false);
    } catch (e) {
      debugPrint('Error fetch order product: $e');
      isLoadingOrderProduct(false);
    }
    return viewOrderList;
  }
}
