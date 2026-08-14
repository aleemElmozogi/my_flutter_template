part of 'theme_mode_cubit.dart';

class ThemeModeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeModeState(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}
