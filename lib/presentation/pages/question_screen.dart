import 'package:chatgpt_app/presentation/bloc/realtime_response_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final _questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatBloc = BlocProvider.of<RealTimeResponseBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Ask a Question')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Enter your question'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/response',
                  arguments: {'question': _questionController.text},
                );
              },
              child: Text('Ask'),
            ),
          ],
        ),
      ),
    );
  }
}
