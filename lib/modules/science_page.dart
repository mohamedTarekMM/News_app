import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/product_cubit.dart';
import 'package:product_app/cubit/product_state.dart';

import '../shared/components.dart';


class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        bool isDark = NewsCubit.get(context).isDark;

        return Scaffold(
          body: listItems(list: list,context:  context,isDark: isDark),
        );
      },
    );
  }
}
