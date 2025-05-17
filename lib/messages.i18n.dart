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
  String expires_on(DateTime date) => """Expires on $date""";
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
}

class TermsMessages {
  final Messages _parent;
  const TermsMessages(this._parent);

  /// ```dart
  /// "Terms & Conditions"
  /// ```
  String get title => """Terms & Conditions""";
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
  """terms.title""": """Terms & Conditions""",
  """common.no_items_found""": """No items found""",
  """common.no_results_found""": """No results found""",
  """common.no_data_found""": """No data found""",
  """common.no_results""": """No results""",
  """common.no_items""": """No items""",
  """common.follow""": """Follow""",
  """common.unfollow""": """Unfollow""",
  """common.following""": """Following""",
};
