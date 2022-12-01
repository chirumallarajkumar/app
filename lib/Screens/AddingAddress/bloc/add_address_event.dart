part of 'add_address_bloc.dart';

abstract class AddAddressEvent extends Equatable {
  const AddAddressEvent();
}
class LoadAddAddressEvent extends AddAddressEvent{
  //passing the parameters to add address
final String mobile;
LoadAddAddressEvent(this.mobile);

@override
  List<Object> get props => [];
}
class ErrorAddAddressEvent extends AddAddressEvent{
@override
  List<Object> get props => [];
}