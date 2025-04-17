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
  AddphonenumberMessages get addphonenumber => AddphonenumberMessages(this);
  AddplateMessages get addplate => AddplateMessages(this);
  AddphonerequestMessages get addphonerequest => AddphonerequestMessages(this);
  AddplaterequestMessages get addplaterequest => AddplaterequestMessages(this);
  PhonedetailsMessages get phonedetails => PhonedetailsMessages(this);
  SellerdetailsMessages get sellerdetails => SellerdetailsMessages(this);
  PlatesdetailsMessages get platesdetails => PlatesdetailsMessages(this);
  QuicksaleMessages get quicksale => QuicksaleMessages(this);
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

  /// ```dart
  /// "Search"
  /// ```
  String get search => """Search""";
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

class AddphonenumberMessages {
  final Messages _parent;
  const AddphonenumberMessages(this._parent);

  /// ```dart
  /// "Add Phone Number"
  /// ```
  String get title => """Add Phone Number""";

  /// ```dart
  /// "Company"
  /// ```
  String get company_label => """Company""";

  /// ```dart
  /// "Phone Number"
  /// ```
  String get phone_number_label => """Phone Number""";

  /// ```dart
  /// "Save"
  /// ```
  String get save_button => """Save""";

  /// ```dart
  /// "Cancel"
  /// ```
  String get cancel_button => """Cancel""";

  /// ```dart
  /// "Add More"
  /// ```
  String get addmore => """Add More""";

  /// ```dart
  /// "With Discount"
  /// ```
  String get with_discount => """With Discount""";

  /// ```dart
  /// "Without Discount"
  /// ```
  String get without_discount => """Without Discount""";

  /// ```dart
  /// "Featured"
  /// ```
  String get featured => """Featured""";

  /// ```dart
  /// "Not Featured"
  /// ```
  String get not_featured => """Not Featured""";

  /// ```dart
  /// "Number"
  /// ```
  String get number => """Number""";

  /// ```dart
  /// "Price"
  /// ```
  String get price => """Price""";

  /// ```dart
  /// "Price before Discount"
  /// ```
  String get price_before_discount => """Price before Discount""";

  /// ```dart
  /// "Price after Discount"
  /// ```
  String get price_after_discount => """Price after Discount""";
}

class AddplateMessages {
  final Messages _parent;
  const AddplateMessages(this._parent);

  /// ```dart
  /// "Add Car Number"
  /// ```
  String get title => """Add Car Number""";

  /// ```dart
  /// "Company"
  /// ```
  String get company_label => """Company""";

  /// ```dart
  /// "Car Number"
  /// ```
  String get plate_number_label => """Car Number""";

  /// ```dart
  /// "Save"
  /// ```
  String get save_button => """Save""";

  /// ```dart
  /// "Cancel"
  /// ```
  String get cancel_button => """Cancel""";

  /// ```dart
  /// "Add More"
  /// ```
  String get addmore => """Add More""";

  /// ```dart
  /// "With Discount"
  /// ```
  String get with_discount => """With Discount""";

  /// ```dart
  /// "Without Discount"
  /// ```
  String get without_discount => """Without Discount""";

  /// ```dart
  /// "Featured"
  /// ```
  String get featured => """Featured""";

  /// ```dart
  /// "Not Featured"
  /// ```
  String get not_featured => """Not Featured""";

  /// ```dart
  /// "Number"
  /// ```
  String get number => """Number""";

  /// ```dart
  /// "Price"
  /// ```
  String get price => """Price""";

  /// ```dart
  /// "Price before Discount"
  /// ```
  String get price_before_discount => """Price before Discount""";

  /// ```dart
  /// "Price after Discount"
  /// ```
  String get price_after_discount => """Price after Discount""";

  /// ```dart
  /// "Code"
  /// ```
  String get code => """Code""";
}

class AddphonerequestMessages {
  final Messages _parent;
  const AddphonerequestMessages(this._parent);

  /// ```dart
  /// "Add Phone Request"
  /// ```
  String get title => """Add Phone Request""";

  /// ```dart
  /// "Company"
  /// ```
  String get company_label => """Company""";

  /// ```dart
  /// "Phone Number"
  /// ```
  String get phone_number_label => """Phone Number""";

  /// ```dart
  /// "Save"
  /// ```
  String get save_button => """Save""";

  /// ```dart
  /// "Cancel"
  /// ```
  String get cancel_button => """Cancel""";

  /// ```dart
  /// "Required Phone Number"
  /// ```
  String get required_phone_number => """Required Phone Number""";

