import 'package:equatable/equatable.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/entities/date/date.dart';

class DateState extends Equatable {
  final List<Date>? getDate;
  final RequestState? getDateState;
  final String? getDateMessage;

  final Date? addDate;
  final RequestState? addDateState;
  final String? addDateMessage;

  final Date? updateDate;
  final RequestState? updateDateState;
  final String? updateDateMessage;


  final Date? deleteDate;
  final RequestState? deleteDateState;
  final String? deleteDateMessage;

  const DateState({
    this.getDate = const[],
    this.getDateState = RequestState.loading,
    this.getDateMessage = "",

    this.addDate,
    this.addDateState = RequestState.loading,
    this.addDateMessage = "",

    this.updateDate,
    this.updateDateState = RequestState.loading,
    this.updateDateMessage = "",

    this.deleteDate,
    this.deleteDateState = RequestState.loading,
    this.deleteDateMessage = ""
  });

  DateState copyWith({
    List<Date>? getDate,
    RequestState? getDateState,
    String? getDateMessage,

    Date? addDate,
    RequestState? addDateState,
    String? addDateMessage,

    Date? updateDate,
    RequestState? updateDateState,
    String? updateDateMessage,

    Date? deleteDate,
    RequestState? deleteDateState,
    String? deleteDateMessage,
  }) {
    return DateState(
      getDate: getDate ?? this.getDate,
      getDateState: getDateState ?? this.getDateState,
      getDateMessage: getDateMessage ?? this.getDateMessage,

      addDate: addDate ?? this.addDate,
      addDateState: addDateState ?? this.addDateState,
      addDateMessage: addDateMessage ?? this.addDateMessage,

      updateDate: updateDate ?? this.updateDate,
      updateDateState: updateDateState ?? this.updateDateState,
      updateDateMessage: updateDateMessage ?? this.updateDateMessage,

      deleteDate: deleteDate ?? this.deleteDate,
      deleteDateState: deleteDateState ?? this.deleteDateState,
      deleteDateMessage: deleteDateMessage ?? this.deleteDateMessage,

    );
  }

  @override
  List<Object?> get props =>
      [
        getDate,
        getDateState,
        getDateMessage,
        addDate,
        addDateState,
        addDateMessage,
        updateDate,
        updateDateState,
        updateDateMessage,
        deleteDate,
        deleteDateState,
        deleteDateMessage,
      ];

}






