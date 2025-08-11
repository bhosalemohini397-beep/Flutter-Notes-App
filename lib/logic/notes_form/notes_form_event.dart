part of 'notes_form_bloc.dart';

sealed class NotesFormEvent{}

class AddNoteEvent extends NotesFormEvent{
  AddNoteEvent({required this.title,required this.content});
  String title;
  String content;
}

class EditNoteEvent extends NotesFormEvent{
  EditNoteEvent({required this.note});
  NoteModel note;
}

