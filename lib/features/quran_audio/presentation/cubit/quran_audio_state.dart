part of 'quran_audio_cubit.dart';

@immutable
sealed class QuranAudioState {}

final class QuranAudioInitial extends QuranAudioState {}

final class SelectSurahState extends QuranAudioState {}

final class AudioPlayerSeekState extends QuranAudioState {}

final class LoadingAudioState extends QuranAudioState {}

final class AudioIdleState extends QuranAudioState {}

final class AudioStopState extends QuranAudioState {}
