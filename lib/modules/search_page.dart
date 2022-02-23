import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/product_cubit.dart';
import 'package:product_app/cubit/product_state.dart';
import 'package:product_app/shared/components.dart';

class NewsSearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultTextForm(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    label: 'Search',
                  outlineInputBorder: const OutlineInputBorder(),
                  onChanged: (value){
                      value = searchController.text;
                      NewsCubit.get(context).getSearch(value: value);
                  },
                ),
                Expanded(
                  child: listItems(
                      list: list,
                      context: context,
                      isDark: NewsCubit.get(context).isDark,
                      isSearch: true),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
