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
  EditprofileMessages get editprofile => EditprofileMessages(this);
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
  ListingdetailsMessages get listingdetails => ListingdetailsMessages(this);
  PhonedetailsMessages get phonedetails => PhonedetailsMessages(this);
  SellerdetailsMessages get sellerdetails => SellerdetailsMessages(this);
  PlatesdetailsMessages get platesdetails => PlatesdetailsMessages(this);
  QuicksaleMessages get quicksale => QuicksaleMessages(this);
  EditphoneMessages get editphone => EditphoneMessages(this);
  EditphonerequestMessages get editphonerequest =>
      EditphonerequestMessages(this);
  EditplateMessages get editplate => EditplateMessages(this);
  EditplaterequestMessages get editplaterequest =>
      EditplaterequestMessages(this);
  IapMessages get iap => IapMessages(this);
  DatetimeMessages get datetime => DatetimeMessages(this);
  AuthMessages get auth => AuthMessages(this);
  FeedMessages get feed => FeedMessages(this);
  PrivacyMessages get privacy => PrivacyMessages(this);
  TermsMessages get terms => TermsMessages(this);
  CommonMessages get common => CommonMessages(this);
  ListingstatusMessages get listingstatus => ListingstatusMessages(this);
  AccountMessages get account => AccountMessages(this);
  UserprofileMessages get userprofile => UserprofileMessages(this);
  PromoteMessages get promote => PromoteMessages(this);
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
  /// "Expired"
  /// ```
  String get expired => """Expired""";

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

  /// ```dart
  /// "Deleted"
  /// ```
  String get disabled => """Deleted""";

  /// ```dart
  /// "Visits"
  /// ```
  String get visits => """Visits""";

  /// ```dart
  /// "Requested"
  /// ```
  String get requested => """Requested""";
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
  /// "Ads"
  /// ```
  String get Ads => """Ads""";

  /// ```dart
  /// "My Ads"
  /// ```
  String get myAds => """My Ads""";

  /// ```dart
  /// "My Requests"
  /// ```
  String get myRequests => """My Requests""";

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
  /// "Theme"
  /// ```
  String get theme => """Theme""";

  /// ```dart
  /// "Dark"
  /// ```
  String get dark_mode => """Dark""";

  /// ```dart
  /// "Light"
  /// ```
  String get light_mode => """Light""";

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

  /// ```dart
  /// "Upload"
  /// ```
  String get upload => """Upload""";

  /// ```dart
  /// "Choose Image Source"
  /// ```
  String get choose_source => """Choose Image Source""";

  /// ```dart
  /// "Gallery"
  /// ```
  String get gallery => """Gallery""";

  /// ```dart
  /// "Camera"
  /// ```
  String get camera => """Camera""";

  /// ```dart
  /// "Promo Code"
  /// ```
  String get promo_code => """Promo Code""";

  /// ```dart
  /// "Enter your promo code"
  /// ```
  String get promo_code_hint => """Enter your promo code""";

  /// ```dart
  /// "Joined on $date"
  /// ```
  String joined_on(String date) => """Joined on $date""";
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

  /// ```dart
  /// "Feed"
  /// ```
  String get feed => """Feed""";
}

class EditprofileMessages {
  final Messages _parent;
  const EditprofileMessages(this._parent);

  /// ```dart
  /// "Profile"
  /// ```
  String get header => """Profile""";

  /// ```dart
  /// "Full Name"
  /// ```
  String get full_name => """Full Name""";

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

  /// ```dart
  /// "This phone number is already used by another user"
  /// ```
  String get phone_number_already_used =>
      """This phone number is already used by another user""";
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

  /// ```dart
  /// "Select Code"
  /// ```
  String get select_code => """Select Code""";

  /// ```dart
  /// "Plate code is required"
  /// ```
  String get code_required => """Plate code is required""";

  /// ```dart
  /// "Plate number is required"
  /// ```
  String get number_required => """Plate number is required""";

  /// ```dart
  /// "Invalid plate code"
  /// ```
  String get invalid_code => """Invalid plate code""";

  /// ```dart
  /// "Invalid plate number"
  /// ```
  String get invalid_number => """Invalid plate number""";

  /// ```dart
  /// "You can use X or Y to mask any digit"
  /// ```
  String get mask_instructions => """You can use X or Y to mask any digit""";
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
  /// "Requested Phone Number"
  /// ```
  String get required_phone_number => """Requested Phone Number""";

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
  /// "Requested Plate Number"
  /// ```
  String get required_plate_number => """Requested Plate Number""";

  /// ```dart
  /// "Plate Code"
  /// ```
  String get code => """Plate Code""";

  /// ```dart
  /// "Plate Number"
  /// ```
  String get number => """Plate Number""";

  /// ```dart
  /// "Optional Price"
  /// ```
  String get optional_price => """Optional Price""";
}

class ListingdetailsMessages {
  final Messages _parent;
  const ListingdetailsMessages(this._parent);

  /// ```dart
  /// "Expires on $date"
  /// ```
  String expires_on(String date) => """Expires on $date""";

  /// ```dart
  /// "Featured until $date"
  /// ```
  String featured_until(String date) => """Featured until $date""";
}

class PhonedetailsMessages {
  final Messages _parent;
  const PhonedetailsMessages(this._parent);

  /// ```dart
  /// "Phone Number Details"
  /// ```
  String get title => """Phone Number Details""";

  /// ```dart
  /// "Check out this plate number: $number"
  /// ```
  String share_message(String number) =>
      """Check out this plate number: $number""";

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
  /// "Error getting data for Plate Number: $plateNumber"
  /// ```
  String error_loading_data(String plateNumber) =>
      """Error getting data for Plate Number: $plateNumber""";

  /// ```dart
  /// "Posted by"
  /// ```
  String get originally_posted_by => """Posted by""";

  /// ```dart
  /// "Member since $year"
  /// ```
  String member_since(String year) => """Member since $year""";

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
  /// "$days ago"
  /// ```
  String days_ago(String days) => """$days ago""";

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

class EditphoneMessages {
  final Messages _parent;
  const EditphoneMessages(this._parent);

  /// ```dart
  /// "Edit Phone Listing"
  /// ```
  String get title => """Edit Phone Listing""";

  /// ```dart
  /// "Phone Number"
  /// ```
  String get phone_number => """Phone Number""";

  /// ```dart
  /// "Price"
  /// ```
  String get price => """Price""";

