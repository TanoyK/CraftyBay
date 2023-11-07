import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/splash_screen.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/utility/app_colors.dart';
import 'package:get/get.dart';

import 'state_holder_binder.dart';


// final ThemeModeController themeModeController = ThemeModeController();

class CraftyBay extends StatefulWidget {
 static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {

  late final StreamSubscription _connectivityStatusStream;

  @override
  void initState() {
    checkInitialInternetConnection();
    checkInternetConnectivityStatus();
    super.initState();
  }

  void checkInitialInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    handelConnectivityStates(result);
  }

  void checkInternetConnectivityStatus() {
    _connectivityStatusStream =
        Connectivity().onConnectivityChanged.listen((status) {
        handelConnectivityStates(status);
    });
  }

  void handelConnectivityStates(ConnectivityResult status){
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      Get.showSnackbar(const GetSnackBar(
        title: 'No Internet',
        message: 'Please check your internet connectivity.',
        duration: Duration(seconds: 3),
      ));
    } else {
      if(Get.isSnackbarOpen){
        Get.closeAllSnackbars();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder(
    //   valueListenable: Get.find<ThemeModeController>().themeMode,
    //   builder: (context, themeMode, _) {
        return GetMaterialApp(
          navigatorKey: CraftyBay.globalKey,
          home: const SplashScreen(),
          initialBinding: StateHolderBinder(),
          theme: ThemeData(
            primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )
              ),
            ),
            inputDecorationTheme:  InputDecorationTheme(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )
              ),
            ),
            inputDecorationTheme:  InputDecorationTheme(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        //  themeMode: themeMode,
          );
     // }
    // );
  }


  @override
  void dispose() {
  _connectivityStatusStream.cancel();
    super.dispose();
  }
}

