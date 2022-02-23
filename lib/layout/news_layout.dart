import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/getwidget.dart';
import 'package:product_app/cubit/product_cubit.dart';
import 'package:product_app/cubit/product_state.dart';
import 'package:product_app/shared/shared_pref.dart';

import '../modules/search_page.dart';
import '../shared/constans.dart';

class NewLayoutsScreen extends StatefulWidget {
  const NewLayoutsScreen({Key? key}) : super(key: key);

  @override
  State<NewLayoutsScreen> createState() => _NewLayoutsScreenState();
}

class _NewLayoutsScreenState extends State<NewLayoutsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: const Text('News '),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context)=>NewsSearchScreen())
                    );
                  },
                  icon: const Icon(Icons.search_sharp),
                ),


              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  const DrawerHeader(child: Center(child: Text('NEWS APP',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))),
                  ListTile(
                    title: const Text('Night Mode'),
                    trailing: GFToggle(
                      value: NewsCubit.get(context).isDark,
                      onChanged: (value){
                        value = NewsCubit.get(context).changeMode();
                      },
                      type: GFToggleType.ios,
                    ),

                  ),
                  ListTile(
                    title: const Text('Country'),
                    trailing: CountryCodePicker(
                      onChanged: (value){
                        setState(() {
                          NewsCubit.get(context).change = true;
                          NewsCubit.get(context).DEAFULTCOUNTRYCODE = value.code!.toLowerCase();
                        });
                       // NewsCubit.get(context).changeCountryCode(value: value.code!.toLowerCase());
                        print(value.code!.toLowerCase());
                      },
                      showFlagMain: true,
                      closeIcon: const Icon(Icons.close),
                      showCountryOnly: true,
                      initialSelection: 'us',
                      hideMainText: true,
                      showFlag: true,
                      showOnlyCountryWhenClosed: true,
                    ),

                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: cubit.bottomItem,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        });
  }
}
