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
  PhonedetailsMessagesAr get phonedetails => PhonedetailsMessagesAr(this);
  SellerdetailsMessagesAr get sellerdetails => SellerdetailsMessagesAr(this);
  PlatesdetailsMessagesAr get platesdetails => PlatesdetailsMessagesAr(this);
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
  /// "أرقامي"
  /// ```
  String get mynumbers => """أرقامي""";

  /// ```dart
  /// "طلباتي"
  /// ```
  String get myRequests => """طلباتي""";
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
  /// "الرمز"
  /// ```
  String get code => """الرمز""";

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
  /// "3 أرقام"
  /// ```
  String get d3 => """3 أرقام""";

  /// ```dart
  /// "4 أرقام"
  /// ```
  String get d4 => """4 أرقام""";

  /// ```dart
  /// "5 أرقام"
  /// ```
  String get d5 => """5 أرقام""";
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
  /// "X???X (5 أرقام)"
  /// ```
  String get f_5_1 => """X???X (5 أرقام)""";

  /// ```dart
  /// "XYZYX (5 أرقام)"
  /// ```
  String get f_5_2 => """XYZYX (5 أرقام)""";

  /// ```dart
  /// "XXXZX (5 أرقام)"
  /// ```
  String get f_5_3 => """XXXZX (5 أرقام)""";

  /// ```dart
  /// "?XXX? (5 أرقام)"
  /// ```
  String get f_5_4 => """?XXX? (5 أرقام)""";

  /// ```dart
  /// "XYXYX (5 أرقام)"
  /// ```
  String get f_5_5 => """XYXYX (5 أرقام)""";

  /// ```dart
  /// "XYYYX (5 أرقام)"
  /// ```
  String get f_5_6 => """XYYYX (5 أرقام)""";

  /// ```dart
  /// "??XXX (5 أرقام)"
  /// ```
  String get f_5_7 => """??XXX (5 أرقام)""";

  /// ```dart
  /// "XXX?? (5 أرقام)"
  /// ```
  String get f_5_8 => """XXX?? (5 أرقام)""";

  /// ```dart
  /// "XXXXX (5 أرقام)"
  /// ```
  String get f_5_9 => """XXXXX (5 أرقام)""";

  /// ```dart
  /// "X??X (4 أرقام)"
  /// ```
  String get f_4_1 => """X??X (4 أرقام)""";

  /// ```dart
  /// "XYXX (4 أرقام)"
  /// ```
  String get f_4_2 => """XYXX (4 أرقام)""";

  /// ```dart
  /// "XYXY (4 أرقام)"
  /// ```
  String get f_4_3 => """XYXY (4 أرقام)""";

  /// ```dart
  /// "?XX? (4 أرقام)"
  /// ```
  String get f_4_4 => """?XX? (4 أرقام)""";

  /// ```dart
  /// "XXXY (4 أرقام)"
  /// ```
  String get f_4_5 => """XXXY (4 أرقام)""";

  /// ```dart
  /// "XYYY (4 أرقام)"
  /// ```
  String get f_4_6 => """XYYY (4 أرقام)""";

  /// ```dart
  /// "XXXX (4 أرقام)"
  /// ```
  String get f_4_7 => """XXXX (4 أرقام)""";

  /// ```dart
  /// "XYX (3 أرقام)"
  /// ```
  String get f_3_1 => """XYX (3 أرقام)""";

  /// ```dart
  /// "XYZ (3 أرقام)"
  /// ```
  String get f_3_2 => """XYZ (3 أرقام)""";

  /// ```dart
  /// "XYY (3 أرقام)"
  /// ```
  String get f_3_3 => """XYY (3 أرقام)""";

  /// ```dart
  /// "XXY (3 أرقام)"
  /// ```
  String get f_3_4 => """XXY (3 أرقام)""";

  /// ```dart
  /// "XXX (3 أرقام)"
  /// ```
  String get f_3_5 => """XXX (3 أرقام)""";
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
  /// "حفظ"
  /// ```
  String get save_button => """حفظ""";

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
  /// "رقم السيارة"
  /// ```
  String get plate_number_label => """رقم السيارة""";

  /// ```dart
  /// "حفظ"
  /// ```
  String get save_button => """حفظ""";

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
  /// "الرمز"
  /// ```
  String get code => """الرمز""";
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
  /// "حفظ"
  /// ```
  String get save_button => """حفظ""";

  /// ```dart
  /// "إلغاء"
  /// ```
  String get cancel_button => """إلغاء""";

  /// ```dart
  /// "رقم الهاتف مطلوب"
  /// ```
  String get required_phone_number => """رقم الهاتف مطلوب""";

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
  /// "رقم السيارة"
  /// ```
  String get plate_number_label => """رقم السيارة""";

  /// ```dart
  /// "حفظ"
  /// ```
  String get save_button => """حفظ""";

  /// ```dart
  /// "إلغاء"
  /// ```
  String get cancel_button => """إلغاء""";

  /// ```dart
  /// "رقم السيارة مطلوب"
  /// ```
  String get required_plate_number => """رقم السيارة مطلوب""";

  /// ```dart
  /// "السعر اختياري"
  /// ```
  String get optional_price => """السعر اختياري""";
}

class PhonedetailsMessagesAr extends PhonedetailsMessages {
  final MessagesAr _parent;
  const PhonedetailsMessagesAr(this._parent) : super(_parent);

  /// ```dart
  /// "تفاصيل رقم الهاتف"
  /// ```
  String get title => """تفاصيل رقم الهاتف""";

