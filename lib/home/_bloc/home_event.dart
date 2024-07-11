part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ShowDialog extends HomeEvent {}

class EditEventScreen extends HomeEvent {
  final String name;
  final String phone;
  final String id;

  EditEventScreen({required this.name, required this.phone, required this.id});

  EditEventScreen copConact(String? name, String? phone, String? id) =>
      EditEventScreen(
          name: name ?? this.name,
          phone: phone ?? this.phone,
          id: id ?? this.id);
}

class EventLoadGetAllContact extends HomeEvent {}

class Edit extends HomeEvent {}

class Delete extends HomeEvent {
  final int id;

  Delete({required this.id});
}

class AddContact extends HomeEvent {}

class LoadHome extends HomeEvent {}
