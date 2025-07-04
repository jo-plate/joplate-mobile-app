// GENERATED FILE, do not edit!
// ignore_for_file: annotate_overrides, non_constant_identifier_names, prefer_single_quotes, unused_element, unused_field
import 'package:i18n/i18n.dart' as i18n;
import 'messages.i18n.dart';

String get _languageCode => 'ar';
String _plural(
  int count, {
  String? zero,
  String? one,
  String? two,
  String? few,
  String? many,
  String? other,
}) => i18n.plural(
  count,
  _languageCode,
  zero: zero,
  one: one,
  two: two,
  few: few,
  many: many,
  other: other,
);
String _ordinal(
  int count, {
  String? zero,
  String? one,
  String? two,
  String? few,
  String? many,
  String? other,
}) => i18n.ordinal(
  count,
  _languageCode,
  zero: zero,
  one: one,
  two: two,
  few: few,
  many: many,
  other: other,
);
String _cardinal(
  int count, {
  String? zero,
  String? one,
  String? two,
  String? few,
  String? many,
  String? other,
}) => i18n.cardinal(
  count,
  _languageCode,
  zero: zero,
  one: one,
  two: two,
  few: few,
  many: many,
  other: other,
);

class MessagesAr extends Messages {
  const MessagesAr();
  String get locale => "ar";
  String get languageCode => "ar";
  AppMessagesAr get app => AppMessagesAr(this);
  HomeMessagesAr get home => HomeMessagesAr(this);
  ProfileMessagesAr get profile => ProfileMessagesAr(this);
  FooterMessagesAr get footer => FooterMessagesAr(this);
  EditprofileMessagesAr get editprofile => EditprofileMessagesAr(this);
  PlanMessagesAr get plan => PlanMessagesAr(this);
  FavoritesScMessagesAr get favoritesSc => FavoritesScMessagesAr(this);
  PhonesMessagesAr get phones => PhonesMessagesAr(this);
  PlatesMessagesAr get plates => PlatesMessagesAr(this);
  DigitcountsMessagesAr get digitcounts => DigitcountsMessagesAr(this);
  FormatsMessagesAr get formats => FormatsMessagesAr(this);
  AddphonenumberMessagesAr get addphonenumber => AddphonenumberMessagesAr(this);
  AddplateMessagesAr get addplate => AddplateMessagesAr(this);
  AddphonerequestMessagesAr get addphonerequest =>
      AddphonerequestMessagesAr(this);
  AddplaterequestMessagesAr get addplaterequest =>
      AddplaterequestMessagesAr(this);
  ListingdetailsMessagesAr get listingdetails => ListingdetailsMessagesAr(this);
  PhonedetailsMessagesAr get phonedetails => PhonedetailsMessagesAr(this);
  SellerdetailsMessagesAr get sellerdetails => SellerdetailsMessagesAr(this);
  PlatesdetailsMessagesAr get platesdetails => PlatesdetailsMessagesAr(this);
  QuicksaleMessagesAr get quicksale => QuicksaleMessagesAr(this);
  EditphoneMessagesAr get editphone => EditphoneMessagesAr(this);
  EditphonerequestMessagesAr get editphonerequest =>
      EditphonerequestMessagesAr(this);
  EditplateMessagesAr get editplate => EditplateMessagesAr(this);
  EditplaterequestMessagesAr get editplaterequest =>
      EditplaterequestMessagesAr(this);
  IapMessagesAr get iap => IapMessagesAr(this);
  DatetimeMessagesAr get datetime => DatetimeMessagesAr(this);
  AuthMessagesAr get auth => AuthMessagesAr(this);
  FeedMessagesAr get feed => FeedMessagesAr(this);
  PrivacyMessagesAr get privacy => PrivacyMessagesAr(this);
  TermsMessagesAr get terms => TermsMessagesAr(this);
  CommonMessagesAr get common => CommonMessagesAr(this);
  ListingstatusMessagesAr get listingstatus => ListingstatusMessagesAr(this);
  AccountMessagesAr get account => AccountMessagesAr(this);
  UserprofileMessagesAr get userprofile => UserprofileMessagesAr(this);
  PromoteMessagesAr get promote => PromoteMessagesAr(this);
  DeletelistingMessagesAr get deletelisting => DeletelistingMessagesAr(this);
}

class AppMessagesAr extends AppMessages {
  final MessagesAr _parent;
  const AppMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "Joplate"
  /// ```
  String get title => """Joplate""";

  /// ```dart
  /// "مرحبًا، $name!"
  /// ```
  String greeting(String name) => """مرحبًا، $name!""";
}

class HomeMessagesAr extends HomeMessages {
  final MessagesAr _parent;
  const HomeMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "مرحبًا بك في Joplate!"
  /// ```
  String get welcome => """مرحبًا بك في Joplate!""";

  /// ```dart
  /// "أضف إعلان"
  /// ```
  String get button_list_item => """أضف إعلان""";

  /// ```dart
  /// "عرض الإعلانات"
  /// ```
  String get button_view_items => """عرض الإعلانات""";

  /// ```dart
  /// "الأرقام المميزة"
  /// ```
  String get featured_numbers => """الأرقام المميزة""";

  /// ```dart
  /// "ارقام السيارات"
  /// ```
  String get car_number => """ارقام السيارات""";

  /// ```dart
  /// "ارقام الهواتف"
  /// ```
  String get phone_numbers => """ارقام الهواتف""";

  /// ```dart
  /// "الطلبات"
  /// ```
  String get requests => """الطلبات""";

  /// ```dart
  /// "البيع السريع"
  /// ```
  String get quick_sale => """البيع السريع""";

  /// ```dart
  /// "مميز"
  /// ```
  String get featured => """مميز""";

  /// ```dart
  /// "تم البيع"
  /// ```
  String get sold => """تم البيع""";

  /// ```dart
  /// "منتهية"
  /// ```
  String get expired => """منتهية""";

  /// ```dart
  /// "أرقامي"
  /// ```
  String get mynumbers => """أرقامي""";

  /// ```dart
  /// "طلباتي"
  /// ```
  String get myRequests => """طلباتي""";

  /// ```dart
  /// "بحث"
  /// ```
  String get search => """بحث""";

  /// ```dart
  /// "محذوف"
  /// ```
  String get disabled => """محذوف""";

  /// ```dart
  /// "المشاهدات"
  /// ```
  String get visits => """المشاهدات""";

  /// ```dart
  /// "مطلوب"
  /// ```
  String get requested => """مطلوب""";
}

class ProfileMessagesAr extends ProfileMessages {
  final MessagesAr _parent;
  const ProfileMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "الملف الشخصي"
  /// ```
  String get title => """الملف الشخصي""";

  /// ```dart
  /// "طلبات"
  /// ```
  String get Requests => """طلبات""";

  /// ```dart
  /// "إعلانات"
  /// ```
  String get Ads => """إعلانات""";

  /// ```dart
  /// "إعلاناتي"
  /// ```
  String get myAds => """إعلاناتي""";

  /// ```dart
  /// "طلباتي"
  /// ```
  String get myRequests => """طلباتي""";

  /// ```dart
  /// "أرقامي"
  /// ```
  String get Numbers => """أرقامي""";

  /// ```dart
  /// "الباقات"
  /// ```
  String get packages => """الباقات""";

  /// ```dart
  /// "باقتي الحالية"
  /// ```
  String get my_current_plan => """باقتي الحالية""";

  /// ```dart
  /// "اللغة"
  /// ```
  String get language => """اللغة""";

  /// ```dart
  /// "الوضع الليلي"
  /// ```
  String get theme => """الوضع الليلي""";

  /// ```dart
  /// "ليل"
  /// ```
  String get dark_mode => """ليل""";

  /// ```dart
  /// "نهار"
  /// ```
  String get light_mode => """نهار""";

  /// ```dart
  /// "من نحن"
  /// ```
  String get aboutus => """من نحن""";

  /// ```dart
  /// "سياسة الخصوصية"
  /// ```
  String get privacy_policy => """سياسة الخصوصية""";

  /// ```dart
  /// "الشروط والأحكام"
  /// ```
  String get terms_conditions => """الشروط والأحكام""";

  /// ```dart
  /// "التعليمات"
  /// ```
  String get instructions => """التعليمات""";

  /// ```dart
  /// "تسجيل الخروج"
  /// ```
  String get logout => """تسجيل الخروج""";

  /// ```dart
  /// "حذف الحساب"
  /// ```
  String get delete_account => """حذف الحساب""";

  /// ```dart
  /// "غير مسجل الدخول"
  /// ```
  String get notsignedin => """غير مسجل الدخول""";

  /// ```dart
  /// "تسجيل الدخول"
  /// ```
  String get signin => """تسجيل الدخول""";

  /// ```dart
  /// "تحميل"
  /// ```
  String get upload => """تحميل""";

  /// ```dart
  /// "اختر مصدر الصورة"
  /// ```
  String get choose_source => """اختر مصدر الصورة""";

  /// ```dart
  /// "معرض الصور"
  /// ```
  String get gallery => """معرض الصور""";

  /// ```dart
  /// "الكاميرا"
  /// ```
  String get camera => """الكاميرا""";

  /// ```dart
  /// "رمز ترويجي"
  /// ```
  String get promo_code => """رمز ترويجي""";

  /// ```dart
  /// "أدخل الرمز الترويجي"
  /// ```
  String get promo_code_hint => """أدخل الرمز الترويجي""";

  /// ```dart
  /// "عضو منذ $date"
  /// ```
  String joined_on(String date) => """عضو منذ $date""";
}

class FooterMessagesAr extends FooterMessages {
  final MessagesAr _parent;
  const FooterMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "الرئيسية"
  /// ```
  String get home => """الرئيسية""";

  /// ```dart
  /// "الملف الشخصي"
  /// ```
  String get profile => """الملف الشخصي""";

  /// ```dart
  /// "المفضلة"
  /// ```
  String get favorites => """المفضلة""";

  /// ```dart
  /// "المتابعة"
  /// ```
  String get feed => """المتابعة""";
}

class EditprofileMessagesAr extends EditprofileMessages {
  final MessagesAr _parent;
  const EditprofileMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// " الملف الشخصي"
  /// ```
  String get header => """ الملف الشخصي""";

  /// ```dart
  /// "الاسم الكامل"
  /// ```
  String get full_name => """الاسم الكامل""";

  /// ```dart
  /// "رقم الهاتف"
  /// ```
  String get phone_number => """رقم الهاتف""";

  /// ```dart
  /// "البريد الالكتروني"
  /// ```
  String get email => """البريد الالكتروني""";

  /// ```dart
  /// "تغيير كلمة المرور"
  /// ```
  String get change_password => """تغيير كلمة المرور""";

  /// ```dart
  /// "تعديل الاسم الكامل"
  /// ```
  String get edit_fullname => """تعديل الاسم الكامل""";

  /// ```dart
  /// "تعديل البريد الالكتروني"
  /// ```
  String get edit_email => """تعديل البريد الالكتروني""";

  /// ```dart
  /// "تعديل رقم الهاتف"
  /// ```
  String get edit_phone => """تعديل رقم الهاتف""";

  /// ```dart
  /// "حفظ"
  /// ```
  String get save => """حفظ""";

  /// ```dart
  /// "ارسال كود التحقق"
  /// ```
  String get send_verification_code => """ارسال كود التحقق""";

  /// ```dart
  /// "تحقق وحفظ"
  /// ```
  String get verifyandsave => """تحقق وحفظ""";

  /// ```dart
  /// "كلمة المرور القديمة"
  /// ```
  String get oldpassword => """كلمة المرور القديمة""";

  /// ```dart
  /// "كلمة المرور الجديدة"
  /// ```
  String get newpassword => """كلمة المرور الجديدة""";

  /// ```dart
  /// "تأكيد كلمة المرور"
  /// ```
  String get confirmpassword => """تأكيد كلمة المرور""";

  /// ```dart
  /// "رقم الهاتف مستخدم من قبل مستخدم آخر"
  /// ```
  String get phone_number_already_used =>
      """رقم الهاتف مستخدم من قبل مستخدم آخر""";
}

class PlanMessagesAr extends PlanMessages {
  final MessagesAr _parent;
  const PlanMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "خطتي الحالية"
  /// ```
  String get title => """خطتي الحالية""";

  /// ```dart
  /// "اسم الخطة"
  /// ```
  String get plan_name => """اسم الخطة""";

