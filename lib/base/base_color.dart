part of 'base.dart';

class _Color {
  const _Color();

  Color get yellow => const Color(0xffF0D946);
  Color get baliHai => const Color(0xff838EAB);
  Color get wedgeWood => const Color(0xff5584AC);
  Color get coconutCream => const Color(0xffF6F2D4);
  Color get blumine => const Color(0xff22577E);
  Color get gurkha => const Color(0xff97947F);
  Color get silver => const Color(0xffBCBCBC);
  Color get grayChaeteau => const Color(0xffA9AEB2);
  Color get flushMahogany => _hexToColor("#C83434");
  Color get sinbad => _hexToColor("#95D1CC");
  Color get cinnabar => _hexToColor("#EB4335");
  Color get selectiveYellow => _hexToColor("#FBBC05");

  Color _hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
