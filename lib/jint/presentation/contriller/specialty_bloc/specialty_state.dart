import 'package:equatable/equatable.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/entities/specialty/specialty.dart';

 class SpecialtyState extends Equatable {
  final List<Specialty>? getSpecialty;
  final RequestState? getSpecialtyState;
  final String? getSpecialtyMessage;


  final Specialty? addSpecialty;
  final RequestState? addSpecialtyState;
  final String? addSpecialtyMessage;


  final Specialty? updateSpecialty;
  final RequestState? updateSpecialtyState;
  final String? updateSpecialtyMessage;

  final Specialty? deleteSpecialty;
  final RequestState? deleteSpecialtyState;
  final String? deleteSpecialtyMessage;

  const SpecialtyState({
    this.getSpecialty = const [],
    this.getSpecialtyState = RequestState.loading,
    this.getSpecialtyMessage = "",

    this.addSpecialty,
    this.addSpecialtyState = RequestState.loading,
    this.addSpecialtyMessage = "",

    this.updateSpecialty,
    this.updateSpecialtyState = RequestState.loading,
    this.updateSpecialtyMessage = "",

    this.deleteSpecialty,
    this.deleteSpecialtyState = RequestState.loading,
    this.deleteSpecialtyMessage = ""});

  SpecialtyState copyWith({
     List<Specialty>? getSpecialty,
     RequestState? getSpecialtyState,
     String? getSpecialtyMessage,

     Specialty? addSpecialty,
     RequestState? addSpecialtyState,
     String? addSpecialtyMessage,

     Specialty? updateSpecialty,
     RequestState? updateSpecialtyState,
     String? updateSpecialtyMessage,

     Specialty? deleteSpecialty,
     RequestState? deleteSpecialtyState,
     String? deleteSpecialtyMessage,
}){
    return SpecialtyState(
      getSpecialty: getSpecialty??this.getSpecialty,
      getSpecialtyState: getSpecialtyState??this.getSpecialtyState,
      getSpecialtyMessage: getSpecialtyMessage??this.getSpecialtyMessage,

      addSpecialty: addSpecialty??this.addSpecialty,
      addSpecialtyState: addSpecialtyState??this.addSpecialtyState,
      addSpecialtyMessage: addSpecialtyMessage??this.addSpecialtyMessage,

      updateSpecialty: updateSpecialty??this.updateSpecialty,
      updateSpecialtyState: updateSpecialtyState??this.updateSpecialtyState,
      updateSpecialtyMessage: updateSpecialtyMessage??this.updateSpecialtyMessage,

      deleteSpecialty: deleteSpecialty??this.deleteSpecialty,
      deleteSpecialtyState: deleteSpecialtyState??this.deleteSpecialtyState,
      deleteSpecialtyMessage: deleteSpecialtyMessage??this.deleteSpecialtyMessage,
    );
  }
  @override
  List<Object?> get props =>
      [
        getSpecialty,
        getSpecialtyState,
        getSpecialtyMessage,
        addSpecialty,
        addSpecialtyState,
        addSpecialtyMessage,
        updateSpecialty,
        updateSpecialtyState,
        updateSpecialtyMessage,
        deleteSpecialty,
        deleteSpecialtyState,
        deleteSpecialtyMessage,
      ];

}



