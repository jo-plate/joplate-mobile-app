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
  EditProfileMessagesAr get editProfile => EditProfileMessagesAr(this);
  PlanMessagesAr get plan => PlanMessagesAr(this);
  FavoritesScMessagesAr get favoritesSc => FavoritesScMessagesAr(this);
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
}

class ProfileMessagesAr extends ProfileMessages {
  final MessagesAr _parent;
  const ProfileMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "الملف الشخصي"
  /// ```
  String get title => """الملف الشخصي""";

  /// ```dart
  /// "الطلبات"
  /// ```
  String get Requests => """الطلبات""";

  /// ```dart
  /// "الأرقام"
  /// ```
  String get Numbers => """الأرقام""";

  /// ```dart
  /// "الباقات"
  /// ```
  String get packages => """الباقات""";

  /// ```dart
  /// "خطتي الحالية"
  /// ```
  String get my_current_plan => """خطتي الحالية""";

  /// ```dart
  /// "اللغة"
  /// ```
  String get language => """اللغة""";

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
}

class EditProfileMessagesAr extends EditProfileMessages {
  final MessagesAr _parent;
  const EditProfileMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// " الملف الشخصي"
  /// ```
  String get header => """ الملف الشخصي""";

  /// ```dart
  /// "الاسم الكامل"
  /// ```
  String get Full_Name => """الاسم الكامل""";

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
  """profile.title""": """الملف الشخصي""",
  """profile.Requests""": """الطلبات""",
  """profile.Numbers""": """الأرقام""",
  """profile.packages""": """الباقات""",
  """profile.my_current_plan""": """خطتي الحالية""",
  """profile.language""": """اللغة""",
  """profile.aboutus""": """من نحن""",
  """profile.privacy_policy""": """سياسة الخصوصية""",
  """profile.terms_conditions""": """الشروط والأحكام""",
  """profile.instructions""": """التعليمات""",
  """profile.logout""": """تسجيل الخروج""",
  """profile.delete_account""": """حذف الحساب""",
  """profile.notsignedin""": """غير مسجل الدخول""",
  """profile.signin""": """تسجيل الدخول""",
  """footer.home""": """الرئيسية""",
  """footer.profile""": """الملف الشخصي""",
  """footer.favorites""": """المفضلة""",
  """edit profile.header""": """ الملف الشخصي""",
  """edit profile.Full_Name""": """الاسم الكامل""",
  """edit profile.phone_number""": """رقم الهاتف""",
  """edit profile.email""": """البريد الالكتروني""",
  """edit profile.change_password""": """تغيير كلمة المرور""",
  """edit profile.edit_fullname""": """تعديل الاسم الكامل""",
  """edit profile.edit_email""": """تعديل البريد الالكتروني""",
  """edit profile.edit_phone""": """تعديل رقم الهاتف""",
  """edit profile.save""": """حفظ""",
  """edit profile.send_verification_code""": """ارسال كود التحقق""",
  """edit profile.verifyandsave""": """تحقق وحفظ""",
  """edit profile.oldpassword""": """كلمة المرور القديمة""",
  """edit profile.newpassword""": """كلمة المرور الجديدة""",
  """edit profile.confirmpassword""": """تأكيد كلمة المرور""",
  """plan.title""": """خطتي الحالية""",
  """plan.plan_name""": """اسم الخطة""",
  """plan.balance""": """0 / JOD""",
  """plan.renewal_date""": """تجديد في""",
  """plan.change_plan_button""": """تغيير الخطة""",
  """plan.your_plan_label""": """خطتك""",
  """favorites sc.no_favorites""": """لا يوجد عناصر في المفضلة""",
  """favorites sc.failed_to_load""": """فشل في تحميل المفضلة""",
};