  /// ```dart
  /// "0 / JOD"
  /// ```
  String get balance => """0 / JOD""";

  /// ```dart
  /// "تجديد في"
  /// ```
  String get renewal_date => """تجديد في""";

  /// ```dart
  /// "تغيير الخطة"
  /// ```
  String get change_plan_button => """تغيير الخطة""";

  /// ```dart
  /// "خطتك"
  /// ```
  String get your_plan_label => """خطتك""";
}

class FavoritesScMessagesAr extends FavoritesScMessages {
  final MessagesAr _parent;
  const FavoritesScMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "لا يوجد عناصر في المفضلة"
  /// ```
  String get no_favorites => """لا يوجد عناصر في المفضلة""";

  /// ```dart
  /// "فشل في تحميل المفضلة"
  /// ```
  String get failed_to_load => """فشل في تحميل المفضلة""";
}

class PhonesMessagesAr extends PhonesMessages {
  final MessagesAr _parent;
  const PhonesMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "أرقام الهواتف"
  /// ```
  String get title => """أرقام الهواتف""";

  /// ```dart
  /// "إضافة"
  /// ```
  String get add_button => """إضافة""";

  /// ```dart
  /// "الشركة"
  /// ```
  String get company_label => """الشركة""";

  /// ```dart
  /// "يحتوي على"
  /// ```
  String get contains => """يحتوي على""";

  /// ```dart
  /// "يبدأ بـ"
  /// ```
  String get starts_with => """يبدأ بـ""";

  /// ```dart
  /// "ينتهي بـ"
  /// ```
  String get ends_with => """ينتهي بـ""";

  /// ```dart
  /// "أقل سعر"
  /// ```
  String get min_price => """أقل سعر""";

  /// ```dart
  /// "أعلى سعر"
  /// ```
  String get max_price => """أعلى سعر""";

  /// ```dart
  /// "بحث"
  /// ```
  String get search => """بحث""";

  /// ```dart
  /// "عرض المزيد"
  /// ```
  String get see_more => """عرض المزيد""";

  /// ```dart
  /// "عرض أقل"
  /// ```
  String get show_less => """عرض أقل""";
}

class PlatesMessagesAr extends PlatesMessages {
  final MessagesAr _parent;
  const PlatesMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "أرقام السيارات"
  /// ```
  String get title => """أرقام السيارات""";

  /// ```dart
  /// "الترميز"
  /// ```
  String get code => """الترميز""";

  /// ```dart
  /// "عدد الأرقام"
  /// ```
  String get digit_count => """عدد الأرقام""";

  /// ```dart
  /// "النمط"
  /// ```
  String get format => """النمط""";

  /// ```dart
  /// "يحتوي على"
  /// ```
  String get contains => """يحتوي على""";

  /// ```dart
  /// "يبدأ بـ"
  /// ```
  String get starts_with => """يبدأ بـ""";

  /// ```dart
  /// "ينتهي بـ"
  /// ```
  String get ends_with => """ينتهي بـ""";

  /// ```dart
  /// "أقل سعر"
  /// ```
  String get min_price => """أقل سعر""";

  /// ```dart
  /// "أعلى سعر"
  /// ```
  String get max_price => """أعلى سعر""";

  /// ```dart
  /// "بحث"
  /// ```
  String get search => """بحث""";

  /// ```dart
  /// "عرض المزيد"
  /// ```
  String get see_more => """عرض المزيد""";

  /// ```dart
  /// "عرض أقل"
  /// ```
  String get show_less => """عرض أقل""";
}

class DigitcountsMessagesAr extends DigitcountsMessages {
  final MessagesAr _parent;
  const DigitcountsMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "رقم واحد"
  /// ```
  String get d1 => """رقم واحد""";

  /// ```dart
  /// "رقمان"
  /// ```
  String get d2 => """رقمان""";

  /// ```dart
  /// "ثلاثي"
  /// ```
  String get d3 => """ثلاثي""";

  /// ```dart
  /// "رباعي"
  /// ```
  String get d4 => """رباعي""";

  /// ```dart
  /// "خماسي"
  /// ```
  String get d5 => """خماسي""";
}

class FormatsMessagesAr extends FormatsMessages {
  final MessagesAr _parent;
  const FormatsMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "النمط"
  /// ```
  String get title => """النمط""";

  /// ```dart
  /// "يحتوي على رقم مكرر مرتين"
  /// ```
  String get repeat_2 => """يحتوي على رقم مكرر مرتين""";

  /// ```dart
  /// "يحتوي على رقم مكرر ثلاث مرات"
  /// ```
  String get repeat_3 => """يحتوي على رقم مكرر ثلاث مرات""";

  /// ```dart
  /// "يحتوي على رقم مكرر أربع مرات"
  /// ```
  String get repeat_4 => """يحتوي على رقم مكرر أربع مرات""";

  /// ```dart
  /// "X???X (خماسي)"
  /// ```
  String get f_5_1 => """X???X (خماسي)""";

  /// ```dart
  /// "XYZYX (خماسي)"
  /// ```
  String get f_5_2 => """XYZYX (خماسي)""";

  /// ```dart
  /// "XXXZX (خماسي)"
  /// ```
  String get f_5_3 => """XXXZX (خماسي)""";

  /// ```dart
  /// "?XXX? (خماسي)"
  /// ```
  String get f_5_4 => """?XXX? (خماسي)""";

  /// ```dart
  /// "XYXYX (خماسي)"
  /// ```
  String get f_5_5 => """XYXYX (خماسي)""";

  /// ```dart
  /// "XYYYX (خماسي)"
  /// ```
  String get f_5_6 => """XYYYX (خماسي)""";

  /// ```dart
  /// "??XXX (خماسي)"
  /// ```
  String get f_5_7 => """??XXX (خماسي)""";

  /// ```dart
  /// "XXX?? (خماسي)"
  /// ```
  String get f_5_8 => """XXX?? (خماسي)""";

  /// ```dart
  /// "XXXXX (خماسي)"
  /// ```
  String get f_5_9 => """XXXXX (خماسي)""";

  /// ```dart
  /// "X??X (رباعي)"
  /// ```
  String get f_4_1 => """X??X (رباعي)""";

  /// ```dart
  /// "XYXX (رباعي)"
  /// ```
  String get f_4_2 => """XYXX (رباعي)""";

  /// ```dart
  /// "XYXY (رباعي)"
  /// ```
  String get f_4_3 => """XYXY (رباعي)""";

  /// ```dart
  /// "?XX? (رباعي)"
  /// ```
  String get f_4_4 => """?XX? (رباعي)""";

  /// ```dart
  /// "XXXY (رباعي)"
  /// ```
  String get f_4_5 => """XXXY (رباعي)""";

  /// ```dart
  /// "XYYY (رباعي)"
  /// ```
  String get f_4_6 => """XYYY (رباعي)""";

  /// ```dart
  /// "XXXX (رباعي)"
  /// ```
  String get f_4_7 => """XXXX (رباعي)""";

  /// ```dart
  /// "XYX (ثلاثي)"
  /// ```
  String get f_3_1 => """XYX (ثلاثي)""";

  /// ```dart
  /// "XYZ (ثلاثي)"
  /// ```
  String get f_3_2 => """XYZ (ثلاثي)""";

  /// ```dart
  /// "XYY (ثلاثي)"
  /// ```
  String get f_3_3 => """XYY (ثلاثي)""";

  /// ```dart
  /// "XXY (ثلاثي)"
  /// ```
  String get f_3_4 => """XXY (ثلاثي)""";

  /// ```dart
  /// "XXX (ثلاثي)"
  /// ```
  String get f_3_5 => """XXX (ثلاثي)""";
}

class AddphonenumberMessagesAr extends AddphonenumberMessages {
  final MessagesAr _parent;
  const AddphonenumberMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "إضافة رقم هاتف"
  /// ```
  String get title => """إضافة رقم هاتف""";

  /// ```dart
  /// "الشركة"
  /// ```
  String get company_label => """الشركة""";

  /// ```dart
  /// "رقم الهاتف"
  /// ```
  String get phone_number_label => """رقم الهاتف""";

  /// ```dart
  /// "نشر"
  /// ```
  String get save_button => """نشر""";

  /// ```dart
  /// "إلغاء"
  /// ```
  String get cancel_button => """إلغاء""";

  /// ```dart
  /// "إضافة أكثر"
  /// ```
  String get addmore => """إضافة أكثر""";

  /// ```dart
  /// "مع خصم"
  /// ```
  String get with_discount => """مع خصم""";

  /// ```dart
  /// "بدون خصم"
  /// ```
  String get without_discount => """بدون خصم""";

  /// ```dart
  /// "مميز"
  /// ```
  String get featured => """مميز""";

  /// ```dart
  /// "غير مميز"
  /// ```
  String get not_featured => """غير مميز""";

  /// ```dart
  /// "رقم"
  /// ```
  String get number => """رقم""";

  /// ```dart
  /// "السعر"
  /// ```
  String get price => """السعر""";

  /// ```dart
  /// "السعر قبل الخصم"
  /// ```
  String get price_before_discount => """السعر قبل الخصم""";

  /// ```dart
  /// "السعر بعد الخصم"
  /// ```
  String get price_after_discount => """السعر بعد الخصم""";
}

class AddplateMessagesAr extends AddplateMessages {
  final MessagesAr _parent;
  const AddplateMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "إضافة رقم سيارة"
  /// ```
  String get title => """إضافة رقم سيارة""";

  /// ```dart
  /// "الشركة"
  /// ```
  String get company_label => """الشركة""";

  /// ```dart
  /// "رقم اللوحة"
  /// ```
  String get plate_number_label => """رقم اللوحة""";

  /// ```dart
  /// "نشر"
  /// ```
  String get save_button => """نشر""";

  /// ```dart
  /// "إلغاء"
  /// ```
  String get cancel_button => """إلغاء""";

  /// ```dart
  /// "إضافة أكثر"
  /// ```
  String get addmore => """إضافة أكثر""";

  /// ```dart
  /// "مع خصم"
  /// ```
  String get with_discount => """مع خصم""";

  /// ```dart
  /// "بدون خصم"
  /// ```
  String get without_discount => """بدون خصم""";

  /// ```dart
  /// "مميز"
  /// ```
  String get featured => """مميز""";

  /// ```dart
  /// "غير مميز"
  /// ```
  String get not_featured => """غير مميز""";

  /// ```dart
  /// "رقم"
  /// ```
  String get number => """رقم""";

  /// ```dart
  /// "السعر"
  /// ```
  String get price => """السعر""";

  /// ```dart
  /// "السعر قبل الخصم"
  /// ```
  String get price_before_discount => """السعر قبل الخصم""";

  /// ```dart
  /// "السعر بعد الخصم"
  /// ```
  String get price_after_discount => """السعر بعد الخصم""";

  /// ```dart
  /// "الترميز"
  /// ```
  String get code => """الترميز""";

  /// ```dart
  /// "اختر الترميز"
  /// ```
  String get select_code => """اختر الترميز""";

  /// ```dart
  /// "الترميز مطلوب"
  /// ```
  String get code_required => """الترميز مطلوب""";

  /// ```dart
  /// "رقم اللوحة مطلوب"
  /// ```
  String get number_required => """رقم اللوحة مطلوب""";

  /// ```dart
  /// "ترميز غير صالح"
  /// ```
  String get invalid_code => """ترميز غير صالح""";

  /// ```dart
  /// "رقم لوحة غير صالح"
  /// ```
  String get invalid_number => """رقم لوحة غير صالح""";

  /// ```dart
  /// "يمكنك استخدام X أو Y لإخفاء أي رقم"
  /// ```
  String get mask_instructions => """يمكنك استخدام X أو Y لإخفاء أي رقم""";
}

class AddphonerequestMessagesAr extends AddphonerequestMessages {
  final MessagesAr _parent;
  const AddphonerequestMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "إضافة طلب هاتف"
  /// ```
  String get title => """إضافة طلب هاتف""";

  /// ```dart
  /// "الشركة"
  /// ```
  String get company_label => """الشركة""";

  /// ```dart
  /// "رقم الهاتف"
  /// ```
  String get phone_number_label => """رقم الهاتف""";

  /// ```dart
  /// "نشر"
  /// ```
  String get save_button => """نشر""";

  /// ```dart
  /// "إلغاء"
  /// ```
  String get cancel_button => """إلغاء""";

  /// ```dart
  /// "رقم الهاتف المطلوب"
  /// ```
  String get required_phone_number => """رقم الهاتف المطلوب""";

