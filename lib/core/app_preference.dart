import 'package:ayov2/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  Future<CustomerModel> customer({CustomerModel data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (data != null) {
      prefs.setString('id', data.customerId);
      prefs.setString('phone', data.customerPhone);
      prefs.setString('name', data.customerName);
      prefs.setString('email', data.customerEmail);
      prefs.setString('fcm', data.customerFcm);
      prefs.setInt('point', data.customerPoint);
      prefs.setString('token', data.customerToken);

      return data;
    } else {
      if (prefs.getString('id') == null) {
        return null;
      } else {
        return CustomerModel(
          customerId: prefs.getString('id'),
          customerPhone: prefs.getString('phone'),
          customerName: prefs.getString('name'),
          customerEmail: prefs.getString('email'),
          customerFcm: prefs.getString('fcm'),
          customerPoint: prefs.getInt('point'),
          customerToken: prefs.getString('token'),
        );
      }
    }
  }
}
