import 'package:flutter/material.dart';
import 'package:flutter_projects/model/login/login_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingStates extends SearchState{}

class SearchSuccessStates extends SearchState{}

class SearchErrorStates extends SearchState{}