  /// ```dart
  /// "السعر اختياري"
  /// ```
  String get optional_price => """السعر اختياري""";
}

class AddplaterequestMessagesAr extends AddplaterequestMessages {
  final MessagesAr _parent;
  const AddplaterequestMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "إضافة طلب رقم سيارة"
  /// ```
  String get title => """إضافة طلب رقم سيارة""";

  /// ```dart
  /// "الشركة"
  /// ```
  String get company_label => """الشركة""";

  /// ```dart
  /// "رقم اللوحة"
  /// ```
  String get plate_number_label => """رقم اللوحة""";

  /// ```dart
  /// "نشر"
  /// ```
  String get save_button => """نشر""";

  /// ```dart
  /// "إلغاء"
  /// ```
  String get cancel_button => """إلغاء""";

  /// ```dart
  /// "رقم اللوحة المطلوب"
  /// ```
  String get required_plate_number => """رقم اللوحة المطلوب""";

  /// ```dart
  /// "ترميز اللوحة"
  /// ```
  String get code => """ترميز اللوحة""";

  /// ```dart
  /// "رقم اللوحة"
  /// ```
  String get number => """رقم اللوحة""";

  /// ```dart
  /// "السعر اختياري"
  /// ```
  String get optional_price => """السعر اختياري""";
}

class ListingdetailsMessagesAr extends ListingdetailsMessages {
  final MessagesAr _parent;
  const ListingdetailsMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "تنتهي صلاحية الاعلان في $date"
  /// ```
  String expires_on(String date) => """تنتهي صلاحية الاعلان في $date""";

  /// ```dart
  /// "مميز حتى $date"
  /// ```
  String featured_until(String date) => """مميز حتى $date""";
}

class PhonedetailsMessagesAr extends PhonedetailsMessages {
  final MessagesAr _parent;
  const PhonedetailsMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "تفاصيل رقم الهاتف"
  /// ```
  String get title => """تفاصيل رقم الهاتف""";

  /// ```dart
  /// "اطلع على رقم اللوحة هذا: $number"
  /// ```
  String share_message(String number) => """اطلع على رقم اللوحة هذا: $number""";

  /// ```dart
  /// "ملاحظات هامة:"
  /// ```
  String get important_note => """ملاحظات هامة:""";

  /// ```dart
  /// "لا تقم بتحويل الأموال عبر الإنترنت"
  /// ```
  String get dont_transfer_money => """لا تقم بتحويل الأموال عبر الإنترنت""";

  /// ```dart
  /// "قابل البائع شخصياً"
  /// ```
  String get meet_in_person => """قابل البائع شخصياً""";
}

class SellerdetailsMessagesAr extends SellerdetailsMessages {
  final MessagesAr _parent;
  const SellerdetailsMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "حول البائع"
  /// ```
  String get about_seller => """حول البائع""";

  /// ```dart
  /// "لم يتم العثور على المستخدم"
  /// ```
  String get user_not_found => """لم يتم العثور على المستخدم""";

  /// ```dart
  /// "واتساب"
  /// ```
  String get whatsapp => """واتساب""";

  /// ```dart
  /// "اتصال"
  /// ```
  String get phone_call => """اتصال""";
}

class PlatesdetailsMessagesAr extends PlatesdetailsMessages {
  final MessagesAr _parent;
  const PlatesdetailsMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "تفاصيل رقم اللوحة"
  /// ```
  String get title => """تفاصيل رقم اللوحة""";

  /// ```dart
  /// "حدث خطأ أثناء جلب بيانات الرقم: $plateNumber"
  /// ```
  String error_loading_data(String plateNumber) =>
      """حدث خطأ أثناء جلب بيانات الرقم: $plateNumber""";

  /// ```dart
  /// "نُشر بواسطة"
  /// ```
  String get originally_posted_by => """نُشر بواسطة""";

  /// ```dart
  /// "عضو منذ $year"
  /// ```
  String member_since(String year) => """عضو منذ $year""";

  /// ```dart
  /// "واتساب"
  /// ```
  String get whatsapp => """واتساب""";

  /// ```dart
  /// "اتصال"
  /// ```
  String get call => """اتصال""";

  /// ```dart
  /// "بائعون آخرون"
  /// ```
  String get other_sellers => """بائعون آخرون""";

  /// ```dart
  /// "البائع"
  /// ```
  String get seller => """البائع""";

  /// ```dart
  /// "السعر"
  /// ```
  String get price => """السعر""";

  /// ```dart
  /// "تواصل"
  /// ```
  String get contact => """تواصل""";

  /// ```dart
  /// "ملاحظة هامة:"
  /// ```
  String get important_note => """ملاحظة هامة:""";

  /// ```dart
  /// "لا تقم بتحويل الأموال عبر الإنترنت"
  /// ```
  String get dont_transfer_money => """لا تقم بتحويل الأموال عبر الإنترنت""";

  /// ```dart
  /// "قابل البائع شخصياً"
  /// ```
  String get meet_in_person => """قابل البائع شخصياً""";

  /// ```dart
  /// "منذ $days"
  /// ```
  String days_ago(String days) => """منذ $days""";

  /// ```dart
  /// "اتصل لمعرفة السعر"
  /// ```
  String get call_for_price => """اتصل لمعرفة السعر""";
}

class QuicksaleMessagesAr extends QuicksaleMessages {
  final MessagesAr _parent;
  const QuicksaleMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "البيع السريع"
  /// ```
  String get title => """البيع السريع""";

  /// ```dart
  /// "هل ترغب بأن نجد لك مشتريًا لرقم سيارتك؟ يمكننا مساعدتك في ذلك."
  /// ```
  String get description =>
      """هل ترغب بأن نجد لك مشتريًا لرقم سيارتك؟ يمكننا مساعدتك في ذلك.""";

  /// ```dart
  /// "واتساب"
  /// ```
  String get whatsapp => """واتساب""";

  /// ```dart
  /// "اتصال"
  /// ```
  String get call => """اتصال""";

  /// ```dart
  /// "لم يتم العثور على المستخدم"
  /// ```
  String get user_not_found => """لم يتم العثور على المستخدم""";

  /// ```dart
  /// "الطلب بواسطة"
  /// ```
  String get requested_by => """الطلب بواسطة""";
}

class EditphoneMessagesAr extends EditphoneMessages {
  final MessagesAr _parent;
  const EditphoneMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "تعديل إعلان الرقم"
  /// ```
  String get title => """تعديل إعلان الرقم""";

  /// ```dart
  /// "رقم الهاتف"
  /// ```
  String get phone_number => """رقم الهاتف""";

  /// ```dart
  /// "السعر"
  /// ```
  String get price => """السعر""";

  /// ```dart
  /// "سعر الخصم"
  /// ```
  String get discount_price => """سعر الخصم""";

  /// ```dart
  /// "تمييز هذا الإعلان"
  /// ```
  String get feature => """تمييز هذا الإعلان""";

  /// ```dart
  /// "تحديد كـ مُباع"
  /// ```
  String get mark_sold => """تحديد كـ مُباع""";

  /// ```dart
  /// "تعطيل هذا الإعلان"
  /// ```
  String get disable => """تعطيل هذا الإعلان""";

  /// ```dart
  /// "حفظ التعديلات"
  /// ```
  String get save_changes => """حفظ التعديلات""";

  /// ```dart
  /// "هل يوجد خصم؟"
  /// ```
  String get withdiscount => """هل يوجد خصم؟""";

  /// ```dart
  /// "هل يوجد خصم؟"
  /// ```
  String get discount => """هل يوجد خصم؟""";
}

class EditphonerequestMessagesAr extends EditphonerequestMessages {
  final MessagesAr _parent;
  const EditphonerequestMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "تعديل طلب الرقم"
  /// ```
  String get title => """تعديل طلب الرقم""";

  /// ```dart
  /// "رقم الهاتف"
  /// ```
  String get phone_number => """رقم الهاتف""";

  /// ```dart
  /// "السعر (اختياري)"
  /// ```
  String get price_optional => """السعر (اختياري)""";

  /// ```dart
  /// "حفظ التعديلات"
  /// ```
  String get save_changes => """حفظ التعديلات""";
}

class EditplateMessagesAr extends EditplateMessages {
  final MessagesAr _parent;
  const EditplateMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "تعديل إعلان اللوحة"
  /// ```
  String get title => """تعديل إعلان اللوحة""";

  /// ```dart
  /// "الترميز"
  /// ```
  String get code => """الترميز""";

  /// ```dart
  /// "رقم اللوحة"
  /// ```
  String get plate_number => """رقم اللوحة""";

  /// ```dart
  /// "السعر"
  /// ```
  String get price => """السعر""";

  /// ```dart
  /// "سعر الخصم"
  /// ```
  String get discount_price => """سعر الخصم""";

  /// ```dart
  /// "تمييز"
  /// ```
  String get featured => """تمييز""";

  /// ```dart
  /// "تعطيل"
  /// ```
  String get disabled => """تعطيل""";

  /// ```dart
  /// "مباع"
  /// ```
  String get sold => """مباع""";

  /// ```dart
  /// "حفظ التعديلات"
  /// ```
  String get save_changes => """حفظ التعديلات""";
}

class EditplaterequestMessagesAr extends EditplaterequestMessages {
  final MessagesAr _parent;
  const EditplaterequestMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "تعديل طلب اللوحة"
  /// ```
  String get title => """تعديل طلب اللوحة""";

  /// ```dart
  /// "الترميز"
  /// ```
  String get code => """الترميز""";

  /// ```dart
  /// "الرقم"
  /// ```
  String get number => """الرقم""";

  /// ```dart
  /// "السعر (اختياري)"
  /// ```
  String get price_optional => """السعر (اختياري)""";

  /// ```dart
  /// "حفظ التعديلات"
  /// ```
  String get save_changes => """حفظ التعديلات""";
}

class IapMessagesAr extends IapMessages {
  final MessagesAr _parent;
  const IapMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "شراء"
  /// ```
  String get purchase => """شراء""";
}

class DatetimeMessagesAr extends DatetimeMessages {
  final MessagesAr _parent;
  const DatetimeMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "$months شهر"
  /// ```
  String months_ago(String months) => """$months شهر""";

  /// ```dart
  /// "$weeks أسبوع"
  /// ```
  String weeks_ago(String weeks) => """$weeks أسبوع""";

  /// ```dart
  /// "$days يوم"
  /// ```
  String days_ago(String days) => """$days يوم""";

  /// ```dart
  /// "$hours ساعة"
  /// ```
  String hours_ago(String hours) => """$hours ساعة""";

  /// ```dart
  /// "$minutes دقيقة"
  /// ```
  String minutes_ago(String minutes) => """$minutes دقيقة""";

  /// ```dart
  /// "$seconds ثانية"
  /// ```
  String seconds_ago(String seconds) => """$seconds ثانية""";

  /// ```dart
  /// "الآن"
  /// ```
  String get just_now => """الآن""";
}

class AuthMessagesAr extends AuthMessages {
  final MessagesAr _parent;
  const AuthMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "تسجيل الدخول"
  /// ```
  String get signin => """تسجيل الدخول""";

  /// ```dart
  /// "تسجيل حساب"
  /// ```
  String get signup => """تسجيل حساب""";

  /// ```dart
  /// "الاسم المعروض"
  /// ```
  String get display_name => """الاسم المعروض""";

  /// ```dart
  /// "البريد الإلكتروني"
  /// ```
  String get email => """البريد الإلكتروني""";

  /// ```dart
  /// "رقم الهاتف"
  /// ```
  String get phone_number => """رقم الهاتف""";

  /// ```dart
  /// "كلمة المرور"
  /// ```
  String get password => """كلمة المرور""";

  /// ```dart
  /// "استعادة كلمة المرور"
  /// ```
  String get reset_password => """استعادة كلمة المرور""";

  /// ```dart
  /// "الاستمرار كزائر"
  /// ```
  String get continue_guest => """الاستمرار كزائر""";

  /// ```dart
  /// "استعادة كلمة المرور"
  /// ```
  String get reset_password_title => """استعادة كلمة المرور""";

  /// ```dart
  /// "أدخل بريدك الإلكتروني"
  /// ```
  String get enter_email => """أدخل بريدك الإلكتروني""";

  /// ```dart
  /// "إلغاء"
  /// ```
  String get cancel => """إلغاء""";

