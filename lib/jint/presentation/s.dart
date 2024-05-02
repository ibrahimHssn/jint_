import 'package:flutter/material.dart';
import 'package:jint/jint/data/data_source/date_data_source/date_data_source.dart';
import 'package:jint/jint/data/data_source/login_data_source/login_data_source.dart';
import 'package:jint/jint/data/data_source/search_data_source/search_data_source.dart';
import 'package:jint/jint/data/repository/date_data_repository.dart';
import 'package:jint/jint/data/repository/login_repository.dart';
import 'package:jint/jint/data/repository/search_repository.dart';
import 'package:jint/jint/domain/repositort/base_date_repository.dart';
import 'package:jint/jint/domain/repositort/base_login_repositort.dart';
import 'package:jint/jint/domain/repositort/base_search_repository.dart';
import 'package:jint/jint/domain/usecase/search_use_case/search_use_case.dart';



class ss extends StatefulWidget {
  const ss({super.key});

  @override
  State<ss> createState() => _ssState();
}

class _ssState extends State<ss> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void initState() {
    super.initState();
    getData();

  }
}

void getData() async {
  BaseLoginDataSource baseLoginDataSource = LoginRemoteDataSource();
  BaseLoginRepository baseGetUserRepository = LoginRepository(
      baseLoginDataSource: baseLoginDataSource);
  // final login=GetLoginUseCase(baseLoginRepository: baseGetUserRepository).
  // call(const LoginParameters(userName: "Error44", password: "Error44"));
  BaseDateDataSource baseDateRemoteDataSource = DateRemoteDataSource();
  BaseDateRepository baseDateRepository = DateDataRepository(
      baseDateRemoteDataSource: baseDateRemoteDataSource);
  BaseSearchDataSource baseSearchDataSource =SearchRemoteDataSource();
  BaseSearchRepository baseSearchRepository =SearchRepository(baseSearchDataSource: baseSearchDataSource);
  SearchUseCase(baseSearchRepository: baseSearchRepository).call(
      const SearchParameters(
          pageNumber: 1, pageSize: 100, query: ""));

}