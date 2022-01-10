import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:limar/models/models.dart';
import 'package:limar/services/services.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  Future<void> getDatas() async {
    ApiReturnValue<List<Data>> result = await DataServices.getDatas();

    if (result.value != null) {
      emit(DataLoaded(result.value));
    } else {
      emit(DataLoadingFailed(result.message));
    }
  }

  Future<void> saveData(Data data, {File pictureAudit}) async {
    ApiReturnValue<Data> result =
        await DataServices.saveData(data, pictureAudit: pictureAudit);

    if (result.value != null) {
      emit(DataLoaded((state as DataLoaded).datas + [result.value]));
      return result.value;
    } else {
      return null;
    }

    // if (result.value != null) {
    //   emit(DataLoaded(result.value));
    // } else {
    //   emit(DataLoadingFailed(result.message));
    // }
  }

  // Future<void> uploadAuditPicture(File pictureAudit) async {
  //   ApiReturnValue<String> result =
  //       await DataServices.uploadAuditPicture(pictureAudit);

  //   if (result.value != null) {
  //     emit(DataLoaded((state as DataLoaded).datas.copyWith(
  //         picturePath:
  //             "https://b052-114-124-204-147.ngrok.io/storage/" + result.value)));
  //   }
  // }
}
