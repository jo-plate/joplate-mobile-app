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
};
