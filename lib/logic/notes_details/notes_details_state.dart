part of 'notes_details_bloc.dart';

sealed class NotesDetailsBlocState{}

final class NotesDetailsInitial extends NotesDetailsBlocState{}

final class NotesDetailsSuccessState extends NotesDetailsBlocState{
  NotesDetailsSuccessState({required this.note});
  NoteModel? note;
}

final class NotesDetailsErrorState extends NotesDetailsBlocState{}