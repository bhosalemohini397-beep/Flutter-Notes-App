part of 'notes_list_bloc.dart';

sealed class NotesListBlocState{}

final class NotesInitial extends NotesListBlocState{}

final class NotesSuccess extends NotesListBlocState{
  NotesSuccess({required this.notes});
  List<NoteModel>? notes;
}

final class NotesError extends NotesListBlocState{}


