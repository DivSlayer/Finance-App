import 'dart:async';
void setInterval(Function callback, Duration duration) {
  Timer.periodic(duration, (timer) {
    callback();
  });
}