  /// ```dart
  /// "استعادة"
  /// ```
  String get reset => """استعادة""";

  /// ```dart
  /// "تم إرسال تعليمات استعادة كلمة المرور إلى بريدك الإلكتروني"
  /// ```
  String get reset_sent =>
      """تم إرسال تعليمات استعادة كلمة المرور إلى بريدك الإلكتروني""";

  /// ```dart
  /// "الاستمرار كزائر"
  /// ```
  String get guest => """الاستمرار كزائر""";

  /// ```dart
  /// "رمز التحقق"
  /// ```
  String get verification_code => """رمز التحقق""";

  /// ```dart
  /// "أدخل رمز التحقق"
  /// ```
  String get enter_verification_code => """أدخل رمز التحقق""";

  /// ```dart
  /// "لقد أرسلنا رمز تحقق إلى $email. أدخل الرمز للمتابعة."
  /// ```
  String code_sent_to_email(String email) =>
      """لقد أرسلنا رمز تحقق إلى $email. أدخل الرمز للمتابعة.""";

  /// ```dart
  /// "يجب أن يصل الرمز خلال دقائق قليلة. تحقق من مجلد البريد المزعج إذا لم تجده."
  /// ```
  String get code_check_spam =>
      """يجب أن يصل الرمز خلال دقائق قليلة. تحقق من مجلد البريد المزعج إذا لم تجده.""";

  /// ```dart
  /// "أدخل الرمز من بريدك الإلكتروني"
  /// ```
  String get enter_code_from_email => """أدخل الرمز من بريدك الإلكتروني""";

  /// ```dart
  /// "الرجاء إدخال رمز التحقق"
  /// ```
  String get please_enter_code => """الرجاء إدخال رمز التحقق""";

  /// ```dart
  /// "تحقق من الرمز"
  /// ```
  String get verify_code => """تحقق من الرمز""";

  /// ```dart
  /// "تم إعادة إرسال رمز التحقق إلى $email"
  /// ```
  String code_resent(String email) =>
      """تم إعادة إرسال رمز التحقق إلى $email""";

  /// ```dart
  /// "إعادة إرسال الرمز"
  /// ```
  String get resend_code => """إعادة إرسال الرمز""";

  /// ```dart
  /// "رجوع"
  /// ```
  String get back => """رجوع""";

  /// ```dart
  /// "إنشاء كلمة مرور جديدة"
  /// ```
  String get create_new_password => """إنشاء كلمة مرور جديدة""";

  /// ```dart
  /// "تم التحقق من بريدك الإلكتروني. الرجاء تعيين كلمة المرور الجديدة."
  /// ```
  String get verified_set_password =>
      """تم التحقق من بريدك الإلكتروني. الرجاء تعيين كلمة المرور الجديدة.""";

  /// ```dart
  /// "كلمة المرور الجديدة"
  /// ```
  String get new_password => """كلمة المرور الجديدة""";

  /// ```dart
  /// "أدخل كلمة المرور الجديدة"
  /// ```
  String get enter_new_password => """أدخل كلمة المرور الجديدة""";

  /// ```dart
  /// "تأكيد كلمة المرور الجديدة"
  /// ```
  String get confirm_password => """تأكيد كلمة المرور الجديدة""";

  /// ```dart
  /// "تأكيد كلمة المرور الجديدة"
  /// ```
  String get confirm_new_password => """تأكيد كلمة المرور الجديدة""";

  /// ```dart
  /// "كلمات المرور غير متطابقة"
  /// ```
  String get passwords_not_match => """كلمات المرور غير متطابقة""";

  /// ```dart
  /// "تم إعادة تعيين كلمة المرور بنجاح"
  /// ```
  String get password_reset_successful =>
      """تم إعادة تعيين كلمة المرور بنجاح""";

  /// ```dart
  /// "تم إعادة تعيين كلمة المرور بنجاح. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة."
  /// ```
  String get password_reset_success_message =>
      """تم إعادة تعيين كلمة المرور بنجاح. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة.""";

  /// ```dart
  /// "تسجيل الدخول"
  /// ```
  String get login => """تسجيل الدخول""";

  /// ```dart
  /// "تابعنا على"
  /// ```
  String get follow_us => """تابعنا على""";

  /// ```dart
  /// "أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور"
  /// ```
  String get reset_password_description =>
      """أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور""";

  /// ```dart
  /// "سنرسل لك رابطًا لإعادة تعيين كلمة المرور"
  /// ```
  String get reset_password_instructions =>
      """سنرسل لك رابطًا لإعادة تعيين كلمة المرور""";

  /// ```dart
  /// "إرسال رابط إعادة التعيين"
  /// ```
  String get send_reset_code => """إرسال رابط إعادة التعيين""";

  /// ```dart
  /// "تحقق من بريدك الإلكتروني للحصول على رابط إعادة التعيين. استخدم الرابط لإعادة تعيين كلمة المرور."
  /// ```
  String get check_email_instructions =>
      """تحقق من بريدك الإلكتروني للحصول على رابط إعادة التعيين. استخدم الرابط لإعادة تعيين كلمة المرور.""";

  /// ```dart
  /// "يجب تسجيل الدخول لعرض معلومات الاتصال"
  /// ```
  String get signin_to_contact => """يجب تسجيل الدخول لعرض معلومات الاتصال""";
}

class FeedMessagesAr extends FeedMessages {
  final MessagesAr _parent;
  const FeedMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "المتابعة"
  /// ```
  String get title => """المتابعة""";

  /// ```dart
  /// "يجب تسجيل الدخول لعرض الاعلانات"
  /// ```
  String get login_required => """يجب تسجيل الدخول لعرض الاعلانات""";

  /// ```dart
  /// "تسجيل الدخول"
  /// ```
  String get sign_in => """تسجيل الدخول""";

  /// ```dart
  /// "خطأ في تحميل الملف الشخصي:"
  /// ```
  String get error_loading => """خطأ في تحميل الملف الشخصي:""";

  /// ```dart
  /// "إعادة المحاولة"
  /// ```
  String get retry => """إعادة المحاولة""";

  /// ```dart
  /// "لم يتم العثور على الملف الشخصي"
  /// ```
  String get user_not_found => """لم يتم العثور على الملف الشخصي""";

  /// ```dart
  /// "لا يوجد اعلانات"
  /// ```
  String get empty_feed => """لا يوجد اعلانات""";

  /// ```dart
  /// "تابع المستخدمين لرؤية إعلاناتهم هنا"
  /// ```
  String get follow_users => """تابع المستخدمين لرؤية إعلاناتهم هنا""";

  /// ```dart
  /// "استكشاف الإعلانات"
  /// ```
  String get explore_listings => """استكشاف الإعلانات""";

  /// ```dart
  /// "أنت لا تتابع أي مستخدمين"
  /// ```
  String get no_users_followed => """أنت لا تتابع أي مستخدمين""";

  /// ```dart
  /// "خطأ في تحميل البيانات:"
  /// ```
  String get error_generic => """خطأ في تحميل البيانات:""";

  /// ```dart
  /// "لا توجد إعلانات لوحات من المستخدمين الذين تتابعهم"
  /// ```
  String get no_plate_listings =>
      """لا توجد إعلانات لوحات من المستخدمين الذين تتابعهم""";

  /// ```dart
  /// "لا توجد إعلانات هواتف من المستخدمين الذين تتابعهم"
  /// ```
  String get no_phone_listings =>
      """لا توجد إعلانات هواتف من المستخدمين الذين تتابعهم""";
}

class PrivacyMessagesAr extends PrivacyMessages {
  final MessagesAr _parent;
  const PrivacyMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "سياسة الخصوصية"
  /// ```
  String get title => """سياسة الخصوصية""";

  /// ```dart
  /// "تاريخ النفاذ: 1 يناير 2023"
  /// ```
  String get effective_date => """تاريخ النفاذ: 1 يناير 2023""";

  /// ```dart
  /// "في جوبليت، نحن نقدر خصوصيتك وملتزمون بحماية معلوماتك الشخصية. توضح سياسة الخصوصية هذه كيفية جمع واستخدام وحماية معلوماتك عند استخدام تطبيقنا للهواتف المحمولة."
  /// ```
  String get intro =>
      """في جوبليت، نحن نقدر خصوصيتك وملتزمون بحماية معلوماتك الشخصية. توضح سياسة الخصوصية هذه كيفية جمع واستخدام وحماية معلوماتك عند استخدام تطبيقنا للهواتف المحمولة.""";

  /// ```dart
  /// "المعلومات التي نجمعها"
  /// ```
  String get information_collected => """المعلومات التي نجمعها""";

  /// ```dart
  /// "• المعلومات الشخصية: الاسم، عنوان البريد الإلكتروني، رقم الهاتف، وصورة الملف الشخصي"
  /// ```
  String get personal_info =>
      """• المعلومات الشخصية: الاسم، عنوان البريد الإلكتروني، رقم الهاتف، وصورة الملف الشخصي""";

  /// ```dart
  /// "• محتوى المستخدم: المعلومات التي تقدمها عن الإعلانات، بما في ذلك الصور والأوصاف"
  /// ```
  String get user_content =>
      """• محتوى المستخدم: المعلومات التي تقدمها عن الإعلانات، بما في ذلك الصور والأوصاف""";

  /// ```dart
  /// "• معلومات الجهاز: نوع الجهاز، نظام التشغيل، ومعرفات الجهاز الفريدة"
  /// ```
  String get device_info =>
      """• معلومات الجهاز: نوع الجهاز، نظام التشغيل، ومعرفات الجهاز الفريدة""";

  /// ```dart
  /// "• بيانات الاستخدام: كيفية تفاعلك مع تطبيقنا، الميزات التي تستخدمها، والوقت المستغرق في التطبيق"
  /// ```
  String get usage_data =>
      """• بيانات الاستخدام: كيفية تفاعلك مع تطبيقنا، الميزات التي تستخدمها، والوقت المستغرق في التطبيق""";

  /// ```dart
  /// "كيفية استخدام معلوماتك"
  /// ```
  String get how_we_use => """كيفية استخدام معلوماتك""";

  /// ```dart
  /// "• لتقديم وصيانة خدمتنا"
  /// ```
  String get use_1 => """• لتقديم وصيانة خدمتنا""";

  /// ```dart
  /// "• لإخطارك بالتغييرات في خدمتنا"
  /// ```
  String get use_2 => """• لإخطارك بالتغييرات في خدمتنا""";

  /// ```dart
  /// "• للسماح لك بالمشاركة في الميزات التفاعلية"
  /// ```
  String get use_3 => """• للسماح لك بالمشاركة في الميزات التفاعلية""";

  /// ```dart
  /// "• لتقديم دعم العملاء"
  /// ```
  String get use_4 => """• لتقديم دعم العملاء""";

  /// ```dart
  /// "• لجمع التحليلات أو المعلومات القيمة لتحسين خدمتنا"
  /// ```
  String get use_5 => """• لجمع التحليلات أو المعلومات القيمة لتحسين خدمتنا""";

  /// ```dart
  /// "• لمراقبة استخدام خدمتنا"
  /// ```
  String get use_6 => """• لمراقبة استخدام خدمتنا""";

  /// ```dart
  /// "• للكشف عن المشكلات التقنية ومنعها ومعالجتها"
  /// ```
  String get use_7 => """• للكشف عن المشكلات التقنية ومنعها ومعالجتها""";

  /// ```dart
  /// "الأمان"
  /// ```
  String get security => """الأمان""";

  /// ```dart
  /// "نحن نقدر ثقتك في تقديم معلوماتك الشخصية لنا، وبالتالي نسعى جاهدين لاستخدام وسائل مقبولة تجارياً لحمايتها. لكن تذكر أنه لا توجد طريقة للإرسال عبر الإنترنت، أو طريقة للتخزين الإلكتروني آمنة وموثوقة بنسبة 100٪، ولا يمكننا ضمان أمنها المطلق."
  /// ```
  String get security_text =>
      """نحن نقدر ثقتك في تقديم معلوماتك الشخصية لنا، وبالتالي نسعى جاهدين لاستخدام وسائل مقبولة تجارياً لحمايتها. لكن تذكر أنه لا توجد طريقة للإرسال عبر الإنترنت، أو طريقة للتخزين الإلكتروني آمنة وموثوقة بنسبة 100٪، ولا يمكننا ضمان أمنها المطلق.""";

  /// ```dart
  /// "التغييرات على سياسة الخصوصية"
  /// ```
  String get changes => """التغييرات على سياسة الخصوصية""";

