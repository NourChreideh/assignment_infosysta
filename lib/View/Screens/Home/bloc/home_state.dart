// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

 class HomeInitial extends HomeState {}
 class HomeLoading extends HomeState {}
 class HomeLoaded extends HomeState {

  List<DataModel> datalist;
 
  HomeLoaded({required this.datalist});
 }
class HomeScroll extends HomeState{
  
  List<DataModel> datalist;
 
  HomeScroll({required this.datalist});
}

class HomeError extends HomeState {}