class ConfigModel {
  late int _systemDefaultCurrency;
  late BaseUrls _baseUrls;
  late List<String> _unit;
  late String _aboutUs;
  late String _privacyPolicy;
  late String _termsConditions;
  late String _refundPolicy;
  late String _returnPolicy;
  late String _cancellationPolicy;
  late String _currencyModel;
  late String _shippingMethod;
  late String _version;
  late String _forgetPasswordVerification;
  late String _countryCode;
  late int _decimalPointSettings;
  late String _brandSetting;
  late String _digitalProductSetting;
  late bool _digitalPayment;
  late bool _cashOnDelivery;
  late String _sellerRegistration;
  late String _companyPhone;
  late String _companyEmail;
  late int _decimalPointSetting;
  late String _companyLogo;
  late int _posActive;

  ConfigModel({
    int systemDefaultCurrency = 0,
    BaseUrls? baseUrls,
    List<String>? unit,
    String? aboutUs,
    String? privacyPolicy,
    String termsConditions="",
    String refundPolicy="",
    String returnPolicy="",
    String cancellationPolicy="",
    String currencyModel="",
    String shippingMethod="",
    String version="",
    String forgetPasswordVerification="",
    String countryCode="",
    int decimalPointSettings = 0,
    String brandSetting="",
    String digitalProductSetting="",
    bool digitalPayment = false,
    bool cashOnDelivery = false,
    String sellerRegistration="",
    String companyPhone="",
    String companyEmail="",
    int decimalPointSetting = 0,
    String companyLogo="",
    int posActive = 0,

  }) {
    this._systemDefaultCurrency = systemDefaultCurrency;
    this._baseUrls = baseUrls!;
    this._unit = unit!;
    this._aboutUs = aboutUs!;
    this._privacyPolicy = privacyPolicy!;
    this._termsConditions = termsConditions;
    this._refundPolicy = refundPolicy;
    this._returnPolicy = returnPolicy;
    this._cancellationPolicy = cancellationPolicy;
    this._currencyModel = currencyModel;
    this._shippingMethod = shippingMethod;
    this._version = version;
    this._forgetPasswordVerification = forgetPasswordVerification;
    this._countryCode = countryCode;
    this._decimalPointSettings = decimalPointSettings;
    if (brandSetting != null) {
      this._brandSetting = brandSetting;
    }
    if (digitalProductSetting != null) {
      this._digitalProductSetting = digitalProductSetting;
    }

    if (digitalPayment != null) {
      this._digitalPayment = digitalPayment;
    }
    if (cashOnDelivery != null) {
      this._cashOnDelivery = cashOnDelivery;
    }
    if (sellerRegistration != null) {
      this._sellerRegistration = sellerRegistration;
    }
    if (companyPhone != null) {
      _companyPhone = companyPhone;
    }
    if (companyEmail != null) {
      _companyEmail = companyEmail;
    }
    _decimalPointSetting = decimalPointSetting;
    _companyLogo = companyLogo;
    _posActive = posActive;
  }

  int get systemDefaultCurrency => _systemDefaultCurrency;
  BaseUrls get baseUrls => _baseUrls;
  List<String> get unit => _unit;
  String get aboutUs => _aboutUs;
  String get privacyPolicy => _privacyPolicy;

  String get termsConditions => _termsConditions;
  String get refundPolicy => _refundPolicy;
  String get returnPolicy => _returnPolicy;
  String get cancellationPolicy => _cancellationPolicy;
  String get currencyModel => _currencyModel;
  String get shippingMethod => _shippingMethod;
  String get version => _version;
  String get forgetPasswordVerification => _forgetPasswordVerification;
  String get countryCode =>_countryCode;
  int get decimalPointSettings => _decimalPointSettings;
  String get brandSetting => _brandSetting;
  String get digitalProductSetting => _digitalProductSetting;
  bool get digitalPayment => _digitalPayment;
  bool get cashOnDelivery => _cashOnDelivery;
  String get sellerRegistration => _sellerRegistration;
  String get companyPhone => _companyPhone;
  String get companyEmail => _companyEmail;
  int get decimalPointSetting => _decimalPointSetting;
  String get companyLogo => _companyLogo;
  int get posActive => _posActive;


