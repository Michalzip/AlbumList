import 'package:flutter/material.dart';
import 'package:flutter_application_1/lib.dart';
import 'package:flutter_application_1/bloc.dart';
import 'package:flutter_application_1/widgets/widgtes.dart';
import 'package:flutter_application_1/model.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AppBloc()..add(GetApi()), child: NoteView());
  }
}

class NoteView extends StatelessWidget {
  const NoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ApiModel model;
    return Scaffold(
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        if (state is ApiInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ApiSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.gallery.length,
            itemBuilder: (context, index) {
              return Gallery(model: state.gallery[index]);
            },
          );
        }

        if (state is ApiError) {
          return Column(
            children: [
              const Text(
                'CHECK INTERNET CONNECTION',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Center(
                child: Text(state.error),
              ),
              FloatingActionButton(
                onPressed: () => context.read<AppBloc>().add(GetApi()),
                child: new Icon(Icons.refresh),
              ),
            ],
          );
        }

        return throw Exception('EXCEPTION HERE ;C');
      }),
    );
  }
}
