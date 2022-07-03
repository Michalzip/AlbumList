import 'package:flutter/material.dart';
import 'package:flutter_application_1/lib.dart';
import 'package:flutter_application_1/model.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/service.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class AppState {}

class ApiInitial extends AppState {}

class ApiSuccess extends AppState {
  ApiSuccess({required this.gallery});

  final List<dynamic> gallery;
}

class ApiError extends AppState {
  ApiError({required this.error});

  final String error;
}

abstract class AppEvent {}

class GetApi extends AppEvent {}

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(ApiInitial()) {
    on<GetApi>(_onGetApi);
  }

  Future<void> _onGetApi(GetApi event, Emitter<AppState> emit) async {
    try {
      final noteApi =
          await fetchNotes('https://jsonplaceholder.typicode.com/albums');

      emit(ApiSuccess(gallery: noteApi));
    } catch (e) {
      emit(ApiError(error: e.toString()));
    }
  }
}