  ConfigModel.fromJson(Map<String, dynamic> json) {
    _systemDefaultCurrency = json['system_default_currency'];
    _baseUrls = (json['base_urls'] != null ? new BaseUrls.fromJson(json['base_urls']) : null)!;
    _unit = List<String>.from(json["unit"].map((x) => x));
    _aboutUs = json['about_us'];
    _privacyPolicy = json['privacy_policy'];
    _termsConditions = json['terms_&_conditions'];
    //_refundPolicy = json['refund_policy']!= null? json['refund_policy'] : '';
    _returnPolicy = 'Refund policy';
    //_cancellationPolicy = json['cancellation_policy'] != null? json['cancellation_policy'] :'';
    _cancellationPolicy = 'cancellation_policy';
    _currencyModel = json['currency_model'];
    _shippingMethod = json['shipping_method'];
    if(json['software_version'] != null){
      _version = json['software_version'];
    }
    _forgetPasswordVerification = json['forgot_password_verification'];
    _countryCode = json['country_code'];
    _decimalPointSettings = int.tryParse(json['decimal_point_settings'].toString())!;
    _brandSetting = json['brand_setting'];
    _digitalProductSetting = json['digital_product_setting'];
    _digitalPayment = json['digital_payment'];
    _cashOnDelivery = json['cash_on_delivery'];
    _sellerRegistration = json['seller_registration'].toString();
    _companyPhone = json['company_phone'];
    _companyEmail = json['company_email'];
    if(json['decimal_point_settings'] != null && json['decimal_point_settings'] != "" ){
      _decimalPointSetting = int.parse(json['decimal_point_settings'].toString());
    }
    _companyLogo =json['company_logo']??'';
    if(json['pos_active'] != null){
      try{
        _posActive =json['pos_active'];
      }catch(e){
        _posActive = int.parse(json['pos_active'].toString());
      }
    }else{
      _posActive = 0;
    }



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['system_default_currency'] = this._systemDefaultCurrency;
    if (this._baseUrls != null) {
      data['base_urls'] = this._baseUrls.toJson();
    }
    data['about_us'] = this._aboutUs;
    data['privacy_policy'] = this._privacyPolicy;
    data['terms_&_conditions'] = this._termsConditions;
    data['currency_model'] = this._currencyModel;
    data['shipping_method'] = this._shippingMethod;
    if (this._version != null) {
      data['software_version'] = this._version;
    }
    data['forgot_password_verification'] = this._forgetPasswordVerification;
    data['country_code'] = this._countryCode;
    data['brand_setting'] = this._brandSetting;
    data['digital_product_setting'] = this._digitalProductSetting;
    data['digital_payment'] = this._digitalPayment;
    data['cash_on_delivery'] = this._cashOnDelivery;
    data['seller_registration'] = this._sellerRegistration;
    data['company_phone'] = _companyPhone;
    data['company_email'] = _companyEmail;
    data['company_logo'] = _companyLogo;
    if (_decimalPointSetting != null) {
      data['decimal_point_settings'] = _decimalPointSetting;
    }
    return data;
  }
}

class BaseUrls {
  late String _productImageUrl;
  late String _productThumbnailUrl;
  late String _brandImageUrl;
  late String _customerImageUrl;
  late String _bannerImageUrl;
  late String _categoryImageUrl;
  late String _reviewImageUrl;
  late String _sellerImageUrl;
  late String _shopImageUrl;
  late String _notificationImageUrl;
  late String _digitalProductUrl;
  late String _deliveryManImageUrl;

  BaseUrls({String productImageUrl="",
    String productThumbnailUrl="",
    String brandImageUrl="",
    String customerImageUrl="",
    String bannerImageUrl="",
    String categoryImageUrl="",
    String reviewImageUrl="",
    String sellerImageUrl="",
    String shopImageUrl="",
    String notificationImageUrl="",
    String digitalProductUrl="",
    String deliveryManImageUrl="",
  }) {
    this._productImageUrl = productImageUrl;
    this._productThumbnailUrl = productThumbnailUrl;
    this._brandImageUrl = brandImageUrl;
    this._customerImageUrl = customerImageUrl;
    this._bannerImageUrl = bannerImageUrl;
    this._categoryImageUrl = categoryImageUrl;
    this._reviewImageUrl = reviewImageUrl;
    this._sellerImageUrl = sellerImageUrl;
    this._shopImageUrl = shopImageUrl;
    this._notificationImageUrl = notificationImageUrl;
    if (digitalProductUrl != null) {
      this._digitalProductUrl = digitalProductUrl;
    }
    this._deliveryManImageUrl = deliveryManImageUrl;
  }

  String get productImageUrl => _productImageUrl;
  String get productThumbnailUrl => _productThumbnailUrl;
  String get brandImageUrl => _brandImageUrl;
  String get customerImageUrl => _customerImageUrl;
  String get bannerImageUrl => _bannerImageUrl;
  String get categoryImageUrl => _categoryImageUrl;
  String get reviewImageUrl => _reviewImageUrl;
  String get sellerImageUrl => _sellerImageUrl;
  String get shopImageUrl => _shopImageUrl;
  String get notificationImageUrl => _notificationImageUrl;
  String get digitalProductUrl => _digitalProductUrl;
  String get deliveryManImageUrl => _deliveryManImageUrl;

  BaseUrls.fromJson(Map<String, dynamic> json) {
    _productImageUrl = json['product_image_url'];
    _productThumbnailUrl = json['product_thumbnail_url'];
    _brandImageUrl = json['brand_image_url'];
    _customerImageUrl = json['customer_image_url'];
    _bannerImageUrl = json['banner_image_url'];
    _categoryImageUrl = json['category_image_url'];
    _reviewImageUrl = json['review_image_url'];
    _sellerImageUrl = json['seller_image_url'];
    _shopImageUrl = json['shop_image_url'];
    _notificationImageUrl = json['notification_image_url'];
    _digitalProductUrl = json['digital_product_url'];
    _deliveryManImageUrl = json['delivery_man_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_url'] = this._productImageUrl;
    data['product_thumbnail_url'] = this._productThumbnailUrl;
    data['brand_image_url'] = this._brandImageUrl;
    data['customer_image_url'] = this._customerImageUrl;
    data['banner_image_url'] = this._bannerImageUrl;
    data['category_image_url'] = this._categoryImageUrl;
    data['review_image_url'] = this._reviewImageUrl;
    data['seller_image_url'] = this._sellerImageUrl;
    data['shop_image_url'] = this._shopImageUrl;
    data['notification_image_url'] = this._notificationImageUrl;
    data['digital_product_url'] = this._digitalProductUrl;
    data['delivery_man_image_url'] = this._deliveryManImageUrl;
    return data;
  }
}


