import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/utility/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../state_holders/create_profile_controller.dart';
import '../../../state_holders/read_profile_controller.dart';
import '../../utility/image_assets.dart';
import '../main_bottom_nav_screen.dart';



class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
  ReadProfileController readProfileController =
  Get.put(ReadProfileController());

  @override
  void initState() {
    if (readProfileController.readProfileModel.data != null) {
      _customerNameTEController.text =
          readProfileController.readProfileModel.data!.cusName ?? '';
      _customerAddTEController.text =
          readProfileController.readProfileModel.data!.cusAdd ?? '';
      _customerCityTEController.text =
          readProfileController.readProfileModel.data!.cusCity ?? '';
      _customerStateTEController.text =
          readProfileController.readProfileModel.data!.cusState ?? '';
      _customerPostcodeTEController.text =
          readProfileController.readProfileModel.data!.cusPostcode ?? '';
      _customerCountryTEController.text =
          readProfileController.readProfileModel.data!.cusCountry ?? '';
      _customerMobileTEController.text =
          readProfileController.readProfileModel.data!.cusPhone ?? '';
      _customerFaxTEController.text =
          readProfileController.readProfileModel.data!.cusFax ?? '';
      _shippingNameTEController.text =
          readProfileController.readProfileModel.data!.shipName ?? '';
      _shippingAddTEController.text =
          readProfileController.readProfileModel.data!.shipAdd ?? '';
      _shippingCityTEController.text =
          readProfileController.readProfileModel.data!.shipCity ?? '';
      _shippingStateTEController.text =
          readProfileController.readProfileModel.data!.shipState ?? '';
      _shippingPostcodeTEController.text =
          readProfileController.readProfileModel.data!.shipPostcode ?? '';
      _shippingCountryTEController.text =
          readProfileController.readProfileModel.data!.shipCountry ?? '';
      _shippingMobileTEController.text =
          readProfileController.readProfileModel.data!.shipPhone ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
          title: const Text(''),
          elevation: 1,
        ),
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
                    'Update Profile',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      'Please update your profile information!',
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
                      hintText: 'Full Name',
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
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    controller: _customerAddTEController,
                    decoration: const InputDecoration(
                      hintText: 'Your Address',
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
                      hintText: 'City',
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
                      hintText: 'State',
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
                      hintText: 'Postcode',
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
                      hintText: 'Country',
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
                      hintText: 'Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your mobile number';
                      } else {
                        if (text!.length < 11) {
                          return 'Mobile number should be at least 11 digit';
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
                      hintText: 'Fax',
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
                      hintText: 'Shipping Person Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your shipping person full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    controller: _shippingAddTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your shipping address';
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
                      hintText: 'Shipping City',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your shipping city name';
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
                      hintText: 'Shipping State',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your shipping state name';
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
                      hintText: 'Shipping Postcode',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your shipping postcode';
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
                      hintText: 'Shipping Country',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your shipping country name';
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
                      hintText: 'Shipping Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your shipping mobile number';
                      } else {
                        if (text!.length < 11) {
                          return 'Mobile number should be at least 11 digit';
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
                        builder: (createProfileController) {
                          if (createProfileController
                              .completeProfileInProgress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                createProfileController
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
                                    _shippingMobileTEController.text.trim())
                                    .then((result) {
                                  if (result) {
                                    Get.snackbar(
                                        'Success', 'Profile Update successful.',
                                        borderRadius: 10,
                                        snackPosition: SnackPosition.BOTTOM);
                                    Get.offAll(() => const MainBottomNavScreen());
                                  } else {
                                    Get.snackbar('Failed',
                                        'Profile Update failed! Please try again.',
                                        borderRadius: 10,
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                });
                              }
                            },
                            child: const Text('Update'),
                          );
                        }),
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