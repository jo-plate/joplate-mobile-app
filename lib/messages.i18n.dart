// GENERATED FILE, do not edit!
// ignore_for_file: annotate_overrides, non_constant_identifier_names, prefer_single_quotes, unused_element, unused_field
import 'package:i18n/i18n.dart' as i18n;

String get _languageCode => 'en';
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

class Messages {
  const Messages();
  String get locale => "en";
  String get languageCode => "en";
  AppMessages get app => AppMessages(this);
  HomeMessages get home => HomeMessages(this);
  ProfileMessages get profile => ProfileMessages(this);
  FooterMessages get footer => FooterMessages(this);
  EditProfileMessages get editProfile => EditProfileMessages(this);
  PlanMessages get plan => PlanMessages(this);
  FavoritesScMessages get favoritesSc => FavoritesScMessages(this);
  PhonesMessages get phones => PhonesMessages(this);
  PlatesMessages get plates => PlatesMessages(this);
  DigitcountsMessages get digitcounts => DigitcountsMessages(this);
  FormatsMessages get formats => FormatsMessages(this);
}

class AppMessages {
  final Messages _parent;
  const AppMessages(this._parent);

  /// ```dart
  /// "Joplate"
  /// ```
  String get title => """Joplate""";

  /// ```dart
  /// "Hello, $name!"
  /// ```
  String greeting(String name) => """Hello, $name!""";
}

class HomeMessages {
  final Messages _parent;
  const HomeMessages(this._parent);

  /// ```dart
  /// "Welcome to Joplate!"
  /// ```
  String get welcome => """Welcome to Joplate!""";

  /// ```dart
  /// "List an Item"
  /// ```
  String get button_list_item => """List an Item""";

  /// ```dart
  /// "View Listings"
  /// ```
  String get button_view_items => """View Listings""";

  /// ```dart
  /// "Featured Numbers"
  /// ```
  String get featured_numbers => """Featured Numbers""";

  /// ```dart
  /// "Car Numbers"
  /// ```
  String get car_number => """Car Numbers""";

  /// ```dart
  /// "Phone Numbers"
  /// ```
  String get phone_numbers => """Phone Numbers""";

  /// ```dart
  /// "Requests"
  /// ```
  String get requests => """Requests""";

  /// ```dart
  /// "Quick Sale"
  /// ```
  String get quick_sale => """Quick Sale""";

  /// ```dart
  /// "Featured"
  /// ```
  String get featured => """Featured""";

  /// ```dart
  /// "Sold"
  /// ```
  String get sold => """Sold""";

  /// ```dart
  /// "My Numbers"
  /// ```
  String get mynumbers => """My Numbers""";

  /// ```dart
  /// "My Requests"
  /// ```
  String get myRequests => """My Requests""";
}

class ProfileMessages {
  final Messages _parent;
  const ProfileMessages(this._parent);

  /// ```dart
  /// "Profile"
  /// ```
  String get title => """Profile""";

  /// ```dart
  /// "Requests"
  /// ```
  String get Requests => """Requests""";

  /// ```dart
  /// "Numbers"
  /// ```
  String get Numbers => """Numbers""";

  /// ```dart
  /// "Packages"
  /// ```
  String get packages => """Packages""";

  /// ```dart
  /// "My Current Plan"
  /// ```
  String get my_current_plan => """My Current Plan""";

  /// ```dart
  /// "Language"
  /// ```
  String get language => """Language""";

  /// ```dart
  /// "About Us"
  /// ```
  String get aboutus => """About Us""";

  /// ```dart
  /// "Privacy Policy"
  /// ```
  String get privacy_policy => """Privacy Policy""";

  /// ```dart
  /// "Terms & Conditions"
  /// ```
  String get terms_conditions => """Terms & Conditions""";

  /// ```dart
  /// "Instructions"
  /// ```
  String get instructions => """Instructions""";

