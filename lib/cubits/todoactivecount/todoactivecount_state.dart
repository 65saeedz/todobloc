part of 'todoactivecount_cubit.dart';

class TodoactivecountState extends Equatable {
  final int activeCount;

  TodoactivecountState({required this.activeCount});
  factory TodoactivecountState.initial() {
    return TodoactivecountState(activeCount: 3);
  }
  @override
  List<Object> get props => [activeCount];

  TodoactivecountState copyWith({
    int? activeCount,
  }) {
    return TodoactivecountState(
      activeCount: activeCount ?? this.activeCount,
    );
  }

  @override
  String toString() => 'TodoactivecountState(activeCount: $activeCount)';
}