  /// ```dart
  /// "Optional Price"
  /// ```
  String get optional_price => """Optional Price""";
}

class AddplaterequestMessages {
  final Messages _parent;
  const AddplaterequestMessages(this._parent);

  /// ```dart
  /// "Add Plate Request"
  /// ```
  String get title => """Add Plate Request""";

  /// ```dart
  /// "Company"
  /// ```
  String get company_label => """Company""";

  /// ```dart
  /// "Plate Number"
  /// ```
  String get plate_number_label => """Plate Number""";

  /// ```dart
  /// "Save"
  /// ```
  String get save_button => """Save""";

  /// ```dart
  /// "Cancel"
  /// ```
  String get cancel_button => """Cancel""";

  /// ```dart
  /// "Required Plate Number"
  /// ```
  String get required_plate_number => """Required Plate Number""";

  /// ```dart
  /// "Optional Price"
  /// ```
  String get optional_price => """Optional Price""";
}

class PhonedetailsMessages {
  final Messages _parent;
  const PhonedetailsMessages(this._parent);

  /// ```dart
  /// "Phone Number Details"
  /// ```
  String get title => """Phone Number Details""";

  /// ```dart
  /// "Check out this plate number: {number}"
  /// ```
  String get share_message => """Check out this plate number: {number}""";

  /// ```dart
  /// "Important Note:"
  /// ```
  String get important_note => """Important Note:""";

  /// ```dart
  /// "Don't transfer money online"
  /// ```
  String get dont_transfer_money => """Don't transfer money online""";

  /// ```dart
  /// "Meet the seller in person"
  /// ```
  String get meet_in_person => """Meet the seller in person""";
}

class SellerdetailsMessages {
  final Messages _parent;
  const SellerdetailsMessages(this._parent);

  /// ```dart
  /// "About Seller"
  /// ```
  String get about_seller => """About Seller""";

  /// ```dart
  /// "User not found"
  /// ```
  String get user_not_found => """User not found""";

  /// ```dart
  /// "WhatsApp"
  /// ```
  String get whatsapp => """WhatsApp""";

  /// ```dart
  /// "Call"
  /// ```
  String get phone_call => """Call""";
}

class PlatesdetailsMessages {
  final Messages _parent;
  const PlatesdetailsMessages(this._parent);

  /// ```dart
  /// "Plate Details"
  /// ```
  String get title => """Plate Details""";

  /// ```dart
  /// "Error getting data for Plate Number: {plateNumber}"
  /// ```
  String get error_loading_data =>
      """Error getting data for Plate Number: {plateNumber}""";

  /// ```dart
  /// "Originally posted by"
  /// ```
  String get originally_posted_by => """Originally posted by""";

  /// ```dart
  /// "Member since {year}"
  /// ```
  String get member_since => """Member since {year}""";

  /// ```dart
  /// "WhatsApp"
  /// ```
  String get whatsapp => """WhatsApp""";

  /// ```dart
  /// "Call"
  /// ```
  String get call => """Call""";

  /// ```dart
  /// "Other Sellers"
  /// ```
  String get other_sellers => """Other Sellers""";

  /// ```dart
  /// "Seller"
  /// ```
  String get seller => """Seller""";

  /// ```dart
  /// "Price"
  /// ```
  String get price => """Price""";

  /// ```dart
  /// "Contact"
  /// ```
  String get contact => """Contact""";

  /// ```dart
  /// "Important Note:"
  /// ```
  String get important_note => """Important Note:""";

  /// ```dart
  /// "Don't transfer money online"
  /// ```
  String get dont_transfer_money => """Don't transfer money online""";

  /// ```dart
  /// "Meet the seller in person"
  /// ```
  String get meet_in_person => """Meet the seller in person""";

  /// ```dart
  /// "{days} ago"
  /// ```
  String get days_ago => """{days} ago""";

  /// ```dart
  /// "Call for Price"
  /// ```
  String get call_for_price => """Call for Price""";
}

class QuicksaleMessages {
  final Messages _parent;
  const QuicksaleMessages(this._parent);

  /// ```dart
  /// "Quick Sale"
  /// ```
  String get title => """Quick Sale""";

  /// ```dart
  /// "Want us to find a buyer for your plate number? We can help you with that."
  /// ```
  String get description =>
      """Want us to find a buyer for your plate number? We can help you with that.""";

  /// ```dart
  /// "WhatsApp"
  /// ```
  String get whatsapp => """WhatsApp""";

