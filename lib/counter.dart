import 'dart:async';

class CounterTimer {
  int start;
  int end;
  int intervalMs;
  Function(int) onTick;
  Timer? _timer;
  int _currentValue;

  CounterTimer({
    required this.start,
    required this.end,
    required this.intervalMs,
    required this.onTick,
  }) : _currentValue = start;

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: intervalMs), (timer) {
      if (_currentValue < end) {
        _currentValue++;
        onTick(_currentValue);
      } else {
        _timer?.cancel();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void updateInterval(int startTime, int endtime, int newIntervalMs) {
    intervalMs = newIntervalMs;
    end = endtime;
    start = startTime;
    stopTimer();
    startTimer();
  }

  int getCurrentValue() {
    return _currentValue;
  }
}