  /// ```dart
  /// "Discount Price"
  /// ```
  String get discount_price => """Discount Price""";

  /// ```dart
  /// "Feature this listing"
  /// ```
  String get feature => """Feature this listing""";

  /// ```dart
  /// "Mark as Sold"
  /// ```
  String get mark_sold => """Mark as Sold""";

  /// ```dart
  /// "Disable this listing"
  /// ```
  String get disable => """Disable this listing""";

  /// ```dart
  /// "Save Changes"
  /// ```
  String get save_changes => """Save Changes""";

  /// ```dart
  /// "With Discount?"
  /// ```
  String get withdiscount => """With Discount?""";

  /// ```dart
  /// "With Discount?"
  /// ```
  String get discount => """With Discount?""";
}

class EditphonerequestMessages {
  final Messages _parent;
  const EditphonerequestMessages(this._parent);

  /// ```dart
  /// "Edit Phone Request"
  /// ```
  String get title => """Edit Phone Request""";

  /// ```dart
  /// "Phone Number"
  /// ```
  String get phone_number => """Phone Number""";

  /// ```dart
  /// "Price (optional)"
  /// ```
  String get price_optional => """Price (optional)""";

  /// ```dart
  /// "Save Changes"
  /// ```
  String get save_changes => """Save Changes""";
}

class EditplateMessages {
  final Messages _parent;
  const EditplateMessages(this._parent);

  /// ```dart
  /// "Edit Plate Listing"
  /// ```
  String get title => """Edit Plate Listing""";

  /// ```dart
  /// "Code"
  /// ```
  String get code => """Code""";

  /// ```dart
  /// "Plate Number"
  /// ```
  String get plate_number => """Plate Number""";

  /// ```dart
  /// "Price"
  /// ```
  String get price => """Price""";

  /// ```dart
  /// "Discount Price"
  /// ```
  String get discount_price => """Discount Price""";

  /// ```dart
  /// "Featured"
  /// ```
  String get featured => """Featured""";

  /// ```dart
  /// "Disabled"
  /// ```
  String get disabled => """Disabled""";

  /// ```dart
  /// "Sold"
  /// ```
  String get sold => """Sold""";

  /// ```dart
  /// "Save Changes"
  /// ```
  String get save_changes => """Save Changes""";
}

class EditplaterequestMessages {
  final Messages _parent;
  const EditplaterequestMessages(this._parent);

  /// ```dart
  /// "Edit Plate Request"
  /// ```
  String get title => """Edit Plate Request""";

  /// ```dart
  /// "Code"
  /// ```
  String get code => """Code""";

  /// ```dart
  /// "Number"
  /// ```
  String get number => """Number""";

  /// ```dart
  /// "Price (optional)"
  /// ```
  String get price_optional => """Price (optional)""";

  /// ```dart
  /// "Save Changes"
  /// ```
  String get save_changes => """Save Changes""";
}

class IapMessages {
  final Messages _parent;
  const IapMessages(this._parent);

  /// ```dart
  /// "Purchase"
  /// ```
  String get purchase => """Purchase""";
}

class DatetimeMessages {
  final Messages _parent;
  const DatetimeMessages(this._parent);

  /// ```dart
  /// "$months months ago"
  /// ```
  String months_ago(String months) => """$months months ago""";

  /// ```dart
  /// "$weeks weeks ago"
  /// ```
  String weeks_ago(String weeks) => """$weeks weeks ago""";

  /// ```dart
  /// "$days days ago"
  /// ```
  String days_ago(String days) => """$days days ago""";

  /// ```dart
  /// "$hours hours ago"
  /// ```
  String hours_ago(String hours) => """$hours hours ago""";

  /// ```dart
  /// "$minutes minutes ago"
  /// ```
  String minutes_ago(String minutes) => """$minutes minutes ago""";

  /// ```dart
  /// "$seconds seconds ago"
  /// ```
  String seconds_ago(String seconds) => """$seconds seconds ago""";

  /// ```dart
  /// "Just now"
  /// ```
  String get just_now => """Just now""";
}

class AuthMessages {
  final Messages _parent;
  const AuthMessages(this._parent);

  /// ```dart
  /// "Sign in"
  /// ```
  String get signin => """Sign in""";

  /// ```dart
  /// "Sign up"
  /// ```
  String get signup => """Sign up""";

  /// ```dart
  /// "Display Name"
  /// ```
  String get display_name => """Display Name""";

  /// ```dart
  /// "Email"
  /// ```
  String get email => """Email""";

  /// ```dart
  /// "Phone number"
  /// ```
  String get phone_number => """Phone number""";

  /// ```dart
  /// "Password"
  /// ```
  String get password => """Password""";

  /// ```dart
  /// "Reset password"
  /// ```
  String get reset_password => """Reset password""";

  /// ```dart
  /// "Continue as a guest"
  /// ```
  String get continue_guest => """Continue as a guest""";

  /// ```dart
  /// "Reset Password"
  /// ```
  String get reset_password_title => """Reset Password""";

  /// ```dart
  /// "Enter your email address"
  /// ```
  String get enter_email => """Enter your email address""";

  /// ```dart
  /// "Cancel"
  /// ```
  String get cancel => """Cancel""";

  /// ```dart
  /// "Reset"
  /// ```
  String get reset => """Reset""";

  /// ```dart
  /// "Password reset instructions sent to your email"
  /// ```
  String get reset_sent => """Password reset instructions sent to your email""";

  /// ```dart
  /// "Continue as a guest"
  /// ```
  String get guest => """Continue as a guest""";

  /// ```dart
  /// "Verification Code"
  /// ```
  String get verification_code => """Verification Code""";

  /// ```dart
  /// "Enter the verification code"
  /// ```
  String get enter_verification_code => """Enter the verification code""";

  /// ```dart
  /// "We sent a verification code to $email. Enter the code to continue."
  /// ```
  String code_sent_to_email(String email) =>
      """We sent a verification code to $email. Enter the code to continue.""";

  /// ```dart
  /// "The code should arrive within a few minutes. Check your spam/junk folder if you don't see it."
  /// ```
  String get code_check_spam =>
      """The code should arrive within a few minutes. Check your spam/junk folder if you don't see it.""";

  /// ```dart
  /// "Enter the code from your email"
  /// ```
  String get enter_code_from_email => """Enter the code from your email""";

