import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:get/get.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: INTRO_PAGE,
      binding: IntroPageBinding(),
      page: () => IntroPage(),
    ),
    GetPage(
      name: ONBOARDING_PAGE,
      binding: OnboardingPageBinding(),
      page: () => OnboardingPage(),
    ),
    GetPage(
      name: LOGIN_PAGE,
      binding: LoginPageBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: REGISTER_PAGE,
      binding: RegisterPageBinding(),
      page: () => RegisterPage(),
    ),
    GetPage(
      name: OTP_PAGE,
      binding: OtpPageBinding(),
      page: () => OtpPage(),
    ),
    GetPage(
      name: PHONE_LOGIN_PAGE,
      binding: PhoneLoginPageBinding(),
      page: () => PhoneLoginPage(),
    ),
    GetPage(
      name: APP_PAGE,
      binding: AppPageBinding(),
      page: () => AppPage(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: PRODUCT_FILTER_PAGE,
      binding: ProductFilterPageBinding(),
      page: () => ProductFilterPage(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: SEARCH_PAGE,
      binding: SearchPageBinding(),
      page: () => SearchPage(),
    ),
    GetPage(
      name: QR_PAGE,
      binding: QrScannerPageBinding(),
      page: () => QrScannerPage(),
    ),
    GetPage(
      name: CATEGORY_PAGE,
      binding: CategoryPageBinding(),
      page: () => CategoryPage(),
    ),
    GetPage(
      name: CATEGORY_DETAIL_PAGE,
      binding: CategoryDetailPageBinding(),
      page: () => CategoryDetailPage(),
    ),
    GetPage(
      name: PRODUCT_PAGE,
      binding: ProductPageBinding(),
      page: () => ProductPage(),
    ),
    GetPage(
      name: PRODUCT_DETAIL_PAGE,
      binding: ProductDetailPageBinding(),
      page: () => ProductDetailPage(),
    ),
    GetPage(
      name: CART_PAGE,
      binding: CartPageBinding(),
      page: () => CartPage(),
    ),
    GetPage(
      name: ORDER_SUMMARY_PAGE,
      binding: OrderSummaryPageBinding(),
      page: () => OrderSummaryPage(),
    ),
    GetPage(
      name: DELIVERY_DETAIL_PAGE,
      binding: DeliveryDetailPageBinding(),
      page: () => DeliveryDetailPage(),
    ),
    GetPage(
      name: MAP_PAGE,
      binding: MapPageBinding(),
      page: () => MapPage(),
    ),
    GetPage(
      name: ERROR_PAGE,
      page: () => ErrorPage(),
    ),
    GetPage(
      name: ORDER_PAGE,
      page: () => OrderPage(),
    ),
    GetPage(
      name: ORDER_COMPLETE_PAGE,
      binding: OrderCompletePageBinding(),
      page: () => OrderCompletePage(),
    ),
    GetPage(
      name: ORDER_DETAIL_PAGE,
      binding: OrderDetailPageBinding(),
      page: () => OrderDetailPage(),
    ),
    GetPage(
      name: CHAT_PAGE,
      binding: ChatPageBinding(),
      page: () => ChatPage(),
    ),
    GetPage(
      name: TRACKING_PAGE,
      binding: TrackingPageBinding(),
      page: () => TrackingPage(),
    ),
  ];
}