  /// ```dart
  /// "اطلع على رقم اللوحة هذا: {number}"
  /// ```
  String get share_message => """اطلع على رقم اللوحة هذا: {number}""";

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
  /// "تفاصيل رقم السيارة"
  /// ```
  String get title => """تفاصيل رقم السيارة""";

  /// ```dart
  /// "حدث خطأ أثناء جلب بيانات الرقم: {plateNumber}"
  /// ```
  String get error_loading_data =>
      """حدث خطأ أثناء جلب بيانات الرقم: {plateNumber}""";

  /// ```dart
  /// "نُشر بواسطة"
  /// ```
  String get originally_posted_by => """نُشر بواسطة""";

  /// ```dart
  /// "عضو منذ {year}"
  /// ```
  String get member_since => """عضو منذ {year}""";

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
  /// "منذ {days}"
  /// ```
  String get days_ago => """منذ {days}""";

  /// ```dart
  /// "اتصل لمعرفة السعر"
  /// ```
  String get call_for_price => """اتصل لمعرفة السعر""";
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
  """home.mynumbers""": """أرقامي""",
  """home.myRequests""": """طلباتي""",
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
  """plates.code""": """الرمز""",
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
  """digitcounts.d3""": """3 أرقام""",
  """digitcounts.d4""": """4 أرقام""",
  """digitcounts.d5""": """5 أرقام""",
  """formats.title""": """النمط""",
  """formats.repeat_2""": """يحتوي على رقم مكرر مرتين""",
  """formats.repeat_3""": """يحتوي على رقم مكرر ثلاث مرات""",
  """formats.repeat_4""": """يحتوي على رقم مكرر أربع مرات""",
  """formats.f_5_1""": """X???X (5 أرقام)""",
  """formats.f_5_2""": """XYZYX (5 أرقام)""",
  """formats.f_5_3""": """XXXZX (5 أرقام)""",
  """formats.f_5_4""": """?XXX? (5 أرقام)""",
  """formats.f_5_5""": """XYXYX (5 أرقام)""",
  """formats.f_5_6""": """XYYYX (5 أرقام)""",
  """formats.f_5_7""": """??XXX (5 أرقام)""",
  """formats.f_5_8""": """XXX?? (5 أرقام)""",
  """formats.f_5_9""": """XXXXX (5 أرقام)""",
  """formats.f_4_1""": """X??X (4 أرقام)""",
  """formats.f_4_2""": """XYXX (4 أرقام)""",
  """formats.f_4_3""": """XYXY (4 أرقام)""",
  """formats.f_4_4""": """?XX? (4 أرقام)""",
  """formats.f_4_5""": """XXXY (4 أرقام)""",
  """formats.f_4_6""": """XYYY (4 أرقام)""",
  """formats.f_4_7""": """XXXX (4 أرقام)""",
  """formats.f_3_1""": """XYX (3 أرقام)""",
  """formats.f_3_2""": """XYZ (3 أرقام)""",
  """formats.f_3_3""": """XYY (3 أرقام)""",
  """formats.f_3_4""": """XXY (3 أرقام)""",
  """formats.f_3_5""": """XXX (3 أرقام)""",
  """addphonenumber.title""": """إضافة رقم هاتف""",
  """addphonenumber.company_label""": """الشركة""",
  """addphonenumber.phone_number_label""": """رقم الهاتف""",
  """addphonenumber.save_button""": """حفظ""",
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
  """addplate.plate_number_label""": """رقم السيارة""",
  """addplate.save_button""": """حفظ""",
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
  """addplate.code""": """الرمز""",
  """addphonerequest.title""": """إضافة طلب هاتف""",
  """addphonerequest.company_label""": """الشركة""",
  """addphonerequest.phone_number_label""": """رقم الهاتف""",
  """addphonerequest.save_button""": """حفظ""",
  """addphonerequest.cancel_button""": """إلغاء""",
  """addphonerequest.required_phone_number""": """رقم الهاتف مطلوب""",
  """addphonerequest.optional_price""": """السعر اختياري""",
  """addplaterequest.title""": """إضافة طلب رقم سيارة""",
  """addplaterequest.company_label""": """الشركة""",
  """addplaterequest.plate_number_label""": """رقم السيارة""",
  """addplaterequest.save_button""": """حفظ""",
  """addplaterequest.cancel_button""": """إلغاء""",
  """addplaterequest.required_plate_number""": """رقم السيارة مطلوب""",
  """addplaterequest.optional_price""": """السعر اختياري""",
  """phonedetails.title""": """تفاصيل رقم الهاتف""",
  """phonedetails.share_message""": """اطلع على رقم اللوحة هذا: {number}""",
  """phonedetails.important_note""": """ملاحظات هامة:""",
  """phonedetails.dont_transfer_money""":
      """لا تقم بتحويل الأموال عبر الإنترنت""",
  """phonedetails.meet_in_person""": """قابل البائع شخصياً""",
  """sellerdetails.about_seller""": """حول البائع""",
  """sellerdetails.user_not_found""": """لم يتم العثور على المستخدم""",
  """sellerdetails.whatsapp""": """واتساب""",
  """sellerdetails.phone_call""": """اتصال""",
  """platesdetails.title""": """تفاصيل رقم السيارة""",
  """platesdetails.error_loading_data""":
      """حدث خطأ أثناء جلب بيانات الرقم: {plateNumber}""",
  """platesdetails.originally_posted_by""": """نُشر بواسطة""",
  """platesdetails.member_since""": """عضو منذ {year}""",
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
  """platesdetails.days_ago""": """منذ {days}""",
  """platesdetails.call_for_price""": """اتصل لمعرفة السعر""",
};