  /// ```dart
  /// "Please enter the verification code"
  /// ```
  String get please_enter_code => """Please enter the verification code""";

  /// ```dart
  /// "Verify Code"
  /// ```
  String get verify_code => """Verify Code""";

  /// ```dart
  /// "Verification code resent to $email"
  /// ```
  String code_resent(String email) => """Verification code resent to $email""";

  /// ```dart
  /// "Resend Code"
  /// ```
  String get resend_code => """Resend Code""";

  /// ```dart
  /// "Back"
  /// ```
  String get back => """Back""";

  /// ```dart
  /// "Create New Password"
  /// ```
  String get create_new_password => """Create New Password""";

  /// ```dart
  /// "Your email has been verified. Please set your new password."
  /// ```
  String get verified_set_password =>
      """Your email has been verified. Please set your new password.""";

  /// ```dart
  /// "New Password"
  /// ```
  String get new_password => """New Password""";

  /// ```dart
  /// "Enter your new password"
  /// ```
  String get enter_new_password => """Enter your new password""";

  /// ```dart
  /// "Confirm New Password"
  /// ```
  String get confirm_password => """Confirm New Password""";

  /// ```dart
  /// "Confirm your new password"
  /// ```
  String get confirm_new_password => """Confirm your new password""";

  /// ```dart
  /// "Passwords do not match"
  /// ```
  String get passwords_not_match => """Passwords do not match""";

  /// ```dart
  /// "Password Reset Successful"
  /// ```
  String get password_reset_successful => """Password Reset Successful""";

  /// ```dart
  /// "Your password has been reset successfully. You can now login with your new password."
  /// ```
  String get password_reset_success_message =>
      """Your password has been reset successfully. You can now login with your new password.""";

  /// ```dart
  /// "Login"
  /// ```
  String get login => """Login""";

  /// ```dart
  /// "Follow us on"
  /// ```
  String get follow_us => """Follow us on""";

  /// ```dart
  /// "Enter your email address to reset your password"
  /// ```
  String get reset_password_description =>
      """Enter your email address to reset your password""";

  /// ```dart
  /// "We will send you a link to reset your password"
  /// ```
  String get reset_password_instructions =>
      """We will send you a link to reset your password""";

  /// ```dart
  /// "Send Reset Code"
  /// ```
  String get send_reset_code => """Send Reset Code""";

  /// ```dart
  /// "Check your email for a Password Reset Link and instructions"
  /// ```
  String get check_email_instructions =>
      """Check your email for a Password Reset Link and instructions""";

  /// ```dart
  /// "Sign up to view the contact details"
  /// ```
  String get signin_to_contact => """Sign up to view the contact details""";
}

class FeedMessages {
  final Messages _parent;
  const FeedMessages(this._parent);

  /// ```dart
  /// "Feed"
  /// ```
  String get title => """Feed""";

  /// ```dart
  /// "You need to sign in to view your feed"
  /// ```
  String get login_required => """You need to sign in to view your feed""";

  /// ```dart
  /// "Sign In"
  /// ```
  String get sign_in => """Sign In""";

  /// ```dart
  /// "Error loading profile:"
  /// ```
  String get error_loading => """Error loading profile:""";

  /// ```dart
  /// "Retry"
  /// ```
  String get retry => """Retry""";

  /// ```dart
  /// "User profile not found"
  /// ```
  String get user_not_found => """User profile not found""";

  /// ```dart
  /// "Your feed is empty"
  /// ```
  String get empty_feed => """Your feed is empty""";

  /// ```dart
  /// "Follow users to see their listings here"
  /// ```
  String get follow_users => """Follow users to see their listings here""";

  /// ```dart
  /// "Explore Listings"
  /// ```
  String get explore_listings => """Explore Listings""";

  /// ```dart
  /// "You are not following any users"
  /// ```
  String get no_users_followed => """You are not following any users""";

  /// ```dart
  /// "Error loading data:"
  /// ```
  String get error_generic => """Error loading data:""";

  /// ```dart
  /// "No plate listings from users you follow"
  /// ```
  String get no_plate_listings => """No plate listings from users you follow""";

  /// ```dart
  /// "No phone listings from users you follow"
  /// ```
  String get no_phone_listings => """No phone listings from users you follow""";
}

class PrivacyMessages {
  final Messages _parent;
  const PrivacyMessages(this._parent);

  /// ```dart
  /// "Privacy Policy"
  /// ```
  String get title => """Privacy Policy""";

  /// ```dart
  /// "Effective Date: January 1, 2023"
  /// ```
  String get effective_date => """Effective Date: January 1, 2023""";

  /// ```dart
  /// "At Joplate, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your information when you use our mobile application."
  /// ```
  String get intro =>
      """At Joplate, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your information when you use our mobile application.""";

  /// ```dart
  /// "Information We Collect"
  /// ```
  String get information_collected => """Information We Collect""";

  /// ```dart
  /// "• Personal Information: Name, email address, phone number, and profile picture"
  /// ```
  String get personal_info =>
      """• Personal Information: Name, email address, phone number, and profile picture""";

  /// ```dart
  /// "• User Content: Information you provide about listings, including images and descriptions"
  /// ```
  String get user_content =>
      """• User Content: Information you provide about listings, including images and descriptions""";

  /// ```dart
  /// "• Device Information: Device type, operating system, and unique device identifiers"
  /// ```
  String get device_info =>
      """• Device Information: Device type, operating system, and unique device identifiers""";

  /// ```dart
  /// "• Usage Data: How you interact with our app, features you use, and time spent on the app"
  /// ```
  String get usage_data =>
      """• Usage Data: How you interact with our app, features you use, and time spent on the app""";

  /// ```dart
  /// "How We Use Your Information"
  /// ```
  String get how_we_use => """How We Use Your Information""";

  /// ```dart
  /// "• To provide and maintain our service"
  /// ```
  String get use_1 => """• To provide and maintain our service""";

  /// ```dart
  /// "• To notify you about changes to our service"
  /// ```
  String get use_2 => """• To notify you about changes to our service""";

  /// ```dart
  /// "• To allow you to participate in interactive features"
  /// ```
  String get use_3 =>
      """• To allow you to participate in interactive features""";

  /// ```dart
  /// "• To provide customer support"
  /// ```
  String get use_4 => """• To provide customer support""";

  /// ```dart
  /// "• To gather analysis or valuable information to improve our service"
  /// ```
  String get use_5 =>
      """• To gather analysis or valuable information to improve our service""";

