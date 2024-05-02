import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/usecase/date_details_use_case/add_date_details_use_case.dart';
import 'package:jint/jint/domain/usecase/date_details_use_case/date_details_parameters.dart';
import 'package:jint/jint/domain/usecase/date_details_use_case/delete_date_details_use_case.dart';
import 'package:jint/jint/domain/usecase/date_details_use_case/get_date_details_use_case.dart';
import 'package:jint/jint/domain/usecase/date_details_use_case/update_date_details_use_case.dart';
import 'package:jint/jint/presentation/contriller/date_details_bloc/date_details_state.dart';

import 'date_details_event.dart';

class DateDetailsBloc extends Bloc<DateDetailsEvent, DateDetailsState> {
  GetDateDetailsUseCase getDateDetailsUseCase;
  AddDateDetailsUseCase addDateDetailsUseCase;
  UpdateDateDetailsUseCase updateDateDetailsUseCase;
  DeleteDateDetailsUseCase dateDetailsUseCase;
  DateDetailsBloc(this.getDateDetailsUseCase,this.addDateDetailsUseCase,this.updateDateDetailsUseCase,this.dateDetailsUseCase) : super(const DateDetailsState()) {
    on<GetDateDetailsEvent>(_getDateDetails);
    on<AddDateDetailsEvent>(_addDateDetails);
    on<UpdateDateDetailsEvent>(_updateDateDetails);
    on<DeleteDateDetailsEvent>(_dateDetails);
  }

  FutureOr<void> _getDateDetails(GetDateDetailsEvent event, Emitter<DateDetailsState> emit) async{
    final result = await getDateDetailsUseCase(DateDetailsParameters(dateId: event.dateId));
    result.fold((l) => emit(state.copyWith(
      getDateDetailsState: RequestState.error,getDateDetailsMessage: l.massage,
    )), (r) => emit(state.copyWith(
      getDateDetails: r,
      getDateDetailsState: RequestState.loaded,
    )));
  }

  FutureOr<void> _addDateDetails(AddDateDetailsEvent event, Emitter<DateDetailsState> emit) async{
    final result = await addDateDetailsUseCase(DateDetailsParameters(dateId:event.dateId,startHour: event.startHour,endHour: event.endHour,startDay: event.startDay,endDay: event.endDay ));
    result.fold((l) => emit(state.copyWith(
      addDateDetailsState: RequestState.error,addDateDetailsMessage: l.massage,
    )), (r) => emit(state.copyWith(
      addDateDetails: r,
      addDateDetailsState: RequestState.loaded,
    )));
  }

  FutureOr<void> _updateDateDetails(UpdateDateDetailsEvent event, Emitter<DateDetailsState> emit)  async{
    final result = await updateDateDetailsUseCase(DateDetailsParameters(id: event.id,dateId:event.dateId,startHour: event.startHour,endHour: event.endHour,startDay: event.startDay,endDay: event.endDay ));
    result.fold((l) => emit(state.copyWith(
      updateDateDetailsState: RequestState.error,updateDateDetailsMessage: l.massage,
    )), (r) => emit(state.copyWith(
      updateDateDetails: r,
      updateDateDetailsState: RequestState.loaded,
    )));
  }

  FutureOr<void> _dateDetails(DeleteDateDetailsEvent event, Emitter<DateDetailsState> emit) async{
    final result = await dateDetailsUseCase(DateDetailsParameters(id: event.idDateDetails));
    result.fold((l) => emit(state.copyWith(
      deleteDateDetailsState: RequestState.error,deleteDateDetailsMessage: l.massage,
    )), (r) => emit(state.copyWith(
      deleteDateDetails: r,
      deleteDateDetailsState: RequestState.loaded,
    )));
  }
}
