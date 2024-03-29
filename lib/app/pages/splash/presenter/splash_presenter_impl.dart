import 'package:fwc_album_app/app/pages/splash/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './splash_presenter.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;
  @override
  Future<void> checkLogin() async {
    _view.showLoader();
    final sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString('accessToken');

    if (accessToken != null) {
      _view.logged(true);
    } else {
      _view.logged(false);
    }

    // Poderia ser
    // view.logged(accessToken != null);
  }

  @override
  set view(view) => _view = view;
}