  /// ```dart
  /// "• To monitor the usage of our service"
  /// ```
  String get use_6 => """• To monitor the usage of our service""";

  /// ```dart
  /// "• To detect, prevent and address technical issues"
  /// ```
  String get use_7 => """• To detect, prevent and address technical issues""";

  /// ```dart
  /// "Security"
  /// ```
  String get security => """Security""";

  /// ```dart
  /// "We value your trust in providing us your personal information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security."
  /// ```
  String get security_text =>
      """We value your trust in providing us your personal information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.""";

  /// ```dart
  /// "Changes to This Privacy Policy"
  /// ```
  String get changes => """Changes to This Privacy Policy""";

  /// ```dart
  /// "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page."
  /// ```
  String get changes_text =>
      """We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.""";

  /// ```dart
  /// "Contact Us"
  /// ```
  String get contact => """Contact Us""";

  /// ```dart
  /// "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at jo1plates@outlook.com"
  /// ```
  String get contact_text =>
      """If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at jo1plates@outlook.com""";
}

class TermsMessages {
  final Messages _parent;
  const TermsMessages(this._parent);

  /// ```dart
  /// "Terms & Conditions"
  /// ```
  String get title => """Terms & Conditions""";

  /// ```dart
  /// "Effective Date: January 1, 2023"
  /// ```
  String get effective_date => """Effective Date: January 1, 2023""";

  /// ```dart
  /// "Please read these Terms and Conditions carefully before using the Joplate mobile application. By accessing or using our service, you agree to be bound by these Terms and Conditions."
  /// ```
  String get intro =>
      """Please read these Terms and Conditions carefully before using the Joplate mobile application. By accessing or using our service, you agree to be bound by these Terms and Conditions.""";

  /// ```dart
  /// "Acceptance of Terms"
  /// ```
  String get acceptance => """Acceptance of Terms""";

  /// ```dart
  /// "By using our app, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use our services."
  /// ```
  String get acceptance_text =>
      """By using our app, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use our services.""";

  /// ```dart
  /// "User Accounts"
  /// ```
  String get user_accounts => """User Accounts""";

  /// ```dart
  /// "• You are responsible for maintaining the confidentiality of your account and password."
  /// ```
  String get account_1 =>
      """• You are responsible for maintaining the confidentiality of your account and password.""";

  /// ```dart
  /// "• You accept responsibility for all activities that occur under your account."
  /// ```
  String get account_2 =>
      """• You accept responsibility for all activities that occur under your account.""";

  /// ```dart
  /// "• You must be at least 18 years old to use this service."
  /// ```
  String get account_3 =>
      """• You must be at least 18 years old to use this service.""";

  /// ```dart
  /// "• You agree to provide accurate and complete information when creating an account."
  /// ```
  String get account_4 =>
      """• You agree to provide accurate and complete information when creating an account.""";

  /// ```dart
  /// "Listing and Transactions"
  /// ```
  String get listings => """Listing and Transactions""";

  /// ```dart
  /// "• You are solely responsible for the accuracy of your listings."
  /// ```
  String get listing_1 =>
      """• You are solely responsible for the accuracy of your listings.""";

  /// ```dart
  /// "• All transactions are between buyers and sellers directly. Joplate only facilitates connections."
  /// ```
  String get listing_2 =>
      """• All transactions are between buyers and sellers directly. Joplate only facilitates connections.""";

  /// ```dart
  /// "• Joplate does not guarantee the quality, safety, or legality of listed items."
  /// ```
  String get listing_3 =>
      """• Joplate does not guarantee the quality, safety, or legality of listed items.""";

  /// ```dart
  /// "• Listing fees and transaction fees may apply as specified in the app."
  /// ```
  String get listing_4 =>
      """• Listing fees and transaction fees may apply as specified in the app.""";

  /// ```dart
  /// "Prohibited Activities"
  /// ```
  String get prohibited => """Prohibited Activities""";

  /// ```dart
  /// "• Posting false, inaccurate, or misleading information"
  /// ```
  String get prohibited_1 =>
      """• Posting false, inaccurate, or misleading information""";

  /// ```dart
  /// "• Using the service for any illegal purpose"
  /// ```
  String get prohibited_2 => """• Using the service for any illegal purpose""";

  /// ```dart
  /// "• Attempting to bypass any security measures"
  /// ```
  String get prohibited_3 => """• Attempting to bypass any security measures""";

  /// ```dart
  /// "• Impersonating another person or entity"
  /// ```
  String get prohibited_4 => """• Impersonating another person or entity""";

  /// ```dart
  /// "• Harassing or threatening other users"
  /// ```
  String get prohibited_5 => """• Harassing or threatening other users""";

  /// ```dart
  /// "Termination"
  /// ```
  String get termination => """Termination""";

  /// ```dart
  /// "We reserve the right to terminate or suspend access to our service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms and Conditions."
  /// ```
  String get termination_text =>
      """We reserve the right to terminate or suspend access to our service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms and Conditions.""";

  /// ```dart
  /// "Changes to Terms"
  /// ```
  String get changes => """Changes to Terms""";

  /// ```dart
  /// "We reserve the right to modify or replace these Terms at any time. We will provide notice of significant changes. Your continued use of the service after such changes constitutes your acceptance of the new Terms."
  /// ```
  String get changes_text =>
      """We reserve the right to modify or replace these Terms at any time. We will provide notice of significant changes. Your continued use of the service after such changes constitutes your acceptance of the new Terms.""";

  /// ```dart
  /// "Contact Us"
  /// ```
  String get contact => """Contact Us""";

  /// ```dart
  /// "If you have any questions about these Terms, please contact us at jo1plates@outlook.com"
  /// ```
  String get contact_text =>
      """If you have any questions about these Terms, please contact us at jo1plates@outlook.com""";
}

class CommonMessages {
  final Messages _parent;
  const CommonMessages(this._parent);

  /// ```dart
  /// "No items found"
  /// ```
  String get no_items_found => """No items found""";

  /// ```dart
  /// "No results found"
  /// ```
  String get no_results_found => """No results found""";

  /// ```dart
  /// "No data found"
  /// ```
  String get no_data_found => """No data found""";

  /// ```dart
  /// "No results"
  /// ```
  String get no_results => """No results""";

  /// ```dart
  /// "No items"
  /// ```
  String get no_items => """No items""";