  /// ```dart
  /// "قد نقوم بتحديث سياسة الخصوصية من وقت لآخر. لذلك، يُنصح بمراجعة هذه الصفحة بشكل دوري لأي تغييرات. سنخطرك بأي تغييرات عن طريق نشر سياسة الخصوصية الجديدة على هذه الصفحة. هذه التغييرات سارية المفعول فور نشرها على هذه الصفحة."
  /// ```
  String get changes_text =>
      """قد نقوم بتحديث سياسة الخصوصية من وقت لآخر. لذلك، يُنصح بمراجعة هذه الصفحة بشكل دوري لأي تغييرات. سنخطرك بأي تغييرات عن طريق نشر سياسة الخصوصية الجديدة على هذه الصفحة. هذه التغييرات سارية المفعول فور نشرها على هذه الصفحة.""";

  /// ```dart
  /// "اتصل بنا"
  /// ```
  String get contact => """اتصل بنا""";

  /// ```dart
  /// "إذا كان لديك أي أسئلة أو اقتراحات حول سياسة الخصوصية، فلا تتردد في الاتصال بنا على jo1plates@outlook.com"
  /// ```
  String get contact_text =>
      """إذا كان لديك أي أسئلة أو اقتراحات حول سياسة الخصوصية، فلا تتردد في الاتصال بنا على jo1plates@outlook.com""";
}

class TermsMessagesAr extends TermsMessages {
  final MessagesAr _parent;
  const TermsMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "الشروط والأحكام"
  /// ```
  String get title => """الشروط والأحكام""";

  /// ```dart
  /// "تاريخ النفاذ: 1 يناير 2023"
  /// ```
  String get effective_date => """تاريخ النفاذ: 1 يناير 2023""";

  /// ```dart
  /// "يرجى قراءة هذه الشروط والأحكام بعناية قبل استخدام تطبيق جوبليت للهواتف المحمولة. بالوصول إلى خدمتنا أو استخدامها، فإنك توافق على الالتزام بهذه الشروط والأحكام."
  /// ```
  String get intro =>
      """يرجى قراءة هذه الشروط والأحكام بعناية قبل استخدام تطبيق جوبليت للهواتف المحمولة. بالوصول إلى خدمتنا أو استخدامها، فإنك توافق على الالتزام بهذه الشروط والأحكام.""";

  /// ```dart
  /// "قبول الشروط"
  /// ```
  String get acceptance => """قبول الشروط""";

  /// ```dart
  /// "باستخدام تطبيقنا، فإنك تقر بأنك قد قرأت وفهمت ووافقت على الالتزام بهذه الشروط والأحكام. إذا كنت لا توافق على هذه الشروط، يرجى عدم استخدام خدماتنا."
  /// ```
  String get acceptance_text =>
      """باستخدام تطبيقنا، فإنك تقر بأنك قد قرأت وفهمت ووافقت على الالتزام بهذه الشروط والأحكام. إذا كنت لا توافق على هذه الشروط، يرجى عدم استخدام خدماتنا.""";

  /// ```dart
  /// "حسابات المستخدمين"
  /// ```
  String get user_accounts => """حسابات المستخدمين""";

  /// ```dart
  /// "• أنت مسؤول عن الحفاظ على سرية حسابك وكلمة المرور الخاصة بك."
  /// ```
  String get account_1 =>
      """• أنت مسؤول عن الحفاظ على سرية حسابك وكلمة المرور الخاصة بك.""";

  /// ```dart
  /// "• أنت تقبل المسؤولية عن جميع الأنشطة التي تتم تحت حسابك."
  /// ```
  String get account_2 =>
      """• أنت تقبل المسؤولية عن جميع الأنشطة التي تتم تحت حسابك.""";

  /// ```dart
  /// "• يجب أن تكون عمرك 18 عاماً على الأقل لاستخدام هذه الخدمة."
  /// ```
  String get account_3 =>
      """• يجب أن تكون عمرك 18 عاماً على الأقل لاستخدام هذه الخدمة.""";

  /// ```dart
  /// "• أنت توافق على تقديم معلومات دقيقة وكاملة عند إنشاء حساب."
  /// ```
  String get account_4 =>
      """• أنت توافق على تقديم معلومات دقيقة وكاملة عند إنشاء حساب.""";

  /// ```dart
  /// "الإعلانات والمعاملات"
  /// ```
  String get listings => """الإعلانات والمعاملات""";

  /// ```dart
  /// "• أنت مسؤول وحدك عن دقة إعلاناتك."
  /// ```
  String get listing_1 => """• أنت مسؤول وحدك عن دقة إعلاناتك.""";

  /// ```dart
  /// "• جميع المعاملات تتم بين البائعين والمشترين مباشرة. جوبليت يسهل الاتصالات فقط."
  /// ```
  String get listing_2 =>
      """• جميع المعاملات تتم بين البائعين والمشترين مباشرة. جوبليت يسهل الاتصالات فقط.""";

  /// ```dart
  /// "• لا يضمن جوبليت جودة أو سلامة أو شرعية العناصر المعلن عنها."
  /// ```
  String get listing_3 =>
      """• لا يضمن جوبليت جودة أو سلامة أو شرعية العناصر المعلن عنها.""";

  /// ```dart
  /// "• قد تنطبق رسوم الإعلان ورسوم المعاملات كما هو محدد في التطبيق."
  /// ```
  String get listing_4 =>
      """• قد تنطبق رسوم الإعلان ورسوم المعاملات كما هو محدد في التطبيق.""";

  /// ```dart
  /// "الأنشطة المحظورة"
  /// ```
  String get prohibited => """الأنشطة المحظورة""";

  /// ```dart
  /// "• نشر معلومات كاذبة أو غير دقيقة أو مضللة"
  /// ```
  String get prohibited_1 => """• نشر معلومات كاذبة أو غير دقيقة أو مضللة""";

  /// ```dart
  /// "• استخدام الخدمة لأي غرض غير قانوني"
  /// ```
  String get prohibited_2 => """• استخدام الخدمة لأي غرض غير قانوني""";

  /// ```dart
  /// "• محاولة تجاوز أي إجراءات أمنية"
  /// ```
  String get prohibited_3 => """• محاولة تجاوز أي إجراءات أمنية""";

  /// ```dart
  /// "• انتحال شخصية شخص أو كيان آخر"
  /// ```
  String get prohibited_4 => """• انتحال شخصية شخص أو كيان آخر""";

  /// ```dart
  /// "• مضايقة أو تهديد المستخدمين الآخرين"
  /// ```
  String get prohibited_5 => """• مضايقة أو تهديد المستخدمين الآخرين""";

  /// ```dart
  /// "إنهاء الخدمة"
  /// ```
  String get termination => """إنهاء الخدمة""";

  /// ```dart
  /// "نحتفظ بالحق في إنهاء أو تعليق الوصول إلى خدمتنا فوراً، دون إشعار مسبق أو مسؤولية، لأي سبب كان، بما في ذلك على سبيل المثال لا الحصر إذا انتهكت الشروط والأحكام."
  /// ```
  String get termination_text =>
      """نحتفظ بالحق في إنهاء أو تعليق الوصول إلى خدمتنا فوراً، دون إشعار مسبق أو مسؤولية، لأي سبب كان، بما في ذلك على سبيل المثال لا الحصر إذا انتهكت الشروط والأحكام.""";

  /// ```dart
  /// "التغييرات على الشروط"
  /// ```
  String get changes => """التغييرات على الشروط""";

  /// ```dart
  /// "نحتفظ بالحق في تعديل أو استبدال هذه الشروط في أي وقت. سنقدم إشعاراً بالتغييرات المهمة. استمرارك في استخدام الخدمة بعد هذه التغييرات يشكل قبولك للشروط الجديدة."
  /// ```
  String get changes_text =>
      """نحتفظ بالحق في تعديل أو استبدال هذه الشروط في أي وقت. سنقدم إشعاراً بالتغييرات المهمة. استمرارك في استخدام الخدمة بعد هذه التغييرات يشكل قبولك للشروط الجديدة.""";

  /// ```dart
  /// "اتصل بنا"
  /// ```
  String get contact => """اتصل بنا""";

  /// ```dart
  /// "إذا كان لديك أي أسئلة حول هذه الشروط، يرجى الاتصال بنا على jo1plates@outlook.com"
  /// ```
  String get contact_text =>
      """إذا كان لديك أي أسئلة حول هذه الشروط، يرجى الاتصال بنا على jo1plates@outlook.com""";
}

class CommonMessagesAr extends CommonMessages {
  final MessagesAr _parent;
  const CommonMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "لا توجد عناصر"
  /// ```
  String get no_items_found => """لا توجد عناصر""";

  /// ```dart
  /// "لا توجد نتائج"
  /// ```
  String get no_results_found => """لا توجد نتائج""";

  /// ```dart
  /// "لا توجد بيانات"
  /// ```
  String get no_data_found => """لا توجد بيانات""";

  /// ```dart
  /// "لا توجد نتائج"
  /// ```
  String get no_results => """لا توجد نتائج""";

  /// ```dart
  /// "لا توجد عناصر"
  /// ```
  String get no_items => """لا توجد عناصر""";

  /// ```dart
  /// "متابعة"
  /// ```
  String get follow => """متابعة""";

  /// ```dart
  /// "إلغاء المتابعة"
  /// ```
  String get unfollow => """إلغاء المتابعة""";

  /// ```dart
  /// "متابع"
  /// ```
  String get following => """متابع""";

  /// ```dart
  /// "تأكيد"
  /// ```
  String get confirm => """تأكيد""";

  /// ```dart
  /// "إلغاء"
  /// ```
  String get cancel => """إلغاء""";

  /// ```dart
  /// "هل أنت متأكد من رغبتك في تسجيل الخروج؟"
  /// ```
  String get confirm_logout => """هل أنت متأكد من رغبتك في تسجيل الخروج؟""";

  /// ```dart
  /// "هل أنت متأكد من رغبتك في حذف حسابك؟ لا يمكن التراجع عن هذا الإجراء."
  /// ```
  String get delete_account_confirmation =>
      """هل أنت متأكد من رغبتك في حذف حسابك؟ لا يمكن التراجع عن هذا الإجراء.""";

  /// ```dart
  /// "يرجى إدخال كلمة المرور لتأكيد حذف الحساب."
  /// ```
  String get enter_password_to_delete =>
      """يرجى إدخال كلمة المرور لتأكيد حذف الحساب.""";

  /// ```dart
  /// "تم حذف الحساب بنجاح."
  /// ```
  String get account_deleted => """تم حذف الحساب بنجاح.""";

  /// ```dart
  /// "فشل في حذف الحساب: "
  /// ```
  String get delete_account_failed => """فشل في حذف الحساب: """;

  /// ```dart
  /// "يرجى إعادة إدخال كلمة المرور لتأكيد هذا الإجراء."
  /// ```
  String get requires_recent_login =>
      """يرجى إعادة إدخال كلمة المرور لتأكيد هذا الإجراء.""";

  /// ```dart
  /// "كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى."
  /// ```
  String get invalid_credentials =>
      """كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى.""";

  /// ```dart
  /// "رمز ترويجي غير صالح. يرجى المحاولة مرة أخرى."
  /// ```
  String get invalid_promo_code =>
      """رمز ترويجي غير صالح. يرجى المحاولة مرة أخرى.""";

  /// ```dart
  /// "تم تطبيق الرمز الترويجي بنجاح!"
  /// ```
  String get promo_code_applied => """تم تطبيق الرمز الترويجي بنجاح!""";

  /// ```dart
  /// "خطأ في تطبيق الرمز الترويجي. يرجى المحاولة مرة أخرى."
  /// ```
  String get error_applying_promo_code =>
      """خطأ في تطبيق الرمز الترويجي. يرجى المحاولة مرة أخرى.""";

  /// ```dart
  /// "لا توجد خطط متاحة."
  /// ```
  String get no_plans_available => """لا توجد خطط متاحة.""";

  /// ```dart
  /// "معرف المنتج مفقود"
  /// ```
  String get missing_product_id => """معرف المنتج مفقود""";

  /// ```dart
  /// "تمت ترقية إعلانك بنجاح!"
  /// ```
  String get promotion_success => """تمت ترقية إعلانك بنجاح!""";

  /// ```dart
  /// "فشل في ترقية الإعلان"
  /// ```
  String get promotion_failed => """فشل في ترقية الإعلان""";

