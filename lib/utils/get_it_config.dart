import 'package:get_it/get_it.dart';
import 'package:github_app/utils/api_config.dart';
import 'package:github_app/services/gift_api.dart';

Future<void> setupDepedencyInjection() async {
  GetIt.I.registerSingleton<GiftApi>(GiftApi(ApiConfig.createInstance()));
  // GetIt.I
  //     .registerSingletonAsync<WishlistRepo>(() async => WishlistRepo().init());
  await GetIt.I.allReady();
}
