import 'package:book_app/core/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependancy_injection.dart';
import 'core/routers/routers.dart';
import 'core/routers/routers_name.dart';
import 'core/theme/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependancyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Book ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.backgroundColor,
          fontFamily: enFont, // "Roboto"
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,

          useMaterial3: true,
        ),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RoutesName.indexPage,
      ),
    );
  }
}
