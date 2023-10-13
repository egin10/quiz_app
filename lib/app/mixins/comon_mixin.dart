import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';

mixin CommonMixin on BaseViewModel {
  void share(String urlShare) async {
    await Share.share(urlShare);
  }
}
