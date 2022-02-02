part of 'base.dart';

class _Image {
  const _Image();
  static const _path = "images/";
  String get icLogin => _path + "ic_login.png";
  String get icGoogle => _path + "ic_google.png";
  String get icEyeClose => _path + "ic_eye_close.png";
  String get icRegister => _path + "ic_register.png";
  String get icWallet => _path + "ic_wallet.png";
  String get icDanger => _path + "ic_danger.png";
  String get icStar => _path + "ic_star.png";

  String get icCalendar => _path + "ic_calendar.png";
  String get icCalendar2 => _path + "ic_calendar2.png";
  String get icHome => _path + "ic_home.png";
  String get icNotif => _path + "ic_notif.png";
  String get icSetting => _path + "ic_setting.png";
  String get icTransaction => _path + "ic_transaction.png";
}

class _String {
  const _String();

  List<String> get listJenjang => [
        // TODO move to database
        "TK",
        "SD 1-3",
        "SD 4-5",
        "SD 6",
        "SMP 1-2",
        "SMP 3",
        "SMA 1-2",
        "SMA 3",
        "Umum",
        "TK",
        "SD 1-3",
        "SD 4-5",
        "SD 6",
        "SMP 1-2",
        "SMP 3",
        "SMA 1-2",
        "SMA 3",
        "Umum",
      ];

  List<String> get listMapel => [
        "Matematika",
        "Bahasa Indonesia",
        "Bahasa Inggris",
        "Biologi",
        "Kimia",
        "Fisika",
        "Ekonomi",
        "Geografi",
        "Sejarah",
      ];
  List<String> get listCategory => ["SENIOR", "PALING SESUAI", "TARIF NORMAL"];
}

class _Font {
  const _Font();

  // String get notoSans => "NotoSans";
  // String get poppins => "Poppins";
}