  /// ```dart
  /// "Logout"
  /// ```
  String get logout => """Logout""";

  /// ```dart
  /// "Delete Account"
  /// ```
  String get delete_account => """Delete Account""";

  /// ```dart
  /// "Not Signed In"
  /// ```
  String get notsignedin => """Not Signed In""";

  /// ```dart
  /// "Sign In"
  /// ```
  String get signin => """Sign In""";
}

class FooterMessages {
  final Messages _parent;
  const FooterMessages(this._parent);

  /// ```dart
  /// "Home"
  /// ```
  String get home => """Home""";

  /// ```dart
  /// "Profile"
  /// ```
  String get profile => """Profile""";

  /// ```dart
  /// "Favorites"
  /// ```
  String get favorites => """Favorites""";
}

class EditProfileMessages {
  final Messages _parent;
  const EditProfileMessages(this._parent);

  /// ```dart
  /// "Profile"
  /// ```
  String get header => """Profile""";

  /// ```dart
  /// "Full Name"
  /// ```
  String get Full_Name => """Full Name""";

  /// ```dart
  /// "Phone Number"
  /// ```
  String get phone_number => """Phone Number""";

  /// ```dart
  /// "Email"
  /// ```
  String get email => """Email""";

  /// ```dart
  /// "Change Password"
  /// ```
  String get change_password => """Change Password""";

  /// ```dart
  /// "Edit Full Name"
  /// ```
  String get edit_fullname => """Edit Full Name""";

  /// ```dart
  /// "Edit Email"
  /// ```
  String get edit_email => """Edit Email""";

  /// ```dart
  /// "Edit Phone Number"
  /// ```
  String get edit_phone => """Edit Phone Number""";

  /// ```dart
  /// "Save"
  /// ```
  String get save => """Save""";

  /// ```dart
  /// "Send Verification Code"
  /// ```
  String get send_verification_code => """Send Verification Code""";

  /// ```dart
  /// "Verify & Save"
  /// ```
  String get verifyandsave => """Verify & Save""";

  /// ```dart
  /// "Old Password"
  /// ```
  String get oldpassword => """Old Password""";

  /// ```dart
  /// "New Password"
  /// ```
  String get newpassword => """New Password""";

  /// ```dart
  /// "Confirm Password"
  /// ```
  String get confirmpassword => """Confirm Password""";
}

class PlanMessages {
  final Messages _parent;
  const PlanMessages(this._parent);

  /// ```dart
  /// "My Current Plan"
  /// ```
  String get title => """My Current Plan""";

  /// ```dart
  /// "Plan Name"
  /// ```
  String get plan_name => """Plan Name""";

  /// ```dart
  /// "0 / JOD"
  /// ```
  String get balance => """0 / JOD""";

  /// ```dart
  /// "Renew on"
  /// ```
  String get renewal_date => """Renew on""";

  /// ```dart
  /// "Change Plan"
  /// ```
  String get change_plan_button => """Change Plan""";

  /// ```dart
  /// "Your Plan"
  /// ```
  String get your_plan_label => """Your Plan""";
}

class FavoritesScMessages {
  final Messages _parent;
  const FavoritesScMessages(this._parent);

  /// ```dart
  /// "You have no favorites yet"
  /// ```
  String get no_favorites => """You have no favorites yet""";

  /// ```dart
  /// "Failed to load favorites"
  /// ```
  String get failed_to_load => """Failed to load favorites""";
}

class PhonesMessages {
  final Messages _parent;
  const PhonesMessages(this._parent);

  /// ```dart
  /// "Phone Numbers"
  /// ```
  String get title => """Phone Numbers""";

  /// ```dart
  /// "Add"
  /// ```
  String get add_button => """Add""";

  /// ```dart
  /// "Company"
  /// ```
  String get company_label => """Company""";

  /// ```dart
  /// "Contains"
  /// ```
  String get contains => """Contains""";

  /// ```dart
  /// "Starts With"
  /// ```
  String get starts_with => """Starts With""";

