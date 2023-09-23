import 'package:toast/toast.dart';

Future<bool> onWillPop(context) async {
  ToastContext().init(context);
  Toast.show(
    "You can't go back at the moment",
    duration: 2,
    gravity: Toast.bottom,
    
  );
  return false;
}
