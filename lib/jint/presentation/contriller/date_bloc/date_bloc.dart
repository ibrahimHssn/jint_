import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/usecase/date_use_case/add_date_usecase.dart';
import 'package:jint/jint/domain/usecase/date_use_case/date_parameters.dart';
import 'package:jint/jint/domain/usecase/date_use_case/delete_date_usecase.dart';
import 'package:jint/jint/domain/usecase/date_use_case/get_date_usecase.dart';
import 'package:jint/jint/domain/usecase/date_use_case/update_date_usecase.dart';
import 'date_event.dart';
import 'date_state.dart';



class DateBloc extends Bloc<DateEvent, DateState> {
  GetDateUseCase getDateUseCase;
  AddDateUseCase  addDateUseCase;
  UpdateDateUseCase updateDateUseCase;
  DeleteDateUseCase deleteDateUseCase;
  DateBloc(this.getDateUseCase,this.addDateUseCase,this.updateDateUseCase,this.deleteDateUseCase) : super(const DateState()) {
    on<GetDateEvent>(_getDate) ;
    on<AddDateEvent>(_addDate) ;
    on<UpdateDateEvent>(_updateDate) ;
    on<DeleteDateEvent>(_deleteDate) ;
  }

  FutureOr<void> _getDate(GetDateEvent event, Emitter<DateState> emit) async{
    final result = await getDateUseCase(DateParameters(specialtyId: event.specialtyId));
    result.fold((l) => emit(state.copyWith(
      getDateState: RequestState.error,getDateMessage: l.massage,
    )), (r) => emit(state.copyWith(
      getDate: r,
      getDateState: RequestState.loaded,
    )));
  }

  FutureOr<void> _addDate(AddDateEvent event, Emitter<DateState> emit) async{
    final result = await addDateUseCase(DateParameters(specialtyId:event.specialtyId,dateName: event.dateName,dateType: event.dateType,
    isEndDate: event.isEndDate,country: event.country,dateNotes: event.dateNotes,buildingNumber: event.buildingNumber,maxClientDateNo: event.maxClientDateNo,
      isByGroub: event.isByGroub,isContinuous: event.isContinuous,endDateTime: event.endDateTime,startDateTime: event.startDateTime,
      governate: event.governate,regionCity: event.regionCity,street: event.street,floor: event.floor,room: event.room,postalCode: event.postalCode,dditionalInformation: event.dditionalInformation,
      landmark: event.landmark,latitude: event.latitude,longitude: event.longitude,
    ));
    result.fold((l) => emit(state.copyWith(
      addDateState: RequestState.error,addDateMessage: l.massage,
    )), (r) => emit(state.copyWith(
      addDate: r,
      addDateState: RequestState.loaded,
    )));
  }

  FutureOr<void> _updateDate(UpdateDateEvent event, Emitter<DateState> emit) async{
    final result = await updateDateUseCase(DateParameters(
      dateId:event.dateId,specialtyId:event.specialtyId,dateName: event.dateName,dateType: event.dateType,
      isEndDate: event.isEndDate,country: event.country,dateNotes: event.dateNotes,buildingNumber: event.buildingNumber,maxClientDateNo: event.maxClientDateNo,
      isByGroub: event.isByGroub,isContinuous: event.isContinuous,endDateTime: event.endDateTime,startDateTime: event.startDateTime,
      governate: event.governate,regionCity: event.regionCity,street: event.street,floor: event.floor,room: event.room,postalCode: event.postalCode,dditionalInformation: event.dditionalInformation,
      landmark: event.landmark,latitude: event.latitude,longitude: event.longitude,
    ));
    result.fold((l) => emit(state.copyWith(
      updateDateState: RequestState.error,updateDateMessage: l.massage,
    )), (r) => emit(state.copyWith(
      updateDate: r,
      updateDateState: RequestState.loaded,
    )));
  }

  FutureOr<void> _deleteDate(DeleteDateEvent event, Emitter<DateState> emit) async{
    final result = await deleteDateUseCase(DateParameters(dateId: event.dateId));

    result.fold((l) => emit(state.copyWith(
      deleteDateState: RequestState.error,deleteDateMessage: l.massage,
    )), (r) => emit(state.copyWith(
      deleteDate: r,
      deleteDateState: RequestState.loaded,
    )));
  }
}
