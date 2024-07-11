part of 'home_bloc.dart';

class HomeStateScreen {
  final bool? delete;
  final bool? edit;
  final bool? add;
  final List<MyContact>? data;

  HomeStateScreen({this.data, this.delete, this.edit, this.add});

  HomeStateScreen copContact(
          {bool? delete, bool? edit, List<MyContact>? data, bool? add}) =>
      HomeStateScreen(
          data: data ?? this.data,
          delete: delete ?? this.delete,
          edit: edit ?? this.edit,
          add: add ?? this.add);
}