  /// ```dart
  /// "رقم الهاتف مطلوب"
  /// ```
  String get phone_required => """رقم الهاتف مطلوب""";

  /// ```dart
  /// "يجب أن يبدأ الرقم بـ 7"
  /// ```
  String get phone_start_with_7 => """يجب أن يبدأ الرقم بـ 7""";

  /// ```dart
  /// "يجب أن يكون الرقم 77 أو 78 أو 79"
  /// ```
  String get phone_start_with_77_78_79 =>
      """يجب أن يكون الرقم 77 أو 78 أو 79""";

  /// ```dart
  /// "يجب أن يكون رقم الهاتف 9 أرقام بعد +962"
  /// ```
  String get phone_length => """يجب أن يكون رقم الهاتف 9 أرقام بعد +962""";

  /// ```dart
  /// "الوصف (اختياري)"
  /// ```
  String get description_optional => """الوصف (اختياري)""";

  /// ```dart
  /// "الوصف"
  /// ```
  String get description => """الوصف""";

  /// ```dart
  /// "أضف وصفًا (الحد الأقصى 150 حرفًا)"
  /// ```
  String get description_hint => """أضف وصفًا (الحد الأقصى 150 حرفًا)""";

  /// ```dart
  /// "يجب أن يكون الوصف 150 حرفًا أو أقل"
  /// ```
  String get description_too_long => """يجب أن يكون الوصف 150 حرفًا أو أقل""";

  /// ```dart
  /// "فشل الشراء"
  /// ```
  String get purchase_error => """فشل الشراء""";

  /// ```dart
  /// "✅ تم تفعيل التذكرة بنجاح"
  /// ```
  String get activation_success => """✅ تم تفعيل التذكرة بنجاح""";

  /// ```dart
  /// "❌ فشل التفعيل: "
  /// ```
  String get activation_failed => """❌ فشل التفعيل: """;

  /// ```dart
  /// "خطأ غير معروف"
  /// ```
  String get unknown_error => """خطأ غير معروف""";
}

class ListingstatusMessagesAr extends ListingstatusMessages {
  final MessagesAr _parent;
  const ListingstatusMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "مميز"
  /// ```
  String get featured => """مميز""";

  /// ```dart
  /// "نشط"
  /// ```
  String get active => """نشط""";

  /// ```dart
  /// "غير نشط"
  /// ```
  String get inactive => """غير نشط""";

  /// ```dart
  /// "معطل"
  /// ```
  String get disabled => """معطل""";

  /// ```dart
  /// "منتهي"
  /// ```
  String get expired => """منتهي""";

  /// ```dart
  /// "مباع"
  /// ```
  String get sold => """مباع""";
}

class AccountMessagesAr extends AccountMessages {
  final MessagesAr _parent;
  const AccountMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "حذف الحساب"
  /// ```
  String get delete_account => """حذف الحساب""";

  /// ```dart
  /// "كلمة المرور"
  /// ```
  String get password => """كلمة المرور""";
}

class UserprofileMessagesAr extends UserprofileMessages {
  final MessagesAr _parent;
  const UserprofileMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "الملف الشخصي"
  /// ```
  String get title => """الملف الشخصي""";

  /// ```dart
  /// "لم يتم العثور على المستخدم"
  /// ```
  String get user_not_found => """لم يتم العثور على المستخدم""";

  /// ```dart
  /// "لا توجد إعلانات لوحات"
  /// ```
  String get no_plate_listings => """لا توجد إعلانات لوحات""";

  /// ```dart
  /// "لا توجد إعلانات هواتف"
  /// ```
  String get no_phone_listings => """لا توجد إعلانات هواتف""";

  /// ```dart
  /// "لا توجد طلبات لوحات"
  /// ```
  String get no_plate_requests => """لا توجد طلبات لوحات""";

  /// ```dart
  /// "لا توجد طلبات هواتف"
  /// ```
  String get no_phone_requests => """لا توجد طلبات هواتف""";

  /// ```dart
  /// "خطأ في تحميل الملف الشخصي:"
  /// ```
  String get error_loading => """خطأ في تحميل الملف الشخصي:""";

  /// ```dart
  /// "خطأ في تحميل إعلانات اللوحات:"
  /// ```
  String get error_loading_plates => """خطأ في تحميل إعلانات اللوحات:""";

  /// ```dart
  /// "خطأ في تحميل إعلانات الهواتف:"
  /// ```
  String get error_loading_phones => """خطأ في تحميل إعلانات الهواتف:""";

  /// ```dart
  /// "خطأ في تحميل طلبات اللوحات:"
  /// ```
  String get error_loading_plate_requests => """خطأ في تحميل طلبات اللوحات:""";

  /// ```dart
  /// "خطأ في تحميل طلبات الهواتف:"
  /// ```
  String get error_loading_phone_requests => """خطأ في تحميل طلبات الهواتف:""";

  /// ```dart
  /// "تمت المتابعة بنجاح"
  /// ```
  String get follow_success => """تمت المتابعة بنجاح""";

  /// ```dart
  /// "تم إلغاء المتابعة بنجاح"
  /// ```
  String get unfollow_success => """تم إلغاء المتابعة بنجاح""";

  /// ```dart
  /// "يجب تسجيل الدخول لمتابعة المستخدمين"
  /// ```
  String get login_required => """يجب تسجيل الدخول لمتابعة المستخدمين""";

  /// ```dart
  /// "خطأ: "
  /// ```
  String get error => """خطأ: """;
}

class PromoteMessagesAr extends PromoteMessages {
  final MessagesAr _parent;
  const PromoteMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "✨ ترقية الإعلان"
  /// ```
  String get title_free => """✨ ترقية الإعلان""";

  /// ```dart
  /// "بيع أسرع!"
  /// ```
  String get title_paid => """بيع أسرع!""";

  /// ```dart
  /// "ميز إعلانك لمدة 14 يوم بتذكرة ذهبية."
  /// ```
  String get description_free => """ميز إعلانك لمدة 14 يوم بتذكرة ذهبية.""";

  /// ```dart
  /// "زد ظهور إعلانك 10 مرات."
  /// ```
  String get description_paid => """زد ظهور إعلانك 10 مرات.""";

  /// ```dart
  /// "ترقية"
  /// ```
  String get promote_button => """ترقية""";

  /// ```dart
  /// "اجعلها مميزة"
  /// ```
  String get make_featured => """اجعلها مميزة""";

  /// ```dart
  /// "جاري التحميل..."
  /// ```
  String get loading => """جاري التحميل...""";

  /// ```dart
  /// "جاري الشراء..."
  /// ```
  String get purchasing => """جاري الشراء...""";
}

class DeletelistingMessagesAr extends DeletelistingMessages {
  final MessagesAr _parent;
  const DeletelistingMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "حذف الإعلان؟"
  /// ```
  String get title => """حذف الإعلان؟""";

  /// ```dart
  /// "هذا الإجراء لا يمكن التراجع عنه. هل تريد حقاً حذف هذا الإعلان؟"
  /// ```
  String get description =>
      """هذا الإجراء لا يمكن التراجع عنه. هل تريد حقاً حذف هذا الإعلان؟""";

  /// ```dart
  /// "تحديد كـ مُباع"
  /// ```
  String get mark_as_sold => """تحديد كـ مُباع""";

  /// ```dart
  /// "حذف"
  /// ```
  String get delete => """حذف""";

  /// ```dart
  /// "تم حذف الإعلان بنجاح"
  /// ```
  String get success_message => """تم حذف الإعلان بنجاح""";
}