  /// ```dart
  /// "Call"
  /// ```
  String get call => """Call""";

  /// ```dart
  /// "User not found"
  /// ```
  String get user_not_found => """User not found""";

  /// ```dart
  /// "Requested by"
  /// ```
  String get requested_by => """Requested by""";
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
  """home.search""": """Search""",
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
  """addphonenumber.title""": """Add Phone Number""",
  """addphonenumber.company_label""": """Company""",
  """addphonenumber.phone_number_label""": """Phone Number""",
  """addphonenumber.save_button""": """Save""",
  """addphonenumber.cancel_button""": """Cancel""",
  """addphonenumber.addmore""": """Add More""",
  """addphonenumber.with_discount""": """With Discount""",
  """addphonenumber.without_discount""": """Without Discount""",
  """addphonenumber.featured""": """Featured""",
  """addphonenumber.not_featured""": """Not Featured""",
  """addphonenumber.number""": """Number""",
  """addphonenumber.price""": """Price""",
  """addphonenumber.price_before_discount""": """Price before Discount""",
  """addphonenumber.price_after_discount""": """Price after Discount""",
  """addplate.title""": """Add Car Number""",
  """addplate.company_label""": """Company""",
  """addplate.plate_number_label""": """Car Number""",
  """addplate.save_button""": """Save""",
  """addplate.cancel_button""": """Cancel""",
  """addplate.addmore""": """Add More""",
  """addplate.with_discount""": """With Discount""",
  """addplate.without_discount""": """Without Discount""",
  """addplate.featured""": """Featured""",
  """addplate.not_featured""": """Not Featured""",
  """addplate.number""": """Number""",
  """addplate.price""": """Price""",
  """addplate.price_before_discount""": """Price before Discount""",
  """addplate.price_after_discount""": """Price after Discount""",
  """addplate.code""": """Code""",
  """addphonerequest.title""": """Add Phone Request""",
  """addphonerequest.company_label""": """Company""",
  """addphonerequest.phone_number_label""": """Phone Number""",
  """addphonerequest.save_button""": """Save""",
  """addphonerequest.cancel_button""": """Cancel""",
  """addphonerequest.required_phone_number""": """Required Phone Number""",
  """addphonerequest.optional_price""": """Optional Price""",
  """addplaterequest.title""": """Add Plate Request""",
  """addplaterequest.company_label""": """Company""",
  """addplaterequest.plate_number_label""": """Plate Number""",
  """addplaterequest.save_button""": """Save""",
  """addplaterequest.cancel_button""": """Cancel""",
  """addplaterequest.required_plate_number""": """Required Plate Number""",
  """addplaterequest.optional_price""": """Optional Price""",
  """phonedetails.title""": """Phone Number Details""",
  """phonedetails.share_message""": """Check out this plate number: {number}""",
  """phonedetails.important_note""": """Important Note:""",
  """phonedetails.dont_transfer_money""": """Don't transfer money online""",
  """phonedetails.meet_in_person""": """Meet the seller in person""",
  """sellerdetails.about_seller""": """About Seller""",
  """sellerdetails.user_not_found""": """User not found""",
  """sellerdetails.whatsapp""": """WhatsApp""",
  """sellerdetails.phone_call""": """Call""",
  """platesdetails.title""": """Plate Details""",
  """platesdetails.error_loading_data""":
      """Error getting data for Plate Number: {plateNumber}""",
  """platesdetails.originally_posted_by""": """Originally posted by""",
  """platesdetails.member_since""": """Member since {year}""",
  """platesdetails.whatsapp""": """WhatsApp""",
  """platesdetails.call""": """Call""",
  """platesdetails.other_sellers""": """Other Sellers""",
  """platesdetails.seller""": """Seller""",
  """platesdetails.price""": """Price""",
  """platesdetails.contact""": """Contact""",
  """platesdetails.important_note""": """Important Note:""",
  """platesdetails.dont_transfer_money""": """Don't transfer money online""",
  """platesdetails.meet_in_person""": """Meet the seller in person""",
  """platesdetails.days_ago""": """{days} ago""",
  """platesdetails.call_for_price""": """Call for Price""",
  """quicksale.title""": """Quick Sale""",
  """quicksale.description""":
      """Want us to find a buyer for your plate number? We can help you with that.""",
  """quicksale.whatsapp""": """WhatsApp""",
  """quicksale.call""": """Call""",
  """quicksale.user_not_found""": """User not found""",
  """quicksale.requested_by""": """Requested by""",
};
