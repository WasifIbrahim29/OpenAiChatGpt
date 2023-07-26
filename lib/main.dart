import 'package:chatgpt_app/data/datasources/remote_data_source.dart';
import 'package:chatgpt_app/presentation/bloc/realtime_response_bloc.dart';
import 'package:chatgpt_app/presentation/pages/question_screen.dart';
import 'package:chatgpt_app/presentation/pages/response_screen.dart';
import 'package:chatgpt_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/realtime_response_respository_impl.dart';
import 'domain/usecases/get_realtime_response.dart';

void main() {
  runApp(ChatGPTApp());
}

class ChatGPTApp extends StatelessWidget {
  final ApiService apiService =
      ApiService('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');

  final GetRealTimeResponse repository = GetRealTimeResponse(
      RealTimeRepositoryImpl(remoteDataSource: RemoteDataSourceImpl()));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider<RealTimeResponseBloc>(
              create: (context) => RealTimeResponseBloc(repository),
              child: QuestionScreen(),
            ),
        '/response': (context) => BlocProvider<RealTimeResponseBloc>(
              create: (context) => RealTimeResponseBloc(repository),
              child: ResponseScreen(),
            ),
      },
    );
  }
}
