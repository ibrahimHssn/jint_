import 'package:equatable/equatable.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/entities/date_details/date_details.dart';

class DateDetailsState extends Equatable {
  final List<DateDetails>? getDateDetails;
  final RequestState? getDateDetailsState;
  final String? getDateDetailsMessage;

  final DateDetails? addDateDetails;
  final RequestState? addDateDetailsState;
  final String? addDateDetailsMessage;

  final DateDetails? updateDateDetails;
  final RequestState? updateDateDetailsState;
  final String? updateDateDetailsMessage;

  final DateDetails? deleteDateDetails;
  final RequestState? deleteDateDetailsState;
  final String? deleteDateDetailsMessage;

  const DateDetailsState(
      {
        this.getDateDetails=const [],
       this.getDateDetailsState= RequestState.loading,
       this.getDateDetailsMessage="",

       this.addDateDetails,
       this.addDateDetailsState= RequestState.loading,
       this.addDateDetailsMessage="",

       this.updateDateDetails,
       this.updateDateDetailsState= RequestState.loading,
       this.updateDateDetailsMessage="",

       this.deleteDateDetails,
       this.deleteDateDetailsState= RequestState.loading,
       this.deleteDateDetailsMessage="",
      });

  DateDetailsState copyWith({
    List<DateDetails>? getDateDetails,
    RequestState? getDateDetailsState,
    String? getDateDetailsMessage,

    DateDetails? addDateDetails,
    RequestState? addDateDetailsState,
    String? addDateDetailsMessage,

    DateDetails? updateDateDetails,
    RequestState? updateDateDetailsState,
    String? updateDateDetailsMessage,

    DateDetails? deleteDateDetails,
    RequestState? deleteDateDetailsState,
    String? deleteDateDetailsMessage,
  }) {
    return DateDetailsState(
      getDateDetails: getDateDetails ?? this.getDateDetails,
      getDateDetailsState: getDateDetailsState ?? this.getDateDetailsState,
      getDateDetailsMessage: getDateDetailsMessage ??
          this.getDateDetailsMessage,


      addDateDetails: addDateDetails ?? this.addDateDetails,
      addDateDetailsState: addDateDetailsState ?? this.addDateDetailsState,
      addDateDetailsMessage: addDateDetailsMessage ??
          this.addDateDetailsMessage,


      updateDateDetails: updateDateDetails ?? this.updateDateDetails,
      updateDateDetailsState: updateDateDetailsState ??
          this.updateDateDetailsState,
      updateDateDetailsMessage: updateDateDetailsMessage ??
          this.updateDateDetailsMessage,

      deleteDateDetails: deleteDateDetails ?? this.deleteDateDetails,
      deleteDateDetailsState: deleteDateDetailsState ??
          this.deleteDateDetailsState,
      deleteDateDetailsMessage: deleteDateDetailsMessage ??
          this.deleteDateDetailsMessage,

    );
  }

  @override
  List<Object?> get props =>
      [
        getDateDetails,
        getDateDetailsState,
        getDateDetailsMessage,
        addDateDetails,
        addDateDetailsState,
        addDateDetailsMessage,
        updateDateDetails,
        updateDateDetailsState,
        updateDateDetailsMessage,
        deleteDateDetails,
        deleteDateDetailsState,
        deleteDateDetailsMessage,
      ];
}