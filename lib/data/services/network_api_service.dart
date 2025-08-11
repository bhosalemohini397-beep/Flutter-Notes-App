// lib/data/services/notes_service.dart
import 'package:notes/data/pojo/note_model.dart';
import 'package:uuid/uuid.dart';

class NetworkApiService {
  // Singleton instance
  static final NetworkApiService _instance = NetworkApiService._internal();

  // Factory constructor always returns the same instance
  factory NetworkApiService() => _instance;

  // Private constructor
  NetworkApiService._internal();

  // In-memory list of notes
  final List<NoteModel> _notes = [];

  // Simulate API delay
  Future<List<NoteModel>> fetchNotes() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_notes); // Return an unmodifiable copy
  }

  Future<NoteModel> addNote({required String title,required String content}) async {
    final note = NoteModel(
      id: const Uuid().v4(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _notes.add(note);
    return note;
  }

  Future<NoteModel?> getNoteById({required String id}) async {
    return _notes.firstWhere((note) => note.id == id);
  }

  Future<void> updateNote({required NoteModel updatedNote}) async {
    final index = _notes.indexWhere((n) => n.id == updatedNote.id);
    if (index != -1) {
      _notes[index] = updatedNote.copyWith(updatedAt: DateTime.now());
    }
  }

  Future<void> deleteNote({required String id}) async {
    _notes.removeWhere((n) => n.id == id);
  }
}
