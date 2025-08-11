part of 'notes_list_bloc.dart';

sealed class NotesListEvent{}

class FetchNotesEvent extends NotesListEvent{}

class DeleteNoteEvent extends NotesListEvent{
  DeleteNoteEvent({required this.id});
  String id;
}


