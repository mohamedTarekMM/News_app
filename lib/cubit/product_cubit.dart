import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/product_state.dart';
import 'package:product_app/modules/home_page.dart';
import 'package:product_app/modules/science_page.dart';
import 'package:product_app/modules/sports_page.dart';
import 'package:product_app/shared/dio_helper.dart';
import 'package:product_app/shared/shared_pref.dart';

import '../shared/constans.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(InitShopState());
  int currentIndex = 0;
  static NewsCubit get (context) =>BlocProvider.of(context);
  List<Widget> screens =[
    HomeScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem>bottomItem=[
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp),label: 'Business News'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports),label: 'Sports News'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined),label: 'Science News'),
  ];
  String DEAFULTCOUNTRYCODE = 'fr';
  void changeBottomNav(index){
    currentIndex = index ;
    emit(NewsBottomNavState());
  }
  changeCountryCode({required String value}){
    DEAFULTCOUNTRYCODE = value;
    emit(ChangeCountryCode());
  }
  bool change = false;
  List business = [];
    getBusiness(){
    DioHelper.getData(path: 'v2/top-headlines',query: {
      'country': DEAFULTCOUNTRYCODE,
      'category':'business',
      'apiKey':'72790f99830c4be79aa4ef06fad391a1'
    }).then((value) {
      business = value.data['articles'];
      emit(GetBusinessNewsSuccessfully());
    }).catchError((error){
      print(error.toString());
      emit(GetBusinessNewsError());
    });
  }

  List science = [];
  getScience(){
    DioHelper.getData(path: 'v2/top-headlines',query: {
      'country': DEAFULTCOUNTRYCODE,
      'category':'science',
      'apiKey':'72790f99830c4be79aa4ef06fad391a1'
    }).then((value) {
      science = value.data['articles'];
      emit(GetScienceNewsSuccessfully());
    }).catchError((error){
      print(error.toString());
      emit(GetScienceNewsError());
    });
  }

  List sports = [];
  getSports(){
    DioHelper.getData(path: 'v2/top-headlines',query: {
      'country': DEAFULTCOUNTRYCODE,
      'category':'sports',
      'apiKey':'72790f99830c4be79aa4ef06fad391a1'
    }).then((value) {
      sports = value.data['articles'];
      emit(GetSportsNewsSuccessfully());
    }).catchError((error){
      print(error.toString());
      emit(GetSportsNewsError());
    });
  }

  bool isDark = false;
  changeMode({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
      emit(ChangeThemeMode());
    }else{
      isDark = !isDark;
      SharedPrefGlobal.saveShopData(key: 'isDark', value: isDark).then((value){
        emit(ChangeThemeMode());
      }).catchError((error){
        print('Error in Change mode${error.toString()} ');
      });
    }
  }

  List search =[];
  getSearch({required value}){
    search = [];
    DioHelper.getData(path: 'v2/everything',query: {
      'q': value,
      'apiKey':'72790f99830c4be79aa4ef06fad391a1'
    }).then((value) {
      search = value.data['articles'];
      emit(GetSearchNewsSuccessfully());
    }).catchError((error){
      print(error.toString());
      emit(GetSearchNewsError());
    });
  }
}