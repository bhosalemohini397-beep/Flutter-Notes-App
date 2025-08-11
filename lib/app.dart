import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/data/services/network_api_service.dart';
import 'package:notes/logic/notes_details/notes_details_bloc.dart';
import 'package:notes/logic/notes_form/notes_form_bloc.dart';
import 'package:notes/logic/notes_list/notes_list_bloc.dart';
import 'package:notes/routes/app_routes_barrel.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}


class _MainAppState extends State<MainApp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      designSize: const Size(402,874),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NotesListBloc>(
            create: (context) => NotesListBloc(
              networkApiServices: NetworkApiService(), 
              router: _appRouter)
          ),
          BlocProvider<NotesFormBloc>(
            create: (context) => NotesFormBloc(
              networkApiServices: NetworkApiService(), 
              router: _appRouter)
          ),
          BlocProvider<NotesDetailsBloc>(
            create: (context) => NotesDetailsBloc(
              networkApiServices: NetworkApiService(), 
              router: _appRouter)
          ),
        ],
        child: MaterialApp.router(routerConfig: _appRouter.config(),)),
    );
  }
}