  /// ```dart
  /// "Follow"
  /// ```
  String get follow => """Follow""";

  /// ```dart
  /// "Unfollow"
  /// ```
  String get unfollow => """Unfollow""";

  /// ```dart
  /// "Following"
  /// ```
  String get following => """Following""";

  /// ```dart
  /// "Confirm"
  /// ```
  String get confirm => """Confirm""";

  /// ```dart
  /// "Cancel"
  /// ```
  String get cancel => """Cancel""";

  /// ```dart
  /// "Are you sure you want to logout?"
  /// ```
  String get confirm_logout => """Are you sure you want to logout?""";

  /// ```dart
  /// "Are you sure you want to delete your account? This action cannot be undone."
  /// ```
  String get delete_account_confirmation =>
      """Are you sure you want to delete your account? This action cannot be undone.""";

  /// ```dart
  /// "Please enter your password to confirm account deletion."
  /// ```
  String get enter_password_to_delete =>
      """Please enter your password to confirm account deletion.""";

  /// ```dart
  /// "Account deleted successfully."
  /// ```
  String get account_deleted => """Account deleted successfully.""";

  /// ```dart
  /// "Failed to delete account: "
  /// ```
  String get delete_account_failed => """Failed to delete account: """;

  /// ```dart
  /// "Please re-enter your password to confirm this action."
  /// ```
  String get requires_recent_login =>
      """Please re-enter your password to confirm this action.""";

  /// ```dart
  /// "Invalid password. Please try again."
  /// ```
  String get invalid_credentials => """Invalid password. Please try again.""";

  /// ```dart
  /// "Invalid promo code. Please try again."
  /// ```
  String get invalid_promo_code => """Invalid promo code. Please try again.""";

  /// ```dart
  /// "Promo code applied successfully!"
  /// ```
  String get promo_code_applied => """Promo code applied successfully!""";

  /// ```dart
  /// "Error applying promo code. Please try again."
  /// ```
  String get error_applying_promo_code =>
      """Error applying promo code. Please try again.""";

  /// ```dart
  /// "No plans available."
  /// ```
  String get no_plans_available => """No plans available.""";

  /// ```dart
  /// "Missing product ID"
  /// ```
  String get missing_product_id => """Missing product ID""";

  /// ```dart
  /// "Your listing has been promoted successfully!"
  /// ```
  String get promotion_success =>
      """Your listing has been promoted successfully!""";

  /// ```dart
  /// "Failed to promote listing"
  /// ```
  String get promotion_failed => """Failed to promote listing""";

  /// ```dart
  /// "Phone number is required"
  /// ```
  String get phone_required => """Phone number is required""";

  /// ```dart
  /// "Number must start with 7"
  /// ```
  String get phone_start_with_7 => """Number must start with 7""";

  /// ```dart
  /// "Number must be 77, 78, or 79"
  /// ```
  String get phone_start_with_77_78_79 => """Number must be 77, 78, or 79""";

  /// ```dart
  /// "Phone must be 9 digits after +962"
  /// ```
  String get phone_length => """Phone must be 9 digits after +962""";

  /// ```dart
  /// "Description (optional)"
  /// ```
  String get description_optional => """Description (optional)""";

  /// ```dart
  /// "Description"
  /// ```
  String get description => """Description""";

  /// ```dart
  /// "Add a description (max 150 characters)"
  /// ```
  String get description_hint => """Add a description (max 150 characters)""";

  /// ```dart
  /// "Description must be 150 characters or less"
  /// ```
  String get description_too_long =>
      """Description must be 150 characters or less""";

  /// ```dart
  /// "Purchase failed"
  /// ```
  String get purchase_error => """Purchase failed""";

  /// ```dart
  /// "✅ Ticket activated successfully"
  /// ```
  String get activation_success => """✅ Ticket activated successfully""";

  /// ```dart
  /// "❌ Activation failed: "
  /// ```
  String get activation_failed => """❌ Activation failed: """;

  /// ```dart
  /// "Unknown error"
  /// ```
  String get unknown_error => """Unknown error""";
}

class ListingstatusMessages {
  final Messages _parent;
  const ListingstatusMessages(this._parent);

  /// ```dart
  /// "Featured"
  /// ```
  String get featured => """Featured""";

  /// ```dart
  /// "Active"
  /// ```
  String get active => """Active""";

  /// ```dart
  /// "Inactive"
  /// ```
  String get inactive => """Inactive""";

  /// ```dart
  /// "Disabled"
  /// ```
  String get disabled => """Disabled""";

  /// ```dart
  /// "Expired"
  /// ```
  String get expired => """Expired""";

  /// ```dart
  /// "Sold"
  /// ```
  String get sold => """Sold""";
}

class AccountMessages {
  final Messages _parent;
  const AccountMessages(this._parent);

  /// ```dart
  /// "Delete Account"
  /// ```
  String get delete_account => """Delete Account""";

  /// ```dart
  /// "Password"
  /// ```
  String get password => """Password""";
}

class UserprofileMessages {
  final Messages _parent;
  const UserprofileMessages(this._parent);

  /// ```dart
  /// "User Profile"
  /// ```
  String get title => """User Profile""";

  /// ```dart
  /// "User not found"
  /// ```
  String get user_not_found => """User not found""";

  /// ```dart
  /// "No plate listings found"
  /// ```
  String get no_plate_listings => """No plate listings found""";

  /// ```dart
  /// "No phone listings found"
  /// ```
  String get no_phone_listings => """No phone listings found""";

  /// ```dart
  /// "No plate requests found"
  /// ```
  String get no_plate_requests => """No plate requests found""";

  /// ```dart
  /// "No phone requests found"
  /// ```
  String get no_phone_requests => """No phone requests found""";

  /// ```dart
  /// "Error loading profile:"
  /// ```
  String get error_loading => """Error loading profile:""";

  /// ```dart
  /// "Error loading plate listings:"
  /// ```
  String get error_loading_plates => """Error loading plate listings:""";

  /// ```dart
  /// "Error loading phone listings:"
  /// ```
  String get error_loading_phones => """Error loading phone listings:""";

  /// ```dart
  /// "Error loading plate requests:"
  /// ```
  String get error_loading_plate_requests =>
      """Error loading plate requests:""";

  /// ```dart
  /// "Error loading phone requests:"
  /// ```
  String get error_loading_phone_requests =>
      """Error loading phone requests:""";

