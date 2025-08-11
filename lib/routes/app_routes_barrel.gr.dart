// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:notes/data/pojo/note_model.dart' as _i7;
import 'package:notes/presentation/screens/notes_details.dart' as _i1;
import 'package:notes/presentation/screens/notes_form.dart' as _i2;
import 'package:notes/presentation/screens/notes_list.dart' as _i3;
import 'package:notes/presentation/screens/splash.dart' as _i4;

/// generated route for
/// [_i1.NotesDetailsScreen]
class NotesDetailsRoute extends _i5.PageRouteInfo<NotesDetailsRouteArgs> {
  NotesDetailsRoute({
    _i6.Key? key,
    required String? title,
    required String? id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         NotesDetailsRoute.name,
         args: NotesDetailsRouteArgs(key: key, title: title, id: id),
         initialChildren: children,
       );

  static const String name = 'NotesDetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotesDetailsRouteArgs>();
      return _i1.NotesDetailsScreen(
        key: args.key,
        title: args.title,
        id: args.id,
      );
    },
  );
}

class NotesDetailsRouteArgs {
  const NotesDetailsRouteArgs({
    this.key,
    required this.title,
    required this.id,
  });

  final _i6.Key? key;

  final String? title;

  final String? id;

  @override
  String toString() {
    return 'NotesDetailsRouteArgs{key: $key, title: $title, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NotesDetailsRouteArgs) return false;
    return key == other.key && title == other.title && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i2.NotesFormScreen]
class NotesFormRoute extends _i5.PageRouteInfo<NotesFormRouteArgs> {
  NotesFormRoute({
    _i6.Key? key,
    required bool isFromEdit,
    _i7.NoteModel? note,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         NotesFormRoute.name,
         args: NotesFormRouteArgs(key: key, isFromEdit: isFromEdit, note: note),
         initialChildren: children,
       );

  static const String name = 'NotesFormRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotesFormRouteArgs>();
      return _i2.NotesFormScreen(
        key: args.key,
        isFromEdit: args.isFromEdit,
        note: args.note,
      );
    },
  );
}

class NotesFormRouteArgs {
  const NotesFormRouteArgs({this.key, required this.isFromEdit, this.note});

  final _i6.Key? key;

  final bool isFromEdit;

  final _i7.NoteModel? note;

  @override
  String toString() {
    return 'NotesFormRouteArgs{key: $key, isFromEdit: $isFromEdit, note: $note}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NotesFormRouteArgs) return false;
    return key == other.key &&
        isFromEdit == other.isFromEdit &&
        note == other.note;
  }

  @override
  int get hashCode => key.hashCode ^ isFromEdit.hashCode ^ note.hashCode;
}

/// generated route for
/// [_i3.NotesListScreen]
class NotesListRoute extends _i5.PageRouteInfo<void> {
  const NotesListRoute({List<_i5.PageRouteInfo>? children})
    : super(NotesListRoute.name, initialChildren: children);

  static const String name = 'NotesListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.NotesListScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