  /// ```dart
  /// "Ends With"
  /// ```
  String get ends_with => """Ends With""";

  /// ```dart
  /// "Min Price"
  /// ```
  String get min_price => """Min Price""";

  /// ```dart
  /// "Max Price"
  /// ```
  String get max_price => """Max Price""";

  /// ```dart
  /// "Search"
  /// ```
  String get search => """Search""";

  /// ```dart
  /// "See More"
  /// ```
  String get see_more => """See More""";

  /// ```dart
  /// "Show Less"
  /// ```
  String get show_less => """Show Less""";
}

class PlatesMessages {
  final Messages _parent;
  const PlatesMessages(this._parent);

  /// ```dart
  /// "Car Numbers"
  /// ```
  String get title => """Car Numbers""";

  /// ```dart
  /// "Code"
  /// ```
  String get code => """Code""";

  /// ```dart
  /// "Digit Count"
  /// ```
  String get digit_count => """Digit Count""";

  /// ```dart
  /// "Format"
  /// ```
  String get format => """Format""";

  /// ```dart
  /// "Contains"
  /// ```
  String get contains => """Contains""";

  /// ```dart
  /// "Starts With"
  /// ```
  String get starts_with => """Starts With""";

  /// ```dart
  /// "Ends With"
  /// ```
  String get ends_with => """Ends With""";

  /// ```dart
  /// "Min Price"
  /// ```
  String get min_price => """Min Price""";

  /// ```dart
  /// "Max Price"
  /// ```
  String get max_price => """Max Price""";

  /// ```dart
  /// "Search"
  /// ```
  String get search => """Search""";

  /// ```dart
  /// "See More"
  /// ```
  String get see_more => """See More""";

  /// ```dart
  /// "Show Less"
  /// ```
  String get show_less => """Show Less""";
}

class DigitcountsMessages {
  final Messages _parent;
  const DigitcountsMessages(this._parent);

  /// ```dart
  /// "1 Digit"
  /// ```
  String get d1 => """1 Digit""";

  /// ```dart
  /// "2 Digits"
  /// ```
  String get d2 => """2 Digits""";

  /// ```dart
  /// "3 Digits"
  /// ```
  String get d3 => """3 Digits""";

  /// ```dart
  /// "4 Digits"
  /// ```
  String get d4 => """4 Digits""";

  /// ```dart
  /// "5 Digits"
  /// ```
  String get d5 => """5 Digits""";
}

class FormatsMessages {
  final Messages _parent;
  const FormatsMessages(this._parent);

  /// ```dart
  /// "Format"
  /// ```
  String get title => """Format""";

  /// ```dart
  /// "Contains Digit Repeated 2 Times"
  /// ```
  String get repeat_2 => """Contains Digit Repeated 2 Times""";

  /// ```dart
  /// "Contains Digit Repeated 3 Times"
  /// ```
  String get repeat_3 => """Contains Digit Repeated 3 Times""";

  /// ```dart
  /// "Contains Digit Repeated 4 Times"
  /// ```
  String get repeat_4 => """Contains Digit Repeated 4 Times""";

  /// ```dart
  /// "X???X (5 Digits)"
  /// ```
  String get f_5_1 => """X???X (5 Digits)""";

  /// ```dart
  /// "XYZYX (5 Digits)"
  /// ```
  String get f_5_2 => """XYZYX (5 Digits)""";

  /// ```dart
  /// "XXXZX (5 Digits)"
  /// ```
  String get f_5_3 => """XXXZX (5 Digits)""";

  /// ```dart
  /// "?XXX? (5 Digits)"
  /// ```
  String get f_5_4 => """?XXX? (5 Digits)""";

  /// ```dart
  /// "XYXYX (5 Digits)"
  /// ```
  String get f_5_5 => """XYXYX (5 Digits)""";

