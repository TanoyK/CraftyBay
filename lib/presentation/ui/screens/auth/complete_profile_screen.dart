import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../state_holders/create_profile_controller.dart';
import '../../utility/image_assets.dart';
import '../main_bottom_nav_screen.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({super.key});

  final TextEditingController _customerNameTEController = TextEditingController();
  final TextEditingController _customerAddTEController = TextEditingController();
  final TextEditingController _customerCityTEController = TextEditingController();
  final TextEditingController _customerStateTEController = TextEditingController();
  final TextEditingController _customerPostcodeTEController =
  TextEditingController();
  final TextEditingController _customerCountryTEController = TextEditingController();
  final TextEditingController _customerMobileTEController = TextEditingController();
  final TextEditingController _customerFaxTEController = TextEditingController();
  final TextEditingController _shippingNameTEController = TextEditingController();
  final TextEditingController _shippingAddTEController = TextEditingController();
  final TextEditingController _shippingCityTEController = TextEditingController();
  final TextEditingController _shippingStateTEController = TextEditingController();
  final TextEditingController _shippingPostcodeTEController =
  TextEditingController();
  final TextEditingController _shippingCountryTEController =
  TextEditingController();
  final TextEditingController _shippingMobileTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                   Center(
                child: SvgPicture.asset(
                  ImageAssets.craftyBayLogoSVG,
                    width: 100,
                   ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Complete Profile',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('Get started with us by share your details',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey)),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'User Details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _customerNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'John Doe',
                      labelText: 'Full Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    controller: _customerAddTEController,
                    decoration: const InputDecoration(
                      hintText: '237 Delia Ports',
                      labelText: 'Your Address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _customerCityTEController,
                    decoration: const InputDecoration(
                      hintText: 'Mireyamouth',
                      labelText: 'City',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your city name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _customerStateTEController,
                    decoration: const InputDecoration(
                      hintText: 'Texas',
                      labelText: 'State',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your state name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _customerPostcodeTEController,
                    decoration: const InputDecoration(
                      hintText: '55064-6682',
                      labelText: 'Postcode',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your postcode';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _customerCountryTEController,
                    decoration: const InputDecoration(
                      hintText: 'USA',
                      labelText: 'Country',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your country name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _customerMobileTEController,
                    decoration: const InputDecoration(
                      hintText: '01**********',
                      labelText: 'Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your mobile number';
                      } else {
                        if (text!.length < 11) {
                          return 'Mobile should be at least 11 digit';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _customerFaxTEController,
                    decoration: const InputDecoration(
                      hintText: '356******',
                      labelText: 'Fax',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your fax number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Shipping Details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _shippingNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'John Doe',
                      labelText: 'Shipping Person Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping person full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    controller: _shippingAddTEController,
                    decoration: const InputDecoration(
                      hintText: '237 Delia Ports',
                      labelText: 'Shipping Address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _shippingCityTEController,
                    decoration: const InputDecoration(
                      hintText: 'Mireyamouth',
                      labelText: 'Shipping City',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping city name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _shippingStateTEController,
                    decoration: const InputDecoration(
                      hintText: 'Texas',
                      labelText: 'Shipping State',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping state name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _shippingPostcodeTEController,
                    decoration: const InputDecoration(
                      hintText: '55064-6682',
                      labelText: 'Shipping Postcode',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping postcode';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _shippingCountryTEController,
                    decoration: const InputDecoration(
                      hintText: 'USA',
                      labelText: 'Shipping Country',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping country name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _shippingMobileTEController,
                    decoration: const InputDecoration(
                      hintText: '01**********',
                      labelText: 'Shipping Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping mobile number';
                      } else {
                        if (text!.length < 11) {
                          return 'Mobile should be at least 11 digit';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                     child: GetBuilder<CreateProfileController>(
                        builder: (createProfileScreenController) {
                          if (createProfileScreenController
                              .completeProfileInProgress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                         return

                           ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                createProfileScreenController
                                    .createProfile(
                                  _customerNameTEController.text.trim(),
                                  _customerAddTEController.text.trim(),
                                  _customerCityTEController.text.trim(),
                                  _customerStateTEController.text.trim(),
                                  _customerPostcodeTEController.text.trim(),
                                  _customerCountryTEController.text.trim(),
                                  _customerMobileTEController.text.trim(),
                                  _customerFaxTEController.text.trim(),
                                  _shippingNameTEController.text.trim(),
                                  _shippingAddTEController.text.trim(),
                                  _shippingCityTEController.text.trim(),
                                  _shippingStateTEController.text.trim(),
                                  _shippingPostcodeTEController.text.trim(),
                                  _shippingCountryTEController.text.trim(),
                                  _shippingMobileTEController.text.trim(),
                                )
                                    .then((result) {
                                  if (result) {
                                    Get.snackbar(
                                        'Success', 'Profile create successful.',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                        borderRadius: 10,
                                        snackPosition: SnackPosition.BOTTOM);
                                    Get.offAll(() => const MainBottomNavScreen());
                                  } else {
                                    Get.snackbar('Failed',
                                        'Profile create failed! Try again.',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                        borderRadius: 10,
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                });
                              }
                            },
                            child: const Text('Complete'),
                           );
                       }
                       ),
                  ),
               ],
                 ),
             ),
          ),
        ),
      ),
    );
  }
}