import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_sale_boss/config/app_theme.dart';
import 'package:smart_sale_boss/config/root_binding.dart';
import 'package:smart_sale_boss/core/services/lang_service.dart';
import 'package:smart_sale_boss/core/services/root_service.dart';
import 'package:smart_sale_boss/presentation/pages/main_page/main_page.dart';
import 'package:smart_sale_boss/presentation/pages/payment_details_page/payment_details_page.dart';
import 'package:smart_sale_boss/presentation/pages/splash_page/splash_page.dart';

void main() async {
  await RootService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        builder: (context, _) {
          return GetMaterialApp(
            title: 'Xon Invest',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
            scrollBehavior: const ScrollBehavior().copyWith(
                overscroll: false, physics: const ClampingScrollPhysics()),
            initialBinding: RootBinding(),
            // navigatorKey: RootService.alice.getNavigatorKey(),
            //Language setting
            fallbackLocale: LangService.fallbackLocale,
            supportedLocales: LangService.locales,
            locale: LangService.locale,
            translations: LangService(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 100),
            initialRoute: SplashPage.id,
            routes: {
              SplashPage.id: (context) => const SplashPage(),
              MainPage.id: (context) => const MainPage(),
              PaymentDetailsPage.id: (context) => const PaymentDetailsPage(),
            },
            builder: (context, child) {
              return MediaQuery(
                // ignore: deprecated_member_use
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
