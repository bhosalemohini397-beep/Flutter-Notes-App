part of 'notes_form_bloc.dart';

sealed class NotesFormBlocState{}

final class NotesFormInitial extends NotesFormBlocState{}

final class AddNoteSuccessState extends NotesFormBlocState{}

final class AddNoteErrorState extends NotesFormBlocState{}

