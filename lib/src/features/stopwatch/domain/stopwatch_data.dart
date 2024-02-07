class StopwatchData {
  const StopwatchData({
    this.previouslyElapsed = Duration.zero,
    this.currentlyElapsed = Duration.zero,
    this.isRunning = false,
  });
  final Duration previouslyElapsed;
  final Duration currentlyElapsed;
  final bool isRunning;

  Duration get totalElapsed => previouslyElapsed + currentlyElapsed;

  StopwatchData copyWith({
    Duration? previouslyElapsed,
    Duration? currentlyElapsed,
    bool? isRunning,
  }) {
    return StopwatchData(
      previouslyElapsed: previouslyElapsed ?? this.previouslyElapsed,
      currentlyElapsed: currentlyElapsed ?? this.currentlyElapsed,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}