  /// ```dart
  /// "Following user successfully"
  /// ```
  String get follow_success => """Following user successfully""";

  /// ```dart
  /// "Unfollowed user successfully"
  /// ```
  String get unfollow_success => """Unfollowed user successfully""";

  /// ```dart
  /// "You must be logged in to follow users"
  /// ```
  String get login_required => """You must be logged in to follow users""";

  /// ```dart
  /// "Error: "
  /// ```
  String get error => """Error: """;
}

class PromoteMessages {
  final Messages _parent;
  const PromoteMessages(this._parent);

  /// ```dart
  /// "✨ Promote Ad"
  /// ```
  String get title_free => """✨ Promote Ad""";

  /// ```dart
  /// "Sell Faster!"
  /// ```
  String get title_paid => """Sell Faster!""";

  /// ```dart
  /// "Feature your ad for 14 days with one golden ticket."
  /// ```
  String get description_free =>
      """Feature your ad for 14 days with one golden ticket.""";

  /// ```dart
  /// "Increase your listing visibility by 10x."
  /// ```
  String get description_paid => """Increase your listing visibility by 10x.""";

  /// ```dart
  /// "Promote"
  /// ```
  String get promote_button => """Promote""";

  /// ```dart
  /// "Make Featured"
  /// ```
  String get make_featured => """Make Featured""";

  /// ```dart
  /// "Loading..."
  /// ```
  String get loading => """Loading...""";

