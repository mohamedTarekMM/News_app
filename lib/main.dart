
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/product_cubit.dart';
import 'package:product_app/cubit/product_state.dart';
import 'package:product_app/layout/news_layout.dart';
import 'package:product_app/modules/adaptive%20test/mobile_screen.dart';
import 'package:product_app/shared/dio_helper.dart';
import 'package:product_app/shared/shared_pref.dart';
import 'package:product_app/shared/themes.dart';

import 'modules/adaptive test/desktop_screen.dart';
import 'modules/home_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefGlobal.initShared();
  DioHelper.init();
  bool ?isDark = SharedPrefGlobal.getData(key: 'isDark');
  runApp( MyApp(isDark: isDark ?? false,));
}

class MyApp extends StatelessWidget {
  final  isDark;
   MyApp({Key? key,required this.isDark}) : super(key: key);
  //final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()..changeMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            //  onGenerateRoute: appRouter.generateRoute,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            darkTheme: dark_Theme,
            themeMode: NewsCubit.get(context).isDark?ThemeMode.dark : ThemeMode.light,
            theme: light_Theme,
            home: LayoutBuilder(builder: (context, constraints) {
              if(constraints.minWidth.toInt() <= 548){
                return MediaQuery(data: MediaQueryData(
                textScaleFactor: 0.9,
                ),child: MobileScreen());
              }else{
                return DesktopScreen();

              }
            }));
        },
      ),
    );
  }
}
