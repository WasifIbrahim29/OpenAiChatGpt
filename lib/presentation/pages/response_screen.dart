import 'package:chatgpt_app/presentation/bloc/realtime_response_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponseScreen extends StatefulWidget {
  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  @override
  void initState() {
    super.initState();
  }

  String response = '';

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    context.read<RealTimeResponseBloc>().add(arguments['question']);
    return Scaffold(
      appBar: AppBar(title: Text('Response')),
      body: BlocBuilder<RealTimeResponseBloc, Stream<String>>(
        builder: (context, state) {
          return StreamBuilder<String>(
            stream: state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != 'null') {
                  response = response + snapshot.data!;
                }
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(response),
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