  /// ```dart
  /// "Purchasing..."
  /// ```
  String get purchasing => """Purchasing...""";
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
  """home.expired""": """Expired""",
  """home.mynumbers""": """My Numbers""",
  """home.myRequests""": """My Requests""",
  """home.search""": """Search""",
  """home.disabled""": """Deleted""",
  """home.visits""": """Visits""",
  """home.requested""": """Requested""",
  """profile.title""": """Profile""",
  """profile.Requests""": """Requests""",
  """profile.Ads""": """Ads""",
  """profile.myAds""": """My Ads""",
  """profile.myRequests""": """My Requests""",
  """profile.Numbers""": """Numbers""",
  """profile.packages""": """Packages""",
  """profile.my_current_plan""": """My Current Plan""",
  """profile.language""": """Language""",
  """profile.theme""": """Theme""",
  """profile.dark_mode""": """Dark""",
  """profile.light_mode""": """Light""",
  """profile.aboutus""": """About Us""",
  """profile.privacy_policy""": """Privacy Policy""",
  """profile.terms_conditions""": """Terms & Conditions""",
  """profile.instructions""": """Instructions""",
  """profile.logout""": """Logout""",
  """profile.delete_account""": """Delete Account""",
  """profile.notsignedin""": """Not Signed In""",
  """profile.signin""": """Sign In""",
  """profile.upload""": """Upload""",
  """profile.choose_source""": """Choose Image Source""",
  """profile.gallery""": """Gallery""",
  """profile.camera""": """Camera""",
  """profile.promo_code""": """Promo Code""",
  """profile.promo_code_hint""": """Enter your promo code""",
  """footer.home""": """Home""",
  """footer.profile""": """Profile""",
  """footer.favorites""": """Favorites""",
  """footer.feed""": """Feed""",
  """editprofile.header""": """Profile""",
  """editprofile.full_name""": """Full Name""",
  """editprofile.phone_number""": """Phone Number""",
  """editprofile.email""": """Email""",
  """editprofile.change_password""": """Change Password""",
  """editprofile.edit_fullname""": """Edit Full Name""",
  """editprofile.edit_email""": """Edit Email""",
  """editprofile.edit_phone""": """Edit Phone Number""",
  """editprofile.save""": """Save""",
  """editprofile.send_verification_code""": """Send Verification Code""",
  """editprofile.verifyandsave""": """Verify & Save""",
  """editprofile.oldpassword""": """Old Password""",
  """editprofile.newpassword""": """New Password""",
  """editprofile.confirmpassword""": """Confirm Password""",
  """editprofile.phone_number_already_used""":
      """This phone number is already used by another user""",
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
  """addplate.select_code""": """Select Code""",
  """addplate.code_required""": """Plate code is required""",
  """addplate.number_required""": """Plate number is required""",
  """addplate.invalid_code""": """Invalid plate code""",
  """addplate.invalid_number""": """Invalid plate number""",
  """addplate.mask_instructions""": """You can use X or Y to mask any digit""",
  """addphonerequest.title""": """Add Phone Request""",
  """addphonerequest.company_label""": """Company""",
  """addphonerequest.phone_number_label""": """Phone Number""",
  """addphonerequest.save_button""": """Save""",
  """addphonerequest.cancel_button""": """Cancel""",
  """addphonerequest.required_phone_number""": """Requested Phone Number""",
  """addphonerequest.optional_price""": """Optional Price""",
  """addplaterequest.title""": """Add Plate Request""",
  """addplaterequest.company_label""": """Company""",
  """addplaterequest.plate_number_label""": """Plate Number""",
  """addplaterequest.save_button""": """Save""",
  """addplaterequest.cancel_button""": """Cancel""",
  """addplaterequest.required_plate_number""": """Requested Plate Number""",
  """addplaterequest.code""": """Plate Code""",
  """addplaterequest.number""": """Plate Number""",
  """addplaterequest.optional_price""": """Optional Price""",
  """phonedetails.title""": """Phone Number Details""",
  """phonedetails.important_note""": """Important Note:""",
  """phonedetails.dont_transfer_money""": """Don't transfer money online""",
  """phonedetails.meet_in_person""": """Meet the seller in person""",
  """sellerdetails.about_seller""": """About Seller""",
  """sellerdetails.user_not_found""": """User not found""",
  """sellerdetails.whatsapp""": """WhatsApp""",
  """sellerdetails.phone_call""": """Call""",
  """platesdetails.title""": """Plate Details""",
  """platesdetails.originally_posted_by""": """Posted by""",
  """platesdetails.whatsapp""": """WhatsApp""",
  """platesdetails.call""": """Call""",
  """platesdetails.other_sellers""": """Other Sellers""",
  """platesdetails.seller""": """Seller""",
  """platesdetails.price""": """Price""",
  """platesdetails.contact""": """Contact""",
  """platesdetails.important_note""": """Important Note:""",
  """platesdetails.dont_transfer_money""": """Don't transfer money online""",
  """platesdetails.meet_in_person""": """Meet the seller in person""",
  """platesdetails.call_for_price""": """Call for Price""",
  """quicksale.title""": """Quick Sale""",
  """quicksale.description""":
      """Want us to find a buyer for your plate number? We can help you with that.""",
  """quicksale.whatsapp""": """WhatsApp""",
  """quicksale.call""": """Call""",
  """quicksale.user_not_found""": """User not found""",
  """quicksale.requested_by""": """Requested by""",
  """editphone.title""": """Edit Phone Listing""",
  """editphone.phone_number""": """Phone Number""",
  """editphone.price""": """Price""",
  """editphone.discount_price""": """Discount Price""",
  """editphone.feature""": """Feature this listing""",
  """editphone.mark_sold""": """Mark as Sold""",
  """editphone.disable""": """Disable this listing""",
  """editphone.save_changes""": """Save Changes""",
  """editphone.withdiscount""": """With Discount?""",
  """editphone.discount""": """With Discount?""",
  """editphonerequest.title""": """Edit Phone Request""",
  """editphonerequest.phone_number""": """Phone Number""",
  """editphonerequest.price_optional""": """Price (optional)""",
  """editphonerequest.save_changes""": """Save Changes""",
  """editplate.title""": """Edit Plate Listing""",
  """editplate.code""": """Code""",
  """editplate.plate_number""": """Plate Number""",
  """editplate.price""": """Price""",
  """editplate.discount_price""": """Discount Price""",
  """editplate.featured""": """Featured""",
  """editplate.disabled""": """Disabled""",
  """editplate.sold""": """Sold""",
  """editplate.save_changes""": """Save Changes""",
  """editplaterequest.title""": """Edit Plate Request""",
  """editplaterequest.code""": """Code""",
  """editplaterequest.number""": """Number""",
  """editplaterequest.price_optional""": """Price (optional)""",
  """editplaterequest.save_changes""": """Save Changes""",
  """iap.purchase""": """Purchase""",
  """datetime.just_now""": """Just now""",
  """auth.signin""": """Sign in""",
  """auth.signup""": """Sign up""",
  """auth.display_name""": """Display Name""",
  """auth.email""": """Email""",
  """auth.phone_number""": """Phone number""",
  """auth.password""": """Password""",
  """auth.reset_password""": """Reset password""",
  """auth.continue_guest""": """Continue as a guest""",
  """auth.reset_password_title""": """Reset Password""",
  """auth.enter_email""": """Enter your email address""",
  """auth.cancel""": """Cancel""",
  """auth.reset""": """Reset""",
  """auth.reset_sent""": """Password reset instructions sent to your email""",
  """auth.guest""": """Continue as a guest""",
  """auth.verification_code""": """Verification Code""",
  """auth.enter_verification_code""": """Enter the verification code""",
  """auth.code_check_spam""":
      """The code should arrive within a few minutes. Check your spam/junk folder if you don't see it.""",
  """auth.enter_code_from_email""": """Enter the code from your email""",
  """auth.please_enter_code""": """Please enter the verification code""",
  """auth.verify_code""": """Verify Code""",
  """auth.resend_code""": """Resend Code""",
  """auth.back""": """Back""",
  """auth.create_new_password""": """Create New Password""",
  """auth.verified_set_password""":
      """Your email has been verified. Please set your new password.""",
  """auth.new_password""": """New Password""",
  """auth.enter_new_password""": """Enter your new password""",
  """auth.confirm_password""": """Confirm New Password""",
  """auth.confirm_new_password""": """Confirm your new password""",
  """auth.passwords_not_match""": """Passwords do not match""",
  """auth.password_reset_successful""": """Password Reset Successful""",
  """auth.password_reset_success_message""":
      """Your password has been reset successfully. You can now login with your new password.""",
  """auth.login""": """Login""",
  """auth.follow_us""": """Follow us on""",
  """auth.reset_password_description""":
      """Enter your email address to reset your password""",
  """auth.reset_password_instructions""":
      """We will send you a link to reset your password""",
  """auth.send_reset_code""": """Send Reset Code""",
  """auth.check_email_instructions""":
      """Check your email for a Password Reset Link and instructions""",
  """auth.signin_to_contact""": """Sign up to view the contact details""",
  """feed.title""": """Feed""",
  """feed.login_required""": """You need to sign in to view your feed""",
  """feed.sign_in""": """Sign In""",
  """feed.error_loading""": """Error loading profile:""",
  """feed.retry""": """Retry""",
  """feed.user_not_found""": """User profile not found""",
  """feed.empty_feed""": """Your feed is empty""",
  """feed.follow_users""": """Follow users to see their listings here""",
  """feed.explore_listings""": """Explore Listings""",
  """feed.no_users_followed""": """You are not following any users""",
  """feed.error_generic""": """Error loading data:""",
  """feed.no_plate_listings""": """No plate listings from users you follow""",
  """feed.no_phone_listings""": """No phone listings from users you follow""",
  """privacy.title""": """Privacy Policy""",
  """privacy.effective_date""": """Effective Date: January 1, 2023""",
  """privacy.intro""":
      """At Joplate, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your information when you use our mobile application.""",
  """privacy.information_collected""": """Information We Collect""",
  """privacy.personal_info""":
      """• Personal Information: Name, email address, phone number, and profile picture""",
  """privacy.user_content""":
      """• User Content: Information you provide about listings, including images and descriptions""",
  """privacy.device_info""":
      """• Device Information: Device type, operating system, and unique device identifiers""",
  """privacy.usage_data""":
      """• Usage Data: How you interact with our app, features you use, and time spent on the app""",
  """privacy.how_we_use""": """How We Use Your Information""",
  """privacy.use_1""": """• To provide and maintain our service""",
  """privacy.use_2""": """• To notify you about changes to our service""",
  """privacy.use_3""":
      """• To allow you to participate in interactive features""",
  """privacy.use_4""": """• To provide customer support""",
  """privacy.use_5""":
      """• To gather analysis or valuable information to improve our service""",
  """privacy.use_6""": """• To monitor the usage of our service""",
  """privacy.use_7""": """• To detect, prevent and address technical issues""",
  """privacy.security""": """Security""",
  """privacy.security_text""":
      """We value your trust in providing us your personal information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.""",
  """privacy.changes""": """Changes to This Privacy Policy""",
  """privacy.changes_text""":
      """We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.""",
  """privacy.contact""": """Contact Us""",
  """privacy.contact_text""":
          """If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at jo1plates@outlook.com""",
  """terms.title""": """Terms & Conditions""",
  """terms.effective_date""": """Effective Date: January 1, 2023""",
  """terms.intro""":
      """Please read these Terms and Conditions carefully before using the Joplate mobile application. By accessing or using our service, you agree to be bound by these Terms and Conditions.""",
  """terms.acceptance""": """Acceptance of Terms""",
  """terms.acceptance_text""":
      """By using our app, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use our services.""",
  """terms.user_accounts""": """User Accounts""",
  """terms.account_1""":
      """• You are responsible for maintaining the confidentiality of your account and password.""",
  """terms.account_2""":
      """• You accept responsibility for all activities that occur under your account.""",
  """terms.account_3""":
      """• You must be at least 18 years old to use this service.""",
  """terms.account_4""":
      """• You agree to provide accurate and complete information when creating an account.""",
  """terms.listings""": """Listing and Transactions""",
  """terms.listing_1""":
      """• You are solely responsible for the accuracy of your listings.""",
  """terms.listing_2""":
      """• All transactions are between buyers and sellers directly. Joplate only facilitates connections.""",
  """terms.listing_3""":
      """• Joplate does not guarantee the quality, safety, or legality of listed items.""",
  """terms.listing_4""":
      """• Listing fees and transaction fees may apply as specified in the app.""",
  """terms.prohibited""": """Prohibited Activities""",
  """terms.prohibited_1""":
      """• Posting false, inaccurate, or misleading information""",
  """terms.prohibited_2""": """• Using the service for any illegal purpose""",
  """terms.prohibited_3""": """• Attempting to bypass any security measures""",
  """terms.prohibited_4""": """• Impersonating another person or entity""",
  """terms.prohibited_5""": """• Harassing or threatening other users""",
  """terms.termination""": """Termination""",
  """terms.termination_text""":
      """We reserve the right to terminate or suspend access to our service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms and Conditions.""",
  """terms.changes""": """Changes to Terms""",
  """terms.changes_text""":
      """We reserve the right to modify or replace these Terms at any time. We will provide notice of significant changes. Your continued use of the service after such changes constitutes your acceptance of the new Terms.""",
  """terms.contact""": """Contact Us""",
  """terms.contact_text""":
          """If you have any questions about these Terms, please contact us at jo1plates@outlook.com""",
  """common.no_items_found""": """No items found""",
  """common.no_results_found""": """No results found""",
  """common.no_data_found""": """No data found""",
  """common.no_results""": """No results""",
  """common.no_items""": """No items""",
  """common.follow""": """Follow""",
  """common.unfollow""": """Unfollow""",
  """common.following""": """Following""",
  """common.confirm""": """Confirm""",
  """common.cancel""": """Cancel""",
  """common.confirm_logout""": """Are you sure you want to logout?""",
  """common.delete_account_confirmation""":
      """Are you sure you want to delete your account? This action cannot be undone.""",
  """common.enter_password_to_delete""":
      """Please enter your password to confirm account deletion.""",
  """common.account_deleted""": """Account deleted successfully.""",
  """common.delete_account_failed""": """Failed to delete account: """,
  """common.requires_recent_login""":
      """Please re-enter your password to confirm this action.""",
  """common.invalid_credentials""": """Invalid password. Please try again.""",
  """common.invalid_promo_code""": """Invalid promo code. Please try again.""",
  """common.promo_code_applied""": """Promo code applied successfully!""",
  """common.error_applying_promo_code""":
      """Error applying promo code. Please try again.""",
  """common.no_plans_available""": """No plans available.""",
  """common.missing_product_id""": """Missing product ID""",
  """common.promotion_success""":
      """Your listing has been promoted successfully!""",
  """common.promotion_failed""": """Failed to promote listing""",
  """common.phone_required""": """Phone number is required""",
  """common.phone_start_with_7""": """Number must start with 7""",
  """common.phone_start_with_77_78_79""": """Number must be 77, 78, or 79""",
  """common.phone_length""": """Phone must be 9 digits after +962""",
  """common.description_optional""": """Description (optional)""",
  """common.description""": """Description""",
  """common.description_hint""": """Add a description (max 150 characters)""",
  """common.description_too_long""":
      """Description must be 150 characters or less""",
  """common.purchase_error""": """Purchase failed""",
  """common.activation_success""": """✅ Ticket activated successfully""",
  """common.activation_failed""": """❌ Activation failed: """,
  """common.unknown_error""": """Unknown error""",
  """listingstatus.featured""": """Featured""",
  """listingstatus.active""": """Active""",
  """listingstatus.inactive""": """Inactive""",
  """listingstatus.disabled""": """Disabled""",
  """listingstatus.expired""": """Expired""",
  """listingstatus.sold""": """Sold""",
  """account.delete_account""": """Delete Account""",
  """account.password""": """Password""",
  """userprofile.title""": """User Profile""",
  """userprofile.user_not_found""": """User not found""",
  """userprofile.no_plate_listings""": """No plate listings found""",
  """userprofile.no_phone_listings""": """No phone listings found""",
  """userprofile.no_plate_requests""": """No plate requests found""",
  """userprofile.no_phone_requests""": """No phone requests found""",
  """userprofile.error_loading""": """Error loading profile:""",
  """userprofile.error_loading_plates""": """Error loading plate listings:""",
  """userprofile.error_loading_phones""": """Error loading phone listings:""",
  """userprofile.error_loading_plate_requests""":
      """Error loading plate requests:""",
  """userprofile.error_loading_phone_requests""":
      """Error loading phone requests:""",
  """userprofile.follow_success""": """Following user successfully""",
  """userprofile.unfollow_success""": """Unfollowed user successfully""",
  """userprofile.login_required""": """You must be logged in to follow users""",
  """userprofile.error""": """Error: """,
  """promote.title_free""": """✨ Promote Ad""",
  """promote.title_paid""": """Sell Faster!""",
  """promote.description_free""":
      """Feature your ad for 14 days with one golden ticket.""",
  """promote.description_paid""":
      """Increase your listing visibility by 10x.""",
  """promote.promote_button""": """Promote""",
  """promote.make_featured""": """Make Featured""",
  """promote.loading""": """Loading...""",
  """promote.purchasing""": """Purchasing...""",
};
