import 'package:equatable/equatable.dart';

abstract class AccountRgistrationEvent extends Equatable {
  const AccountRgistrationEvent();
}


class AccountRgistrationJintEvent extends AccountRgistrationEvent{
  final String name;
  final String userName;
  final String phoneNumber;
  final String password;

  const AccountRgistrationJintEvent({required this.name, required this.userName, required this.phoneNumber, required this.password});


  @override
  List<Object> get props => [name, userName, phoneNumber, password];

}