import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/otp_verification_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/read_profile_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/utility/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/image_assets.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;
  const OTPVerificationScreen({super.key, required this.email});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  final TextEditingController _otpTEController = TextEditingController();

  final _otpVerificationFormKey = GlobalKey<FormState>();


  int _secondsRemaining = 120;
  late Timer _timer;
  bool _isElevatedButtonEnable = true;
  bool _isTextButtonEnable = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _isElevatedButtonEnable = true;
    _isTextButtonEnable = false;
    setState(() {});
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_secondsRemaining == 0) {
          _timer.cancel();
          _isElevatedButtonEnable = false;
          _isTextButtonEnable = true;
          setState(() {});
          // Perform any necessary action when timer completes
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  Future<void> resendOTP() async {
    _secondsRemaining = 120;
    _startTimer();
    setState(() {});
    // Enter hare your API Code to resend the OTP on your Mobile number.
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _otpVerificationFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
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
                    'Enter your OTP code',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'A 4 digit OTP code has been sent',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PinCodeTextField(
                    controller: _otpTEController,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor,
                      selectedColor: Colors.green,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {
                    },
                    onChanged: (value) {
                    },
                    beforeTextPaste: (text) {
                       return true;
                    }, appContext: context,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<OtpVerificationController>(
                        builder: (controller) {
                          if(controller.otpVerificationInProgress){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                              onPressed: () {
                                verifyOtp(controller);
                              },
                              child: const Text('Next'));
                        }
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),
                  RichText(text: TextSpan(
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    children: [
                      const TextSpan(
                        text: 'This code will expire in '
                      ),
                      TextSpan(
                          text: '120s',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ),
                       TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.grey,
                          ),
                          child: const Text('Resend'),

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(OtpVerificationController controller) async {
    final response =
    await controller.verifyOtp(widget.email, _otpTEController.text.trim());
    if (response) {
      Get.snackbar('Success', 'OTP verification successful',
          snackPosition: SnackPosition.BOTTOM );
      await Get.find<ReadProfileController>().readProfileData();

      Get.find<ReadProfileController>().readProfileModel.data == null
          ? Get.offAll(() => CompleteProfileScreen())
          : Get.offAll(() => const MainBottomNavScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Otp verification failed! Try again')),
        );
      }
      _otpTEController.clear();
    }
  }

}
