import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/email_verification_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utility/image_assets.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formStateKey,
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
                  'Welcome back',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please enter your email address',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter your email address';
                    } else if (text!.isEmail == false) {
                      //REGEX (Email validator)
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<EmailVerificationController>(
                      builder: (controller) {
                    if (controller.emailVerificationInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                        onPressed: () async {
                          if (_formStateKey.currentState!.validate()) {
                            verifyEmail(controller);
                          }
                        },
                        child: const Text('Next'));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response =
        await controller.verifyEmail(_emailTEController.text.trim());
    if (response) {
      Get.to(() => OTPVerificationScreen(
            email: _emailTEController.text.trim(),
          ));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(controller.message)),
        );
      }
    }
  }
}
