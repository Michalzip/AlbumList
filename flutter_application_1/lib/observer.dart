import 'package:flutter_application_1/lib.dart';


class MyObserver extends BlocObserver{



void onChange(BlocBase bloc,Change changes){
  super.onChange(bloc, changes);
}

void onError(BlocBase bloc,Object error,StackTrace stackTrace){
  super.onError(bloc,error, stackTrace);
}

}