  /// ```dart
  /// "XYYYX (5 Digits)"
  /// ```
  String get f_5_6 => """XYYYX (5 Digits)""";

  /// ```dart
  /// "??XXX (5 Digits)"
  /// ```
  String get f_5_7 => """??XXX (5 Digits)""";

  /// ```dart
  /// "XXX?? (5 Digits)"
  /// ```
  String get f_5_8 => """XXX?? (5 Digits)""";

  /// ```dart
  /// "XXXXX (5 Digits)"
  /// ```
  String get f_5_9 => """XXXXX (5 Digits)""";

  /// ```dart
  /// "X??X (4 Digits)"
  /// ```
  String get f_4_1 => """X??X (4 Digits)""";

  /// ```dart
  /// "XYXX (4 Digits)"
  /// ```
  String get f_4_2 => """XYXX (4 Digits)""";

  /// ```dart
  /// "XYXY (4 Digits)"
  /// ```
  String get f_4_3 => """XYXY (4 Digits)""";

  /// ```dart
  /// "?XX? (4 Digits)"
  /// ```
  String get f_4_4 => """?XX? (4 Digits)""";

  /// ```dart
  /// "XXXY (4 Digits)"
  /// ```
  String get f_4_5 => """XXXY (4 Digits)""";

  /// ```dart
  /// "XYYY (4 Digits)"
  /// ```
  String get f_4_6 => """XYYY (4 Digits)""";

  /// ```dart
  /// "XXXX (4 Digits)"
  /// ```
  String get f_4_7 => """XXXX (4 Digits)""";

  /// ```dart
  /// "XYX (3 Digits)"
  /// ```
  String get f_3_1 => """XYX (3 Digits)""";

  /// ```dart
  /// "XYZ (3 Digits)"
  /// ```
  String get f_3_2 => """XYZ (3 Digits)""";

  /// ```dart
  /// "XYY (3 Digits)"
  /// ```
  String get f_3_3 => """XYY (3 Digits)""";

  /// ```dart
  /// "XXY (3 Digits)"
  /// ```
  String get f_3_4 => """XXY (3 Digits)""";

  /// ```dart
  /// "XXX (3 Digits)"
  /// ```
  String get f_3_5 => """XXX (3 Digits)""";
}

