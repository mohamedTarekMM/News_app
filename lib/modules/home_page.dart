import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/product_cubit.dart';
import 'package:product_app/cubit/product_state.dart';
import 'package:product_app/shared/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var list = NewsCubit.get(context).business;
            bool isDark = NewsCubit.get(context).isDark;

            return Scaffold(
              body: RefreshIndicator(
                onRefresh: onRefreshFun,
                  edgeOffset: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                  color: Colors.white,
                  child: listItems(list: list,context:  context,isDark: isDark)),
            );
          },
        );
      }
    );
  }
  Future onRefreshFun()async{
    await Future.delayed(Duration(seconds: 1));
    var list = NewsCubit.get(context).business;
  }
}
