import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

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
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

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
  // loginPage
  {
    'o07j3mgv': {
      'en': 'Welcome back',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'fzxvw3mu': {
      'en': 'Login to access your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'a9j78va9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'i7f18cve': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'wztjmbn8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'lw1jpm1f': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'm2xyjvuf': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
    },
    'qbmoi1av': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    'cjqb8ial': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    'a0iimirx': {
      'en': 'Create',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // registerAccount
  {
    'gpokmd81': {
      'en': 'Get Started',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'oitrrwgg': {
      'en': 'Create your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'qy3ehd7s': {
      'en': 'Coordinator (UC)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ik8zy4yt': {
      'en': 'Support (US)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ze3syo71': {
      'en': 'Please select...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mgfnrn28': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gcwdqm4g': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'iam0xgwx': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'bqv15dcf': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'joih97mn': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'rzpiwq9p': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
    },
    'eyfkffka': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    '5kmjfwsk': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
    },
    '3twynvfz': {
      'en': 'Login',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    '9ssznj0g': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que te identifiquemos fácilmente.',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'n636qnrx': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    '72ii0waq': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'pf8glhkg': {
      'en': 'What is your position?',
      'ar': 'ماهوموقعك؟',
      'de': 'Wo befinden Sie sich?',
      'es': '¿Cual es tu posicion?',
    },
    'hbhd3bdt': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_Reports
  {
    'cd0zp71n': {
      'en': 'My Reports',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    '9il8u06k': {
      'en': 'Report',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yvhhudxi': {
      'en': 'Solving wifi',
      'ar': '',
      'de': '',
      'es': '',
    },
    'okyphbdu': {
      'en': '5 hours working',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c81i1ybg': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'rrbwd2z6': {
      'en': '\$2,502',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ah4t7cpx': {
      'en': 'Report',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto publicitario',
    },
    '0tsohlub': {
      'en': 'Bla bla bla ',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '5y1u9kxg': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '4jknsif6': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'o9rmbnd7': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'fn6kvat8': {
      'en': 'Report 45',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto publicitario',
    },
    '6uht91yb': {
      'en': 'PC DJKSJDS',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '1qm6rhod': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '65tvvjcw': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'c03678eq': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'ofz2zvlc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'en': 'My Account',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
    },
    'i61y9ibx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    '03k0vw86': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '2ll42t1u': {
      'en': 'Dark Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8srr2k0j': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // reportDetails
  {
    '9yi3zs3z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'akubzhk3': {
      'en': '5 hours working',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ti7ipegi': {
      'en': ' N° Report',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'o7a8ijm4': {
      'en': '2,502',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l53kroui': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // taskComplete
  {
    'xf8d4sm8': {
      'en': 'Task Complete',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'iq9jjji8': {
      'en': 'Great work, your report will be put in the report view.',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // AsignTask
  {
    'wv1862li': {
      'en': 'Send Task',
      'ar': 'طلب التمويل',
      'de': 'Geld anfordern',
      'es': 'Pedír fondos',
    },
    'ejxtqu0l': {
      'en': 'User here...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jkgldj5q': {
      'en': 'Very fast',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ijde52hi': {
      'en': 'Not so fast',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wo9cebk7': {
      'en': 'Select priotity',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rcevwwju': {
      'en': 'Description',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'uvrt7im0': {
      'en': 'Send Task',
      'ar': 'طلب التمويل',
      'de': 'Geld anfordern',
      'es': 'Pedír fondos',
    },
    '7y89msg9': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'xk0bwox3': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // createReportsUS
  {
    'smbfunwu': {
      'en': 'Create Report',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'onjddqdc': {
      'en': 'Problem Name',
      'ar': 'اسم الميزانية',
      'de': 'Budgetname',
      'es': 'Nombre del presupuesto',
    },
    'nslg15rr': {
      'en': 'Start Time',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6x6nohek': {
      'en': 'End Time',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g83gfmaf': {
      'en': 'Description',
      'ar': 'وصف',
      'de': 'Beschreibung',
      'es': 'Descripción',
    },
    '0iex13x2': {
      'en': 'Create Report',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    '8hzaiw1r': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'mos068mm': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    'zoxan2gi': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
    },
    '3p9y21e2': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
      'es': 'Por favor ingrese un número valido...',
    },
    'z4fstn5l': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'de': 'Deine E-Mail',
      'es': 'Tu correo electrónico',
    },
    '8h1cjk5a': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    'zvymbfia': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'i6edcl52': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '2b97u8y5': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un enlace para restablecer su contraseña.',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'if4pz6lm': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage_UC
  {
    'ucqlrrlk': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'c10wb3ot': {
      'en': 'Your account Details are below.',
      'ar': 'تفاصيل حسابك أدناه.',
      'de': 'Ihre Kontodetails sind unten.',
      'es': 'Los detalles de su cuenta se encuentran a continuación.',
    },
    '6z1sm34j': {
      'en': 'Total teams on charge',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'c0dls4u5': {
      'en': '20',
      'ar': '25202 دولار',
      'de': '25.202 \$',
      'es': '\$25,202',
    },
    'lmo3ko2i': {
      'en': 'Quick Services',
      'ar': 'خدمات سريعة',
      'de': 'Schnelle Dienste',
      'es': 'Servicios rápidos',
    },
    'xs2as0vf': {
      'en': 'Manage Personal',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'g8yaaa7f': {
      'en': 'Rate Reports',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'nb29ps2o': {
      'en': '1 New Alert',
      'ar': '1 تنبيه جديد',
      'de': '1 Neue Benachrichtigung',
      'es': '1 nueva alerta',
    },
    'vgt9s153': {
      'en': 'View Now',
      'ar': 'عرض الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'pnvkw3b7': {
      'en': 'We have recieve a new task complete, tap here to see it ',
      'ar': 'لقد لاحظنا تكلفة صغيرة خارجة عن طبيعة هذا الحساب ، يرجى المراجعة.',
      'de':
          'Wir haben eine kleine Belastung festgestellt, die für dieses Konto untypisch ist. Bitte überprüfen Sie diese.',
      'es':
          'Notamos un pequeño cargo que está fuera de lugar en esta cuenta, revíselo.',
    },
    'c805m53i': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage_US
  {
    'xdh0z8qh': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'rzpg3cvh': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'b8oj0pck': {
      'en': 'Team Name',
      'ar': 'اسم الفريق',
      'de': 'Teamname',
      'es': 'Nombre del equipo',
    },
    'jzfejglt': {
      'en': 'Head of Design',
      'ar': 'رئيس قسم التصميم',
      'de': 'Leiter Design',
      'es': 'Jefe de Diseño',
    },
    'zm0lhm2a': {
      'en': '[Time Stamp]',
      'ar': '[الطابع الزمني]',
      'de': '[Zeitstempel]',
      'es': '[Marca de tiempo]',
    },
    'cibd5rqo': {
      'en': '+ Add Report',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qutt9ik0': {
      'en': 'In this section report the problem solved. ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qnfpdbpa': {
      'en': 'View Reports',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lbmqucda': {
      'en': 'View the history of reports here.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8hu2v2im': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // Report_DELETE
  {
    'pozov0xz': {
      'en': 'Delete Report',
      'ar': 'حذف الميزانية',
      'de': 'Budget löschen',
      'es': 'Eliminar presupuesto',
    },
    'aptjmof0': {
      'en':
          'If you delete this report, the coordinator will be able to see it.',
      'ar': 'إذا حذفت هذه الميزانية ، فلن تكون معاملاتك مرتبطة بها بعد الآن.',
      'de':
          'Wenn Sie dieses Budget löschen, sind Ihre Transaktionen nicht mehr damit verknüpft.',
      'es':
          'Si elimina este presupuesto, sus transacciones ya no estarán asociadas a él.',
    },
    '9l7pbjcj': {
      'en': 'Delete Report',
      'ar': 'حذف الميزانية',
      'de': 'Budget löschen',
      'es': 'Eliminar presupuesto',
    },
    'b1xp801p': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // AdminUS
  {
    'hhb6veym': {
      'en': 'Manage Users',
      'ar': 'رصيد المحفظة',
      'de': 'Wallet-Guthaben',
      'es': 'Saldo de la cartera',
    },
    'r04m9nxs': {
      'en': 'Add/edit US',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    '8nac51xz': {
      'en': 'Edit Client',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'opob20j8': {
      'en': 'Support User #234',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Soloña',
    },
    'fi3cleyj': {
      'en': '1200',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '606emxw1': {
      'en': '40% of task assigned',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    'qx0ykpbm': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2jj7etyi': {
      'en': 'User #234',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Soloña',
    },
    '4nzkvuyh': {
      'en': '1200',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    'fbwq2hpa': {
      'en': '40% of task assigned',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    'l3udwk3h': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lnfiek3s': {
      'en': 'User #234',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Soloña',
    },
    'kd8scbn0': {
      'en': '1200',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '7g5lcbk6': {
      'en': '40% of task assigned',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    'ab7d4hgt': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vox9t1s0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // AdminSupportUser
  {
    't38quocn': {
      'en': 'Edit Information',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd5toea6h': {
      'en': '[User name]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ynsn43or': {
      'en': '[email]',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9smam40i': {
      'en': '[password]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pcqwygnu': {
      'en': '[id user]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uqse37yu': {
      'en': 'Start Date',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6azpbzqd': {
      'en': 'Start Time',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eekl9itl': {
      'en': 'Edit Information',
      'ar': '',
      'de': '',
      'es': '',
    },
    'abncckzx': {
      'en': 'Delete User',
      'ar': '',
      'de': '',
      'es': '',
    },
    'blt94kii': {
      'en': 'Please enter the patients full name.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3yxrw9et': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6v6jknmt': {
      'en': 'Please enter an age for the patient.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fm6ykel1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3lt5g1bj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hhrouvgy': {
      'en': 'Please enter the date of birth of the patient.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7l5t9jvr': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '22efzyn0': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qzfqphk7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '522ycq9d': {
      'en': 'Manage US profile',
      'ar': '',
      'de': '',
      'es': '',
    },
    'svvwurbo': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // SearchSupportUser
  {
    'xthikzer': {
      'en': 'Manage Support',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y2mx398v': {
      'en': 'Search user',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pq4yjq8v': {
      'en': 'Popular Users',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rtc70x6h': {
      'en': '[User name]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i7hbyuj4': {
      'en': '[user email]\n[user tittle]\n[number of task completes]\n[age]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'piylsgdw': {
      'en': 'View details',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2h84elsl': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // AdminClientUser
  {
    'yf5akt1q': {
      'en': 'Edit Information',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0n8gsenm': {
      'en': '[Client name]',
      'ar': '',
      'de': '',
      'es': '',
    },
    '95xzbaya': {
      'en': '[id client]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bp5dxwsm': {
      'en': 'Start Date',
      'ar': '',
      'de': '',
      'es': '',
    },
    'avt9w2hs': {
      'en': 'Start Time',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xrkccixf': {
      'en': 'Edit Information',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y2018jy2': {
      'en': 'Please enter the patients full name.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'knt1qjee': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ryt9vt7l': {
      'en': 'Please enter an age for the patient.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mlc5xccw': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kat1vsuh': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k920hz5m': {
      'en': 'Please enter the date of birth of the patient.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1oi31fnz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g8eeplys': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j5yhe2e3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mm2qmpcg': {
      'en': 'Manage Client Profile',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f0fpbda8': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // SearchClientUser
  {
    '062djigf': {
      'en': 'Manage Clients',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2m0s2ik2': {
      'en': 'Search user',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p0yiqfbc': {
      'en': 'Popular Users',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2bnbc42z': {
      'en': '[User name]',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2n4yi8xt': {
      'en': '\n[user email]\n[number of task completes]\n',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5yph39ze': {
      'en': 'View details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cmvo9men': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // bookAppointment
  {
    'sfzj3riz': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    '4skzh9os': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'b87tcas2': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'iicnw3dq': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    '5tkkg4yu': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '7w5m45zt': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'bmfmxg71': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'prt95f0g': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    '7ohalsg9': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'xukiv2ku': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'lpc88cht': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'b5umyycx': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // bookingOld
  {
    '8laf5zmk': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    'udwhsu8p': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'm6f5lawq': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'yz52729g': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'hdmqdmzq': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    'stpxpct6': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'wvgk6obb': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'xt7ujyt8': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'andpn0t0': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'ycaso9dc': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    '2pmd2p3w': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    '13j05r8j': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // editBooking
  {
    '6j668hma': {
      'en': 'Edit Appointment',
      'ar': 'تحرير موعد',
      'de': 'Termin bearbeiten',
      'es': 'Editar cita',
    },
    'cbp936ta': {
      'en': 'Edit the fields below in order to change your appointment.',
      'ar': 'قم بتحرير الحقول أدناه لتغيير موعدك.',
      'de': 'Bearbeiten Sie die Felder unten, um Ihren Termin zu ändern.',
      'es': 'Edite los campos a continuación para cambiar su cita.',
    },
    '6btfslje': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'mhko6q8p': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'shqcgjqe': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '5ixhbnsd': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'db46hhfw': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'e1zm6kzh': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'oy6qvd33': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    '9emhgrhs': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija Fecha',
    },
    '2bzoinpy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'gjnq0j86': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
