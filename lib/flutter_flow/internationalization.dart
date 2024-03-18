import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fa', 'ps'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? faText = '',
    String? psText = '',
  }) =>
      [enText, faText, psText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Welcome
  {
    'qwqw25gw': {
      'en': 'RUSHD TEACHER',
      'fa': 'معلم رشد',
      'ps': 'رشد ښوونکی',
    },
    'mpn5mi8u': {
      'en': 'ACCURATE',
      'fa': 'دقیق',
      'ps': 'دقیق',
    },
    'mtavscia': {
      'en': 'EASY',
      'fa': 'آسان',
      'ps': 'اسانه',
    },
    'xo40jv4h': {
      'en': 'Your Journey Begins',
      'fa': 'سفر شما آغاز می شود',
      'ps': 'ستاسو سفر پیل کیږي',
    },
    'v01n34i0': {
      'en': 'Sign up below in order to get started!',
      'fa': 'برای شروع در زیر ثبت نام کنید!',
      'ps': 'د پیل کولو لپاره لاندې لاسلیک وکړئ!',
    },
    's1i0v2sa': {
      'en': 'Get Started',
      'fa': 'شروع کنید',
      'ps': 'پیل کړئ',
    },
    'ac1n29qi': {
      'en': 'Already have account\n',
      'fa': 'از قبل حساب دارید',
      'ps': 'دمخه حساب لري',
    },
    'v1qmwq1u': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // Login
  {
    'nehkzv5e': {
      'en': 'Welcome Back',
      'fa': 'خوش برگشتی',
      'ps': 'بیرته پخیر راغلې',
    },
    'sfsq5bpw': {
      'en': 'Let\'s get started by filling out the form below.',
      'fa': 'بیایید با پر کردن فرم زیر شروع کنیم.',
      'ps': 'راځئ چې د لاندې فارم په ډکولو سره پیل وکړو.',
    },
    'ezjrfzaa': {
      'en': 'Email or  phone number',
      'fa': 'ایمیل یا شماره تلفن',
      'ps': 'بریښنالیک یا تلیفون شمیره',
    },
    'ogqipk0e': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'pl6v3ww5': {
      'en': 'Password',
      'fa': 'کلمه عبور',
      'ps': 'رمز',
    },
    'm4vlclaw': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '28zumbc1': {
      'en': 'Sign In',
      'fa': 'ورود',
      'ps': 'ننوزئ',
    },
    '1l12ls4y': {
      'en': 'OR',
      'fa': 'یا',
      'ps': 'OR',
    },
    'fs0xthdd': {
      'en': 'Continue with Google',
      'fa': 'با گوگل ادامه دهید',
      'ps': 'د ګوګل سره دوام ورکړئ',
    },
    'e7ann1kp': {
      'en': 'Forget password',
      'fa': 'فراموشی رمز عبور',
      'ps': 'پټنوم هیر کړئ',
    },
    '61fnmlad': {
      'en': 'Don\'t have an account? ',
      'fa': 'حساب کاربری ندارید؟',
      'ps': 'حساب نه لرئ؟',
    },
    'v24yab6g': {
      'en': 'Sign Up here',
      'fa': 'اینجا ثبت نام کنید',
      'ps': 'دلته لاسلیک وکړئ',
    },
    '4d48mbaj': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // CreateAccount
  {
    '7n01cr5r': {
      'en': 'Create an account',
      'fa': 'یک حساب کاربری ایجاد کنید',
      'ps': 'ګڼون پرانیستل',
    },
    'ciljk4tk': {
      'en': 'Let\'s get started by filling out the form below.',
      'fa': 'بیایید با پر کردن فرم زیر شروع کنیم.',
      'ps': 'راځئ چې د لاندې فورمې په ډکولو سره پیل وکړو.',
    },
    '67sokm5k': {
      'en': 'Email',
      'fa': 'پست الکترونیک',
      'ps': 'ایمیل',
    },
    '62mbps5o': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'wxngoox2': {
      'en': 'Password',
      'fa': 'کلمه عبور',
      'ps': 'رمز',
    },
    'fihpfvdy': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'b96po32j': {
      'en': 'Confirm Password',
      'fa': 'رمز عبور را تایید کنید',
      'ps': 'پاسورډ تایید کړه',
    },
    'kajcdpte': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'bp4b1cf0': {
      'en': 'Create Account',
      'fa': 'ایجاد حساب کاربری',
      'ps': 'ګڼون جوړول',
    },
    '8encf2wj': {
      'en': 'OR',
      'fa': 'یا',
      'ps': 'OR',
    },
    '3riyif76': {
      'en': 'Continue with Google',
      'fa': 'با گوگل ادامه دهید',
      'ps': 'د ګوګل سره دوام ورکړئ',
    },
    'owtyftzn': {
      'en': 'Already have an account? ',
      'fa': 'از قبل حساب کاربری دارید؟',
      'ps': 'ایا دمخه حساب لرئ؟',
    },
    'dt2zgvpi': {
      'en': ' Sign In here',
      'fa': 'اینجا وارد شوید',
      'ps': 'دلته ننوتل',
    },
    '8daj3d4b': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // Forgetpassword
  {
    'qq5dwy1j': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'fa':
          'ما یک ایمیل با پیوندی برای بازنشانی رمز عبور برای شما ارسال خواهیم کرد، لطفا ایمیل مرتبط با حساب خود را در زیر وارد کنید.',
      'ps':
          'موږ به تاسو ته ستاسو د پټنوم د بیا تنظیمولو لپاره د لینک سره یو بریښنالیک واستوو، مهرباني وکړئ لاندې ستاسو د حساب سره تړلی بریښنالیک دننه کړئ.',
    },
    'geaekj6k': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'ir759q2y': {
      'en': 'Enter your email...',
      'fa': 'ایمیل خود را وارد کنید...',
      'ps': 'خپل بریښنالیک دننه کړئ ...',
    },
    'vunnduh8': {
      'en': 'Send Link',
      'fa': 'ارسال لینک',
      'ps': 'لینک ولېږئ',
    },
    'r5fhq84c': {
      'en': 'Forgot Password',
      'fa': 'رمز عبور را فراموش کرده اید',
      'ps': 'خپل پټ نوم درڅخه هیر دی',
    },
    'dj96kslr': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // VerficationCode
  {
    'i46kk4lu': {
      'en': 'Please type verification code that we send in your email',
      'fa': 'لطفاً کد تأییدی را که در ایمیل شما ارسال می کنیم تایپ کنید',
      'ps': 'مهرباني وکړئ د تایید کوډ ولیکئ چې موږ ستاسو په بریښنالیک کې لیږو',
    },
    'isyyq7wx': {
      'en': 'code',
      'fa': 'کد',
      'ps': 'کوډ',
    },
    'pit5o4k8': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'k4godwva': {
      'en': 'Confirm',
      'fa': 'تایید',
      'ps': 'تایید کړه',
    },
    'wy97q7tr': {
      'en': ' Verification Code',
      'fa': 'کد تایید',
      'ps': 'د تایید کوډ',
    },
    'fi4lhlxp': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // ComplateProfilestep1
  {
    'nc5le913': {
      'en': 'Complate profile',
      'fa': 'تکمیل نمایه',
      'ps': 'بشپړ پروفایل',
    },
    '6im8lb6e': {
      'en': 'Genral information',
      'fa': 'اطلاعات عمومی',
      'ps': 'عمومي معلومات',
    },
    '5vrn4wsn': {
      'en': 'Tap camera to upload photo',
      'fa': 'برای آپلود عکس روی دوربین ضربه بزنید',
      'ps': 'د عکس پورته کولو لپاره کیمره ټایپ کړئ',
    },
    'tj4tbi4n': {
      'en': 'Name',
      'fa': 'نام',
      'ps': 'نوم',
    },
    '3f6k7tms': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '2j1niz40': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
      'ps': 'تخلص',
    },
    'aueqnkyj': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '533q8mfg': {
      'en': 'Father name',
      'fa': 'نام پدر',
      'ps': 'د پلار نوم',
    },
    'lv3b8vpg': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'h71zs4wt': {
      'en': 'Please attach your tazkara photo',
      'fa': 'لطفا عکس تذکره خود را پیوست کنید',
      'ps': 'مهرباني وکړئ خپل د تذکرې عکس ضمیمه کړئ',
    },
    '9yd3nkto': {
      'en': 'Tazkra number',
      'fa': 'شماره تذکره',
      'ps': 'تذکره نمبر',
    },
    '4upplvs6': {
      'en': 'Next',
      'fa': 'بعد',
      'ps': 'بل',
    },
    'x44lj3p1': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // Congratulations
  {
    'jmxlrdd5': {
      'en': 'Congratulations!',
      'fa': 'تبریک می گویم!',
      'ps': 'مبارک شه!',
    },
    'infx0r2a': {
      'en': 'Your account has saccessfuly created',
      'fa': 'حساب شما با موفقیت ایجاد شده است',
      'ps': 'ستاسو حساب په بریالیتوب سره جوړ شو',
    },
    'i7rn3yp7': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // ChangePassword
  {
    'wybgb5xw': {
      'en': 'Welcome Back',
      'fa': 'خوش برگشتی',
      'ps': 'بیرته پخیر راغلې',
    },
    'b9ko5a62': {
      'en': 'Let\'s get started by filling out the form below.',
      'fa': 'بیایید با پر کردن فرم زیر شروع کنیم.',
      'ps': 'راځئ چې د لاندې فارم په ډکولو سره پیل وکړو.',
    },
    'z3jxvmzo': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
      'ps': 'نوئ پټ نوم',
    },
    '7pj9udcg': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'zwh385pm': {
      'en': 'Confirm  new password',
      'fa': 'رمز عبور جدید را تایید کنید',
      'ps': 'نوی پټنوم تایید کړئ',
    },
    '24apo0by': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'mo9jfrqc': {
      'en': 'Sign In',
      'fa': 'ورود',
      'ps': 'ننوزئ',
    },
    'otqhv5o8': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // ComplateProfilestep2
  {
    'oe8ycsdf': {
      'en': 'Personal  information',
      'fa': 'اطلاعات شخصی',
      'ps': 'شخصي معلومات',
    },
    'sb7odrl8': {
      'en': 'Single',
      'fa': 'تنها',
      'ps': 'واحد',
    },
    'va19y53h': {
      'en': 'Married',
      'fa': 'متاهل',
      'ps': 'واده شوی',
    },
    '2zexgr4f': {
      'en': 'Widow',
      'fa': 'بیوه',
      'ps': 'کونډه',
    },
    '235fh5zz': {
      'en': 'Divorced',
      'fa': 'جدا شده',
      'ps': 'طلاق شوی',
    },
    'gbzimrjb': {
      'en': 'Marital status',
      'fa': 'وضعیت تأهل',
      'ps': 'مدني حالت',
    },
    'xn4umcrq': {
      'en': 'Search for an item...',
      'fa': 'جستجو برای یک مورد ...',
      'ps': 'د یو توکي لټون...',
    },
    'optr66wt': {
      'en': 'Gender',
      'fa': 'جنسیت',
      'ps': 'جندر',
    },
    'funtl3zc': {
      'en': 'Female',
      'fa': 'زن',
      'ps': 'ښځینه',
    },
    'won9htaz': {
      'en': 'Male\n',
      'fa': 'نر',
      'ps': 'نارینه',
    },
    '9225uw2d': {
      'en': 'Date of birth',
      'fa': 'تاریخ تولد',
      'ps': 'د زیږون نیټه',
    },
    '6tm3a3m6': {
      'en': 'Phone number',
      'fa': 'شماره تلفن',
      'ps': 'د تلیفون شمیره',
    },
    '3robs572': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'xbukxk2b': {
      'en': 'Add',
      'fa': 'اضافه کردن',
      'ps': 'اضافه کړئ',
    },
    '1uzbbzox': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '0i43hp86': {
      'en': 'Next',
      'fa': 'بعد',
      'ps': 'بل',
    },
    '3sv0tfrf': {
      'en': 'Step 2',
      'fa': 'گام 2',
      'ps': '2 ګام',
    },
    'cox5c5d3': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // ComplateProfilestep3
  {
    '3f246xqn': {
      'en': 'Educational  information',
      'fa': 'اطلاعات آموزشی',
      'ps': 'تعلیمي معلومات',
    },
    'qgy6qx85': {
      'en': 'Start fro last',
      'fa': 'از آخر شروع کن',
      'ps': 'له وروستي څخه پیل کړئ',
    },
    '1iwpvqpd': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'ps': 'دلته نښه کړئ ...',
    },
    'vyavw44c': {
      'en': 'Add more',
      'fa': 'بیشتر اضافه کنید',
      'ps': 'نور زیات کړئ',
    },
    '1fczw543': {
      'en': 'Add Courses',
      'fa': 'اضافه کردن دوره ها',
      'ps': 'کورسونه اضافه کړئ',
    },
    '1rxr5ja7': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'ps': 'دلته نښه کړئ ...',
    },
    '96o4chwu': {
      'en': 'Add more',
      'fa': 'بیشتر اضافه کنید',
      'ps': 'نور زیات کړئ',
    },
    '9arb6l0u': {
      'en': 'Next',
      'fa': 'بعد',
      'ps': 'بل',
    },
    'qwi0uk6k': {
      'en': 'Step 3',
      'fa': 'مرحله 3',
      'ps': '3 ګام',
    },
    'yg95yayg': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // ComplateProfilestep4
  {
    'sr3m9gtu': {
      'en': 'Work experiences',
      'fa': 'تجربیات کاری',
      'ps': 'کاري تجربې',
    },
    '8gr6qesy': {
      'en': 'Start from last',
      'fa': 'از آخر شروع کن',
      'ps': 'له وروستي څخه پیل کړئ',
    },
    '6djkzamj': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'ps': 'دلته نښه کړئ ...',
    },
    'bwhm6mhd': {
      'en': 'Add more',
      'fa': 'بیشتر اضافه کنید',
      'ps': 'نور زیات کړئ',
    },
    'axl069sz': {
      'en': 'Next',
      'fa': 'بعد',
      'ps': 'بل',
    },
    'uhbyawg2': {
      'en': 'Step 4',
      'fa': 'مرحله 4',
      'ps': '4 ګام',
    },
    '8h23cs8j': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
  },
  // Reviewprofile
  {
    'vsmg6f34': {
      'en': 'Genral information',
      'fa': 'اطلاعات عمومی',
      'ps': 'عمومي معلومات',
    },
    '54o24sh7': {
      'en': 'Name',
      'fa': 'نام',
      'ps': 'نوم',
    },
    'gqr29qnk': {
      'en': 'Nargis',
      'fa': 'نرگس',
      'ps': 'نرګس',
    },
    't1n1gk6s': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
      'ps': 'تخلص',
    },
    'egjcy3hf': {
      'en': 'Ahmadi',
      'fa': 'احمدی',
      'ps': 'احمدي',
    },
    'd2114v27': {
      'en': 'Father name',
      'fa': 'نام پدر',
      'ps': 'د پلار نوم',
    },
    'lkbr6h8d': {
      'en': 'Abdulla',
      'fa': 'عبدالله',
      'ps': 'عبدالله',
    },
    'jzsnynku': {
      'en': 'Tazkra number',
      'fa': 'شماره تذکره',
      'ps': 'تذکره نمبر',
    },
    '338pja0l': {
      'en': '1402009034321',
      'fa': '1402009034321',
      'ps': '1402009034321',
    },
    'mw9gw4nw': {
      'en': 'Tazkra photo',
      'fa': 'عکس تذکره',
      'ps': 'د تذکرې عکس',
    },
    'n697guwk': {
      'en': 'View',
      'fa': 'چشم انداز',
      'ps': 'لید',
    },
    '3lrzu2gl': {
      'en': 'Personal information',
      'fa': 'اطلاعات شخصی',
      'ps': 'شخصي معلومات',
    },
    'vaev1l5s': {
      'en': 'Marital status',
      'fa': 'وضعیت تأهل',
      'ps': 'مدني حالت',
    },
    'goj8rqer': {
      'en': 'Single',
      'fa': 'تنها',
      'ps': 'واحد',
    },
    'b0404e3z': {
      'en': 'Gender',
      'fa': 'جنسیت',
      'ps': 'جندر',
    },
    'ag4whf6x': {
      'en': 'Female',
      'fa': 'زن',
      'ps': 'ښځینه',
    },
    'dwaxuai9': {
      'en': 'Date of birth',
      'fa': 'تاریخ تولد',
      'ps': 'د زیږون نیټه',
    },
    'tqq22nc6': {
      'en': '1374/05/05',
      'fa': '1374/05/05',
      'ps': '۱۳۷۴/۰۵/۰۵',
    },
    'ck5tv1ce': {
      'en': 'Phone number',
      'fa': 'شماره تلفن',
      'ps': 'د تلیفون شمیره',
    },
    '834glhxn': {
      'en': '0799353567',
      'fa': '0799353567',
      'ps': '۰۷۹۹۳۵۳۵۶۷',
    },
    'rueoh88w': {
      'en': 'Address',
      'fa': 'نشانی',
      'ps': 'پته',
    },
    'cv62ehe1': {
      'en': 'kabul',
      'fa': 'کابل',
      'ps': 'کابل',
    },
    '78dith61': {
      'en': 'Email',
      'fa': 'پست الکترونیک',
      'ps': 'ایمیل',
    },
    'z5ox85ra': {
      'en': 'Nargishmadi@gmail.om',
      'fa': 'Nargishmadi@gmail.om',
      'ps': 'Nargishmadi@gmail.om',
    },
    'ku30ofgm': {
      'en': 'Education',
      'fa': 'تحصیلات',
      'ps': 'زده کړه',
    },
    '2spzs5l5': {
      'en': 'Deploma',
      'fa': 'دیپلم',
      'ps': 'ډیپلوما',
    },
    '2za6a6k8': {
      'en': 'View',
      'fa': 'چشم انداز',
      'ps': 'لید',
    },
    '2g9prmcr': {
      'en': 'Bachelor\'s degree',
      'fa': 'مدرک کارشناسی',
      'ps': 'لیسانس',
    },
    'tgdntetc': {
      'en': 'View',
      'fa': 'چشم انداز',
      'ps': 'لید',
    },
    'nb42c0s2': {
      'en': 'Other courses',
      'fa': 'دوره های دیگر',
      'ps': 'نور کورسونه',
    },
    'iff3ueu1': {
      'en': 'Deploma',
      'fa': 'دیپلم',
      'ps': 'ډیپلوما',
    },
    'gzs710il': {
      'en': 'View',
      'fa': 'چشم انداز',
      'ps': 'لید',
    },
    'cwn5xi4q': {
      'en': 'work experiences',
      'fa': 'تجربیات کاری',
      'ps': 'کاري تجربې',
    },
    'pkx3vtb7': {
      'en': 'Enayat high school',
      'fa': 'دبیرستان عنایت',
      'ps': 'عنايت ليسه',
    },
    'jt3mgheb': {
      'en': 'Maneger',
      'fa': 'مدیر',
      'ps': 'منیجر',
    },
    '82kemh1w': {
      'en': 'Password',
      'fa': 'کلمه عبور',
      'ps': 'رمز',
    },
    'h99q6d2d': {
      'en': '*********',
      'fa': '*********',
      'ps': '*********',
    },
    'o2uxe1qm': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
    'b1ja3wqz': {
      'en': 'Review',
      'fa': 'مرور',
      'ps': 'بیاکتنه',
    },
  },
  // Courses
  {
    'nn4dpop9': {
      'en': 'Courses',
      'fa': 'دوره های آموزشی',
      'ps': 'کورسونه',
    },
    'pgeysvmu': {
      'en': 'Search lecture...',
      'fa': 'جستجوی سخنرانی ...',
      'ps': 'د لیکچر لټون...',
    },
    'u8tygo3l': {
      'en': 'All courses',
      'fa': 'همه دوره ها',
      'ps': 'ټول کورسونه',
    },
    'f464nocc': {
      'en': 'For You',
      'fa': 'برای شما',
      'ps': 'ستاسو لپاره',
    },
    '2rls8fpd': {
      'en': 'Computer',
      'fa': 'کامپیوتر',
      'ps': 'کمپیوټر',
    },
    'to55xm97': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
    'g19kb5g7': {
      'en': 'Math',
      'fa': 'ریاضی',
      'ps': 'ریاضی',
    },
    '150w4ela': {
      'en': 'Ai',
      'fa': 'Ai',
      'ps': 'ای',
    },
    'vkx56orn': {
      'en': 'Echonomic',
      'fa': 'اقتصادی',
      'ps': 'اکونومیک',
    },
    'h56ldvmd': {
      'en': 'For You',
      'fa': 'برای شما',
      'ps': 'ستاسو لپاره',
    },
    'sfkuihcd': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
    'gf3omchw': {
      'en': 'Arabic',
      'fa': 'عربی',
      'ps': 'عربي',
    },
    't6bqkihz': {
      'en': 'Computer',
      'fa': 'کامپیوتر',
      'ps': 'کمپیوټر',
    },
    'yo2ci4zk': {
      'en': 'Physics',
      'fa': 'فیزیک',
      'ps': 'فزیک',
    },
    'y4390clt': {
      'en': 'Ai',
      'fa': 'Ai',
      'ps': 'ای',
    },
    'vxsvhwip': {
      'en': 'Graphics',
      'fa': 'گرافیک',
      'ps': 'ګرافیک',
    },
    '09hqjpu3': {
      'en': 'Photoshop',
      'fa': 'فتوشاپ',
      'ps': 'فوټوشاپ',
    },
    'nv34wuf8': {
      'en': 'Web',
      'fa': 'وب',
      'ps': 'ویب',
    },
    'zgvv8cmv': {
      'en': 'Enrolled',
      'fa': 'ثبت نام کرد',
      'ps': 'نومول شوی',
    },
    'glqfv7to': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
    'bkbhb6et': {
      'en': 'Computer',
      'fa': 'کامپیوتر',
      'ps': 'کمپیوټر',
    },
    '0wv08l4r': {
      'en': 'Ai',
      'fa': 'Ai',
      'ps': 'ای',
    },
    'rrrp94uu': {
      'en': 'Graphics',
      'fa': 'گرافیک',
      'ps': 'ګرافیک',
    },
    'coy5ocjl': {
      'en': 'Photoshop',
      'fa': 'فتوشاپ',
      'ps': 'فوټوشاپ',
    },
    '2ljj5r9j': {
      'en': 'My courses',
      'fa': 'دوره های من',
      'ps': 'زما کورسونه',
    },
    'ntqs78xm': {
      'en': 'Arabic',
      'fa': 'عربی',
      'ps': 'عربي',
    },
    '9z2bjb4g': {
      'en': 'Computer',
      'fa': 'کامپیوتر',
      'ps': 'کمپیوټر',
    },
    'iozwp4qk': {
      'en': 'Ai',
      'fa': 'Ai',
      'ps': 'ای',
    },
    'k9ez3o74': {
      'en': 'Graphics',
      'fa': 'گرافیک',
      'ps': 'ګرافیک',
    },
    '9tqky728': {
      'en': 'Photoshop',
      'fa': 'فتوشاپ',
      'ps': 'فوټوشاپ',
    },
  },
  // Classes
  {
    'e989fwrj': {
      'en': 'Classes',
      'fa': 'کلاس ها',
      'ps': 'ټولګي',
    },
    'rwlww05e': {
      'en': 'A-12',
      'fa': 'الف-12',
      'ps': 'A-12',
    },
    'mtcvxer8': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
    'mwsctfv2': {
      'en': 'A-12',
      'fa': 'الف-12',
      'ps': 'A-12',
    },
    'o7loofc2': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
    'qg53l4do': {
      'en': 'A-12',
      'fa': 'الف-12',
      'ps': 'A-12',
    },
    'k7c9sdj4': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
    'wlzqk5d2': {
      'en': 'A-12',
      'fa': 'الف-12',
      'ps': 'A-12',
    },
    'dkj2i4vb': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
  },
  // Home
  {
    'uoulglcv': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
    '17ln7c5b': {
      'en': 'Now you have about 999+ books ',
      'fa': 'اکنون حدود 999+ کتاب دارید',
      'ps': 'اوس تاسو شاوخوا 999+ کتابونه لرئ',
    },
    'qmo1ah7f': {
      'en': '1402/09/09 12:23 pm',
      'fa': '1402/09/09 12:23 ب.ظ',
      'ps': '1402/09/09 12:23 pm',
    },
    'kqb836qy': {
      'en': 'Rushd news',
      'fa': 'اخبار رشد',
      'ps': 'د رشد خبر',
    },
    '7tqne1tk': {
      'en': 'Najma Shmas',
      'fa': 'نجمه شماس',
      'ps': 'نجمه شماس',
    },
    'u3l7mlbb': {
      'en': 'Student of the year',
      'fa': 'دانشجوی سال',
      'ps': 'د کال محصل',
    },
    'awonoevr': {
      'en': 'Library',
      'fa': 'کتابخانه',
      'ps': 'کتابتون',
    },
    'xqk6vn3v': {
      'en': 'Reviews',
      'fa': 'بررسی ها',
      'ps': 'بیاکتنې',
    },
    'hbnpskk2': {
      'en': 'Courses',
      'fa': 'دوره های آموزشی',
      'ps': 'کورسونه',
    },
    'u38up23o': {
      'en': 'Notice bourd',
      'fa': 'تابلوی توجه',
      'ps': 'د خبرتیا بورډ',
    },
    '316cwcbh': {
      'en': 'My activity',
      'fa': 'فعالیت من',
      'ps': 'زما فعالیت',
    },
    'r1akwi9p': {
      'en': 'Time table',
      'fa': 'جدول زمان',
      'ps': 'د مهال ویش',
    },
    'cjs3tihs': {
      'en': 'My student',
      'fa': 'دانش آموز من',
      'ps': 'زما شاګرد',
    },
  },
  // Support
  {
    's9on9x4c': {
      'en': 'Help center',
      'fa': 'مرکز کمک',
      'ps': 'د مرستې مرکز',
    },
    '4itpywaw': {
      'en':
          'To find call center logos relevant to your business \nenter your business  name - We\'ll automa',
      'fa':
          'برای پیدا کردن آرم مرکز تماس مرتبط با کسب و کار شما\nنام کسب و کار خود را وارد کنید - ما خودکار می شویم',
      'ps':
          'ستاسو د سوداګرۍ پورې اړوند د تلیفون مرکز لوګو موندلو لپاره\nخپل د سوداګرۍ نوم دننه کړئ - موږ به اتوماتیک کړو',
    },
    'u411xf30': {
      'en': 'What is Rushd?',
      'fa': 'رشد چیست؟',
      'ps': 'رشد څه شی دی؟',
    },
    'jyufim1x': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fa': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'ps': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
    },
    'hfevplir': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'ps':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'idvc82ea': {
      'en': 'How students enrole themself?',
      'fa': 'دانش آموزان چگونه خود را ثبت نام می کنند؟',
      'ps': 'زده کوونکي څنګه ځان ثبتوي؟',
    },
    'z1xo92ap': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fa': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'ps': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
    },
    '0800ndzl': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'ps':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'iw5i2d9j': {
      'en': 'How to submit my homeworks?',
      'fa': 'چگونه تکالیف خود را ارسال کنم؟',
      'ps': 'څنګه خپل کورنی کارونه وسپارم؟',
    },
    'hqa1sffu': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fa': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'ps': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
    },
    'dn37fls8': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'ps':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    '83w9ihtw': {
      'en': 'How to contact a teacher?',
      'fa': 'چگونه با معلم تماس بگیریم؟',
      'ps': 'د ښوونکي سره څنګه اړیکه ونیسئ؟',
    },
    'k9qx07ge': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fa': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'ps': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
    },
    'qacpbpgh': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'ps':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'q91q3w5z': {
      'en': 'Still need help',
      'fa': 'هنوز به کمک نیاز داری',
      'ps': 'لا هم مرستې ته اړتیا لري',
    },
  },
  // Readbook
  {
    'zsoazsjl': {
      'en': 'The light of stone',
      'fa': 'نور سنگ',
      'ps': 'د ډبرې رڼا',
    },
    'wtvlem54': {
      'en': 'Description',
      'fa': 'شرح',
      'ps': 'تفصیل',
    },
    'e28olwh1': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    '25z3ypnu': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    '55oi23n5': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    'vaotcraw': {
      'en': 'Author',
      'fa': 'نویسنده',
      'ps': 'لیکوال',
    },
  },
  // Noticeboard
  {
    '2obyn6t6': {
      'en': 'Holyday announcement',
      'fa': 'اطلاعیه تعطیلات',
      'ps': 'د رخصتۍ اعلان',
    },
    'xhui9oe4': {
      'en': 'No comments yet! Add one to start the conversation.',
      'fa': 'هنوز نظری وجود ندارد! برای شروع مکالمه یکی را اضافه کنید.',
      'ps': 'تر اوسه کومه تبصره نشته! د خبرو اترو پیل کولو لپاره یو اضافه کړئ.',
    },
    '9cvjkyrb': {
      'en': 'Read more',
      'fa': 'ادامه مطلب',
      'ps': 'نور یی ولوله',
    },
    '3a36tfcz': {
      'en': 'Final year exam',
      'fa': 'امتحان سال آخر',
      'ps': 'د وروستي کال امتحان',
    },
    '948jw466': {
      'en': 'No comments yet! Add one to start the conversation.',
      'fa': 'هنوز نظری وجود ندارد! برای شروع مکالمه یکی را اضافه کنید.',
      'ps': 'تر اوسه کومه تبصره نشته! د خبرو اترو پیل کولو لپاره یو اضافه کړئ.',
    },
    'd119cm0s': {
      'en': 'Read more',
      'fa': 'ادامه مطلب',
      'ps': 'نور یی ولوله',
    },
    '6zsl4i5l': {
      'en': 'Final year exam',
      'fa': 'امتحان سال آخر',
      'ps': 'د وروستي کال امتحان',
    },
    'g07x0pgd': {
      'en': 'No comments yet! Add one to start the conversation.',
      'fa': 'هنوز نظری وجود ندارد! برای شروع مکالمه یکی را اضافه کنید.',
      'ps': 'تر اوسه کومه تبصره نشته! د خبرو اترو پیل کولو لپاره یو اضافه کړئ.',
    },
    'kw75qy0f': {
      'en': 'Read more',
      'fa': 'ادامه مطلب',
      'ps': 'نور یی ولوله',
    },
    '23gy7fkm': {
      'en': 'Final year exam',
      'fa': 'امتحان سال آخر',
      'ps': 'د وروستي کال امتحان',
    },
    'o9qi2rnt': {
      'en': 'No comments yet! Add one to start the conversation.',
      'fa': 'هنوز نظری وجود ندارد! برای شروع مکالمه یکی را اضافه کنید.',
      'ps': 'تر اوسه کومه تبصره نشته! د خبرو اترو پیل کولو لپاره یو اضافه کړئ.',
    },
    '906zzmqk': {
      'en': 'Read more',
      'fa': 'ادامه مطلب',
      'ps': 'نور یی ولوله',
    },
  },
  // Activity
  {
    'uf9jov9u': {
      'en': 'Last 30 Days',
      'fa': '30 روز گذشته',
      'ps': 'وروستۍ 30 ورځې',
    },
    'rj48te9l': {
      'en': 'Avg. Grade',
      'fa': 'میانگین مقطع تحصیلی',
      'ps': 'اوسط درجه',
    },
  },
  // MyEnrolledLectures
  {
    'hkh6fxv9': {
      'en': 'Search lecture...',
      'fa': 'جستجوی سخنرانی ...',
      'ps': 'د لیکچر لټون...',
    },
    'flyuqhyj': {
      'en': 'Related book',
      'fa': 'کتاب مرتبط',
      'ps': 'اړوند کتاب',
    },
    'zq4rvdsh': {
      'en': 'Introduction to computer',
      'fa': 'مقدمه ای بر کامپیوتر',
      'ps': 'د کمپیوټر پیژندنه',
    },
    'vrcv5wxl': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسون هیویت',
      'ps': 'جکسن هیویټ',
    },
    'kox3zzwz': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    'wf0k1esj': {
      'en': '12h',
      'fa': 'ساعت 12',
      'ps': '12h',
    },
    '9doe16y2': {
      'en': 'Read Now',
      'fa': 'الان بخوان',
      'ps': 'اوس ولولئ',
    },
    'd0ils2c0': {
      'en': 'Computer archteture and more about',
      'fa': 'معماری کامپیوتر و بیشتر در مورد',
      'ps': 'د کمپیوټر جوړښت او نور په اړه',
    },
    '84z7gs9s': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسون هیویت',
      'ps': 'جکسن هیویټ',
    },
    'gr9mw1et': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    'dwa1eg86': {
      'en': '12h',
      'fa': 'ساعت 12',
      'ps': '12h',
    },
    'bpouq9j3': {
      'en': 'Read Now',
      'fa': 'الان بخوان',
      'ps': 'اوس ولولئ',
    },
    '3e7acxze': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'fa': 'HSBC در حال بازگشت به وام های مصرف کننده در ایالات متحده است.',
      'ps':
          'HSBC په متحده ایالاتو کې د مصرف کونکو پورونو ته بیرته راځي د دې مطابق ...',
    },
    'jhyarz2h': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسون هیویت',
      'ps': 'جیکسن هیویټ',
    },
    'h7tmyh84': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    'ygz8z56i': {
      'en': '12h',
      'fa': 'ساعت 12',
      'ps': '12h',
    },
    '7oeg92zp': {
      'en': 'Read Now',
      'fa': 'الان بخوان',
      'ps': 'اوس ولولئ',
    },
  },
  // ReadCourse
  {
    'x0lnvo10': {
      'en': 'Lecture 1, computer basics',
      'fa': 'سخنرانی 1، مبانی کامپیوتر',
      'ps': '1 لیکچر، د کمپیوټر اساسات',
    },
    'cetq8lt5': {
      'en': '3.1k Members',
      'fa': '3.1k عضو',
      'ps': '3.1k غړي',
    },
    'f14phy60': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ps':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    'mcp7ukw0': {
      'en': 'Add your homework',
      'fa': 'تکالیف خود را اضافه کنید',
      'ps': 'خپل کورنی کار اضافه کړئ',
    },
    'gk52pz68': {
      'en': 'Take assessment',
      'fa': 'ارزیابی کنید',
      'ps': 'ارزونه وکړئ',
    },
    'hrzn86oi': {
      'en': '3',
      'fa': '3',
      'ps': '3',
    },
    'bwogau6v': {
      'en': 'likes',
      'fa': 'دوست دارد',
      'ps': 'خوښوي',
    },
    'e4zf7a5h': {
      'en': '8',
      'fa': '8',
      'ps': '۸',
    },
    'xc3fzbz8': {
      'en': 'Comments',
      'fa': 'نظرات',
      'ps': 'تبصرې',
    },
    'hfho6x1e': {
      'en': 'Type your comments here...',
      'fa': 'نظرات خود را اینجا تایپ کنید...',
      'ps': 'خپل نظرونه دلته ولیکئ...',
    },
    'y1r1sba5': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
    'pl7s0l0f': {
      'en': 'Randy Alcorn',
      'fa': 'رندی آلکورن',
      'ps': 'سینګ الکورن',
    },
    'q04bq5rc': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'fa':
          'من واقعاً در مورد این بخش در اینجا مطمئن نیستم، فکر می کنم شما باید کار جالبی انجام دهید!',
      'ps':
          'زه دلته د دې برخې په اړه واقعیا ډاډه نه یم زه فکر کوم چې تاسو باید یو څه ښه کار وکړئ!',
    },
    'haee068n': {
      'en': 'a min ago',
      'fa': 'یک دقیقه پیش',
      'ps': 'یوه دقیقه مخکې',
    },
    'w2ldt0uz': {
      'en': 'Sandra Smith',
      'fa': 'ساندرا اسمیت',
      'ps': 'سانډرا سمیټ',
    },
    'nukixep1': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'fa':
          'من واقعاً در مورد این بخش در اینجا مطمئن نیستم، فکر می کنم شما باید کار جالبی انجام دهید!',
      'ps':
          'زه دلته د دې برخې په اړه واقعیا ډاډه نه یم زه فکر کوم چې تاسو باید یو څه ښه کار وکړئ!',
    },
    'hg40242z': {
      'en': 'a min ago',
      'fa': 'یک دقیقه پیش',
      'ps': 'یوه دقیقه مخکې',
    },
  },
  // MyAssessmentCompleted
  {
    '6w80b3o5': {
      'en': 'Feb 8th',
      'fa': '8 فوریه',
      'ps': 'د فبروري اتمه',
    },
    'zbsg0081': {
      'en': 'Wednesday',
      'fa': 'چهار شنبه',
      'ps': 'چهارشنبه',
    },
    '3ph2rcr3': {
      'en': 'Completed',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شو',
    },
    'h9iff0kl': {
      'en': 'Marks obtained ',
      'fa': 'علائم به دست آمده',
      'ps': 'ترلاسه شوي نمرې',
    },
    'evujjyvs': {
      'en': '47',
      'fa': '47',
      'ps': '۴۷',
    },
    '52e5oqvf': {
      'en': 'Questions',
      'fa': 'سوالات',
      'ps': 'پوښتنې',
    },
    'g5ryjonr': {
      'en': 'What is the value of pi?',
      'fa': 'مقدار پی چیست؟',
      'ps': 'د pi ارزښت څه دی؟',
    },
    'tllmgc0a': {
      'en': '3.54',
      'fa': '3.54',
      'ps': '3.54',
    },
    'lso59n55': {
      'en': '3.14',
      'fa': '3.14',
      'ps': '3.14',
    },
    'cfvqs9yt': {
      'en': '3.11',
      'fa': '3.11',
      'ps': '3.11',
    },
    '8ggx4jw6': {
      'en': '3.54',
      'fa': '3.54',
      'ps': '3.54',
    },
    'yautk4ir': {
      'en': 'Total internal angles of a triangle is?',
      'fa': 'مجموع زوایای داخلی یک مثلث است؟',
      'ps': 'د مثلث ټول داخلي زاویې څومره دي؟',
    },
    '9ftzoo0v': {
      'en': '180',
      'fa': '180',
      'ps': '۱۸۰',
    },
    's9id0z6f': {
      'en': '360',
      'fa': '360',
      'ps': '۳۶۰',
    },
    'wixz2k0f': {
      'en': '180',
      'fa': '180',
      'ps': '۱۸۰',
    },
    '47fu6rd6': {
      'en': '270',
      'fa': '270',
      'ps': '۲۷۰',
    },
    'jikh4vkq': {
      'en': '90',
      'fa': '90',
      'ps': '90',
    },
    'k6bqqq7d': {
      'en': 'What is value of Euler number (e) ?',
      'fa': 'ارزش عدد اویلر (e) چیست؟',
      'ps': 'د یولر شمیر (e) ارزښت څه دی؟',
    },
    '8ansb22p': {
      'en': '2.71',
      'fa': '2.71',
      'ps': '2.71',
    },
    'w43sh9w5': {
      'en': '3.60',
      'fa': '3.60',
      'ps': '3.60',
    },
    'cf42h6gt': {
      'en': '2.80',
      'fa': '2.80',
      'ps': '2.80',
    },
    '35zqssv6': {
      'en': '2.71',
      'fa': '2.71',
      'ps': '2.71',
    },
    'vsr5vbot': {
      'en': 'none',
      'fa': 'هیچ یک',
      'ps': 'هیڅ نه',
    },
    'cipaz1q7': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
  },
  // MyAssessments
  {
    '7gfbcbta': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    't7vpebuc': {
      'en': 'Physics',
      'fa': 'فیزیک',
      'ps': 'فزیک',
    },
    '34pp6b7h': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
    '2517ut18': {
      'en': 'Math',
      'fa': 'ریاضی',
      'ps': 'ریاضی',
    },
    'jvw27wmi': {
      'en': 'Geology',
      'fa': 'زمين شناسي',
      'ps': 'جیولوجی',
    },
    '1om023tr': {
      'en': 'Dari',
      'fa': 'دری',
      'ps': 'دري',
    },
    'cnahqlbk': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    'nu1e8nz2': {
      'en': 'Completed',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شو',
    },
    '0y085djq': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    'g1dhhbrq': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'wusj6q9v': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    'e8wc8qm8': {
      'en': 'Completed',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شو',
    },
    'ycne1le1': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    'y3q4u8sj': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    '2mhbbge8': {
      'en': '10-12-2023',
      'fa': '10-12-2023',
      'ps': '10-12-2023',
    },
    '9s61dwqc': {
      'en': 'Expired',
      'fa': 'منقضی شده',
      'ps': 'تېر شو',
    },
    '95kw39dt': {
      'en': 'You did not submit your homework for physics subject. ',
      'fa': 'شما تکالیف خود را برای درس فیزیک ارسال نکردید.',
      'ps': 'تاسو خپل کورنی کار د فزیک مضمون لپاره ندی سپارلی.',
    },
    'yvtod3d9': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'fmefnlgj': {
      'en': '10-01-2023',
      'fa': '10-01-2023',
      'ps': '10-01-2023',
    },
  },
  // MyAssessmentSubmitted
  {
    'lmvdupsv': {
      'en': 'Good job!',
      'fa': 'آفرین!',
      'ps': 'ښه کار!',
    },
    '4d6x99ax': {
      'en': 'Your assessment successfully submitted.',
      'fa': 'ارزیابی شما با موفقیت ارسال شد.',
      'ps': 'ستاسو ارزونه په بریالیتوب سره وسپارل شوه.',
    },
    'emqb538e': {
      'en': 'Back to lecture',
      'fa': 'بازگشت به سخنرانی',
      'ps': 'بیرته لیکچر ته',
    },
  },
  // MyTakeAssessment
  {
    'ok5pgbaj': {
      'en': '0:30',
      'fa': '0:30',
      'ps': '0:30',
    },
    'kdx6jrsw': {
      'en': 'Terminate',
      'fa': 'خاتمه دادن',
      'ps': 'ختمول',
    },
    'j48bmdf5': {
      'en': '5%',
      'fa': '5%',
      'ps': '۵٪',
    },
    '8462jxiw': {
      'en': 'What is the value of Pi?',
      'fa': 'ارزش پی چیست؟',
      'ps': 'د Pi ارزښت څه دی؟',
    },
    'xyg7j5ei': {
      'en': '3.141',
      'fa': '3.141',
      'ps': '3.141',
    },
    'tm6nqos8': {
      'en': '3.112',
      'fa': '3.112',
      'ps': '3.112',
    },
    '2wvp94zu': {
      'en': '3.543',
      'fa': '3.543',
      'ps': '3.543',
    },
    '2dovbp0z': {
      'en': '3.148',
      'fa': '3.148',
      'ps': '3.148',
    },
  },
  // HomeworkDetails
  {
    'hszatnqr': {
      'en': 'Feb 8th',
      'fa': '8 فوریه',
      'ps': 'د فبروري اتمه',
    },
    'uy6czt8j': {
      'en': 'Wednesday',
      'fa': 'چهار شنبه',
      'ps': 'چهارشنبه',
    },
    'ajnu1rry': {
      'en': 'Completed',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شو',
    },
    'eiscyfb6': {
      'en': 'Rushd test and exam policy',
      'fa': 'سیاست آزمون و آزمون رشد',
      'ps': 'د رشد ټیسټ او امتحان پالیسي',
    },
    'x6jhqjo7': {
      'en':
          'Please solve all the questions by yourself, If system detect any suspicious actions your test will be marked as invalid test.',
      'fa':
          'لطفاً تمام سؤالات را خودتان حل کنید، اگر سیستم هر گونه اقدام مشکوکی را تشخیص دهد، آزمون شما به عنوان آزمون نامعتبر علامت‌گذاری می‌شود.',
      'ps':
          'مهرباني وکړئ ټولې پوښتنې پخپله حل کړئ، که سیسټم کوم شکمن عمل ومومي ستاسو ازموینه به د غلط ازموینې په توګه په نښه شي.',
    },
    'boq68hl6': {
      'en': 'Questions',
      'fa': 'سوالات',
      'ps': 'پوښتنې',
    },
    'w0psueld': {
      'en': 'Please find the area of a circle?',
      'fa': 'لطفا مساحت دایره را پیدا کنید؟',
      'ps': 'مهرباني وکړئ د دایرې ساحه ومومئ؟',
    },
    'mp19osgx': {
      'en': 'Please use a know farmula to find circle area.',
      'fa': 'لطفاً از یک farmula know برای پیدا کردن ناحیه دایره استفاده کنید.',
      'ps':
          'مهرباني وکړئ د حلقې ساحې موندلو لپاره د پوه فارمولا څخه کار واخلئ.',
    },
    '0vpqs5oa': {
      'en': '8 marks',
      'fa': '8 نمره',
      'ps': '۸ نمرې',
    },
    'uok3g0ph': {
      'en': 'Answer',
      'fa': 'پاسخ',
      'ps': 'ځواب',
    },
    'dgf3rpu5': {
      'en': 'Please define rectangle?',
      'fa': 'لطفا مستطیل را تعریف کنید؟',
      'ps': 'مهرباني وکړئ مستطیل تعریف کړئ؟',
    },
    '5k3yqjk1': {
      'en': 'Please use a know farmula to find circle area.',
      'fa': 'لطفاً از یک farmula know برای پیدا کردن ناحیه دایره استفاده کنید.',
      'ps':
          'مهرباني وکړئ د حلقې ساحې موندلو لپاره د پوه فارمولا څخه کار واخلئ.',
    },
    'q0r0pa2h': {
      'en': '2 marks',
      'fa': '2 نمره',
      'ps': '2 نښه',
    },
    'jmlll7m0': {
      'en': 'Answer',
      'fa': 'پاسخ',
      'ps': 'ځواب',
    },
    'blj8peef': {
      'en': 'Please define rectangle?',
      'fa': 'لطفا مستطیل را تعریف کنید؟',
      'ps': 'مهرباني وکړئ مستطیل تعریف کړئ؟',
    },
    'z0xvoo1i': {
      'en': 'A short history into what UX design is and the history of it.',
      'fa': 'تاریخچه کوتاهی در مورد طراحی UX و تاریخچه آن.',
      'ps': 'یو لنډ تاریخ چې د UX ډیزاین څه شی دی او د دې تاریخ.',
    },
    '6xldz8lq': {
      'en': '8 marks',
      'fa': '8 نمره',
      'ps': '۸ نمرې',
    },
    'czq1ewbj': {
      'en': 'Your answer here',
      'fa': 'پاسخ شما اینجاست',
      'ps': 'ستاسو ځواب دلته',
    },
    'es73m905': {
      'en': 'Intro to UX Design',
      'fa': 'مقدمه ای بر طراحی UX',
      'ps': 'د UX ډیزاین معرفي کول',
    },
    '8g6qulos': {
      'en': 'A short history into what UX design is and the history of it.',
      'fa': 'تاریخچه کوتاهی در مورد طراحی UX و تاریخچه آن.',
      'ps': 'یو لنډ تاریخ چې د UX ډیزاین څه شی دی او د دې تاریخ.',
    },
    'j6r0ului': {
      'en': '3.14',
      'fa': '3.14',
      'ps': '3.14',
    },
    'ebf7ctb3': {
      'en': '3.11',
      'fa': '3.11',
      'ps': '3.11',
    },
    'mub9oh4i': {
      'en': '3.54',
      'fa': '3.54',
      'ps': '3.54',
    },
    'st7hw6u3': {
      'en': '1 mark',
      'fa': '1 نمره',
      'ps': '1 نښه',
    },
    'a7a4hpv0': {
      'en': 'Submit your answers',
      'fa': 'پاسخ های خود را ارسال کنید',
      'ps': 'خپل ځوابونه وسپارئ',
    },
  },
  // Homeworks
  {
    '057lis1y': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    '0zpwqwz0': {
      'en': 'Physics',
      'fa': 'فیزیک',
      'ps': 'فزیک',
    },
    '2h8dt8cc': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
    'rqfctk2b': {
      'en': 'Math',
      'fa': 'ریاضی',
      'ps': 'ریاضی',
    },
    '89hx8426': {
      'en': 'Geology',
      'fa': 'زمين شناسي',
      'ps': 'جیولوجی',
    },
    'lirkek2v': {
      'en': 'Dari',
      'fa': 'دری',
      'ps': 'دري',
    },
    'sqfcgejj': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    'i9nx6wko': {
      'en': 'Pending',
      'fa': 'انتظار',
      'ps': 'پاتې',
    },
    '1u8yo6u2': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    'tlbazy4v': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'e0sv9nln': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    'sdpzl285': {
      'en': 'Completed',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شو',
    },
    '11p6idwz': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    't3bk899h': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    '10vke6yn': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    'n879vv74': {
      'en': 'Pending',
      'fa': 'انتظار',
      'ps': 'پاتې',
    },
    'i1j1k6uw': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    'l6bslshr': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    's7hotp2w': {
      'en': '10-12-2023',
      'fa': '10-12-2023',
      'ps': '10-12-2023',
    },
    'b8vuqfks': {
      'en': 'Expired',
      'fa': 'منقضی شده',
      'ps': 'تېر شو',
    },
    'oy4k5hrq': {
      'en': 'You did not submit your homework for physics subject. ',
      'fa': 'شما تکالیف خود را برای درس فیزیک ارسال نکردید.',
      'ps': 'تاسو خپل کورنی کار د فزیک مضمون لپاره ندی سپارلی.',
    },
    'htrul7k6': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    't0k7mj61': {
      'en': '10-01-2023',
      'fa': '10-01-2023',
      'ps': '10-01-2023',
    },
  },
  // MyHomeworkSubmitted
  {
    'yx141lao': {
      'en': 'Good job!',
      'fa': 'آفرین!',
      'ps': 'ښه کار!',
    },
    'gyqyw19t': {
      'en': 'Your homework successfully submitted.',
      'fa': 'تکالیف شما با موفقیت ارسال شد.',
      'ps': 'ستاسو کورنی کار په بریالیتوب سره سپارل شوی.',
    },
    'v441gppa': {
      'en': 'Back to lecture',
      'fa': 'بازگشت به سخنرانی',
      'ps': 'بیرته لیکچر ته',
    },
  },
  // EditCourses
  {
    'v2qeb5tx': {
      'en': 'Add ',
      'fa': 'اضافه کردن',
      'ps': 'اضافه کړئ',
    },
    'gy9g0ha1': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'ps': 'دلته نښه کړئ ...',
    },
    'vxf7pvxy': {
      'en': 'Add more',
      'fa': 'بیشتر اضافه کنید',
      'ps': 'نور زیات کړئ',
    },
    '27soboly': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
    '4moh1q3m': {
      'en': 'Submite',
      'fa': 'ارسال کنید',
      'ps': 'سپارل',
    },
  },
  // EditEducation
  {
    'wn0biinq': {
      'en': 'Add ',
      'fa': 'اضافه کردن',
      'ps': 'اضافه کړئ',
    },
    'fj5huby4': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'ps': 'دلته نښه کړئ ...',
    },
    'n44w5vsk': {
      'en': 'Add more',
      'fa': 'بیشتر اضافه کنید',
      'ps': 'نور زیات کړئ',
    },
    'y5dhkkw2': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
    'gv2h35gl': {
      'en': 'Submite',
      'fa': 'ارسال کنید',
      'ps': 'سپارل',
    },
  },
  // EditWorkexperiences
  {
    '2fqxgv2o': {
      'en': 'Add ',
      'fa': 'اضافه کردن',
      'ps': 'اضافه کړئ',
    },
    'pz9lrojf': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'ps': 'دلته نښه کړئ ...',
    },
    '6tls421m': {
      'en': 'Add more',
      'fa': 'بیشتر اضافه کنید',
      'ps': 'نور زیات کړئ',
    },
    'ae7mrces': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
    'q019975z': {
      'en': 'Submite',
      'fa': 'ارسال کنید',
      'ps': 'سپارل',
    },
  },
  // GeneralInformation
  {
    '5r9l5pnp': {
      'en': 'Genral information',
      'fa': 'اطلاعات عمومی',
      'ps': 'عمومي معلومات',
    },
    '2r19open': {
      'en': 'Name',
      'fa': 'نام',
      'ps': 'نوم',
    },
    'v3c0nhrt': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
      'ps': 'تخلص',
    },
    '2zkgcvnc': {
      'en': 'Ahmadi',
      'fa': 'احمدی',
      'ps': 'احمدي',
    },
    'ub17di0r': {
      'en': 'Father name',
      'fa': 'نام پدر',
      'ps': 'د پلار نوم',
    },
    'po5mrzjm': {
      'en': 'Abdulla',
      'fa': 'عبدالله',
      'ps': 'عبدالله',
    },
    'pxrhz8gk': {
      'en': 'Tazkra number',
      'fa': 'شماره تذکره',
      'ps': 'تذکره نمبر',
    },
    'krofb21z': {
      'en': '1402009034321',
      'fa': '1402009034321',
      'ps': '1402009034321',
    },
    'mblf38ff': {
      'en': 'Tazkra photo',
      'fa': 'عکس تذکره',
      'ps': 'د تذکرې عکس',
    },
    'hsygvn8d': {
      'en': 'View',
      'fa': 'چشم انداز',
      'ps': 'لید',
    },
    '0w3dlus1': {
      'en': 'Personal information',
      'fa': 'اطلاعات شخصی',
      'ps': 'شخصي معلومات',
    },
    'wcri2fos': {
      'en': 'Marital status',
      'fa': 'وضعیت تأهل',
      'ps': 'مدني حالت',
    },
    'mik1puai': {
      'en': 'Single',
      'fa': 'تنها',
      'ps': 'واحد',
    },
    '5s1yuav0': {
      'en': 'Gender',
      'fa': 'جنسیت',
      'ps': 'جندر',
    },
    'hcmbm7n5': {
      'en': 'Female',
      'fa': 'زن',
      'ps': 'ښځینه',
    },
    'lkd65huk': {
      'en': 'Date of birth',
      'fa': 'تاریخ تولد',
      'ps': 'د زیږون نیټه',
    },
    'zjtwqw4o': {
      'en': '1374/05/05',
      'fa': '1374/05/05',
      'ps': '۱۳۷۴/۰۵/۰۵',
    },
    'cmbj8fqs': {
      'en': 'Phone number',
      'fa': 'شماره تلفن',
      'ps': 'د تلیفون شمیره',
    },
    'gwjfyz1v': {
      'en': '0799353567',
      'fa': '0799353567',
      'ps': '۰۷۹۹۳۵۳۵۶۷',
    },
    'id0hv5wy': {
      'en': 'Address',
      'fa': 'نشانی',
      'ps': 'پته',
    },
    'a8me979x': {
      'en': 'Email',
      'fa': 'پست الکترونیک',
      'ps': 'ایمیل',
    },
    'igblaqza': {
      'en': 'Nargishmadi@gmail.om',
      'fa': 'Nargishmadi@gmail.om',
      'ps': 'Nargishmadi@gmail.om',
    },
    '9v932ge2': {
      'en': 'Education',
      'fa': 'تحصیلات',
      'ps': 'زده کړه',
    },
    'zr0966js': {
      'en': 'View',
      'fa': 'چشم انداز',
      'ps': 'لید',
    },
    'z5edfzo6': {
      'en': 'Other courses',
      'fa': 'سایر دوره ها',
      'ps': 'نور کورسونه',
    },
    '5fhvmwwi': {
      'en': 'Deploma',
      'fa': 'دیپلم',
      'ps': 'ډیپلوما',
    },
    'asbb8vm9': {
      'en': 'View',
      'fa': 'چشم انداز',
      'ps': 'لید',
    },
    'tdpzmnsl': {
      'en': 'work experiences',
      'fa': 'تجربیات کاری',
      'ps': 'کاري تجربې',
    },
    '4f83t38o': {
      'en': 'Enayat high school',
      'fa': 'دبیرستان عنایت',
      'ps': 'عنايت ليسه',
    },
    'queez6pw': {
      'en': 'Maneger',
      'fa': 'مدیر',
      'ps': 'منیجر',
    },
    'kl7n3oqj': {
      'en': 'Password',
      'fa': 'کلمه عبور',
      'ps': 'رمز',
    },
    'gehbvs44': {
      'en': '*********',
      'fa': '*********',
      'ps': '*********',
    },
  },
  // Profile
  {
    'b5je8plg': {
      'en': 'Your Account',
      'fa': 'حساب شما',
      'ps': 'ستاسو حساب',
    },
    '49l9hzol': {
      'en': 'General infomaton',
      'fa': 'اطلاعات عمومی',
      'ps': 'عمومي معلومات',
    },
    'isiwkuyt': {
      'en': 'App Settings',
      'fa': 'تنظیمات برنامه',
      'ps': 'د اپلیکیشن تنظیمات',
    },
    'yetn8p7q': {
      'en': 'Setting',
      'fa': 'تنظیمات',
      'ps': 'ترتیب',
    },
    'r5fya4rw': {
      'en': 'Support',
      'fa': 'حمایت کردن',
      'ps': 'ملاتړ',
    },
    'u27557ps': {
      'en': 'Terms of Service',
      'fa': 'شرایط استفاده از خدمات',
      'ps': 'د خدمت شرطونه',
    },
  },
  // ResetPassword
  {
    'w3nx0oh7': {
      'en': 'Let\'s get started by filling out the form below.',
      'fa': 'بیایید با پر کردن فرم زیر شروع کنیم.',
      'ps': 'راځئ چې د لاندې فارم په ډکولو سره پیل وکړو.',
    },
    'kbwk909f': {
      'en': 'Old password',
      'fa': 'رمز عبور قدیمی',
      'ps': 'زوړ پټ نوم',
    },
    'vx8l09f8': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'wppma01t': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
      'ps': 'نوئ پټ نوم',
    },
    'lo91lhqi': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'n0jthh9r': {
      'en': 'Confirm  new password',
      'fa': 'رمز عبور جدید را تایید کنید',
      'ps': 'نوی پټنوم تایید کړئ',
    },
    'u2ynnsqs': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'pfiddd63': {
      'en': 'Confirm',
      'fa': 'تایید',
      'ps': 'تایید کړه',
    },
    '2d3cn94j': {
      'en': 'Confirm',
      'fa': 'تایید',
      'ps': 'تایید کړه',
    },
  },
  // Language
  {
    'aq4f90ec': {
      'en': 'Change language',
      'fa': 'تغییر زبان',
      'ps': 'ژبه بدله کړه',
    },
    '74w4x71x': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انګلیسي',
    },
    'orxa43lx': {
      'en': 'فارسی',
      'fa': 'فارسی',
      'ps': 'فارسی',
    },
    'qjuh84e0': {
      'en': 'پښتو',
      'fa': 'پښتو',
      'ps': 'پښتو',
    },
  },
  // Homework
  {
    'vgmsn2eo': {
      'en': 'Assignment 1',
      'fa': 'تکلیف 1',
      'ps': 'دنده 1',
    },
    '84r4rgpo': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    '1pas5dzk': {
      'en': 'Due',
      'fa': 'ناشی از',
      'ps': 'له امله',
    },
    'ab78xg4x': {
      'en': 'Today, 5:30pm',
      'fa': 'امروز ساعت 17:30',
      'ps': 'نن مازدیګر ۵:۳۰ بجې',
    },
    'e42wxekv': {
      'en': 'Assignment 2',
      'fa': 'تکلیف 2',
      'ps': 'دنده 2',
    },
    '7eus3oy0': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    '604gc953': {
      'en': 'Due',
      'fa': 'ناشی از',
      'ps': 'له امله',
    },
    '69qak461': {
      'en': 'Today, 5:30pm',
      'fa': 'امروز ساعت 17:30',
      'ps': 'نن مازدیګر ۵:۳۰ بجې',
    },
    'ypnwy5is': {
      'en': 'Assignment 3',
      'fa': 'تکلیف 3',
      'ps': 'دنده 3',
    },
    'a9pwsc13': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    'xj36v3r5': {
      'en': 'Due',
      'fa': 'ناشی از',
      'ps': 'له امله',
    },
    'y06ed1k2': {
      'en': 'Today, 5:30pm',
      'fa': 'امروز ساعت 17:30',
      'ps': 'نن مازدیګر ۵:۳۰ بجې',
    },
  },
  // RemarkAssignment
  {
    'eirwvart': {
      'en': 'Homework',
      'fa': 'مشق شب',
      'ps': 'کورنی دنده',
    },
    'gtubcmkn': {
      'en': 'Question 1',
      'fa': 'سوال 1',
      'ps': '1 پوښتنه',
    },
    'wxfvoekh': {
      'en': 'Whats UI?',
      'fa': 'UI چیست؟',
      'ps': 'UI څه شی دی؟',
    },
    '3z3thygt': {
      'en':
          'This is the podcast description and we go over the proper content that is covered in this podcast.',
      'fa':
          'این توضیحات پادکست است و ما به محتوای مناسبی که در این پادکست پرداخته شده است می پردازیم.',
      'ps':
          'دا د پوډکاسټ توضیح دی او موږ مناسب مینځپانګې ته ځو چې پدې پوډکاسټ کې پوښل شوي.',
    },
    '7hym3pdo': {
      'en': 'Mar 25 • 3 hr, 32 min',
      'fa': '25 مارس • 3 ساعت و 32 دقیقه',
      'ps': 'د مارچ ۲۵ • ۳ ساعته، ۳۲ دقیقې',
    },
    '1sfcto5n': {
      'en': 'Please leave your comment here',
      'fa': 'لطفا نظر خود را اینجا بگذارید',
      'ps': 'مهرباني وکړئ خپل نظر دلته پریږدئ',
    },
    'zj87uwak': {
      'en': 'Very bad',
      'fa': 'خیلی بد',
      'ps': 'ډېر بد',
    },
    '9trh60i4': {
      'en': 'bad',
      'fa': 'بد',
      'ps': 'بد',
    },
    '1mwfqwqz': {
      'en': 'Good',
      'fa': 'خوب',
      'ps': 'ښه',
    },
    'tnwoons2': {
      'en': 'Very good',
      'fa': 'خیلی خوب',
      'ps': 'ډیر ښه',
    },
    'd87lze4m': {
      'en': 'Excellent',
      'fa': 'عالی',
      'ps': 'ډیر ښه',
    },
    'lvre5i8a': {
      'en': 'Write something...',
      'fa': 'چیزی بنویسید...',
      'ps': 'یو څه ولیکئ ...',
    },
    'fpko08aj': {
      'en': 'Post',
      'fa': 'پست',
      'ps': 'پوسټ',
    },
    'e6d57syk': {
      'en': 'Question 2',
      'fa': 'سوال 2',
      'ps': 'پوښتنه 2',
    },
    'behoiowf': {
      'en': 'Whats UI?',
      'fa': 'UI چیست؟',
      'ps': 'UI څه شی دی؟',
    },
    'mjn2ktr2': {
      'en':
          'This is the podcast description and we go over the proper content that is covered in this podcast.',
      'fa':
          'این توضیحات پادکست است و ما به محتوای مناسبی که در این پادکست پرداخته شده است می پردازیم.',
      'ps':
          'دا د پوډکاسټ توضیح دی او موږ مناسب مینځپانګې ته ځو چې پدې پوډکاسټ کې پوښل شوي.',
    },
    'z9hh9ozu': {
      'en': 'Mar 25 • 3 hr, 32 min',
      'fa': '25 مارس • 3 ساعت و 32 دقیقه',
      'ps': 'د مارچ ۲۵ • ۳ ساعته، ۳۲ دقیقې',
    },
    'm31mk1pj': {
      'en': 'Please leave your comment here',
      'fa': 'لطفا نظر خود را اینجا بگذارید',
      'ps': 'مهرباني وکړئ خپل نظر دلته پریږدئ',
    },
    'mzofqef5': {
      'en': 'Very bad',
      'fa': 'خیلی بد',
      'ps': 'ډېر بد',
    },
    '0bc5cpad': {
      'en': 'bad',
      'fa': 'بد',
      'ps': 'بد',
    },
    's2tbn1ks': {
      'en': 'Good',
      'fa': 'خوب',
      'ps': 'ښه',
    },
    'q3v8o8zx': {
      'en': 'Very good',
      'fa': 'خیلی خوب',
      'ps': 'ډیر ښه',
    },
    'dstoood2': {
      'en': 'Excellent',
      'fa': 'عالی',
      'ps': 'ډیر ښه',
    },
    'uturp89g': {
      'en': 'Write something...',
      'fa': 'چیزی بنویسید...',
      'ps': 'یو څه ولیکئ ...',
    },
    'w5n4g7rh': {
      'en': 'Post',
      'fa': 'پست',
      'ps': 'پوسټ',
    },
    'wt3x79s1': {
      'en': 'Question 3',
      'fa': 'سوال 3',
      'ps': 'پوښتنه 3',
    },
    'v2twhp19': {
      'en': 'Whats UI?',
      'fa': 'UI چیست؟',
      'ps': 'UI څه شی دی؟',
    },
    'sqn7pcpw': {
      'en': 'Template',
      'fa': 'قالب',
      'ps': 'کينډۍ',
    },
    'xuap9typ': {
      'en': 'Desiign',
      'fa': 'طراحی',
      'ps': 'ډیزاین',
    },
    '4tkswcn8': {
      'en': 'User Interface',
      'fa': 'رابط کاربری',
      'ps': 'د کارن انٹرفیس',
    },
    '8fhm9yyk': {
      'en': 'User experaince',
      'fa': 'تجربه کاربری',
      'ps': 'د کارونکي تجربه',
    },
    'sszwohwg': {
      'en': 'Mar 25 • 3 hr, 32 min',
      'fa': '25 مارس • 3 ساعت و 32 دقیقه',
      'ps': 'د مارچ ۲۵ • ۳ ساعته، ۳۲ دقیقې',
    },
    'engd8hgz': {
      'en': 'Please leave your comment here',
      'fa': 'لطفا نظر خود را اینجا بگذارید',
      'ps': 'مهرباني وکړئ خپل نظر دلته پریږدئ',
    },
    'zq7izbmj': {
      'en': 'Very bad',
      'fa': 'خیلی بد',
      'ps': 'ډېر بد',
    },
    'qlghek2n': {
      'en': 'bad',
      'fa': 'بد',
      'ps': 'بد',
    },
    'j8e10ike': {
      'en': 'Good',
      'fa': 'خوب',
      'ps': 'ښه',
    },
    'b2u3tapg': {
      'en': 'Very good',
      'fa': 'خیلی خوب',
      'ps': 'ډیر ښه',
    },
    'g2blhz9v': {
      'en': 'Excellent',
      'fa': 'عالی',
      'ps': 'ډیر ښه',
    },
    '8uth1p6q': {
      'en': 'Write something...',
      'fa': 'چیزی بنویسید...',
      'ps': 'یو څه ولیکئ ...',
    },
    '4qb2c6wh': {
      'en': 'Post',
      'fa': 'پست',
      'ps': 'پوسټ',
    },
    'uz52vk0c': {
      'en': 'Assignment',
      'fa': 'وظیفه',
      'ps': 'دنده',
    },
    '23lc3s1u': {
      'en': 'Total internal angles of a triangle is?',
      'fa': 'مجموع زوایای داخلی یک مثلث است؟',
      'ps': 'د مثلث ټول داخلي زاویې څومره دي؟',
    },
    'to6n9vn2': {
      'en': '180',
      'fa': '180',
      'ps': '۱۸۰',
    },
    'nqnmk4r1': {
      'en': '360',
      'fa': '360',
      'ps': '۳۶۰',
    },
    'shvmmgt5': {
      'en': '180',
      'fa': '180',
      'ps': '۱۸۰',
    },
    'klr37vs8': {
      'en': '270',
      'fa': '270',
      'ps': '۲۷۰',
    },
    '95mlvgpo': {
      'en': '90',
      'fa': '90',
      'ps': '90',
    },
    'xsls7445': {
      'en': 'Total internal angles of a triangle is?',
      'fa': 'مجموع زوایای داخلی یک مثلث است؟',
      'ps': 'د مثلث ټول داخلي زاویې څومره دي؟',
    },
    'zfxjey9t': {
      'en': '90',
      'fa': '90',
      'ps': '90',
    },
    'rkyn6par': {
      'en': '360',
      'fa': '360',
      'ps': '۳۶۰',
    },
    '5ow089c3': {
      'en': '180',
      'fa': '180',
      'ps': '۱۸۰',
    },
    'ytvcdnzs': {
      'en': '270',
      'fa': '270',
      'ps': '۲۷۰',
    },
    '25jhws0v': {
      'en': '90',
      'fa': '90',
      'ps': '90',
    },
  },
  // StudentListAssignmentAndHomework
  {
    'kvea3kf1': {
      'en': 'Najma ',
      'fa': 'نجما',
      'ps': 'نجمه',
    },
    'bg1ivpos': {
      'en': 'completed',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شوی',
    },
  },
  // Lecture
  {
    'pgjv8xrk': {
      'en': 'Coffee Farm Tours',
      'fa': 'گشت در مزرعه قهوه',
      'ps': 'د کافي فارم سفرونه',
    },
    'u5ipyssj': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ps':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    'xyf2ohw5': {
      'en': 'Homwork',
      'fa': 'تکلیف',
      'ps': 'د کور کار',
    },
    'rqndyrmn': {
      'en': 'Assignment',
      'fa': 'وظیفه',
      'ps': 'دنده',
    },
    'iw1c7kpj': {
      'en': 'Student Activity',
      'fa': 'فعالیت دانشجویی',
      'ps': 'د زده کونکي فعالیت',
    },
    'f5b6rbtp': {
      'en': '3',
      'fa': '3',
      'ps': '3',
    },
    'frc7eutd': {
      'en': 'likes',
      'fa': 'دوست دارد',
      'ps': 'خوښوي',
    },
    'sfrcgv5v': {
      'en': '8',
      'fa': '8',
      'ps': '۸',
    },
    'en4f2prb': {
      'en': 'Comments',
      'fa': 'نظرات',
      'ps': 'تبصرې',
    },
    'ce5139ic': {
      'en': 'Write something...',
      'fa': 'چیزی بنویسید...',
      'ps': 'یو څه ولیکئ ...',
    },
    'g6xhwipn': {
      'en': 'Post',
      'fa': 'پست',
      'ps': 'پوسټ',
    },
    'p99a4lbe': {
      'en': 'Randy Alcorn',
      'fa': 'رندی آلکورن',
      'ps': 'سینګ الکورن',
    },
    'u1d7tk8j': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'fa':
          'من واقعاً در مورد این بخش در اینجا مطمئن نیستم، فکر می کنم شما باید کار جالبی انجام دهید!',
      'ps':
          'زه دلته د دې برخې په اړه واقعیا ډاډه نه یم زه فکر کوم چې تاسو باید یو څه ښه ترسره کړئ!',
    },
    'pwthtwl3': {
      'en': 'a min ago',
      'fa': 'یک دقیقه پیش',
      'ps': 'یوه دقیقه مخکې',
    },
    's6h5znzf': {
      'en': 'Randy Alcorn',
      'fa': 'رندی آلکورن',
      'ps': 'سینګ الکورن',
    },
    'zpiq4hld': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'fa':
          'من واقعاً در مورد این بخش در اینجا مطمئن نیستم، فکر می کنم شما باید کار جالبی انجام دهید!',
      'ps':
          'زه دلته د دې برخې په اړه واقعیا ډاډه نه یم زه فکر کوم چې تاسو باید یو څه ښه کار وکړئ!',
    },
    '6bx9ioku': {
      'en': 'a min ago',
      'fa': 'یک دقیقه پیش',
      'ps': 'یوه دقیقه مخکې',
    },
  },
  // LectureAndStudentList
  {
    '7tw6ycsz': {
      'en': 'Lectures',
      'fa': 'سخنرانی ها',
      'ps': 'لیکچرونه',
    },
    'nihl6xfs': {
      'en': 'Add',
      'fa': 'اضافه کردن',
      'ps': 'اضافه کړئ',
    },
    'ifjp4kpn': {
      'en': 'Computer archteture and more about',
      'fa': 'معماری کامپیوتر و بیشتر در مورد',
      'ps': 'د کمپیوټر جوړښت او نور په اړه',
    },
    'ckqe9n5q': {
      'en': 'Homework 3',
      'fa': 'تکالیف 3',
      'ps': 'د کور کار ۳',
    },
    'k4nhteku': {
      'en': 'Assignment 4',
      'fa': 'تکلیف 4',
      'ps': 'دنده ۴',
    },
    'g4bfbdx3': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    'lpqpyiui': {
      'en': '12h',
      'fa': 'ساعت 12',
      'ps': '12h',
    },
    'af6h11z8': {
      'en': 'Edit',
      'fa': 'ویرایش کنید',
      'ps': 'سمون',
    },
    '1lx281tj': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'fa': 'HSBC در حال بازگشت به وام های مصرف کننده در ایالات متحده است.',
      'ps':
          'HSBC په متحده ایالاتو کې د مصرف کونکو پورونو ته بیرته راځي د دې مطابق ...',
    },
    'y6z1ukne': {
      'en': 'Homework 0',
      'fa': 'تکلیف 0',
      'ps': 'کورنی کار ۰',
    },
    'ya8v6nbh': {
      'en': 'Assignment 0',
      'fa': 'تکلیف 0',
      'ps': 'دنده ۰',
    },
    'u4ugp9y9': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    'ira9uuga': {
      'en': '12h',
      'fa': 'ساعت 12',
      'ps': '12h',
    },
    'i91qnizw': {
      'en': 'Edit',
      'fa': 'ویرایش کنید',
      'ps': 'سمون',
    },
    'kwen1408': {
      'en': 'Please add Homework And Assigment',
      'fa': 'لطفا تکالیف و تکلیف را اضافه کنید',
      'ps': 'مهرباني وکړئ د کور کار او دنده اضافه کړئ',
    },
    '3jfng9ra': {
      'en': 'Students',
      'fa': 'دانش آموزان',
      'ps': 'زده کوونکي',
    },
    'yxub10al': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسون هیویت',
      'ps': 'جکسن هیویټ',
    },
    '830ms16f': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسون هیویت',
      'ps': 'جکسن هیویټ',
    },
  },
  // StudentDetails
  {
    'kznzwayf': {
      'en': 'Genral information',
      'fa': 'اطلاعات عمومی',
      'ps': 'عمومي معلومات',
    },
    'pty6da9y': {
      'en': 'Name',
      'fa': 'نام',
      'ps': 'نوم',
    },
    'okev0r9y': {
      'en': 'Najma',
      'fa': 'نجما',
      'ps': 'نجمه',
    },
    'xxj3zg3b': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
      'ps': 'تخلص',
    },
    '2bccbqlt': {
      'en': 'Shams',
      'fa': 'شمس',
      'ps': 'شمس',
    },
    'b9o6nmue': {
      'en': 'Father name',
      'fa': 'نام پدر',
      'ps': 'د پلار نوم',
    },
    'jz47lyc5': {
      'en': 'Hameed',
      'fa': 'حمید',
      'ps': 'حمید',
    },
    '9mjml2mk': {
      'en': 'Tazkra number',
      'fa': 'شماره تذکره',
      'ps': 'تذکره نمبر',
    },
    'v881vz73': {
      'en': '1402009034321',
      'fa': '1402009034321',
      'ps': '1402009034321',
    },
    'gk86dgq8': {
      'en': 'More',
      'fa': 'بیشتر',
      'ps': 'نور',
    },
    '8d3knu0l': {
      'en': 'Marital status',
      'fa': 'وضعیت تأهل',
      'ps': 'مدني حالت',
    },
    '6elsq4hb': {
      'en': 'Single',
      'fa': 'تنها',
      'ps': 'واحد',
    },
    '7u8uzvog': {
      'en': 'Gender',
      'fa': 'جنسیت',
      'ps': 'جندر',
    },
    'b709oirb': {
      'en': 'Female',
      'fa': 'زن',
      'ps': 'ښځینه',
    },
    '6rft7lq0': {
      'en': 'Date of birth',
      'fa': 'تاریخ تولد',
      'ps': 'د زیږون نیټه',
    },
    'dds6goi3': {
      'en': '1374/05/05',
      'fa': '1374/05/05',
      'ps': '۱۳۷۴/۰۵/۰۵',
    },
    '7tuqup21': {
      'en': 'Phone number',
      'fa': 'شماره تلفن',
      'ps': 'د تلیفون شمیره',
    },
    '0ju5h1ke': {
      'en': '0799353567',
      'fa': '0799353567',
      'ps': '۰۷۹۹۳۵۳۵۶۷',
    },
    'e8f8k9k7': {
      'en': 'Address',
      'fa': 'نشانی',
      'ps': 'پته',
    },
    '4va3rb1t': {
      'en': 'kabul',
      'fa': 'کابل',
      'ps': 'کابل',
    },
    '9ta3l0rt': {
      'en': 'Email',
      'fa': 'پست الکترونیک',
      'ps': 'ایمیل',
    },
    'sbkbhxv6': {
      'en': 'Nargishmadi@gmail.om',
      'fa': 'Nargishmadi@gmail.om',
      'ps': 'Nargishmadi@gmail.om',
    },
  },
  // Student
  {
    '4ozq1rve': {
      'en': 'Search lecture...',
      'fa': 'جستجوی سخنرانی ...',
      'ps': 'د لیکچر لټون...',
    },
    '1ebmbt5m': {
      'en': 'Ahmad',
      'fa': 'احمد',
      'ps': 'احمد',
    },
    '34td7vrh': {
      'en': 'Class A',
      'fa': 'کلاس A',
      'ps': 'ټولګي الف',
    },
    'hit16za0': {
      'en': 'Najma',
      'fa': 'نجما',
      'ps': 'نجمه',
    },
    '9pqgsrjj': {
      'en': 'Class A',
      'fa': 'کلاس A',
      'ps': 'ټولګي الف',
    },
  },
  // Assignment
  {
    'jzz592e8': {
      'en': 'Assignment 1',
      'fa': 'تکلیف 1',
      'ps': 'دنده 1',
    },
    '1i3r0jnt': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    '55nybc28': {
      'en': 'Due',
      'fa': 'ناشی از',
      'ps': 'له امله',
    },
    'ehu8eflg': {
      'en': 'Today, 5:30pm',
      'fa': 'امروز ساعت 17:30',
      'ps': 'نن مازدیګر ۵:۳۰ بجې',
    },
    'yt3diigr': {
      'en': 'Assignment 2',
      'fa': 'تکلیف 2',
      'ps': 'دنده 2',
    },
    'iouzg36b': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    'g8oufrnr': {
      'en': 'Due',
      'fa': 'ناشی از',
      'ps': 'له امله',
    },
    '0mdr6czn': {
      'en': 'Today, 5:30pm',
      'fa': 'امروز ساعت 17:30',
      'ps': 'نن مازدیګر ۵:۳۰ بجې',
    },
    'ktizf4yr': {
      'en': 'Assignment 3',
      'fa': 'تکلیف 3',
      'ps': 'دنده 3',
    },
    'gjcvz6vp': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    'jqladh1c': {
      'en': 'Due',
      'fa': 'ناشی از',
      'ps': 'له امله',
    },
    'yf68q7zr': {
      'en': 'Today, 5:30pm',
      'fa': 'امروز ساعت 17:30',
      'ps': 'نن مازدیګر ۵:۳۰ بجې',
    },
  },
  // AddLecture
  {
    '0a6lip4u': {
      'en': 'Start',
      'fa': 'شروع کنید',
      'ps': 'پیل',
    },
    'q6afjmgj': {
      'en': 'Add \nlecture',
      'fa': 'اضافه کردن\nسخنرانی',
      'ps': 'اضافه کړئ\nلیکچر',
    },
    'bgtg8imr': {
      'en': 'Add Homework',
      'fa': 'اضافه کردن تکالیف',
      'ps': 'د کور کار اضافه کړئ',
    },
    'qbkkip0u': {
      'en': 'Add Assigment',
      'fa': 'افزودن تخصیص',
      'ps': 'دنده اضافه کړئ',
    },
    'a8drzby2': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'qqqkrvms': {
      'en': 'Title',
      'fa': 'عنوان',
      'ps': 'عنوان',
    },
    '3viqv59g': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'swujt6rs': {
      'en': 'Details',
      'fa': 'جزئیات',
      'ps': 'جزیات',
    },
    'ja7qhug3': {
      'en': 'Next',
      'fa': 'بعد',
      'ps': 'بل',
    },
    '74cfqnvf': {
      'en': 'Next',
      'fa': 'بعد',
      'ps': 'بل',
    },
  },
  // AddHomework
  {
    'hf2y2z6s': {
      'en': 'Start',
      'fa': 'شروع کنید',
      'ps': 'پیل',
    },
    'tqynlpxr': {
      'en': 'Add \nlecture',
      'fa': 'اضافه کردن\nسخنرانی',
      'ps': 'اضافه کړئ\nلیکچر',
    },
    'whnhokg1': {
      'en': 'Add Homework',
      'fa': 'اضافه کردن تکالیف',
      'ps': 'د کور کار اضافه کړئ',
    },
    'la68hkub': {
      'en': 'Add Assigment',
      'fa': 'افزودن تخصیص',
      'ps': 'دنده اضافه کړئ',
    },
    'b66sjb4p': {
      'en': '4 Answer question',
      'fa': '4 به سوال پاسخ دهید',
      'ps': '4 پوښتنې ځواب کړئ',
    },
    'g5ex9tdh': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'vj8jmu10': {
      'en': 'Question',
      'fa': 'سوال',
      'ps': 'پوښتنه',
    },
    'rv3ame86': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'w19ar42w': {
      'en': 'Answer A',
      'fa': 'جواب الف',
      'ps': 'ځواب A',
    },
    '2id59153': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'rj9tfr9e': {
      'en': 'Answer B',
      'fa': 'پاسخ ب',
      'ps': 'ځواب B',
    },
    'ffl40kmt': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '0ey1y5bk': {
      'en': 'Answer C',
      'fa': 'پاسخ ج',
      'ps': 'ځواب سي',
    },
    'su5wglsc': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'ecvrliuk': {
      'en': 'Answer D',
      'fa': 'جواب د',
      'ps': 'ځواب D',
    },
    '2pkg5gmz': {
      'en': 'Select the correct answer',
      'fa': 'پاسخ صحیح را انتخاب کنید',
      'ps': 'سم ځواب غوره کړئ',
    },
    'y4rfzh5i': {
      'en': 'A',
      'fa': 'آ',
      'ps': 'الف',
    },
    'qa2ny0q5': {
      'en': 'B',
      'fa': 'ب',
      'ps': 'ب',
    },
    '7kgut797': {
      'en': 'C',
      'fa': 'سی',
      'ps': 'ج',
    },
    'ke9zbefb': {
      'en': 'D',
      'fa': 'دی',
      'ps': 'ډي',
    },
    'xvvnjo32': {
      'en': 'One Answer question',
      'fa': 'سوال یک جوابی',
      'ps': 'د یوې پوښتنې ځواب',
    },
    'iibtkfit': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'pxi3j0xu': {
      'en': 'Question',
      'fa': 'سوال',
      'ps': 'پوښتنه',
    },
    '11uv14ft': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '51l4n330': {
      'en': 'Answer 1',
      'fa': 'پاسخ 1',
      'ps': 'ځواب 1',
    },
    'v8rtsqu7': {
      'en': 'Only question',
      'fa': 'فقط سوال',
      'ps': 'یوازې پوښتنه',
    },
    'ljvs0oyk': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'pbfqq8yv': {
      'en': 'Question',
      'fa': 'سوال',
      'ps': 'پوښتنه',
    },
    'r1clpnqw': {
      'en': 'Add more',
      'fa': 'بیشتر اضافه کنید',
      'ps': 'نور زیات کړئ',
    },
    'o3fav0rh': {
      'en': 'Next',
      'fa': 'بعد',
      'ps': 'بل',
    },
    '7el2qgbq': {
      'en': 'Select querstion type',
      'fa': 'نوع سوال را انتخاب کنید',
      'ps': 'د پوښتنې ډول وټاکئ',
    },
    'edwpyye9': {
      'en': 'A',
      'fa': 'آ',
      'ps': 'الف',
    },
    'b9mw03wd': {
      'en': 'B',
      'fa': 'ب',
      'ps': 'ب',
    },
    'e1ft6hhr': {
      'en': 'C',
      'fa': 'سی',
      'ps': 'ج',
    },
    'resvpz9y': {
      'en': 'Button',
      'fa': '',
      'ps': '',
    },
  },
  // AddAssignment
  {
    '64jqo6kc': {
      'en': 'Start',
      'fa': 'شروع کنید',
      'ps': 'پیل',
    },
    'mbcqvyzf': {
      'en': 'Add \nlecture',
      'fa': 'اضافه کردن\nسخنرانی',
      'ps': 'اضافه کړئ\nلیکچر',
    },
    'fhbwlb0s': {
      'en': 'Add Homework',
      'fa': 'اضافه کردن تکالیف',
      'ps': 'د کور کار اضافه کړئ',
    },
    '9zmx6bna': {
      'en': 'Add Assigment',
      'fa': 'افزودن تخصیص',
      'ps': 'دنده اضافه کړئ',
    },
    'adal8hoz': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '7x6rxx6l': {
      'en': 'Question',
      'fa': 'سوال',
      'ps': 'پوښتنه',
    },
    'z5yzko1v': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '7xwdpdwi': {
      'en': 'Answer 1',
      'fa': 'پاسخ 1',
      'ps': 'ځواب 1',
    },
    '658j4afb': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'x0pl3bt5': {
      'en': 'Answer 1',
      'fa': 'پاسخ 1',
      'ps': 'ځواب 1',
    },
    'p712vt9i': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '8kkjjgoi': {
      'en': 'Answer 1',
      'fa': 'پاسخ 1',
      'ps': 'ځواب 1',
    },
    'vhq31wey': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'a573sjyj': {
      'en': 'Answer 1',
      'fa': 'پاسخ 1',
      'ps': 'ځواب 1',
    },
    'txo99w7u': {
      'en': 'Select the correct answer',
      'fa': 'پاسخ صحیح را انتخاب کنید',
      'ps': 'سم ځواب غوره کړئ',
    },
    'ggcwd273': {
      'en': 'A',
      'fa': 'آ',
      'ps': 'الف',
    },
    'ixbhqshk': {
      'en': 'B',
      'fa': 'ب',
      'ps': 'ب',
    },
    '2t3dsxwa': {
      'en': 'C',
      'fa': 'سی',
      'ps': 'ج',
    },
    '8spar9pa': {
      'en': 'D',
      'fa': 'دی',
      'ps': 'ډي',
    },
    'dibjpdw8': {
      'en': 'Add more',
      'fa': 'بیشتر اضافه کنید',
      'ps': 'نور زیات کړئ',
    },
    '5dfugjv9': {
      'en': 'Next',
      'fa': 'بعد',
      'ps': 'بل',
    },
  },
  // AddCompelet
  {
    '05vduy2x': {
      'en': 'Start',
      'fa': 'شروع کنید',
      'ps': 'پیل',
    },
    'ihsmfphf': {
      'en': 'Add \nlecture',
      'fa': 'اضافه کردن\nسخنرانی',
      'ps': 'اضافه کړئ\nلیکچر',
    },
    'jw69izlr': {
      'en': 'Add Homework',
      'fa': 'اضافه کردن تکالیف',
      'ps': 'د کور کار اضافه کړئ',
    },
    'oj8edic3': {
      'en': 'Add Assigment',
      'fa': 'افزودن تخصیص',
      'ps': 'دنده اضافه کړئ',
    },
    'j3olxbn1': {
      'en': 'Good job!',
      'fa': 'آفرین!',
      'ps': 'ښه کار!',
    },
    'kqxrjmi1': {
      'en': ' Submitted',
      'fa': 'ارسال شده',
      'ps': 'سپارل شوی',
    },
    'yurcj1ny': {
      'en': 'Back to lecture',
      'fa': 'بازگشت به سخنرانی',
      'ps': 'بیرته لیکچر ته',
    },
  },
  // MyLectures
  {
    'neptcp69': {
      'en': 'Search lecture...',
      'fa': 'جستجوی سخنرانی ...',
      'ps': 'د لیکچر لټون...',
    },
    'dohn9u59': {
      'en': 'Enroll Now',
      'fa': 'اکنون ثبت نام کنید',
      'ps': 'همدا اوس نوم لیکنه وکړئ',
    },
    'su0aczep': {
      'en': 'Related book',
      'fa': 'کتاب مرتبط',
      'ps': 'اړوند کتاب',
    },
    'hrga925a': {
      'en': 'Introduction to computer',
      'fa': 'مقدمه ای بر کامپیوتر',
      'ps': 'د کمپیوټر پیژندنه',
    },
    'yeskujtf': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسون هیویت',
      'ps': 'جکسن هیویټ',
    },
    '8lw9eefq': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    'oqhq91as': {
      'en': '12h',
      'fa': 'ساعت 12',
      'ps': '12h',
    },
    'syoqj4e0': {
      'en': 'Read Now',
      'fa': 'الان بخوان',
      'ps': 'اوس ولولئ',
    },
    'caclejyj': {
      'en': 'Computer archteture and more about',
      'fa': 'معماری کامپیوتر و بیشتر در مورد',
      'ps': 'د کمپیوټر جوړښت او نور په اړه',
    },
    'h4hevi4z': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسون هیویت',
      'ps': 'جکسن هیویټ',
    },
    'yq57nxjw': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    'f78rbwk0': {
      'en': '12h',
      'fa': 'ساعت 12',
      'ps': '12h',
    },
    'ihdm00ud': {
      'en': 'Read Now',
      'fa': 'الان بخوان',
      'ps': 'اوس ولولئ',
    },
    'zwgm7n4l': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'fa': 'HSBC در حال بازگشت به وام های مصرف کننده در ایالات متحده است.',
      'ps':
          'HSBC په متحده ایالاتو کې د مصرف کونکو پورونو ته بیرته راځي د دې مطابق ...',
    },
    'p29881qm': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسون هیویت',
      'ps': 'جکسن هیویټ',
    },
    '9nxgm944': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    '4lf6i2lc': {
      'en': '12h',
      'fa': 'ساعت 12',
      'ps': '12h',
    },
    'pxd45seg': {
      'en': 'Read Now',
      'fa': 'الان بخوان',
      'ps': 'اوس ولولئ',
    },
    'nsa97aum': {
      'en': 'Enroll Now',
      'fa': 'اکنون ثبت نام کنید',
      'ps': 'همدا اوس نوم لیکنه وکړئ',
    },
  },
  // Enrolling
  {
    'tde48jvo': {
      'en': 'For Enroll this course please donate',
      'fa': 'برای ثبت نام در این دوره لطفا کمک مالی کنید',
      'ps': 'د دې کورس د نوم لیکنې لپاره مهرباني وکړئ مرسته وکړئ',
    },
  },
  // chat_2_Details
  {
    '2c48irk3': {
      'en': 'Group Chat',
      'fa': 'چت گروهی',
      'ps': 'ګروپ چټ',
    },
    'prmvd76m': {
      'en': 'Home',
      'fa': '',
      'ps': '',
    },
  },
  // chat_2_main
  {
    '0izljff9': {
      'en': 'Below are your chats and group chats',
      'fa': 'در زیر چت ها و چت های گروهی شما آمده است',
      'ps': 'لاندې ستاسو چیټونه او ګروپ چیټونه دي',
    },
    'hefj2mjs': {
      'en': 'Group Chat',
      'fa': 'چت گروهی',
      'ps': 'ګروپ چټ',
    },
    '71gyaxgw': {
      'en': 'My Chats',
      'fa': 'چت های من',
      'ps': 'زما چټونه',
    },
    'nz79v32z': {
      'en': '__',
      'fa': '__',
      'ps': '__',
    },
  },
  // chat_2_InviteUsers
  {
    'j4onqus2': {
      'en': 'Invite Friends',
      'fa': 'دوستان را دعوت کنید',
      'ps': 'ملګري را دعوت کړئ',
    },
    'hsmp9tkp': {
      'en': 'Selected',
      'fa': 'انتخاب شد',
      'ps': 'ټاکل شوی',
    },
    'paj7ezvq': {
      'en': 'Invite Friends',
      'fa': 'دوستان را دعوت کنید',
      'ps': 'ملګري را دعوت کړئ',
    },
    '544q5cwh': {
      'en': 'Select users from below to start a chat.',
      'fa': 'کاربران را از زیر برای شروع یک چت انتخاب کنید.',
      'ps': 'د چیټ پیل کولو لپاره له لاندې څخه کاروونکي غوره کړئ.',
    },
    'ix7itnq0': {
      'en': 'Home',
      'fa': '',
      'ps': '',
    },
  },
  // image_Details
  {
    '8qpe6p63': {
      'en': 'Home',
      'fa': '',
      'ps': '',
    },
  },
  // Drawer
  {
    'l2r8yw54': {
      'en': 'Zia Akbari',
      'fa': 'ضیا اکبری',
      'ps': 'ضیا اکبري',
    },
    'ixp49nyq': {
      'en': 'Zia Akbari',
      'fa': 'ضیا اکبری',
      'ps': 'ضیا اکبري',
    },
    'ioxi8zm1': {
      'en': 'Rashid',
      'fa': 'رشید',
      'ps': 'راشد',
    },
    'tv1dtkuk': {
      'en': 'Hamaion',
      'fa': 'هامایون',
      'ps': 'همایون',
    },
    'ckeo9ws8': {
      'en': 'Profile',
      'fa': 'مشخصات',
      'ps': 'پروفایل',
    },
    '6gdmi28a': {
      'en': 'Notice board',
      'fa': 'تابلو اعلانات',
      'ps': 'د خبرتیا تخته',
    },
    'nqqclm2u': {
      'en': 'Messages',
      'fa': 'پیام ها',
      'ps': 'پیغامونه',
    },
    'i5lvnwkd': {
      'en': 'Logout',
      'fa': 'خروج',
      'ps': 'وتل',
    },
  },
  // MobileAppbar
  {
    '4hom5i78': {
      'en': 'Hello World',
      'fa': 'سلام دنیا',
      'ps': 'سلام نړی',
    },
  },
  // DesktopTitle
  {
    'lffnnsf5': {
      'en': 'Title',
      'fa': 'عنوان',
      'ps': 'عنوان',
    },
  },
  // Author
  {
    'joa1tvom': {
      'en': 'John Thoh',
      'fa': 'جان توه',
      'ps': 'جان توه',
    },
    '7lypr606': {
      'en': 'Secondary text',
      'fa': 'متن ثانویه',
      'ps': 'دوهم متن',
    },
  },
  // Notification
  {
    'q8px62ld': {
      'en': '1',
      'fa': '1',
      'ps': '1',
    },
  },
  // Activitycomponent
  {
    '4kvhd5u1': {
      'en': 'Activities',
      'fa': 'فعالیت ها',
      'ps': 'فعالیتونه',
    },
    'ne2992qm': {
      'en': 'Recent activities by Hekmatullah',
      'fa': 'فعالیت های اخیر حکمت الله',
      'ps': 'د حکمت الله لخوا وروستي فعالیتونه',
    },
    'iep43mew': {
      'en': 'Hekmatullah',
      'fa': 'حکمت الله',
      'ps': 'حکمت الله',
    },
    'dhdrl9l9': {
      'en': '4 months ago',
      'fa': '4 ماه پیش',
      'ps': '4 میاشتې مخکې',
    },
    'hcg5oojl': {
      'en': 'Completed ',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شو',
    },
    '83vzxa1h': {
      'en': 'Arabic course',
      'fa': 'دوره عربی',
      'ps': 'عربي کورس',
    },
    'vks2yt6u': {
      'en': 'Hekmatullah',
      'fa': 'حکمت الله',
      'ps': 'حکمت الله',
    },
    'bbksi7an': {
      'en': '4 days ago',
      'fa': '4 روز پیش',
      'ps': '4 ورځې وړاندې',
    },
    '9wn843my': {
      'en': 'Started ',
      'fa': 'آغاز شده',
      'ps': 'پیل شو',
    },
    '4we576lx': {
      'en': 'Computer course',
      'fa': 'دوره کامپیوتر',
      'ps': 'د کمپیوټر کورس',
    },
    'um162xhz': {
      'en': 'Hekmatullah',
      'fa': 'حکمت الله',
      'ps': 'حکمت الله',
    },
    'ask4pyqp': {
      'en': '1 month ago',
      'fa': '1 ماه پیش',
      'ps': '1 میاشت دمخه',
    },
    '99jp7950': {
      'en': 'Started ',
      'fa': 'آغاز شده',
      'ps': 'پیل شو',
    },
    'qrlnj1z8': {
      'en': 'English course',
      'fa': 'دوره زبان انگلیسی',
      'ps': 'د انګلیسي کورس',
    },
    '3hf8jfe2': {
      'en': 'Hekmatullah',
      'fa': 'حکمت الله',
      'ps': 'حکمت الله',
    },
    'ed2lpofv': {
      'en': '9 months ago',
      'fa': '9 ماه قبل',
      'ps': '۹ میاشتې وړاندې',
    },
    'hotr63ay': {
      'en': 'Completed ',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شو',
    },
    'f1eyioki': {
      'en': 'English assessment',
      'fa': 'ارزیابی زبان انگلیسی',
      'ps': 'د انګلیسي ارزونه',
    },
  },
  // DesktopDrawer
  {
    'owlje3lz': {
      'en': 'Zia Akbari',
      'fa': 'ضیا اکبری',
      'ps': 'ضیا اکبري',
    },
    'at31wjjp': {
      'en': 'Zia Akbari',
      'fa': 'ضیا اکبری',
      'ps': 'ضیا اکبري',
    },
    'yb96a1s5': {
      'en': 'Rashid',
      'fa': 'رشید',
      'ps': 'راشد',
    },
    'ux9ecp4o': {
      'en': 'Hamaion',
      'fa': 'هامایون',
      'ps': 'همایون',
    },
    '9atvfn1i': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'کور',
    },
    'xl4aw9yy': {
      'en': 'Classes',
      'fa': 'کلاس ها',
      'ps': 'ټولګي',
    },
    'ak2qg9k4': {
      'en': 'Courses',
      'fa': 'دوره های آموزشی',
      'ps': 'کورسونه',
    },
    'hx3q2elc': {
      'en': 'Profile',
      'fa': 'مشخصات',
      'ps': 'پروفایل',
    },
    'echfal7z': {
      'en': 'Notice board',
      'fa': 'تابلو اعلانات',
      'ps': 'د خبرتیا تخته',
    },
    '93mxtmxd': {
      'en': 'Messages',
      'fa': 'پیام ها',
      'ps': 'پیغامونه',
    },
    'm5ng1gbe': {
      'en': 'Logout',
      'fa': 'خروج',
      'ps': 'وتل',
    },
  },
  // chat_DetailsOverlay
  {
    'mkp6l69o': {
      'en': 'Chat Details',
      'fa': '',
      'ps': '',
    },
    '9m67dmhx': {
      'en': 'Group Chat ID: ',
      'fa': 'شناسه چت گروهی:',
      'ps': 'د ګروپ چټ ID:',
    },
    '3532i073': {
      'en': 'In this chat',
      'fa': 'در این چت',
      'ps': 'په دې خبرو کې',
    },
    '6y1hgu32': {
      'en': 'Close',
      'fa': 'بستن',
      'ps': 'تړل',
    },
  },
  // chat_ThreadComponent
  {
    'w6bkqbv8': {
      'en': 'Start typing here...',
      'fa': 'از اینجا شروع به تایپ کنید...',
      'ps': 'دلته ټایپ کول پیل کړئ ...',
    },
    't1sf246a': {
      'en': 'You must enter a message...',
      'fa': 'باید پیامی وارد کنید...',
      'ps': 'تاسو باید یو پیغام دننه کړئ ...',
    },
    'dgc0tr3u': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
      'ps': 'مهرباني وکړئ د ښکته کیدو څخه یو اختیار غوره کړئ',
    },
  },
  // user_ListSmall
  {
    'nfqbewg7': {
      'en': 'ME',
      'fa': 'من',
      'ps': 'ME',
    },
  },
  // deleteDialog
  {
    '060tfrxt': {
      'en': 'Options',
      'fa': 'گزینه ها',
      'ps': 'اختیارونه',
    },
    '55xuv7tv': {
      'en': 'Invite Users',
      'fa': 'دعوت از کاربران',
      'ps': 'کاروونکو ته بلنه ورکړئ',
    },
    'mhk7rsac': {
      'en': 'Delete Chat',
      'fa': 'چت را حذف کنید',
      'ps': 'چیټ ړنګ کړئ',
    },
    'aqnfkjkg': {
      'en': 'Confirm Delete',
      'fa': 'تایید حذف',
      'ps': 'ړنګول تایید کړئ',
    },
    '11mkwuwt': {
      'en': 'You can\'t undo this action.',
      'fa': 'شما نمی توانید این عمل را واگرد کنید.',
      'ps': 'تاسو نشئ کولی دا کړنه بیرته راولي.',
    },
    '322iomjw': {
      'en': 'Delete',
      'fa': 'حذف',
      'ps': 'ړنګول',
    },
  },
  // Miscellaneous
  {
    '0gytb0ua': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'ps': 'دلته نښه کړئ ...',
    },
    'vpq6460x': {
      'en': 'Button',
      'fa': 'دکمه',
      'ps': 'تڼۍ',
    },
    'juponsy8': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'ps': 'دلته نښه کړئ ...',
    },
    '17p6y5q2': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'ps': 'دلته نښه کړئ ...',
    },
    'gabqefvt': {
      'en': 'Option 1',
      'fa': 'انتخاب 1',
      'ps': 'اختیار 1',
    },
    'bkwqf5bb': {
      'en': 'Please select...',
      'fa': 'لطفا انتخاب کنید...',
      'ps': 'مهرباني وکړئ غوره کړئ ...',
    },
    '9dlklm5z': {
      'en': 'Search for an item...',
      'fa': 'جستجو برای یک مورد ...',
      'ps': 'د یو توکي لټون...',
    },
    'x0bd3ac5': {
      'en': 'Button',
      'fa': 'دکمه',
      'ps': 'تڼۍ',
    },
    'fxoix5up': {
      'en': 'Button',
      'fa': 'دکمه',
      'ps': 'تڼۍ',
    },
    'qe3ydb0i': {
      'en': 'Button',
      'fa': 'دکمه',
      'ps': 'تڼۍ',
    },
    'ifk3ons4': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'u57m5wd5': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'zxs96a04': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'f15u86d2': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '6fqtyt95': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'l4otvppe': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'n2hdunlt': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'c3vm3p9t': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '263mnzf4': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'nt07lx7n': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '0h5wpbrm': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '3g3kh4ma': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '2esxvxfp': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'z41yncsl': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'mvrniwjp': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '5fiz2b9q': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'h4asbaxn': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '0ye2ozof': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'zzfwg9y3': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '3cmsqvnl': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '8l4rqz32': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'gn7ige8g': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'pra09i7q': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '114oms3v': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'bj2whesk': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'u7k7ee7v': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '6hemamq4': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'glci8zlt': {
      'en': '',
      'fa': '',
      'ps': '',
    },
  },
].reduce((a, b) => a..addAll(b));