Map<String, String> get messagesMap => {
  """app.title""": """Joplate""",
  """home.welcome""": """Welcome to Joplate!""",
  """home.button_list_item""": """List an Item""",
  """home.button_view_items""": """View Listings""",
  """home.featured_numbers""": """Featured Numbers""",
  """home.car_number""": """Car Numbers""",
  """home.phone_numbers""": """Phone Numbers""",
  """home.requests""": """Requests""",
  """home.quick_sale""": """Quick Sale""",
  """home.featured""": """Featured""",
  """home.sold""": """Sold""",
  """home.mynumbers""": """My Numbers""",
  """home.myRequests""": """My Requests""",
  """profile.title""": """Profile""",
  """profile.Requests""": """Requests""",
  """profile.Numbers""": """Numbers""",
  """profile.packages""": """Packages""",
  """profile.my_current_plan""": """My Current Plan""",
  """profile.language""": """Language""",
  """profile.aboutus""": """About Us""",
  """profile.privacy_policy""": """Privacy Policy""",
  """profile.terms_conditions""": """Terms & Conditions""",
  """profile.instructions""": """Instructions""",
  """profile.logout""": """Logout""",
  """profile.delete_account""": """Delete Account""",
  """profile.notsignedin""": """Not Signed In""",
  """profile.signin""": """Sign In""",
  """footer.home""": """Home""",
  """footer.profile""": """Profile""",
  """footer.favorites""": """Favorites""",
  """edit profile.header""": """Profile""",
  """edit profile.Full_Name""": """Full Name""",
  """edit profile.phone_number""": """Phone Number""",
  """edit profile.email""": """Email""",
  """edit profile.change_password""": """Change Password""",
  """edit profile.edit_fullname""": """Edit Full Name""",
  """edit profile.edit_email""": """Edit Email""",
  """edit profile.edit_phone""": """Edit Phone Number""",
  """edit profile.save""": """Save""",
  """edit profile.send_verification_code""": """Send Verification Code""",
  """edit profile.verifyandsave""": """Verify & Save""",
  """edit profile.oldpassword""": """Old Password""",
  """edit profile.newpassword""": """New Password""",
  """edit profile.confirmpassword""": """Confirm Password""",
  """plan.title""": """My Current Plan""",
  """plan.plan_name""": """Plan Name""",
  """plan.balance""": """0 / JOD""",
  """plan.renewal_date""": """Renew on""",
  """plan.change_plan_button""": """Change Plan""",
  """plan.your_plan_label""": """Your Plan""",
  """favorites sc.no_favorites""": """You have no favorites yet""",
  """favorites sc.failed_to_load""": """Failed to load favorites""",
  """phones.title""": """Phone Numbers""",
  """phones.add_button""": """Add""",
  """phones.company_label""": """Company""",
  """phones.contains""": """Contains""",
  """phones.starts_with""": """Starts With""",
  """phones.ends_with""": """Ends With""",
  """phones.min_price""": """Min Price""",
  """phones.max_price""": """Max Price""",
  """phones.search""": """Search""",
  """phones.see_more""": """See More""",
  """phones.show_less""": """Show Less""",
  """plates.title""": """Car Numbers""",
  """plates.code""": """Code""",
  """plates.digit_count""": """Digit Count""",
  """plates.format""": """Format""",
  """plates.contains""": """Contains""",
  """plates.starts_with""": """Starts With""",
  """plates.ends_with""": """Ends With""",
  """plates.min_price""": """Min Price""",
  """plates.max_price""": """Max Price""",
  """plates.search""": """Search""",
  """plates.see_more""": """See More""",
  """plates.show_less""": """Show Less""",
  """digitcounts.d1""": """1 Digit""",
  """digitcounts.d2""": """2 Digits""",
  """digitcounts.d3""": """3 Digits""",
  """digitcounts.d4""": """4 Digits""",
  """digitcounts.d5""": """5 Digits""",
  """formats.title""": """Format""",
  """formats.repeat_2""": """Contains Digit Repeated 2 Times""",
  """formats.repeat_3""": """Contains Digit Repeated 3 Times""",
  """formats.repeat_4""": """Contains Digit Repeated 4 Times""",
  """formats.f_5_1""": """X???X (5 Digits)""",
  """formats.f_5_2""": """XYZYX (5 Digits)""",
  """formats.f_5_3""": """XXXZX (5 Digits)""",
  """formats.f_5_4""": """?XXX? (5 Digits)""",
  """formats.f_5_5""": """XYXYX (5 Digits)""",
  """formats.f_5_6""": """XYYYX (5 Digits)""",
  """formats.f_5_7""": """??XXX (5 Digits)""",
  """formats.f_5_8""": """XXX?? (5 Digits)""",
  """formats.f_5_9""": """XXXXX (5 Digits)""",
  """formats.f_4_1""": """X??X (4 Digits)""",
  """formats.f_4_2""": """XYXX (4 Digits)""",
  """formats.f_4_3""": """XYXY (4 Digits)""",
  """formats.f_4_4""": """?XX? (4 Digits)""",
  """formats.f_4_5""": """XXXY (4 Digits)""",
  """formats.f_4_6""": """XYYY (4 Digits)""",
  """formats.f_4_7""": """XXXX (4 Digits)""",
  """formats.f_3_1""": """XYX (3 Digits)""",
  """formats.f_3_2""": """XYZ (3 Digits)""",
  """formats.f_3_3""": """XYY (3 Digits)""",
  """formats.f_3_4""": """XXY (3 Digits)""",
  """formats.f_3_5""": """XXX (3 Digits)""",
};
