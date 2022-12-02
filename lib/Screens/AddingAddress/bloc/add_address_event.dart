part of 'add_address_bloc.dart';

abstract class AddAddressEvent extends Equatable {
  const AddAddressEvent();
}

class LoadAddAddressEvent extends AddAddressEvent {
  //passing the parameters to add address
  final String label, line1, line2, city, State, mobile, Status, pincode;
  LoadAddAddressEvent(this.mobile, this.label, this.line1, this.line2,
      this.city, this.State, this.Status, this.pincode);

  @override
  List<Object> get props => [];
}

class ErrorAddAddressEvent extends AddAddressEvent {
  @override
  List<Object> get props => [];
}
