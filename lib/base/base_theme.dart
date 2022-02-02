part of 'base.dart';

class _Button {
  const _Button();
  Color get _defaultColor => C.color.blumine;

  MaterialStateProperty<OutlinedBorder> get outlineBorder =>
      MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(C.num.getSize(20)),
        ),
      );

  MaterialStateProperty<Size> get minimumSize =>
      MaterialStateProperty.all<Size>(Size(0, C.num.getSize(52)));

  MaterialStateProperty<Color> get backgroundColor =>
      MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return C.color.silver;
          return C.color.blumine; // Use the component's default.
        },
      );

  MaterialStateProperty<Color> get foregroundColor =>
      MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return Colors.white;
          return Colors.white; // Use the component's default.
        },
      );

  MaterialStateProperty<Color> get opacityColor =>
      MaterialStateProperty.all<Color>(_defaultColor.withOpacity(0.1));

  OutlinedButtonThemeData get outlineButtonTheme => OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: T.button.backgroundColor,
          overlayColor: T.button.opacityColor,
          minimumSize: T.button.minimumSize,
          shape: T.button.outlineBorder,
        ),
      );

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: elevatedStyle,
      );

  ButtonStyle get elevatedStyle => ButtonStyle(
      backgroundColor: T.button.backgroundColor,
      minimumSize: T.button.minimumSize,
      shape: T.button.outlineBorder,
      foregroundColor: foregroundColor,
      textStyle: MaterialStateProperty.all<TextStyle>(T.text.notoStyle));
}

class _Text {
  const _Text();
  TextStyle get notoStyle => TextStyle();
}

class _Decoration {
  const _Decoration();

  BoxDecoration get card => BoxDecoration(
        color: C.color.coconutCream,
        borderRadius: BorderRadius.circular(16),
      );

  InputDecorationTheme get input => InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        iconColor: Colors.black,
        contentPadding: EdgeInsets.symmetric(
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      );

  BoxDecoration get item => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      );
}
