import 'package:ayov2/helper/dialog.dart';
import 'package:ayov2/helper/toast.dart';

class Helper {
  final AyoDialog dialog = AyoDialog();
  final AyoToast toasts = AyoToast();

  String placeName(String description) {
    String result = '';

    if (description.length > 0)
      result = description.substring(0, description.indexOf(','));

    return result;
  }
}