Map<String, String> get messagesArMap => {
  """app.title""": """Joplate""",
  """home.welcome""": """مرحبًا بك في Joplate!""",
  """home.button_list_item""": """أضف إعلان""",
  """home.button_view_items""": """عرض الإعلانات""",
  """home.featured_numbers""": """الأرقام المميزة""",
  """home.car_number""": """ارقام السيارات""",
  """home.phone_numbers""": """ارقام الهواتف""",
  """home.requests""": """الطلبات""",
  """home.quick_sale""": """البيع السريع""",
  """home.featured""": """مميز""",
  """home.sold""": """تم البيع""",
  """home.expired""": """منتهية""",
  """home.mynumbers""": """أرقامي""",
  """home.myRequests""": """طلباتي""",
  """home.search""": """بحث""",
  """home.disabled""": """محذوف""",
  """home.visits""": """المشاهدات""",
  """home.requested""": """مطلوب""",
  """profile.title""": """الملف الشخصي""",
  """profile.Requests""": """طلبات""",
  """profile.Ads""": """إعلانات""",
  """profile.myAds""": """إعلاناتي""",
  """profile.myRequests""": """طلباتي""",
  """profile.Numbers""": """أرقامي""",
  """profile.packages""": """الباقات""",
  """profile.my_current_plan""": """باقتي الحالية""",
  """profile.language""": """اللغة""",
  """profile.theme""": """الوضع الليلي""",
  """profile.dark_mode""": """ليل""",
  """profile.light_mode""": """نهار""",
  """profile.aboutus""": """من نحن""",
  """profile.privacy_policy""": """سياسة الخصوصية""",
  """profile.terms_conditions""": """الشروط والأحكام""",
  """profile.instructions""": """التعليمات""",
  """profile.logout""": """تسجيل الخروج""",
  """profile.delete_account""": """حذف الحساب""",
  """profile.notsignedin""": """غير مسجل الدخول""",
  """profile.signin""": """تسجيل الدخول""",
  """profile.upload""": """تحميل""",
  """profile.choose_source""": """اختر مصدر الصورة""",
  """profile.gallery""": """معرض الصور""",
  """profile.camera""": """الكاميرا""",
  """profile.promo_code""": """رمز ترويجي""",
  """profile.promo_code_hint""": """أدخل الرمز الترويجي""",
  """footer.home""": """الرئيسية""",
  """footer.profile""": """الملف الشخصي""",
  """footer.favorites""": """المفضلة""",
  """footer.feed""": """المتابعة""",
  """editprofile.header""": """ الملف الشخصي""",
  """editprofile.full_name""": """الاسم الكامل""",
  """editprofile.phone_number""": """رقم الهاتف""",
  """editprofile.email""": """البريد الالكتروني""",
  """editprofile.change_password""": """تغيير كلمة المرور""",
  """editprofile.edit_fullname""": """تعديل الاسم الكامل""",
  """editprofile.edit_email""": """تعديل البريد الالكتروني""",
  """editprofile.edit_phone""": """تعديل رقم الهاتف""",
  """editprofile.save""": """حفظ""",
  """editprofile.send_verification_code""": """ارسال كود التحقق""",
  """editprofile.verifyandsave""": """تحقق وحفظ""",
  """editprofile.oldpassword""": """كلمة المرور القديمة""",
  """editprofile.newpassword""": """كلمة المرور الجديدة""",
  """editprofile.confirmpassword""": """تأكيد كلمة المرور""",
  """editprofile.phone_number_already_used""":
      """رقم الهاتف مستخدم من قبل مستخدم آخر""",
  """plan.title""": """خطتي الحالية""",
  """plan.plan_name""": """اسم الخطة""",
  """plan.balance""": """0 / JOD""",
  """plan.renewal_date""": """تجديد في""",
  """plan.change_plan_button""": """تغيير الخطة""",
  """plan.your_plan_label""": """خطتك""",
  """favorites sc.no_favorites""": """لا يوجد عناصر في المفضلة""",
  """favorites sc.failed_to_load""": """فشل في تحميل المفضلة""",
  """phones.title""": """أرقام الهواتف""",
  """phones.add_button""": """إضافة""",
  """phones.company_label""": """الشركة""",
  """phones.contains""": """يحتوي على""",
  """phones.starts_with""": """يبدأ بـ""",
  """phones.ends_with""": """ينتهي بـ""",
  """phones.min_price""": """أقل سعر""",
  """phones.max_price""": """أعلى سعر""",
  """phones.search""": """بحث""",
  """phones.see_more""": """عرض المزيد""",
  """phones.show_less""": """عرض أقل""",
  """plates.title""": """أرقام السيارات""",
  """plates.code""": """الترميز""",
  """plates.digit_count""": """عدد الأرقام""",
  """plates.format""": """النمط""",
  """plates.contains""": """يحتوي على""",
  """plates.starts_with""": """يبدأ بـ""",
  """plates.ends_with""": """ينتهي بـ""",
  """plates.min_price""": """أقل سعر""",
  """plates.max_price""": """أعلى سعر""",
  """plates.search""": """بحث""",
  """plates.see_more""": """عرض المزيد""",
  """plates.show_less""": """عرض أقل""",
  """digitcounts.d1""": """رقم واحد""",
  """digitcounts.d2""": """رقمان""",
  """digitcounts.d3""": """ثلاثي""",
  """digitcounts.d4""": """رباعي""",
  """digitcounts.d5""": """خماسي""",
  """formats.title""": """النمط""",
  """formats.repeat_2""": """يحتوي على رقم مكرر مرتين""",
  """formats.repeat_3""": """يحتوي على رقم مكرر ثلاث مرات""",
  """formats.repeat_4""": """يحتوي على رقم مكرر أربع مرات""",
  """formats.f_5_1""": """X???X (خماسي)""",
  """formats.f_5_2""": """XYZYX (خماسي)""",
  """formats.f_5_3""": """XXXZX (خماسي)""",
  """formats.f_5_4""": """?XXX? (خماسي)""",
  """formats.f_5_5""": """XYXYX (خماسي)""",
  """formats.f_5_6""": """XYYYX (خماسي)""",
  """formats.f_5_7""": """??XXX (خماسي)""",
  """formats.f_5_8""": """XXX?? (خماسي)""",
  """formats.f_5_9""": """XXXXX (خماسي)""",
  """formats.f_4_1""": """X??X (رباعي)""",
  """formats.f_4_2""": """XYXX (رباعي)""",
  """formats.f_4_3""": """XYXY (رباعي)""",
  """formats.f_4_4""": """?XX? (رباعي)""",
  """formats.f_4_5""": """XXXY (رباعي)""",
  """formats.f_4_6""": """XYYY (رباعي)""",
  """formats.f_4_7""": """XXXX (رباعي)""",
  """formats.f_3_1""": """XYX (ثلاثي)""",
  """formats.f_3_2""": """XYZ (ثلاثي)""",
  """formats.f_3_3""": """XYY (ثلاثي)""",
  """formats.f_3_4""": """XXY (ثلاثي)""",
  """formats.f_3_5""": """XXX (ثلاثي)""",
  """addphonenumber.title""": """إضافة رقم هاتف""",
  """addphonenumber.company_label""": """الشركة""",
  """addphonenumber.phone_number_label""": """رقم الهاتف""",
  """addphonenumber.save_button""": """نشر""",
  """addphonenumber.cancel_button""": """إلغاء""",
  """addphonenumber.addmore""": """إضافة أكثر""",
  """addphonenumber.with_discount""": """مع خصم""",
  """addphonenumber.without_discount""": """بدون خصم""",
  """addphonenumber.featured""": """مميز""",
  """addphonenumber.not_featured""": """غير مميز""",
  """addphonenumber.number""": """رقم""",
  """addphonenumber.price""": """السعر""",
  """addphonenumber.price_before_discount""": """السعر قبل الخصم""",
  """addphonenumber.price_after_discount""": """السعر بعد الخصم""",
  """addplate.title""": """إضافة رقم سيارة""",
  """addplate.company_label""": """الشركة""",
  """addplate.plate_number_label""": """رقم اللوحة""",
  """addplate.save_button""": """نشر""",
  """addplate.cancel_button""": """إلغاء""",
  """addplate.addmore""": """إضافة أكثر""",
  """addplate.with_discount""": """مع خصم""",
  """addplate.without_discount""": """بدون خصم""",
  """addplate.featured""": """مميز""",
  """addplate.not_featured""": """غير مميز""",
  """addplate.number""": """رقم""",
  """addplate.price""": """السعر""",
  """addplate.price_before_discount""": """السعر قبل الخصم""",
  """addplate.price_after_discount""": """السعر بعد الخصم""",
  """addplate.code""": """الترميز""",
  """addplate.select_code""": """اختر الترميز""",
  """addplate.code_required""": """الترميز مطلوب""",
  """addplate.number_required""": """رقم اللوحة مطلوب""",
  """addplate.invalid_code""": """ترميز غير صالح""",
  """addplate.invalid_number""": """رقم لوحة غير صالح""",
  """addplate.mask_instructions""": """يمكنك استخدام X أو Y لإخفاء أي رقم""",
  """addphonerequest.title""": """إضافة طلب هاتف""",
  """addphonerequest.company_label""": """الشركة""",
  """addphonerequest.phone_number_label""": """رقم الهاتف""",
  """addphonerequest.save_button""": """نشر""",
  """addphonerequest.cancel_button""": """إلغاء""",
  """addphonerequest.required_phone_number""": """رقم الهاتف المطلوب""",
  """addphonerequest.optional_price""": """السعر اختياري""",
  """addplaterequest.title""": """إضافة طلب رقم سيارة""",
  """addplaterequest.company_label""": """الشركة""",
  """addplaterequest.plate_number_label""": """رقم اللوحة""",
  """addplaterequest.save_button""": """نشر""",
  """addplaterequest.cancel_button""": """إلغاء""",
  """addplaterequest.required_plate_number""": """رقم اللوحة المطلوب""",
  """addplaterequest.code""": """ترميز اللوحة""",
  """addplaterequest.number""": """رقم اللوحة""",
  """addplaterequest.optional_price""": """السعر اختياري""",
  """phonedetails.title""": """تفاصيل رقم الهاتف""",
  """phonedetails.important_note""": """ملاحظات هامة:""",
  """phonedetails.dont_transfer_money""":
      """لا تقم بتحويل الأموال عبر الإنترنت""",
  """phonedetails.meet_in_person""": """قابل البائع شخصياً""",
  """sellerdetails.about_seller""": """حول البائع""",
  """sellerdetails.user_not_found""": """لم يتم العثور على المستخدم""",
  """sellerdetails.whatsapp""": """واتساب""",
  """sellerdetails.phone_call""": """اتصال""",
  """platesdetails.title""": """تفاصيل رقم اللوحة""",
  """platesdetails.originally_posted_by""": """نُشر بواسطة""",
  """platesdetails.whatsapp""": """واتساب""",
  """platesdetails.call""": """اتصال""",
  """platesdetails.other_sellers""": """بائعون آخرون""",
  """platesdetails.seller""": """البائع""",
  """platesdetails.price""": """السعر""",
  """platesdetails.contact""": """تواصل""",
  """platesdetails.important_note""": """ملاحظة هامة:""",
  """platesdetails.dont_transfer_money""":
      """لا تقم بتحويل الأموال عبر الإنترنت""",
  """platesdetails.meet_in_person""": """قابل البائع شخصياً""",
  """platesdetails.call_for_price""": """اتصل لمعرفة السعر""",
  """quicksale.title""": """البيع السريع""",
  """quicksale.description""":
      """هل ترغب بأن نجد لك مشتريًا لرقم سيارتك؟ يمكننا مساعدتك في ذلك.""",
  """quicksale.whatsapp""": """واتساب""",
  """quicksale.call""": """اتصال""",
  """quicksale.user_not_found""": """لم يتم العثور على المستخدم""",
  """quicksale.requested_by""": """الطلب بواسطة""",
  """editphone.title""": """تعديل إعلان الرقم""",
  """editphone.phone_number""": """رقم الهاتف""",
  """editphone.price""": """السعر""",
  """editphone.discount_price""": """سعر الخصم""",
  """editphone.feature""": """تمييز هذا الإعلان""",
  """editphone.mark_sold""": """تحديد كـ مُباع""",
  """editphone.disable""": """تعطيل هذا الإعلان""",
  """editphone.save_changes""": """حفظ التعديلات""",
  """editphone.withdiscount""": """هل يوجد خصم؟""",
  """editphone.discount""": """هل يوجد خصم؟""",
  """editphonerequest.title""": """تعديل طلب الرقم""",
  """editphonerequest.phone_number""": """رقم الهاتف""",
  """editphonerequest.price_optional""": """السعر (اختياري)""",
  """editphonerequest.save_changes""": """حفظ التعديلات""",
  """editplate.title""": """تعديل إعلان اللوحة""",
  """editplate.code""": """الترميز""",
  """editplate.plate_number""": """رقم اللوحة""",
  """editplate.price""": """السعر""",
  """editplate.discount_price""": """سعر الخصم""",
  """editplate.featured""": """تمييز""",
  """editplate.disabled""": """تعطيل""",
  """editplate.sold""": """مباع""",
  """editplate.save_changes""": """حفظ التعديلات""",
  """editplaterequest.title""": """تعديل طلب اللوحة""",
  """editplaterequest.code""": """الترميز""",
  """editplaterequest.number""": """الرقم""",
  """editplaterequest.price_optional""": """السعر (اختياري)""",
  """editplaterequest.save_changes""": """حفظ التعديلات""",
  """iap.purchase""": """شراء""",
  """datetime.just_now""": """الآن""",
  """auth.signin""": """تسجيل الدخول""",
  """auth.signup""": """تسجيل حساب""",
  """auth.display_name""": """الاسم المعروض""",
  """auth.email""": """البريد الإلكتروني""",
  """auth.phone_number""": """رقم الهاتف""",
  """auth.password""": """كلمة المرور""",
  """auth.reset_password""": """استعادة كلمة المرور""",
  """auth.continue_guest""": """الاستمرار كزائر""",
  """auth.reset_password_title""": """استعادة كلمة المرور""",
  """auth.enter_email""": """أدخل بريدك الإلكتروني""",
  """auth.cancel""": """إلغاء""",
  """auth.reset""": """استعادة""",
  """auth.reset_sent""":
      """تم إرسال تعليمات استعادة كلمة المرور إلى بريدك الإلكتروني""",
  """auth.guest""": """الاستمرار كزائر""",
  """auth.verification_code""": """رمز التحقق""",
  """auth.enter_verification_code""": """أدخل رمز التحقق""",
  """auth.code_check_spam""":
      """يجب أن يصل الرمز خلال دقائق قليلة. تحقق من مجلد البريد المزعج إذا لم تجده.""",
  """auth.enter_code_from_email""": """أدخل الرمز من بريدك الإلكتروني""",
  """auth.please_enter_code""": """الرجاء إدخال رمز التحقق""",
  """auth.verify_code""": """تحقق من الرمز""",
  """auth.resend_code""": """إعادة إرسال الرمز""",
  """auth.back""": """رجوع""",
  """auth.create_new_password""": """إنشاء كلمة مرور جديدة""",
  """auth.verified_set_password""":
      """تم التحقق من بريدك الإلكتروني. الرجاء تعيين كلمة المرور الجديدة.""",
  """auth.new_password""": """كلمة المرور الجديدة""",
  """auth.enter_new_password""": """أدخل كلمة المرور الجديدة""",
  """auth.confirm_password""": """تأكيد كلمة المرور الجديدة""",
  """auth.confirm_new_password""": """تأكيد كلمة المرور الجديدة""",
  """auth.passwords_not_match""": """كلمات المرور غير متطابقة""",
  """auth.password_reset_successful""": """تم إعادة تعيين كلمة المرور بنجاح""",
  """auth.password_reset_success_message""":
      """تم إعادة تعيين كلمة المرور بنجاح. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة.""",
  """auth.login""": """تسجيل الدخول""",
  """auth.follow_us""": """تابعنا على""",
  """auth.reset_password_description""":
      """أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور""",
  """auth.reset_password_instructions""":
      """سنرسل لك رابطًا لإعادة تعيين كلمة المرور""",
  """auth.send_reset_code""": """إرسال رابط إعادة التعيين""",
  """auth.check_email_instructions""":
      """تحقق من بريدك الإلكتروني للحصول على رابط إعادة التعيين. استخدم الرابط لإعادة تعيين كلمة المرور.""",
  """auth.signin_to_contact""": """يجب تسجيل الدخول لعرض معلومات الاتصال""",
  """feed.title""": """المتابعة""",
  """feed.login_required""": """يجب تسجيل الدخول لعرض الاعلانات""",
  """feed.sign_in""": """تسجيل الدخول""",
  """feed.error_loading""": """خطأ في تحميل الملف الشخصي:""",
  """feed.retry""": """إعادة المحاولة""",
  """feed.user_not_found""": """لم يتم العثور على الملف الشخصي""",
  """feed.empty_feed""": """لا يوجد اعلانات""",
  """feed.follow_users""": """تابع المستخدمين لرؤية إعلاناتهم هنا""",
  """feed.explore_listings""": """استكشاف الإعلانات""",
  """feed.no_users_followed""": """أنت لا تتابع أي مستخدمين""",
  """feed.error_generic""": """خطأ في تحميل البيانات:""",
  """feed.no_plate_listings""":
      """لا توجد إعلانات لوحات من المستخدمين الذين تتابعهم""",
  """feed.no_phone_listings""":
      """لا توجد إعلانات هواتف من المستخدمين الذين تتابعهم""",
  """privacy.title""": """سياسة الخصوصية""",
  """privacy.effective_date""": """تاريخ النفاذ: 1 يناير 2023""",
  """privacy.intro""":
      """في جوبليت، نحن نقدر خصوصيتك وملتزمون بحماية معلوماتك الشخصية. توضح سياسة الخصوصية هذه كيفية جمع واستخدام وحماية معلوماتك عند استخدام تطبيقنا للهواتف المحمولة.""",
  """privacy.information_collected""": """المعلومات التي نجمعها""",
  """privacy.personal_info""":
      """• المعلومات الشخصية: الاسم، عنوان البريد الإلكتروني، رقم الهاتف، وصورة الملف الشخصي""",
  """privacy.user_content""":
      """• محتوى المستخدم: المعلومات التي تقدمها عن الإعلانات، بما في ذلك الصور والأوصاف""",
  """privacy.device_info""":
      """• معلومات الجهاز: نوع الجهاز، نظام التشغيل، ومعرفات الجهاز الفريدة""",
  """privacy.usage_data""":
      """• بيانات الاستخدام: كيفية تفاعلك مع تطبيقنا، الميزات التي تستخدمها، والوقت المستغرق في التطبيق""",
  """privacy.how_we_use""": """كيفية استخدام معلوماتك""",
  """privacy.use_1""": """• لتقديم وصيانة خدمتنا""",
  """privacy.use_2""": """• لإخطارك بالتغييرات في خدمتنا""",
  """privacy.use_3""": """• للسماح لك بالمشاركة في الميزات التفاعلية""",
  """privacy.use_4""": """• لتقديم دعم العملاء""",
  """privacy.use_5""": """• لجمع التحليلات أو المعلومات القيمة لتحسين خدمتنا""",
  """privacy.use_6""": """• لمراقبة استخدام خدمتنا""",
  """privacy.use_7""": """• للكشف عن المشكلات التقنية ومنعها ومعالجتها""",
  """privacy.security""": """الأمان""",
  """privacy.security_text""":
      """نحن نقدر ثقتك في تقديم معلوماتك الشخصية لنا، وبالتالي نسعى جاهدين لاستخدام وسائل مقبولة تجارياً لحمايتها. لكن تذكر أنه لا توجد طريقة للإرسال عبر الإنترنت، أو طريقة للتخزين الإلكتروني آمنة وموثوقة بنسبة 100٪، ولا يمكننا ضمان أمنها المطلق.""",
  """privacy.changes""": """التغييرات على سياسة الخصوصية""",
  """privacy.changes_text""":
      """قد نقوم بتحديث سياسة الخصوصية من وقت لآخر. لذلك، يُنصح بمراجعة هذه الصفحة بشكل دوري لأي تغييرات. سنخطرك بأي تغييرات عن طريق نشر سياسة الخصوصية الجديدة على هذه الصفحة. هذه التغييرات سارية المفعول فور نشرها على هذه الصفحة.""",
  """privacy.contact""": """اتصل بنا""",
  """privacy.contact_text""":
      """إذا كان لديك أي أسئلة أو اقتراحات حول سياسة الخصوصية، فلا تتردد في الاتصال بنا على jo1plates@outlook.com""",
  """terms.title""": """الشروط والأحكام""",
  """terms.effective_date""": """تاريخ النفاذ: 1 يناير 2023""",
  """terms.intro""":
      """يرجى قراءة هذه الشروط والأحكام بعناية قبل استخدام تطبيق جوبليت للهواتف المحمولة. بالوصول إلى خدمتنا أو استخدامها، فإنك توافق على الالتزام بهذه الشروط والأحكام.""",
  """terms.acceptance""": """قبول الشروط""",
  """terms.acceptance_text""":
      """باستخدام تطبيقنا، فإنك تقر بأنك قد قرأت وفهمت ووافقت على الالتزام بهذه الشروط والأحكام. إذا كنت لا توافق على هذه الشروط، يرجى عدم استخدام خدماتنا.""",
  """terms.user_accounts""": """حسابات المستخدمين""",
  """terms.account_1""":
      """• أنت مسؤول عن الحفاظ على سرية حسابك وكلمة المرور الخاصة بك.""",
  """terms.account_2""":
      """• أنت تقبل المسؤولية عن جميع الأنشطة التي تتم تحت حسابك.""",
  """terms.account_3""":
      """• يجب أن تكون عمرك 18 عاماً على الأقل لاستخدام هذه الخدمة.""",
  """terms.account_4""":
      """• أنت توافق على تقديم معلومات دقيقة وكاملة عند إنشاء حساب.""",
  """terms.listings""": """الإعلانات والمعاملات""",
  """terms.listing_1""": """• أنت مسؤول وحدك عن دقة إعلاناتك.""",
  """terms.listing_2""":
      """• جميع المعاملات تتم بين البائعين والمشترين مباشرة. جوبليت يسهل الاتصالات فقط.""",
  """terms.listing_3""":
      """• لا يضمن جوبليت جودة أو سلامة أو شرعية العناصر المعلن عنها.""",
  """terms.listing_4""":
      """• قد تنطبق رسوم الإعلان ورسوم المعاملات كما هو محدد في التطبيق.""",
  """terms.prohibited""": """الأنشطة المحظورة""",
  """terms.prohibited_1""": """• نشر معلومات كاذبة أو غير دقيقة أو مضللة""",
  """terms.prohibited_2""": """• استخدام الخدمة لأي غرض غير قانوني""",
  """terms.prohibited_3""": """• محاولة تجاوز أي إجراءات أمنية""",
  """terms.prohibited_4""": """• انتحال شخصية شخص أو كيان آخر""",
  """terms.prohibited_5""": """• مضايقة أو تهديد المستخدمين الآخرين""",
  """terms.termination""": """إنهاء الخدمة""",
  """terms.termination_text""":
      """نحتفظ بالحق في إنهاء أو تعليق الوصول إلى خدمتنا فوراً، دون إشعار مسبق أو مسؤولية، لأي سبب كان، بما في ذلك على سبيل المثال لا الحصر إذا انتهكت الشروط والأحكام.""",
  """terms.changes""": """التغييرات على الشروط""",
  """terms.changes_text""":
      """نحتفظ بالحق في تعديل أو استبدال هذه الشروط في أي وقت. سنقدم إشعاراً بالتغييرات المهمة. استمرارك في استخدام الخدمة بعد هذه التغييرات يشكل قبولك للشروط الجديدة.""",
  """terms.contact""": """اتصل بنا""",
  """terms.contact_text""":
      """إذا كان لديك أي أسئلة حول هذه الشروط، يرجى الاتصال بنا على jo1plates@outlook.com""",
  """common.no_items_found""": """لا توجد عناصر""",
  """common.no_results_found""": """لا توجد نتائج""",
  """common.no_data_found""": """لا توجد بيانات""",
  """common.no_results""": """لا توجد نتائج""",
  """common.no_items""": """لا توجد عناصر""",
  """common.follow""": """متابعة""",
  """common.unfollow""": """إلغاء المتابعة""",
  """common.following""": """متابع""",
  """common.confirm""": """تأكيد""",
  """common.cancel""": """إلغاء""",
  """common.confirm_logout""": """هل أنت متأكد من رغبتك في تسجيل الخروج؟""",
  """common.delete_account_confirmation""":
      """هل أنت متأكد من رغبتك في حذف حسابك؟ لا يمكن التراجع عن هذا الإجراء.""",
  """common.enter_password_to_delete""":
      """يرجى إدخال كلمة المرور لتأكيد حذف الحساب.""",
  """common.account_deleted""": """تم حذف الحساب بنجاح.""",
  """common.delete_account_failed""": """فشل في حذف الحساب: """,
  """common.requires_recent_login""":
      """يرجى إعادة إدخال كلمة المرور لتأكيد هذا الإجراء.""",
  """common.invalid_credentials""":
      """كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى.""",
  """common.invalid_promo_code""":
      """رمز ترويجي غير صالح. يرجى المحاولة مرة أخرى.""",
  """common.promo_code_applied""": """تم تطبيق الرمز الترويجي بنجاح!""",
  """common.error_applying_promo_code""":
      """خطأ في تطبيق الرمز الترويجي. يرجى المحاولة مرة أخرى.""",
  """common.no_plans_available""": """لا توجد خطط متاحة.""",
  """common.missing_product_id""": """معرف المنتج مفقود""",
  """common.promotion_success""": """تمت ترقية إعلانك بنجاح!""",
  """common.promotion_failed""": """فشل في ترقية الإعلان""",
  """common.phone_required""": """رقم الهاتف مطلوب""",
  """common.phone_start_with_7""": """يجب أن يبدأ الرقم بـ 7""",
  """common.phone_start_with_77_78_79""":
      """يجب أن يكون الرقم 77 أو 78 أو 79""",
  """common.phone_length""": """يجب أن يكون رقم الهاتف 9 أرقام بعد +962""",
  """common.description_optional""": """الوصف (اختياري)""",
  """common.description""": """الوصف""",
  """common.description_hint""": """أضف وصفًا (الحد الأقصى 150 حرفًا)""",
  """common.description_too_long""": """يجب أن يكون الوصف 150 حرفًا أو أقل""",
  """common.purchase_error""": """فشل الشراء""",
  """common.activation_success""": """✅ تم تفعيل التذكرة بنجاح""",
  """common.activation_failed""": """❌ فشل التفعيل: """,
  """common.unknown_error""": """خطأ غير معروف""",
  """listingstatus.featured""": """مميز""",
  """listingstatus.active""": """نشط""",
  """listingstatus.inactive""": """غير نشط""",
  """listingstatus.disabled""": """معطل""",
  """listingstatus.expired""": """منتهي""",
  """listingstatus.sold""": """مباع""",
  """account.delete_account""": """حذف الحساب""",
  """account.password""": """كلمة المرور""",
  """userprofile.title""": """الملف الشخصي""",
  """userprofile.user_not_found""": """لم يتم العثور على المستخدم""",
  """userprofile.no_plate_listings""": """لا توجد إعلانات لوحات""",
  """userprofile.no_phone_listings""": """لا توجد إعلانات هواتف""",
  """userprofile.no_plate_requests""": """لا توجد طلبات لوحات""",
  """userprofile.no_phone_requests""": """لا توجد طلبات هواتف""",
  """userprofile.error_loading""": """خطأ في تحميل الملف الشخصي:""",
  """userprofile.error_loading_plates""": """خطأ في تحميل إعلانات اللوحات:""",
  """userprofile.error_loading_phones""": """خطأ في تحميل إعلانات الهواتف:""",
  """userprofile.error_loading_plate_requests""":
      """خطأ في تحميل طلبات اللوحات:""",
  """userprofile.error_loading_phone_requests""":
      """خطأ في تحميل طلبات الهواتف:""",
  """userprofile.follow_success""": """تمت المتابعة بنجاح""",
  """userprofile.unfollow_success""": """تم إلغاء المتابعة بنجاح""",
  """userprofile.login_required""": """يجب تسجيل الدخول لمتابعة المستخدمين""",
  """userprofile.error""": """خطأ: """,
  """promote.title_free""": """✨ ترقية الإعلان""",
  """promote.title_paid""": """بيع أسرع!""",
  """promote.description_free""": """ميز إعلانك لمدة 14 يوم بتذكرة ذهبية.""",
  """promote.description_paid""": """زد ظهور إعلانك 10 مرات.""",
  """promote.promote_button""": """ترقية""",
  """promote.make_featured""": """اجعلها مميزة""",
  """promote.loading""": """جاري التحميل...""",
  """promote.purchasing""": """جاري الشراء...""",
  """deletelisting.title""": """حذف الإعلان؟""",
  """deletelisting.description""":
      """هذا الإجراء لا يمكن التراجع عنه. هل تريد حقاً حذف هذا الإعلان؟""",
  """deletelisting.mark_as_sold""": """تحديد كـ مُباع""",
  """deletelisting.delete""": """حذف""",
  """deletelisting.success_message""": """تم حذف الإعلان بنجاح""",
};
