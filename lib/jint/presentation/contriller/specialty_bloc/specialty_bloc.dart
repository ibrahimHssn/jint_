
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/add_specialty_usecase.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/delete_specialty_usecase.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/get_specialty_usecase.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/specialty_parameters.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/update_specialty_usecase.dart';

import 'specialty_event.dart';
import 'specialty_state.dart';

class SpecialtyBloc extends Bloc<SpecialtyEvent, SpecialtyState>{
  GetSpecialtyUseCase getSpecialtyUseCase;
  AddSpecialtyUseCase addSpecialtyUseCase;
  UpdateSpecialtyUseCase updateSpecialtyUseCase;
  DeleteSpecialtyUseCase deleteSpecialtyUseCase;
  SpecialtyBloc(this.getSpecialtyUseCase,this.addSpecialtyUseCase,this.updateSpecialtyUseCase,this.deleteSpecialtyUseCase) : super(const SpecialtyState()) {
    on<GetSpecialtyEvent>(_getSpecialty);
    on<AddSpecialtyEvent>(_addSpecialty);
    on<UpdateSpecialtyEvent>(_updateSpecialty);
    on<DeleteSpecialtyEvent>(_deleteSpecialty);
  }

  FutureOr<void> _getSpecialty(GetSpecialtyEvent event, Emitter<SpecialtyState> emit) async{
    final result = await getSpecialtyUseCase(SpecialtyParameters(pageSize: event.pageSize,pageNumber: event.pageNumber));
    result.fold((l) => emit(state.copyWith(getSpecialtyState: RequestState.error,
            getSpecialtyMessage: l.massage)), (r) => emit(state.copyWith(getSpecialtyState: RequestState.loaded,getSpecialty: r)));
  }

  FutureOr<void> _addSpecialty(AddSpecialtyEvent event, Emitter<SpecialtyState> emit) async{
    final result = await addSpecialtyUseCase(SpecialtyParameters(
      name: event.name,
      jopName: event.jopName,
      price: event.price,
        color: event.color,
      isPublic: event.isPublic,
      notes: event.notes,
      ownerId: event.ownerId,
      code: event.code,
    ));
    result.fold((l) => emit(state.copyWith(addSpecialtyState: RequestState.error,
        addSpecialtyMessage: l.massage)), (r) => emit(state.copyWith(addSpecialtyState: RequestState.loaded,addSpecialty: r)));


  }

  FutureOr<void> _updateSpecialty(UpdateSpecialtyEvent event, Emitter<SpecialtyState> emit)  async{
    final result = await updateSpecialtyUseCase(SpecialtyParameters(
      id: event.id,
      name: event.name,
      jopName: event.jopName,
      price: event.price,
      color: event.color,
      isPublic: event.isPublic,
      notes: event.notes,
      ownerId: event.ownerId,
      code: event.code,
    ));
    result.fold((l) => emit(state.copyWith(
            updateSpecialtyState: RequestState.error,
            updateSpecialtyMessage: l.massage)), (r) => emit(state.copyWith(updateSpecialtyState: RequestState.loaded, updateSpecialty: r)));
  }

  FutureOr<void> _deleteSpecialty(DeleteSpecialtyEvent event, Emitter<SpecialtyState> emit)  async{
    final result = await deleteSpecialtyUseCase(SpecialtyParameters(
      id: event.specialtyId,
    ));
    result.fold((l) => emit(state.copyWith(
        deleteSpecialtyState: RequestState.error,
        deleteSpecialtyMessage: l.massage)), (r) => emit(state.copyWith(deleteSpecialtyState: RequestState.loaded, deleteSpecialty: r)));
  }
}
