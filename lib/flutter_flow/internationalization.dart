import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sl', 'es'];

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
    String? slText = '',
    String? esText = '',
  }) =>
      [enText, slText, esText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // create_account
  {
    'hma5gxno': {
      'en': 'Trampuž warehouse',
      'es': 'Almacén Trampuž',
      'sl': 'Skladišče Trampuž',
    },
    'h4z0a3z3': {
      'en': 'Create an account',
      'es': 'Crea una cuenta',
      'sl': 'Ustvari račun',
    },
    'vyc1ujqk': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Comencemos completando el formulario a continuación.',
      'sl': 'Začnimo z izpolnitvijo spodnjega obrazca.',
    },
    '86s8kzxx': {
      'en': 'Name',
      'es': 'Nombre',
      'sl': 'Ime',
    },
    'iirmn0zw': {
      'en': 'Last name',
      'es': 'Apellido',
      'sl': 'Priimek',
    },
    '889gd7ck': {
      'en': 'User type',
      'es': 'Tipo de usuario',
      'sl': 'Vrsta uporabnika',
    },
    '2is4mjzb': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '99r8wugx': {
      'en': 'administrator',
      'es': 'administrator',
      'sl': 'administrator',
    },
    'jw8uoqy2': {
      'en': 'employee',
      'es': 'employee',
      'sl': 'employee',
    },
    '2lk9a7co': {
      'en': 'superadmin',
      'es': 'superadmin',
      'sl': 'superadmin',
    },
    'ui7rta8c': {
      'en': 'Status',
      'es': 'Estado',
      'sl': 'Stanje',
    },
    'txcpsr93': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'dqqkgfoq': {
      'en': 'active',
      'es': 'active',
      'sl': 'active',
    },
    'kgxxej2s': {
      'en': 'inactive',
      'es': 'inactive',
      'sl': 'inactive',
    },
    '617idpiw': {
      'en': 'Photo',
      'es': 'Foto',
      'sl': 'Fotografija',
    },
    'ec3kgh69': {
      'en': 'Job role',
      'es': 'Puesto de trabajo',
      'sl': 'Delovna vloga',
    },
    'kjxck9ix': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'sl': 'E-naslov',
    },
    '7w95o0si': {
      'en': 'Password',
      'es': 'Contraseña',
      'sl': 'Geslo',
    },
    'oxnb6qlg': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'sl': 'potrdi geslo',
    },
    'e7x3js7r': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'sl': 'Ustvari račun',
    },
    'dpf4qbt5': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
      'sl': 'Že imate račun?',
    },
    '2ugy5uag': {
      'en': '  Sign In here',
      'es': 'Firme aquí',
      'sl': 'Prijavite se tukaj',
    },
    'qbuzwfrg': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'qextis7e': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    'b4h2xe93': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'y5z9nlac': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    'wvmon1ja': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    '7dzc0vda': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    'oa53wqny': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'ygtm5rh2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    'oc3ogl6u': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'yhqpvm48': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    'wz4omj7v': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    '29tsnkk4': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    '8b5ekxog': {
      'en': 'Home',
      'es': 'Hogar',
      'sl': 'domov',
    },
  },
  // login
  {
    'xbr8v6ey': {
      'en': 'Welcome Back',
      'es': 'Bienvenido de nuevo',
      'sl': 'Dobrodošel nazaj',
    },
    'rs4dwwg2': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Comencemos completando el formulario a continuación.',
      'sl': 'Začnimo z izpolnitvijo spodnjega obrazca.',
    },
    'hw9fduru': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'sl': 'E-naslov',
    },
    'ltkqidid': {
      'en': 'Password',
      'es': 'Contraseña',
      'sl': 'Geslo',
    },
    'ahqc4aox': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'sl': 'Prijava',
    },
    'bsw4hd4t': {
      'en': 'Home',
      'es': 'Hogar',
      'sl': 'domov',
    },
  },
  // users
  {
    '4jqoquse': {
      'en': 'Trampuž',
      'es': 'Trampuz',
      'sl': 'Trampuž',
    },
    '8fwhjzmc': {
      'en': 'Reports',
      'es': 'Informes',
      'sl': 'Poročila',
    },
    '04dk6qvh': {
      'en': 'Order warehouse',
      'es': 'Almacén de pedidos',
      'sl': 'Naročila',
    },
    'za21j1f4': {
      'en': 'Warehouse 2',
      'es': 'Almacén 2',
      'sl': 'Skladišče',
    },
    'cujche2h': {
      'en': 'Calendar',
      'es': 'Calendario',
      'sl': 'Koledar',
    },
    'e2dey9vb': {
      'en': 'Settings',
      'es': 'Ajustes',
      'sl': 'nastavitve',
    },
    'yib8xul7': {
      'en': 'Users',
      'es': 'Usuarios',
      'sl': 'Uporabniki',
    },
    'xsvkgu9p': {
      'en': 'Explore',
      'es': 'Explorar',
      'sl': 'Podatki',
    },
    'pww61gn0': {
      'en': 'Users',
      'es': 'Usuarios',
      'sl': 'Uporabniki',
    },
    'dxa0ddlv': {
      'en': 'Users',
      'es': 'Usuarios',
      'sl': 'Uporabniki',
    },
    '0inci51p': {
      'en': 'Create account',
      'es': 'Crear una cuenta',
      'sl': 'Ustvari račun',
    },
    'w3t1ro5y': {
      'en': 'Below are the details of your available users.',
      'es':
          'A continuación se muestran los detalles de sus usuarios disponibles.',
      'sl': 'Spodaj so podrobnosti vaših razpoložljivih uporabnikov.',
    },
    '35m2g51k': {
      'en': 'Id',
      'es': 'Identificación',
      'sl': 'Id',
    },
    '2tbhql7j': {
      'en': 'Created time',
      'es': 'Hora de creación',
      'sl': 'Ustvarjen čas',
    },
    'mh9vrq5g': {
      'en': 'Full name',
      'es': 'Nombre completo',
      'sl': 'Polno ime',
    },
    'mvh0j0ys': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'sl': 'E-naslov',
    },
    '8cvb8jex': {
      'en': 'User type',
      'es': 'Tipo de usuario',
      'sl': 'Vrsta uporabnika',
    },
    '1iu2936f': {
      'en': 'Status',
      'es': 'Estado',
      'sl': 'Stanje',
    },
    'ch5dldsy': {
      'en': 'Job role',
      'es': 'Puesto de trabajo',
      'sl': 'Delovna vloga',
    },
    'dl4ag5nq': {
      'en': 'Password',
      'es': 'Contraseña',
      'sl': 'Geslo',
    },
    '7wv4l9ei': {
      'en': 'Image',
      'es': 'Imagen',
      'sl': 'Slika',
    },
    '17xi50wo': {
      'en': 'Edit',
      'es': 'Editar',
      'sl': 'Uredi',
    },
    '4lda3i2a': {
      'en': 'Order Details',
      'es': 'Detalles del pedido',
      'sl': 'podrobnosti naročila',
    },
  },
  // warehouse2
  {
    'c79jd9mp': {
      'en': 'Trampuž',
      'es': 'Trampuz',
      'sl': 'Trampuž',
    },
    'herxqh9m': {
      'en': 'Reports',
      'es': 'Informes',
      'sl': 'Poročila',
    },
    'q3z2kzhq': {
      'en': 'Order warehouse',
      'es': 'Almacén de pedidos',
      'sl': 'Naročila',
    },
    '9xz0x26y': {
      'en': 'Warehouse 2',
      'es': 'Almacén 2',
      'sl': 'Skladišče',
    },
    'abhnwadp': {
      'en': 'Calendar',
      'es': 'Calendario',
      'sl': 'Koledar',
    },
    'onsxf48i': {
      'en': 'Settings',
      'es': 'Ajustes',
      'sl': 'nastavitve',
    },
    'r8wv2y24': {
      'en': 'Users',
      'es': 'Usuarios',
      'sl': 'Uporabniki',
    },
    '5vf7vs5q': {
      'en': 'Explore',
      'es': 'Explorar',
      'sl': 'Podatki',
    },
    'uqmisslm': {
      'en': 'Warehouse 2',
      'es': 'Almacén 2',
      'sl': 'Skladišče',
    },
    'gewq9u1w': {
      'en': 'Movements',
      'es': 'Movimientos',
      'sl': 'Naročila',
    },
    'pkwucw9j': {
      'en': 'Below are the details of your inventory movements.',
      'es':
          'A continuación se muestran los detalles de sus movimientos de inventario.',
      'sl': 'Podatki vseh naročil.',
    },
    'lzzntp6o': {
      'en': 'Updates:',
      'es': 'Actualizaciones:',
      'sl': 'Posodobitve:',
    },
    '4btj9d1k': {
      'en': 'Search',
      'es': 'Buscar',
      'sl': 'Iskati',
    },
    '91itryis': {
      'en': 'Reset filters',
      'es': 'Reset filtros',
      'sl': 'Ponastavi filtre',
    },
    'fpybr0sz': {
      'en': 'Inventory status',
      'es': 'Estado de inventario',
      'sl': 'Stanje zalog',
    },
    '793l94ba': {
      'en': 'Order No.',
      'es': 'N º de pedido.',
      'sl': 'Številka naročila.',
    },
    'ragnfncj': {
      'en': 'Client',
      'es': 'Cliente',
      'sl': 'Stranka',
    },
    'z6kin5ny': {
      'en': 'Warehouse...',
      'es': 'Depósito...',
      'sl': 'Skladišče...',
    },
    '50vl3gta': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'e3klgouf': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    't14hhudl': {
      'en': 'Order no',
      'es': 'Order no',
      'sl': 'Številka naročila',
    },
    '8nsyuubu': {
      'en': 'Order status...',
      'es': 'Estado del pedido...',
      'sl': 'Status naročila...',
    },
    '2ucqsx1u': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'bro4fnz4': {
      'en': 'novo naročilo',
      'es': 'nuevo naročilo',
      'sl': 'novo naročilo',
    },
    'qvrflcba': {
      'en': 'priprava',
      'es': 'priprava',
      'sl': 'priprava',
    },
    '1j4tlqvy': {
      'en': 'izvajanje',
      'es': 'izvajanje',
      'sl': 'izvajanje',
    },
    'e8oggj7g': {
      'en': 'zaključeno',
      'es': 'zaključeno',
      'sl': 'zaključeno',
    },
    'mhbe33km': {
      'en': 'Flow...',
      'es': 'Fluir...',
      'sl': 'pretok...',
    },
    '84rlb004': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '9k268aaj': {
      'en': 'in',
      'es': 'in',
      'sl': 'in',
    },
    'atultzrw': {
      'en': 'out',
      'es': 'out',
      'sl': 'out',
    },
    '6sa5yw3i': {
      'en': '/',
      'es': '/',
      'sl': '/',
    },
    'oz83wu3b': {
      'en': ' : ',
      'es': ':',
      'sl': ':',
    },
    '31a0tduz': {
      'en': 'Licence',
      'es': 'Licencia',
      'sl': 'REG. ŠTEVILKA',
    },
    '7e6fh3im': {
      'en': 'Improvement',
      'es': 'Mejora',
      'sl': 'Nadgrad',
    },
    '2gkrhee6': {
      'en': 'Search for an item...',
      'es': '',
      'sl': '',
    },
    '1wf426a5': {
      'en': 'kont.-20\"',
      'es': '',
      'sl': '',
    },
    'c3pssq17': {
      'en': 'kont.-40\"',
      'es': '',
      'sl': '',
    },
    '35njsoh5': {
      'en': 'kont.-45\"',
      'es': '',
      'sl': '',
    },
    '4sekid6j': {
      'en': 'cerada',
      'es': '',
      'sl': '',
    },
    't9hc0b5f': {
      'en': 'hladilnik',
      'es': '',
      'sl': '',
    },
    '3sxi518z': {
      'en': 'silos',
      'es': '',
      'sl': '',
    },
    'vlchl4eg': {
      'en': '/',
      'es': '',
      'sl': '',
    },
    'esgnf4ug': {
      'en': 'Container no',
      'es': 'Contenedor',
      'sl': 'Posoda št',
    },
    'b78itnx2': {
      'en': 'Ramp',
      'es': 'Rampa',
      'sl': 'Rampa',
    },
    'crv76qym': {
      'en': 'Load ref dvh',
      'es': 'Ref, 3',
      'sl': 'REF. 3',
    },
    '13ksyjsf': {
      'en': 'Q1',
      'es': '',
      'sl': '',
    },
    'v66fmowi': {
      'en': ' : ',
      'es': '',
      'sl': '',
    },
    'u0a99ktw': {
      'en': 'Q2',
      'es': '',
      'sl': '',
    },
    '6xzvhd5f': {
      'en': 'Packaging...',
      'es': '',
      'sl': '',
    },
    '7ob2a9ss': {
      'en': 'Search for an item...',
      'es': '',
      'sl': '',
    },
    'bodp6n5r': {
      'en': 'Option 1',
      'es': '',
      'sl': '',
    },
    'r4ttalz8': {
      'en': 'Custom...',
      'es': '',
      'sl': '',
    },
    '4pj365he': {
      'en': 'Search for an item...',
      'es': '',
      'sl': '',
    },
    '3b9cnxpw': {
      'en': 'Option 1',
      'es': '',
      'sl': '',
    },
    'qvk5jx1r': {
      'en': 'Int custom',
      'es': 'Aduana int.',
      'sl': 'ŠT.CAR. DOK.',
    },
    '3yqz4p50': {
      'en': 'Edit',
      'es': 'Editar',
      'sl': 'Uredi',
    },
    'nz9524ak': {
      'en': 'Copy',
      'es': 'Copiar',
      'sl': 'Kopirati',
    },
    '0epfhvwi': {
      'en': 'Print',
      'es': 'Editar',
      'sl': 'Uredi',
    },
    'ekjkfh1o': {
      'en': 'Details',
      'es': 'Detalles',
      'sl': 'Podrobnosti',
    },
    'hkhvwlax': {
      'en': 'Warehouse',
      'es': 'Depósito',
      'sl': 'SKLAD.',
    },
    'tqt0eper': {
      'en': 'Order No.',
      'es': 'N º de pedido.',
      'sl': 'ŠT. NAR.',
    },
    'd44sn4k3': {
      'en': 'Client',
      'es': 'Cliente',
      'sl': 'Stranka',
    },
    'c65fsm2p': {
      'en': 'Order status',
      'es': 'Estado del pedido',
      'sl': 'STAT.NAR.',
    },
    '95c1guqt': {
      'en': 'Accept',
      'es': 'Aceptar',
      'sl': 'Sprejmi',
    },
    'xh8akft5': {
      'en': 'Pre-Check',
      'es': 'Pre chequeo',
      'sl': 'Predhodno preverjanje',
    },
    'u4cf73iv': {
      'en': 'Check',
      'es': 'Controlar',
      'sl': 'Preverite',
    },
    '300djcxc': {
      'en': 'Flow',
      'es': 'Fluir',
      'sl': 'In/Out',
    },
    '0d2sas7m': {
      'en': 'Arrival date',
      'es': 'Fecha de llegada',
      'sl': 'Datum',
    },
    '5ysxyora': {
      'en': 'Time (Approx.)',
      'es': 'Tiempo (aprox.)',
      'sl': 'URA CCA.',
    },
    'agwkrr0h': {
      'en': 'Licence',
      'es': 'Licencia',
      'sl': 'REG. ŠTEVILKA',
    },
    'tuc8rkmb': {
      'en': 'Improvement',
      'es': 'Mejora',
      'sl': 'NADGRAD.',
    },
    'vb1ea58a': {
      'en': 'Container No.',
      'es': 'No contenedor.',
      'sl': 'ŠT. KONTEJNER',
    },
    'fjjmh97p': {
      'en': 'Arrival',
      'es': 'Llegada',
      'sl': 'Prihod',
    },
    'me92z6p6': {
      'en': 'Loading Gate',
      'es': 'Puerta de carga',
      'sl': 'RAMPA',
    },
    'xhhb6x3t': {
      'en': 'Load sequence',
      'es': 'Secuencia de carga',
      'sl': 'ZAP.ŠT.PRIH.',
    },
    '8z5e1rsa': {
      'en': 'Load ref dvh',
      'es': 'Cargar ref dvh',
      'sl': 'REF.3',
    },
    'ip3vuyir': {
      'en': 'Packaging',
      'es': 'embalaje',
      'sl': 'EMB.',
    },
    '9fz16ucw': {
      'en': 'Weight',
      'es': 'Peso',
      'sl': 'TEŽA/KG',
    },
    'dlz0f15v': {
      'en': 'Custom',
      'es': 'Costumbre',
      'sl': 'CAR.POST.',
    },
    'rfp36rji': {
      'en': 'Comment',
      'es': 'Comentario',
      'sl': 'KOMENTAR RAZNO',
    },
    'zfam4qo2': {
      'en': 'Documents',
      'es': 'Documentos',
      'sl': 'Dok.',
    },
    '55h6r8x9': {
      'en': 'Admin',
      'es': 'Administración',
      'sl': 'Uporabnik',
    },
    'xz4dl6v2': {
      'en': 'Int custom',
      'es': 'Aduana int.',
      'sl': 'ŠT.CAR. DOK.',
    },
    '3ndo5buw': {
      'en': 'Create new record',
      'es': 'Crear nuevo registro',
      'sl': 'Novo naročilo',
    },
  },
  // explore
  {
    'jmbjo6gt': {
      'en': 'Trampuž',
      'es': 'Trampuz',
      'sl': 'Trampuž',
    },
    'yp8ed6x3': {
      'en': 'Reports',
      'es': 'Informes',
      'sl': 'Poročila',
    },
    'kzzdt5g6': {
      'en': 'Order warehouse',
      'es': 'Almacén de pedidos',
      'sl': 'Naročila',
    },
    '2apulfqc': {
      'en': 'Warehouse 2',
      'es': 'Almacén 2',
      'sl': 'Skladišče',
    },
    'fj8bla5j': {
      'en': 'Calendar',
      'es': 'Calendario',
      'sl': 'Koledar',
    },
    'kjn32hsn': {
      'en': 'Settings',
      'es': 'Ajustes',
      'sl': 'nastavitve',
    },
    'xfut7kxz': {
      'en': 'Users',
      'es': 'Usuarios',
      'sl': 'Uporabniki',
    },
    'xzbclzca': {
      'en': 'Explore',
      'es': 'Explorar',
      'sl': 'Podatki',
    },
    'qn4hiip7': {
      'en': 'Explore',
      'es': 'Explorar',
      'sl': 'Podatki',
    },
    '70sojiw8': {
      'en': 'Static tables',
      'es': 'tablas estáticas',
      'sl': 'Statične tabele',
    },
    '2qgg50no': {
      'en': 'Below are the details of your static tables.',
      'es': 'A continuación se muestran los detalles de sus tablas estáticas.',
      'sl': 'Spodaj so podrobnosti vaših statičnih tabel.',
    },
    'vxsfzvqg': {
      'en': 'Refresh tables',
      'es': 'Actualizar tablas',
      'sl': 'Osveži tabele',
    },
    '51h0n2ji': {
      'en': 'Warehouses',
      'es': 'Almacenes',
      'sl': 'SKLAD.',
    },
    '7edbksh3': {
      'en': 'Warehouse',
      'es': 'Depósito',
      'sl': 'SKLAD.',
    },
    'n04rcicr': {
      'en': 'Clients',
      'es': 'Clientela',
      'sl': 'Stranke',
    },
    'kn8z4zmk': {
      'en': 'Client',
      'es': 'Cliente',
      'sl': 'Stranka',
    },
    'nf9pfdmm': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'sl': 'Naslov',
    },
    'jj9gq5l5': {
      'en': 'City',
      'es': 'Ciudad',
      'sl': 'Mesto',
    },
    'vo6vujav': {
      'en': 'Country',
      'es': 'País',
      'sl': 'Država',
    },
    '6vbkf8db': {
      'en': 'Name aiss',
      'es': 'nombre aiss',
      'sl': 'Ime aiss',
    },
    'ce3ze44x': {
      'en': 'Vat no',
      'es': 'IVA no',
      'sl': 'DDV št',
    },
    'l681o904': {
      'en': 'Customs',
      'es': 'Aduanas',
      'sl': 'CAR.POST.',
    },
    '6al7qlnh': {
      'en': 'Custom',
      'es': 'Costumbre',
      'sl': 'Po meri',
    },
    'qjp3n2kp': {
      'en': 'Goods',
      'es': 'Bienes',
      'sl': 'BLAGO',
    },
    'f0h08w8g': {
      'en': 'Good',
      'es': 'Bien',
      'sl': 'Dobro',
    },
    'vj3tfbys': {
      'en': 'Good descriptions',
      'es': 'Buenas descripciones',
      'sl': 'OPIS BLAGA',
    },
    'ulbprri0': {
      'en': 'Good description',
      'es': 'Buena descripción',
      'sl': 'Dober opis',
    },
    'nn518qwk': {
      'en': 'Packagings',
      'es': 'Embalajes',
      'sl': 'EMB.',
    },
    'tkwn2ymj': {
      'en': 'Packaging',
      'es': 'embalaje',
      'sl': 'Pakiranje',
    },
    'srfb3a9b': {
      'en': 'Abreviation',
      'es': 'Abreviatura',
      'sl': 'Okrajšava',
    },
    'vfgoswxs': {
      'en': 'Manipulations',
      'es': 'Manipulaciones',
      'sl': 'MANIPULACIJA',
    },
    'it5cqdjv': {
      'en': 'Manipulation',
      'es': 'Manipulación',
      'sl': 'Manipulacija',
    },
    'bt0i7sba': {
      'en': 'Order Details',
      'es': 'Detalles del pedido',
      'sl': 'podrobnosti naročila',
    },
  },
  // calendar
  {
    'pccjrsyx': {
      'en': 'Trampuž',
      'es': 'Trampuz',
      'sl': 'Trampuž',
    },
    'e81lwjk0': {
      'en': 'Reports',
      'es': 'Informes',
      'sl': 'Poročila',
    },
    'r2yzm09a': {
      'en': 'Order warehouse',
      'es': 'Almacén de pedidos',
      'sl': 'Naročila',
    },
    'dr5xxudp': {
      'en': 'Warehouse 2',
      'es': 'Almacén 2',
      'sl': 'Skladišče',
    },
    '38h9lzty': {
      'en': 'Calendar',
      'es': 'Calendario',
      'sl': 'Koledar',
    },
    'z9acdbvy': {
      'en': 'Settings',
      'es': 'Ajustes',
      'sl': 'nastavitve',
    },
    '1fryj9i0': {
      'en': 'Users',
      'es': 'Usuarios',
      'sl': 'Uporabniki',
    },
    'dt3rvtis': {
      'en': 'Explore',
      'es': 'Explorar',
      'sl': 'Podatki',
    },
    'xi5pl87s': {
      'en': 'Calendar',
      'es': 'Calendario',
      'sl': 'Koledar',
    },
    '081bbeg6': {
      'en': 'Upcoming appointments.',
      'es': 'Próximas citas.',
      'sl': 'Prihajajoči sestanki.',
    },
    'hjdhyanu': {
      'en': 'Below are the details of your nearest scheduled appointments.',
      'es':
          'A continuación se muestran los detalles de sus citas programadas más cercanas.',
      'sl': 'Spodaj so podrobnosti o vaših najbližjih načrtovanih terminih.',
    },
    'hvgqwx33': {
      'en': 'Refresh manually',
      'es': 'Actualizar manualmente',
      'sl': 'Osveži ročno',
    },
    '3szriht0': {
      'en': 'Search',
      'es': 'Buscar',
      'sl': 'Iskati',
    },
    'hnmx914k': {
      'en': 'Warehouse...',
      'es': 'Depósito...',
      'sl': 'Skladišče...',
    },
    '2i4u5g3o': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'm1tv1qol': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    '52x557ef': {
      'en': 'Edit',
      'es': 'Editar',
      'sl': 'Uredi',
    },
    'oo7fg7qp': {
      'en': 'Details',
      'es': 'Detalles',
      'sl': 'Podrobnosti',
    },
    '0qdej7mg': {
      'en': 'Warehouse',
      'es': 'Depósito',
      'sl': 'SKLAD.',
    },
    'h5rlrezl': {
      'en': 'Order No.',
      'es': 'N º de pedido.',
      'sl': 'ŠT. NAR.',
    },
    '1psxt20c': {
      'en': 'Client',
      'es': 'Cliente',
      'sl': 'Stranka',
    },
    '3vvz8g49': {
      'en': 'Flow',
      'es': 'Fluir',
      'sl': 'In/Out',
    },
    'fl6dgwma': {
      'en': 'Order status',
      'es': 'Estado del pedido',
      'sl': 'STAT.NAR.',
    },
    'vqgn58gs': {
      'en': 'Time (Approx.)',
      'es': 'Tiempo (aprox.)',
      'sl': 'URA CCA.',
    },
    '84djow45': {
      'en': 'Licence',
      'es': 'Licencia',
      'sl': 'REG. ŠTEVILKA',
    },
    'qytldwpg': {
      'en': 'Improvement',
      'es': 'Mejora',
      'sl': 'NADGRAD.',
    },
    'oxl7id7w': {
      'en': 'Weight',
      'es': 'Peso',
      'sl': 'TEŽA/KG',
    },
    'hr3ga2j0': {
      'en': 'Admin',
      'es': 'Administración',
      'sl': 'UPORABNIK',
    },
  },
  // reports
  {
    'yakl8w1o': {
      'en': 'Trampuž',
      'es': 'Trampuz',
      'sl': 'Trampuž',
    },
    '7uqhp8pp': {
      'en': 'Reports',
      'es': 'Informes',
      'sl': 'Poročila',
    },
    'i1pfz7zq': {
      'en': 'Order warehouse',
      'es': 'Almacén de pedidos',
      'sl': 'Naročila',
    },
    'et4sokhi': {
      'en': 'Warehouse 2',
      'es': 'Almacén 2',
      'sl': 'Skladišče',
    },
    'wywtkc0i': {
      'en': 'Calendar',
      'es': 'Calendario',
      'sl': 'Koledar',
    },
    '18763ku5': {
      'en': 'Settings',
      'es': 'Ajustes',
      'sl': 'nastavitve',
    },
    'e9bl6o82': {
      'en': 'Users',
      'es': 'Usuarios',
      'sl': 'Uporabniki',
    },
    'atnu4jxq': {
      'en': 'Explore',
      'es': 'Explorar',
      'sl': 'Podatki',
    },
    'fcpvqdd4': {
      'en': 'Reports',
      'es': 'Informes',
      'sl': 'Poročila',
    },
    'xcnmxdqs': {
      'en': 'Reports',
      'es': 'Informes',
      'sl': 'Poročila',
    },
    'x6z5lxox': {
      'en':
          'Here you have the general and stock report of your inventory movements.',
      'es':
          'Aquí tienes el informe general y de stock de tus movimientos de inventario.',
      'sl': 'Tukaj imate splošno poročilo in poročilo o stanju zalog.',
    },
    '4nd2o6gw': {
      'en': 'Updates:',
      'es': 'Actualizaciones:',
      'sl': 'Posodobitve:',
    },
    'aiynpwsa': {
      'en': 'Search',
      'es': 'Buscar',
      'sl': 'Iskati',
    },
    'a6w8pdi9': {
      'en': 'Reset filters',
      'es': 'Reset filtros',
      'sl': 'Ponastavi filtre',
    },
    'h90z5128': {
      'en': 'General report',
      'es': 'informe general',
      'sl': 'Splošno poročilo',
    },
    'puejuiye': {
      'en': ' : ',
      'es': ':',
      'sl': ':',
    },
    '3ho1b072': {
      'en': 'Flow...',
      'es': 'Fluir...',
      'sl': 'In/Out...',
    },
    'qzxhechl': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'coftigh0': {
      'en': 'in',
      'es': 'in',
      'sl': 'in',
    },
    '52sq369l': {
      'en': 'out',
      'es': 'out',
      'sl': 'out',
    },
    'v0wukty2': {
      'en': '/',
      'es': '/',
      'sl': '/',
    },
    'w8jpzl3k': {
      'en': 'Licence',
      'es': '',
      'sl': '',
    },
    '91d01uq3': {
      'en': 'Improvement...',
      'es': 'Mejora...',
      'sl': 'Izboljšava...',
    },
    'tjcjineb': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'i2kiwnp4': {
      'en': 'kont.-20\"',
      'es': 'conector-20\"',
      'sl': 'kont.-20\"',
    },
    'v5wy8v7m': {
      'en': 'kont.-40\"',
      'es': 'conector-40\"',
      'sl': 'kont.-40\"',
    },
    'qol0zt3l': {
      'en': 'kont.-45\"',
      'es': 'conector-45\"',
      'sl': 'kont.-45\"',
    },
    'u8wiw2t0': {
      'en': 'cerada',
      'es': 'cerada',
      'sl': 'cerada',
    },
    'b7iw65ay': {
      'en': 'hladilnik',
      'es': 'hladilnik',
      'sl': 'hladilnik',
    },
    'uznf7vm0': {
      'en': 'silos',
      'es': 'silos',
      'sl': 'silosi',
    },
    'epe6jf3c': {
      'en': '/',
      'es': '/',
      'sl': '/',
    },
    'y9dw69hr': {
      'en': 'Container no',
      'es': '',
      'sl': '',
    },
    'bqccp7da': {
      'en': 'Universal ref num',
      'es': '',
      'sl': '',
    },
    '7gyenvii': {
      'en': 'FMS ref',
      'es': '',
      'sl': '',
    },
    'lsw1s220': {
      'en': 'Load ref dvh',
      'es': '',
      'sl': '',
    },
    '0ok7j8mg': {
      'en': 'Q1',
      'es': '',
      'sl': '',
    },
    '74ggfe4h': {
      'en': ' : ',
      'es': ':',
      'sl': ':',
    },
    'ver4j0jq': {
      'en': 'Q2',
      'es': '',
      'sl': '',
    },
    'pjyrwgzx': {
      'en': 'Packaging...',
      'es': 'Empaquetado...',
      'sl': 'EMB...',
    },
    'rt8sxze5': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'lkbi9a7t': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'luhd4lxr': {
      'en': 'W1',
      'es': '',
      'sl': '',
    },
    'dg3ae4rg': {
      'en': ' : ',
      'es': ':',
      'sl': ':',
    },
    'shhnnobf': {
      'en': 'W2',
      'es': '',
      'sl': '',
    },
    'zysgo73l': {
      'en': 'Good',
      'es': 'Buena descripción...',
      'sl': 'Dober opis...',
    },
    'zf14esit': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'fb7tmc40': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'r88txs3j': {
      'en': 'Loading type...',
      'es': 'Tipo de carga...',
      'sl': 'DELO Z...',
    },
    'jyn280dv': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '81cshm22': {
      'en': 'viličar',
      'es': 'Opción 1',
      'sl': 'viličar',
    },
    '369hdv0h': {
      'en': 'ročno',
      'es': 'ročno',
      'sl': 'ročno',
    },
    'mfj7h4z3': {
      'en': '/',
      'es': '/',
      'sl': '/',
    },
    'ir1knbgr': {
      'en': 'Manipulations...',
      'es': 'Manipulaciones...',
      'sl': 'Manipulacije...',
    },
    'duvs6owd': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'bb7t9nz0': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'hkjhkokq': {
      'en': 'Client',
      'es': 'Cliente',
      'sl': 'Stranka',
    },
    'kekfc6eg': {
      'en': 'Arrival Date',
      'es': 'Fecha de llegada',
      'sl': 'Datum',
    },
    'j0b3b1bh': {
      'en': 'Flow',
      'es': 'Fluir',
      'sl': 'IN/OUT',
    },
    'bbk1ht3g': {
      'en': 'Licence',
      'es': 'Licencia',
      'sl': 'REG. ŠTEVILKA',
    },
    'utyttd0v': {
      'en': 'Improvement',
      'es': 'Mejora',
      'sl': 'NADGRAD.',
    },
    'zqzx7dla': {
      'en': 'Container No.',
      'es': 'No contenedor.',
      'sl': 'ŠT. KONTEJNER',
    },
    'xq8wlt0n': {
      'en': 'Universal ref num',
      'es': 'Número de referencia universal',
      'sl': 'REF.1',
    },
    'm8ahl3iw': {
      'en': 'FMS ref',
      'es': 'FMS ref',
      'sl': 'REF.2',
    },
    'ef41n9x0': {
      'en': 'Load ref dvh',
      'es': 'Carga ref',
      'sl': 'REF.3',
    },
    'jrxcwct7': {
      'en': 'Packaging',
      'es': 'embalaje',
      'sl': 'EMB.',
    },
    'e3pmrlnn': {
      'en': 'Weight',
      'es': 'Peso',
      'sl': 'TEŽA/KG',
    },
    '2pr0riml': {
      'en': 'Good',
      'es': 'Bien',
      'sl': 'BLAGO',
    },
    '4j8frg1g': {
      'en': 'Good description',
      'es': 'Buena descripción',
      'sl': 'OPIS BLAGA',
    },
    'ze84nx05': {
      'en': 'Type of un/upload',
      'es': 'Tipo de descarga/descarga',
      'sl': 'DELO Z',
    },
    'k4802oaz': {
      'en': 'Other manipulations',
      'es': 'Otras manipulaciones',
      'sl': 'MANIPULACIJA',
    },
    '3pty1hz6': {
      'en': 'Documents',
      'es': '',
      'sl': '',
    },
    'ro3l2d4w': {
      'en': 'Order N°',
      'es': 'Número de orden',
      'sl': 'ŠT. NAROČILA',
    },
    'ocbbo07c': {
      'en': 'Custom',
      'es': 'Aduana',
      'sl': 'CAR.POST.',
    },
    'ahljt63q': {
      'en': 'Int custom',
      'es': 'Aduana int',
      'sl': 'ŠT.CAR.DOK.',
    },
    'lk2foi05': {
      'en': 'Stock report',
      'es': 'Informe de acciones',
      'sl': 'Poročilo o zalogah',
    },
    'q5ory8gd': {
      'en': ' : ',
      'es': ':',
      'sl': ':',
    },
    'x6cbapn0': {
      'en': 'Inv status...',
      'es': 'Estado de la invitación...',
      'sl': 'Stanje računa ...',
    },
    'itq4b9rp': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'kwg0eqpl': {
      'en': 'najava',
      'es': 'najavá',
      'sl': 'najava',
    },
    'k3fvsjs7': {
      'en': 'obdelava',
      'es': 'obdelava',
      'sl': 'obdelava',
    },
    'zt64rnsl': {
      'en': 'izdano',
      'es': 'izdano',
      'sl': 'izdano',
    },
    '1q3pfu3e': {
      'en': 'zaloga',
      'es': 'zaloga',
      'sl': 'zaloga',
    },
    'i5rk28c5': {
      'en': 'brez izbire',
      'es': 'brez izbire',
      'sl': 'brez izbire',
    },
    '7sc0jxmd': {
      'en': 'Container no',
      'es': '',
      'sl': '',
    },
    '0f6mofkd': {
      'en': 'Q1',
      'es': '',
      'sl': '',
    },
    '4opjt5wr': {
      'en': ' : ',
      'es': ':',
      'sl': ':',
    },
    '9s1g0w05': {
      'en': 'Q2',
      'es': '',
      'sl': '',
    },
    '2o3540tf': {
      'en': 'Packaging...',
      'es': 'Empaquetado...',
      'sl': 'EMB...',
    },
    'tizjlouh': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '1i3ufstk': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    '4x0gzgsb': {
      'en': 'W1',
      'es': '',
      'sl': '',
    },
    'zcp0084v': {
      'en': ' : ',
      'es': ':',
      'sl': ':',
    },
    '9nsgzlio': {
      'en': 'W2',
      'es': '',
      'sl': '',
    },
    '7shgtldo': {
      'en': 'Good...',
      'es': 'Bien...',
      'sl': 'dobro...',
    },
    'vgwp3mus': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'odovfeuh': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'w9uulmsc': {
      'en': 'Client',
      'es': 'Cliente',
      'sl': 'Stranka',
    },
    'gaco1k8c': {
      'en': 'Arrival Date',
      'es': 'Fecha de llegada',
      'sl': 'Datum',
    },
    'jkhm5g0t': {
      'en': 'Inventory status',
      'es': 'Estado de inventario',
      'sl': 'STAT. BLAG',
    },
    'pvaiwwpu': {
      'en': 'Container No.',
      'es': 'No contenedor.',
      'sl': 'ŠT. KONTEJNER',
    },
    '3qgnc5hv': {
      'en': 'Packaging',
      'es': 'embalaje',
      'sl': 'EMB.',
    },
    'gc8z373e': {
      'en': 'Weight',
      'es': 'Peso',
      'sl': 'TEŽA/KG',
    },
    '93m8rdj0': {
      'en': 'Good',
      'es': 'Bien',
      'sl': 'BLAGO',
    },
    'yrl7zpbo': {
      'en': 'Good description',
      'es': 'Buena descripción',
      'sl': 'OPIS BLAGA',
    },
    '8f9l2oap': {
      'en': 'Documents',
      'es': '',
      'sl': '',
    },
  },
  // order_warehouse
  {
    'pndo8yxo': {
      'en': 'Trampuž',
      'es': 'Trampuz',
      'sl': 'Trampuž',
    },
    'lylin1wr': {
      'en': 'Reports',
      'es': 'Informes',
      'sl': 'Poročila',
    },
    'j602wsdt': {
      'en': 'Order warehouse',
      'es': 'Almacén de pedidos',
      'sl': 'Naročila',
    },
    'u09580ec': {
      'en': 'Warehouse 2',
      'es': 'Almacén 2',
      'sl': 'Skladišče',
    },
    'kgotqw8e': {
      'en': 'Calendar',
      'es': 'Calendario',
      'sl': 'Koledar',
    },
    'fyhezuql': {
      'en': 'Settings',
      'es': 'Ajustes',
      'sl': 'nastavitve',
    },
    '8q9xj2n2': {
      'en': 'Users',
      'es': 'Usuarios',
      'sl': 'Uporabniki',
    },
    'j7p06qzs': {
      'en': 'Explore',
      'es': 'Explorar',
      'sl': 'Podatki',
    },
    'n93kx1hi': {
      'en': 'Order warehouse',
      'es': 'Almacén de pedidos',
      'sl': 'Naročila',
    },
    't3kkdl4l': {
      'en': 'Movements',
      'es': 'Movimientos',
      'sl': 'Naročila',
    },
    'lajbsmm6': {
      'en': 'Below are the details of your inventory movements.',
      'es':
          'A continuación se muestran los detalles de sus movimientos de inventario.',
      'sl': 'Podatki vseh naročil.',
    },
    'khb7ecz2': {
      'en': 'Updates:',
      'es': 'Actualizaciones:',
      'sl': 'Posodobitve:',
    },
    't3xb6dv5': {
      'en': 'Search',
      'es': 'Buscar',
      'sl': 'Iskati',
    },
    'ls98mfhq': {
      'en': 'Reset filters',
      'es': 'Reset filtros',
      'sl': 'Ponastavi filtre',
    },
    'p1aro1bt': {
      'en': 'Inventory status',
      'es': 'Estado de inventario',
      'sl': 'Stanje zalog',
    },
    'ipet2wod': {
      'en': 'Order No.',
      'es': 'N º de pedido.',
      'sl': 'Številka naročila.',
    },
    'jwvc4zl3': {
      'en': 'Client',
      'es': 'Cliente',
      'sl': 'Stranka',
    },
    'usjnsdde': {
      'en': 'Available quantity',
      'es': 'Cantidad disponible',
      'sl': 'Razpoložljiva količina',
    },
    'y6figred': {
      'en': 'Order no',
      'es': 'Order no',
      'sl': 'Številka naročila',
    },
    'zg5cnw50': {
      'en': 'Inv status...',
      'es': 'Estado de la invitación...',
      'sl': 'Stanje računa ...',
    },
    '56mdwa1o': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    's1gz9iyl': {
      'en': 'najava',
      'es': 'najavá',
      'sl': 'najava',
    },
    'lk6ttrfd': {
      'en': 'obdelava',
      'es': 'obdelava',
      'sl': 'obdelava',
    },
    '0w46ds42': {
      'en': 'izdano',
      'es': 'izdano',
      'sl': 'izdano',
    },
    'xmwot4dv': {
      'en': 'zaloga',
      'es': 'zaloga',
      'sl': 'zaloga',
    },
    '5qfjvsw3': {
      'en': 'brez izbire',
      'es': 'brez izbire',
      'sl': 'brez izbire',
    },
    '7rq9qabv': {
      'en': 'Warehouse...',
      'es': 'Depósito...',
      'sl': 'Skladišče...',
    },
    'xw92a5vh': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '4c6kxkf1': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'ykwwni04': {
      'en': 'Order status...',
      'es': 'Estado del pedido...',
      'sl': 'Status naročila...',
    },
    'qkbziwpb': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '6zot6n9a': {
      'en': 'novo naročilo',
      'es': 'nuevo naročilo',
      'sl': 'novo naročilo',
    },
    'mrmzl0es': {
      'en': 'priprava',
      'es': 'priprava',
      'sl': 'priprava',
    },
    'szv0zyjs': {
      'en': 'izvajanje',
      'es': 'izvajanje',
      'sl': 'izvajanje',
    },
    'vtf9nwfi': {
      'en': 'zaključeno',
      'es': 'zaključeno',
      'sl': 'zaključeno',
    },
    '1drvvjof': {
      'en': ' : ',
      'es': '',
      'sl': '',
    },
    'ikmxfw89': {
      'en': 'Flow...',
      'es': 'Fluir...',
      'sl': 'pretok...',
    },
    '8mkelogw': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'csypsxs1': {
      'en': 'in',
      'es': 'in',
      'sl': 'in',
    },
    'dhkstw40': {
      'en': 'out',
      'es': 'out',
      'sl': 'out',
    },
    'ntr0ptby': {
      'en': '/',
      'es': '/',
      'sl': '/',
    },
    'pj4mrmfk': {
      'en': 'Licence',
      'es': 'Licencia',
      'sl': 'Licenca',
    },
    '7q0v2vxm': {
      'en': 'Improvement...',
      'es': 'Mejora...',
      'sl': 'Izboljšava...',
    },
    '1obbbitq': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    't83cuth8': {
      'en': 'kont.-20\"',
      'es': 'conector-20\"',
      'sl': 'kont.-20\"',
    },
    'fwy748pv': {
      'en': 'kont.-40\"',
      'es': 'conector-40\"',
      'sl': 'kont.-40\"',
    },
    'l819u54o': {
      'en': 'kont.-45\"',
      'es': 'conector-45\"',
      'sl': 'kont.-45\"',
    },
    'cn7vi467': {
      'en': 'cerada',
      'es': 'cerada',
      'sl': 'cerada',
    },
    'xj5l8wma': {
      'en': 'hladilnik',
      'es': 'hladilnik',
      'sl': 'hladilnik',
    },
    'jpse87u0': {
      'en': 'silos',
      'es': 'silos',
      'sl': 'silosi',
    },
    's73p3eyf': {
      'en': '/',
      'es': '/',
      'sl': '/',
    },
    'erto5js9': {
      'en': 'Container no',
      'es': 'Contenedor',
      'sl': 'Posoda št',
    },
    't2sfy091': {
      'en': 'Packaging...',
      'es': 'Empaquetados',
      'sl': 'Emb.',
    },
    '23kntqxi': {
      'en': 'Search for an item...',
      'es': '',
      'sl': '',
    },
    's0ehrupr': {
      'en': 'Option 1',
      'es': '',
      'sl': '',
    },
    'zdutof8e': {
      'en': 'Pallet position',
      'es': 'Posición de paleta',
      'sl': 'Položaj palete',
    },
    '3qxaz814': {
      'en': 'Universal ref num',
      'es': 'Universal ref',
      'sl': 'Ref. 1',
    },
    '7iiglt9e': {
      'en': 'FMS ref',
      'es': 'FMS ref',
      'sl': 'Ref. 2',
    },
    'l7lwni20': {
      'en': 'Load ref dvh',
      'es': 'Load ref dvh',
      'sl': 'Ref. 3',
    },
    'crfk6x04': {
      'en': 'Custom...',
      'es': 'Costumbre...',
      'sl': 'Po meri ...',
    },
    'iuip1zrq': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'vx0sady4': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    '6kcdoxun': {
      'en': 'Int custom',
      'es': 'Int custom',
      'sl': 'ŠT. CAR. DOK',
    },
    'h4h9rz1q': {
      'en': 'Good...',
      'es': 'Bien...',
      'sl': 'dobro...',
    },
    'nfklryns': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '631e83r7': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    '419v29wl': {
      'en': 'Assistant 1...',
      'es': 'Asistente 1...',
      'sl': 'Pomočnik 1...',
    },
    'eu3mu4ho': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'sct4fnxp': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'idg8wpf3': {
      'en': 'Assistant 2...',
      'es': 'Asistente 2...',
      'sl': 'Pomočnik 2...',
    },
    'kkqpx57b': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'ys883qcr': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'wrnkwoec': {
      'en': 'Admin...',
      'es': 'Administración...',
      'sl': 'skrbnik...',
    },
    'grnqn61y': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'lua0ja9h': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'nlpnr5vn': {
      'en': 'Barcode',
      'es': 'Código de barras',
      'sl': 'črtne kode ',
    },
    '4c0zejyr': {
      'en': 'Assistant 3...',
      'es': 'Asistente 3...',
      'sl': 'Pomočnik 3...',
    },
    'vss1fkup': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'qzbel4bp': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    '6q8hcgfp': {
      'en': 'Assistant 4...',
      'es': 'Asistente 4...',
      'sl': 'Pomočnik 4...',
    },
    '426zj3j5': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'c2mwaezc': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    '568zq24j': {
      'en': 'Assistant 5...',
      'es': 'Asistente 5...',
      'sl': 'Pomočnik 5...',
    },
    'vhwf96ur': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'zol3bg55': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'paolioc1': {
      'en': 'Assistant 6...',
      'es': 'Asistente 6...',
      'sl': 'Pomočnik 6...',
    },
    '0un47wx2': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'yvf8u8et': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'ud2h2jet': {
      'en': 'Edit',
      'es': 'Editar',
      'sl': 'Uredi',
    },
    'ya8o7wnk': {
      'en': 'Copy',
      'es': 'Copiar',
      'sl': 'Kopirati',
    },
    'prxdkc9p': {
      'en': 'Print',
      'es': 'Imprimir',
      'sl': 'Tiskanje',
    },
    'yrwztnm6': {
      'en': 'Details',
      'es': 'Detalles',
      'sl': 'Podro',
    },
    '8w3q52pp': {
      'en': 'Order No.',
      'es': 'N º de pedido.',
      'sl': 'ŠT. NAR.',
    },
    '54iuvccp': {
      'en': 'Client',
      'es': 'Cliente',
      'sl': 'Stranka',
    },
    'lcozyg6k': {
      'en': 'Inv status',
      'es': 'Estado de inversión',
      'sl': 'STAT. BLAG',
    },
    'u2ocxm3p': {
      'en': 'Accept',
      'es': 'Aceptar',
      'sl': 'Sprejmi',
    },
    'j28jp1bt': {
      'en': 'Pre-Check',
      'es': 'Pre chequeo',
      'sl': 'Predhodno preverjanje',
    },
    'r47v7zi7': {
      'en': 'Check',
      'es': 'Controlar',
      'sl': 'Preverite',
    },
    '643yrzrd': {
      'en': 'Warehouse',
      'es': 'Depósito',
      'sl': 'SKLAD.',
    },
    'okhckl15': {
      'en': 'Order status',
      'es': 'Estado del pedido',
      'sl': 'Status naročila',
    },
    'i9o78iev': {
      'en': 'Arrival Date',
      'es': 'Fecha de llegada',
      'sl': 'Datum',
    },
    'heqnq0dm': {
      'en': 'Flow',
      'es': 'Fluir',
      'sl': 'In/Out',
    },
    'i4t3xduq': {
      'en': 'Time (Approx.)',
      'es': 'Tiempo (aprox.)',
      'sl': 'URA CCA.',
    },
    'ygv7bb1m': {
      'en': 'Licence',
      'es': 'Licencia',
      'sl': 'REG. ŠTEVILKA',
    },
    '62esz4sh': {
      'en': 'Improvement',
      'es': 'Mejora',
      'sl': 'NADGRAD.',
    },
    '99tz36nz': {
      'en': 'Container No.',
      'es': 'No contenedor.',
      'sl': 'ŠT. KONTEJNER',
    },
    'v75povv7': {
      'en': 'Arrival',
      'es': 'Llegada',
      'sl': 'Prihod',
    },
    'oweythc5': {
      'en': 'Packaging',
      'es': 'embalaje',
      'sl': 'EMB.',
    },
    'ledcdxk4': {
      'en': 'Weight',
      'es': 'Peso',
      'sl': 'TEŽA/KG',
    },
    '143j6p4y': {
      'en': 'Pallet position',
      'es': 'Posición del palet',
      'sl': 'PAL.MESTA',
    },
    '9alk4ph8': {
      'en': 'Universal ref num',
      'es': 'Número de referencia universal',
      'sl': 'REF.1',
    },
    'zph5pysn': {
      'en': 'FMS ref',
      'es': 'referencia FMS',
      'sl': 'REF.2',
    },
    'iy9wrt91': {
      'en': 'Load ref dvh',
      'es': 'Cargar ref dvh',
      'sl': 'REF.3',
    },
    'uee1zop3': {
      'en': 'Custom',
      'es': 'Costumbre',
      'sl': 'CAR.POST.',
    },
    'o7wp664z': {
      'en': 'Int custom',
      'es': 'personalizado',
      'sl': 'ŠT. CAR. DOK.',
    },
    '4uo8ujno': {
      'en': 'Comment',
      'es': 'Comentario',
      'sl': 'KOMENTAR RAZNO',
    },
    'gqx7jlfr': {
      'en': 'Documents',
      'es': 'Documentos',
      'sl': 'Dok.',
    },
    'xozsddyk': {
      'en': 'Good',
      'es': 'Bien',
      'sl': 'BLAGO',
    },
    'uadxr1ie': {
      'en': 'Good description',
      'es': 'Descripción del bien',
      'sl': 'Opis blaga',
    },
    '2zm3w203': {
      'en': 'Type of un/upload',
      'es': 'Tipo de descarga/descarga',
      'sl': 'DELO Z',
    },
    'va39stkz': {
      'en': 'Other manipulations',
      'es': 'Otras manipulaciones',
      'sl': 'MANIPULACIJA',
    },
    'a0clcsn7': {
      'en': 'Responsible',
      'es': 'Responsable',
      'sl': 'ODG.SKL.',
    },
    'mxbpgo12': {
      'en': 'Assistant 1',
      'es': 'Asistente 1',
      'sl': 'SKLADIŠČNIK 1',
    },
    '1jxclypc': {
      'en': 'Assistant 2',
      'es': 'Asistente 2',
      'sl': 'SKLADIŠČNIK 2',
    },
    'ynsqfgfj': {
      'en': 'Admin',
      'es': 'Administración',
      'sl': 'UPORABNIK',
    },
    'g4u50bj4': {
      'en': 'Internal number - accounting',
      'es': 'Número interno - contabilidad',
      'sl': 'ŠT.NAR.ATOM',
    },
    'iwvj5kvk': {
      'en': 'Loading Gate',
      'es': 'Puerta de carga',
      'sl': 'RAMPA',
    },
    '2qw070lr': {
      'en': 'Loading gate sequence',
      'es': 'Secuencia de puerta de carga',
      'sl': 'ZAP.ŠT.PRIH.',
    },
    'i5cyhm3i': {
      'en': 'Assistant 3',
      'es': 'Asistente 3',
      'sl': 'SKLADIŠČNIK 3',
    },
    'ckt0bjg8': {
      'en': 'Assistant 4',
      'es': 'Asistente 4',
      'sl': 'SKLADIŠČNIK 4',
    },
    '9ic0y1ds': {
      'en': 'Assistant 5',
      'es': 'Asistente 5',
      'sl': 'SKLADIŠČNIK 5',
    },
    'ml51jxnx': {
      'en': 'Assistant 6',
      'es': 'Asistente 6',
      'sl': 'SKLADIŠČNIK 6',
    },
    'y1r5gz15': {
      'en': 'Start',
      'es': 'Comenzar',
      'sl': 'ZAČETEK',
    },
    'stcx8kjx': {
      'en': 'Stop',
      'es': 'Detener',
      'sl': 'KONEC',
    },
    'bnjlgu40': {
      'en': 'Date (order creation)',
      'es': 'Fecha (creación del pedido)',
      'sl': 'Datum (izdelava naročila)',
    },
    '6f81qh5n': {
      'en': 'Type of un/upload 2',
      'es': 'Tipo de descarga/descarga 2',
      'sl': 'DELO Z 2',
    },
    'ar1hpefe': {
      'en': 'Associated order',
      'es': 'Orden asociada',
      'sl': 'Povezano naročilo',
    },
    '1iscaxd6': {
      'en': 'Edit',
      'es': 'Editar',
      'sl': 'Uredi',
    },
    'r7wnmjno': {
      'en': 'Copy',
      'es': 'Copiar',
      'sl': 'Kopirati',
    },
    'qi20zqjt': {
      'en': 'Details',
      'es': 'Detalles',
      'sl': 'Podro',
    },
    'twn1d2c5': {
      'en': 'Delete',
      'es': 'Borrar',
      'sl': 'Izbriši',
    },
    'xsrlg6n0': {
      'en': 'Row',
      'es': 'Fila',
      'sl': 'Vrsti',
    },
    'sfuh8dl0': {
      'en': 'rows...',
      'es': '',
      'sl': '',
    },
    '8ssuu897': {
      'en': 'all',
      'es': 'all',
      'sl': 'all',
    },
    'olwk09ha': {
      'en': 'available',
      'es': 'available',
      'sl': 'available',
    },
    '7sys5903': {
      'en': 'disassociated',
      'es': 'disassociated',
      'sl': 'disassociated',
    },
    '59dfe1a7': {
      'en': 'error',
      'es': 'error',
      'sl': 'error',
    },
    '8h9bxrgw': {
      'en': 'all',
      'es': '',
      'sl': '',
    },
    '060myq9m': {
      'en': 'Create new record',
      'es': 'Crear nuevo registro',
      'sl': 'Novo naročilo',
    },
  },
  // details
  {
    'ej3c0qzx': {
      'en': 'Details',
      'es': 'Detalles',
      'sl': 'Podrobnosti',
    },
    'n91zm2rr': {
      'en': 'Orden No:',
      'es': 'Número de orden:',
      'sl': 'Naročilna št.:',
    },
    'pyz0k5rt': {
      'en': 'Select barcode...',
      'es': 'Seleccionar código de barras...',
      'sl': 'Izberite črtno kodo ...',
    },
    '34nyg3g4': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '719rj85w': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    '19723qox': {
      'en': 'Packaging',
      'es': 'embalaje',
      'sl': 'Pakiranje',
    },
    '5kdfhiqm': {
      'en': 'Warehouse position',
      'es': 'Posición del almacén',
      'sl': 'Položaj skladišča',
    },
    'nbpuiz1p': {
      'en': 'Barcode',
      'es': 'Código de barras',
      'sl': 'Črtna koda',
    },
    'yevxvs85': {
      'en': 'Check',
      'es': 'Controlar',
      'sl': 'Preverite',
    },
    'tir65x38': {
      'en': 'Row',
      'es': 'Fila',
      'sl': 'Vrsti',
    },
    'rhplic1y': {
      'en': 'Edit',
      'es': 'Editar',
      'sl': 'Uredi',
    },
    'x64934g9': {
      'en': 'Delete',
      'es': 'Borrar',
      'sl': 'Izbriši',
    },
  },
  // forms
  {
    '4w4fampe': {
      'en': 'Edit record',
      'es': 'Editar registro',
      'sl': 'Uredi zapis',
    },
    's2ln34za': {
      'en': 'Announcement',
      'es': 'Anuncio',
      'sl': 'Obvestilo',
    },
    'ixgnt5vg': {
      'en': 'Vehicle, quantity',
      'es': 'Vehículo, cantidad',
      'sl': 'Vozilo, količina',
    },
    'slij6xnt': {
      'en': 'Time, ramp',
      'es': 'tiempo, rampa',
      'sl': 'Čas, rampa',
    },
    '7mz1zveh': {
      'en': 'Manipulations, warehouses',
      'es': 'Manipulaciones, almacenes.',
      'sl': 'Manipulacije, skladišča',
    },
    '06cqog9s': {
      'en': 'Goods, ref. no, barcode',
      'es': 'Bienes, ref. no, código de barras',
      'sl': 'Blago, ref. ne, črtna koda',
    },
    '2fq4wgnt': {
      'en': 'Order No:  ',
      'es': 'N º de pedido:',
      'sl': 'ŠT. NAR.:',
    },
    'ej4ffm0k': {
      'en': 'Client:  ',
      'es': 'Cliente:',
      'sl': 'STRANKA:',
    },
    'iaur83ra': {
      'en': 'Input/output:  ',
      'es': 'De entrada y salida:',
      'sl': 'Vhod/izhod:',
    },
    'cocrs8uw': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'beno68e9': {
      'en': 'in',
      'es': 'in',
      'sl': 'in',
    },
    '4f68f0jj': {
      'en': 'out',
      'es': 'out',
      'sl': 'out',
    },
    '0pln6r7m': {
      'en': 'Estimated arrival:  ',
      'es': 'Llegada estimada:',
      'sl': 'DATUM:',
    },
    'er1iflkk': {
      'en': 'Order status:  ',
      'es': 'Estado del pedido:',
      'sl': 'STAT.NAR.:',
    },
    '2920vcxf': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'vinazm7z': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '4mm5s45u': {
      'en': 'novo naročilo',
      'es': 'novo naročilo',
      'sl': 'novo naročilo',
    },
    'q8evheu3': {
      'en': 'izvajanje',
      'es': 'izvajanje',
      'sl': 'izvajanje',
    },
    'c7ae11xt': {
      'en': 'zaključeno',
      'es': 'zaključeno',
      'sl': 'zaključeno',
    },
    'rvm1e9wy': {
      'en': 'Warehouse:  ',
      'es': 'Depósito:',
      'sl': 'SKLAD.:',
    },
    'uyruzdr8': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '3s4hp8em': {
      'en': 'Creation date:  ',
      'es': 'Fecha de creación:',
      'sl': 'Datum:',
    },
    'n2o8wfi4': {
      'en': 'Admin:  ',
      'es': 'Administración:',
      'sl': 'UPORABNIK:',
    },
    'uh5dxl5p': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'x6to0e7v': {
      'en': 'Custom:  ',
      'es': 'Costumbre:',
      'sl': 'CAR.POST.:',
    },
    'ynfr932b': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'p7usehyk': {
      'en': 'Internal reference number - customs:  ',
      'es': 'Número de referencia interna - aduanas:',
      'sl': 'ŠT. CAR. DOK.',
    },
    'jruby3lr': {
      'en': 'Internal accounting:  ',
      'es': 'Número interno - contabilidad:',
      'sl': 'ŠT.NAR.ATOM:',
    },
    '52lqeszm': {
      'en': 'Documents:  ',
      'es': 'Documentos:',
      'sl': 'DOK.:',
    },
    '51d0v2pi': {
      'en': 'Inventory status:  ',
      'es': 'Estado de inventario:',
      'sl': 'STAT. BLAG:',
    },
    'n5adkyve': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'd2ay29dq': {
      'en': 'najava',
      'es': 'najava',
      'sl': 'najava',
    },
    '9mqiqqmd': {
      'en': 'obdelava',
      'es': 'obdelava',
      'sl': 'obdelava',
    },
    'ak1nrnrl': {
      'en': 'izdano',
      'es': 'izdano',
      'sl': 'izdano',
    },
    'ck4ekony': {
      'en': 'zaloga',
      'es': 'zaloga',
      'sl': 'zaloga',
    },
    'g5m6fbuf': {
      'en': 'Announced time 1:  ',
      'es': 'Hora anunciada 1:',
      'sl': 'Napovedan čas 1:',
    },
    'uoxtbao7': {
      'en': 'Announced time 2:  ',
      'es': 'Hora anunciada 2:',
      'sl': 'Napovedan čas 2:',
    },
    'b63594nl': {
      'en': 'Arrival:  ',
      'es': 'Llegada:',
      'sl': 'Prihod:',
    },
    '7pkfn8ib': {
      'en': 'Loading gate:  ',
      'es': 'Puerta de carga:',
      'sl': 'RAMPA:',
    },
    'o6gubyim': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'ggnfr75d': {
      'en': 'Loading gate sequence:  ',
      'es': 'Secuencia de puerta de carga:',
      'sl': 'ZAP.ŠT.PRIH.:',
    },
    '5b3d3y3h': {
      'en': 'Start (upload/unload):  ',
      'es': 'Iniciar (cargar/descargar):',
      'sl': 'Začetek:',
    },
    'p0vxwlax': {
      'en': 'Stop (upload/unload):  ',
      'es': 'Detener (cargar/descargar):',
      'sl': 'KONEC:',
    },
    'jsq2xkyk': {
      'en': 'Licence plate No:  ',
      'es': 'Número de matrícula:',
      'sl': 'REG. ŠTEVILKA:',
    },
    'e0d8yka2': {
      'en': 'Improvement:  ',
      'es': 'Mejora:',
      'sl': 'NADGRAD.:',
    },
    '9c8qpw3n': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'l8k0xuaf': {
      'en': 'kont.-20\"',
      'es': 'kont.-20\"',
      'sl': 'kont.-20\"',
    },
    '4citue3o': {
      'en': 'kont.-40\"',
      'es': 'kont.-40\"',
      'sl': 'kont.-40\"',
    },
    '4y1sq1d7': {
      'en': 'kont.-45\"',
      'es': 'kont.-45\"',
      'sl': 'kont.-45\"',
    },
    '2572s363': {
      'en': 'cerada',
      'es': 'cerada',
      'sl': 'cerada',
    },
    'aj0w8yyo': {
      'en': 'hladilnik',
      'es': 'hladilnik',
      'sl': 'hladilnik',
    },
    'onw3427g': {
      'en': 'silos',
      'es': 'silos',
      'sl': 'silos',
    },
    '241xgsk0': {
      'en': 'Container No:  ',
      'es': 'No contenedor:',
      'sl': 'ŠT. KONTEJNER:',
    },
    '1luorh6t': {
      'en': 'Comment:  ',
      'es': 'Comentario:',
      'sl': 'KOMENTAR RAZNO:',
    },
    '2x6bir61': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    '6v4a337z': {
      'en': 'Quantity:  ',
      'es': 'Cantidad:',
      'sl': 'Količina:',
    },
    'n93uyp2z': {
      'en': 'Pallet position:  ',
      'es': 'Posición del palet:',
      'sl': 'PAL.MESTA:',
    },
    '963ibpdr': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'bbrh0h2w': {
      'en': 'Pre - Check:  ',
      'es': 'Pre chequeo:',
      'sl': 'Predhodni pregled:',
    },
    '8c0v3o3c': {
      'en': 'Check:  ',
      'es': 'Controlar:',
      'sl': 'Preverite:',
    },
    'x7scfgzz': {
      'en': 'Unit:  ',
      'es': 'Unidad:',
      'sl': 'SCAN.VRST.:',
    },
    '3lpe3obr': {
      'en': 'Weight:  ',
      'es': 'Peso:',
      'sl': 'TEŽA/KG:',
    },
    'swxjzyjy': {
      'en': 'Other manipulations:  ',
      'es': 'Otras manipulaciones:',
      'sl': 'MANIPULACIJA:',
    },
    'iep49uhs': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '1nhh5v4p': {
      'en': 'paletiranje',
      'es': 'paletiranje',
      'sl': 'paletiranje',
    },
    '0hdkxipi': {
      'en': 'čiščenje',
      'es': 'ciščenje',
      'sl': 'čiščenje',
    },
    'dicagqab': {
      'en': 'ovijanje-folija',
      'es': 'ovijanje-folija',
      'sl': 'ovijanje-folija',
    },
    'jvt03f0c': {
      'en': 'povezovanje',
      'es': 'povezovanje',
      'sl': 'povezovanje',
    },
    'k3bvaxvd': {
      'en': 'Type of un/upload:  ',
      'es': 'Tipo de descarga/descarga:',
      'sl': 'DELO Z:',
    },
    'gc8cy7x7': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'c1g1mv1p': {
      'en': 'viličar',
      'es': 'viličar',
      'sl': 'viličar',
    },
    'xt5iyzud': {
      'en': 'ročno',
      'es': 'ročno',
      'sl': 'ročno',
    },
    '4ys80k7p': {
      'en': 'Type of un/upload 2:  ',
      'es': 'Tipo de descarga/descarga 2:',
      'sl': 'DELO Z 2:',
    },
    'qxb7w2sx': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'dfdjkscf': {
      'en': 'viličar',
      'es': 'vilicar',
      'sl': 'viličar',
    },
    'gaxkwc6b': {
      'en': 'ročno',
      'es': 'ročno',
      'sl': 'ročno',
    },
    'nnew7c7t': {
      'en': 'Responsible: ',
      'es': 'Responsable:',
      'sl': 'Odgovorni:',
    },
    '5j26f3oh': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'rxkrrxst': {
      'en': 'Assistant 1:  ',
      'es': 'Asistente 1:',
      'sl': 'SKLADIŠČNIK 1:',
    },
    'w00it0yk': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'odfaa90q': {
      'en': 'Assistant 2:  ',
      'es': 'Asistente 2:',
      'sl': 'SKLADIŠČNIK 2:',
    },
    '86gnzb1r': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '42o4cwkv': {
      'en': 'Assistant 3:  ',
      'es': 'Asistente 3:',
      'sl': 'SKLADIŠČNIK 3:',
    },
    'y9wemh7m': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'uxlc78ll': {
      'en': 'Assistant 4:  ',
      'es': 'Asistente 4:',
      'sl': 'SKLADIŠČNIK 4:',
    },
    'cyhz6mld': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'dh2jv6vo': {
      'en': 'Assistant 5:  ',
      'es': 'Asistente 5:',
      'sl': 'SKLADIŠČNIK 5:',
    },
    '2rezj3dd': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'iigw54yp': {
      'en': 'Assistant 6:  ',
      'es': 'Asistente 6:',
      'sl': 'SKLADIŠČNIK 6:',
    },
    'gvqo5j88': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '27brn9o8': {
      'en': 'Universal ref num:  ',
      'es': 'Número de referencia universal:',
      'sl': 'REF.1:',
    },
    'w2vc2fpp': {
      'en': 'FMS ref:  ',
      'es': 'Referencia FMS:',
      'sl': 'REF.2:',
    },
    'qx5ac8t1': {
      'en': 'Load ref/dvh:  ',
      'es': 'Cargar ref/dvh:',
      'sl': 'REF.3:',
    },
    'xcuhjh74': {
      'en': 'Good:  ',
      'es': 'Bien:',
      'sl': 'BLAGO:',
    },
    'nstuvhay': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '6f042ri4': {
      'en': 'Item description:',
      'es': 'Descripción del item:',
      'sl': 'Opis blaga:',
    },
    '18qvpp0q': {
      'en': 'Packaging:  ',
      'es': 'Embalaje:',
      'sl': 'EMB.:',
    },
    '2gywf2o3': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'spunb0qj': {
      'en': 'Barcodes:  ',
      'es': 'Códigos de barras:',
      'sl': 'črtne kode:',
    },
    'x1apz81p': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'm7gpyzpy': {
      'en': 'Repeated barcodes:  ',
      'es': 'Códigos de barras repetidos:',
      'sl': 'Ponavljajoče se črtne kode:',
    },
    's7iw07q6': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'u3jax3cb': {
      'en': 'Non-existent barcodes:  ',
      'es': 'Códigos de barras inexistentes:',
      'sl': 'Neobstoječe črtne kode:',
    },
    'wh7caubp': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'kgb68azj': {
      'en': 'Save changes',
      'es': 'Guardar cambios',
      'sl': 'Shrani spremembe',
    },
  },
  // sureQuery
  {
    '2b7kj1vi': {
      'en': 'Are you sure?',
      'es': '¿Está seguro?',
      'sl': 'Ali si prepričan?',
    },
    'd0fh7lyk': {
      'en': 'Yes',
      'es': 'Sí',
      'sl': 'ja',
    },
    'wb1becmn': {
      'en': 'No',
      'es': 'No',
      'sl': 'ne',
    },
  },
  // editDetails
  {
    'j79j5yyd': {
      'en': 'Edit record',
      'es': 'Editar registro',
      'sl': 'Uredi zapis',
    },
    'eby9i6es': {
      'en': 'Good:  ',
      'es': 'Bien:',
      'sl': 'dobro:',
    },
    'zwxjnc97': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    '7piqz5sc': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'qfqrlwsg': {
      'en': 'Description:  ',
      'es': 'Descripción:',
      'sl': 'Opis:',
    },
    '67o19ah6': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'uloafuuz': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'q3fbzpds': {
      'en': 'Packaging:  ',
      'es': 'Embalaje:',
      'sl': 'Pakiranje:',
    },
    'dp689g4e': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'slwgvnbp': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '2pmsi25l': {
      'en': 'Warehouse position:  ',
      'es': 'Posición del almacén:',
      'sl': 'Položaj skladišča:',
    },
    'qpecaokf': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'b01g0obk': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'ebn4opmu': {
      'en': 'Barcode:  ',
      'es': 'Código de barras:',
      'sl': 'črtna koda:',
    },
    'orv8tifl': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'mor3o7pl': {
      'en': 'Save changes',
      'es': 'Guardar cambios',
      'sl': 'Shrani spremembe',
    },
  },
  // clientsTF
  {
    'tfcqb0zh': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
  },
  // editClients
  {
    '2g5zhl8k': {
      'en': 'Client details',
      'es': 'Detalles del cliente',
      'sl': 'Podrobnosti o stranki',
    },
    'j8d5n29t': {
      'en': 'Client:  ',
      'es': 'Cliente:',
      'sl': 'Naročnik:',
    },
    '2d19wu1s': {
      'en': 'Address:  ',
      'es': 'DIRECCIÓN:',
      'sl': 'Naslov:',
    },
    '8mh3bzf7': {
      'en': 'City:  ',
      'es': 'Ciudad:',
      'sl': 'mesto:',
    },
    '0ybgfuw5': {
      'en': 'Country:  ',
      'es': 'País:',
      'sl': 'Država:',
    },
    'm7pcjtgw': {
      'en': 'Name aiss:  ',
      'es': 'Nombre:',
      'sl': 'Ime aiss:',
    },
    'jpkyman4': {
      'en': 'Vat no:  ',
      'es': 'N° IVA:',
      'sl': 'DDV številka:',
    },
    'zp0khhb7': {
      'en': 'Save changes',
      'es': 'Guardar cambios',
      'sl': 'Shrani spremembe',
    },
  },
  // customsTF
  {
    'va0e7fje': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
  },
  // goodsTF
  {
    '28p1yis3': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
  },
  // goodsDescriptionsTF
  {
    'x40isfgi': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
  },
  // editPackaging
  {
    'x0hs380u': {
      'en': 'Packaging details',
      'es': 'Detalles del empaque',
      'sl': 'Podrobnosti pakiranja',
    },
    'mb8km6s7': {
      'en': 'Packaging:  ',
      'es': 'Embalaje:',
      'sl': 'Pakiranje:',
    },
    'x6cs6pqp': {
      'en': 'Abbreviation:  ',
      'es': 'Abreviatura:',
      'sl': 'Okrajšava:',
    },
    'wfvsoosu': {
      'en': 'Save changes',
      'es': 'Guardar cambios',
      'sl': 'Shrani spremembe',
    },
  },
  // warehouseDetails
  {
    'dcyr07l8': {
      'en': 'Warehouse details',
      'es': 'Detalles del almacén',
      'sl': 'Podrobnosti o skladišču',
    },
    'cpabvyqv': {
      'en': 'Warehouse positions',
      'es': 'Posiciones de almacén',
      'sl': 'Skladiščne pozicije',
    },
    'tffmk5em': {
      'en': 'Position',
      'es': 'Posición',
      'sl': 'Položaj',
    },
    'j7v7zf4e': {
      'en': 'Loading gates',
      'es': 'Puertas de carga',
      'sl': 'Nakladalna vrata',
    },
    'jiqtvl3p': {
      'en': 'Ramp',
      'es': 'Rampa',
      'sl': 'Klančina',
    },
  },
  // warehousePositionsTF
  {
    'bm78l3b3': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
  },
  // loadingGatesTF
  {
    '2rk32fe5': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
  },
  // manipulationsTF
  {
    '2adki1rz': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
  },
  // createRecord
  {
    'icazai1q': {
      'en': 'Create record',
      'es': 'Crear registro',
      'sl': 'Ustvari zapis',
    },
    'awyh9clr': {
      'en': 'Announcement',
      'es': 'Anuncio',
      'sl': 'Obvestilo',
    },
    'oqag4g4z': {
      'en': 'Vehicle, quantity',
      'es': 'Vehículo, cantidad',
      'sl': 'Vozilo, količina',
    },
    '7gxoffrz': {
      'en': 'Time, ramp',
      'es': 'tiempo, rampa',
      'sl': 'Čas, rampa',
    },
    'ciz89uu4': {
      'en': 'Manipulations, warehouses',
      'es': 'Manipulaciones, almacenes.',
      'sl': 'Manipulacije, skladišča',
    },
    'c28mc4jt': {
      'en': 'Goods, ref. no, barcode',
      'es': 'Bienes, ref. no, código de barras',
      'sl': 'Blago, ref. ne, črtna koda',
    },
    'ky1fkyq8': {
      'en': 'Order No:  ',
      'es': 'N º de pedido:',
      'sl': 'ŠT. NAR.:',
    },
    'd4pgq4wh': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'n4lv60m3': {
      'en': 'Client:  ',
      'es': 'Cliente:',
      'sl': 'STRANKA:',
    },
    '4t7wu43q': {
      'en': 'Input/output:  ',
      'es': 'De entrada y salida:',
      'sl': 'In/out:  ',
    },
    '1hn2bb2c': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    '7ng7rqd2': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'mb6t6xsl': {
      'en': 'in',
      'es': 'in',
      'sl': 'in',
    },
    'uhas6n8o': {
      'en': 'out',
      'es': 'out',
      'sl': 'out',
    },
    'u3y2wa25': {
      'en': 'Estimated arrival:  ',
      'es': 'Llegada estimada:',
      'sl': 'DATUM:',
    },
    'mdnjx34b': {
      'en': 'Order status:  ',
      'es': 'Estado del pedido:',
      'sl': 'STAT.NAR.:',
    },
    'w7oxraah': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'wa3dr3qi': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'a4hkbbbs': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '6gbetm8e': {
      'en': 'novo naročilo',
      'es': 'novo naročilo',
      'sl': 'novo naročilo',
    },
    'u24qhs2i': {
      'en': 'izvajanje',
      'es': 'izvajanje',
      'sl': 'izvajanje',
    },
    'qld2hdoq': {
      'en': 'zaključeno',
      'es': 'zaključeno',
      'sl': 'zaključeno',
    },
    'yf58ods0': {
      'en': 'Warehouse:  ',
      'es': 'Depósito:',
      'sl': 'SKLAD.:',
    },
    '2oi66ola': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'p9h1yasj': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'gyl4et1g': {
      'en': 'Creation date:  ',
      'es': 'Fecha de creación:',
      'sl': 'Datum nastanka:',
    },
    '3i8fpg3s': {
      'en': 'Admin:  ',
      'es': 'Administración:',
      'sl': 'skrbnik:',
    },
    'o51pbopf': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'rsbq7dpb': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'wtl5gquy': {
      'en': 'Custom:  ',
      'es': 'Costumbre:',
      'sl': 'CAR.POST.:',
    },
    'npwrukop': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    '6o1amf6g': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'y9nlr7l1': {
      'en': 'Internal reference number - customs:  ',
      'es': 'Número de referencia interna - aduanas:',
      'sl': 'ŠT. CAR. DOK.:',
    },
    'nwod5dwl': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'u8csng2w': {
      'en': 'Internal number - accounting:  ',
      'es': 'Número interno - contabilidad:',
      'sl': 'ŠT.NAR.ATOM:',
    },
    'jnxu2lw2': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    '97flenab': {
      'en': 'Documents:  ',
      'es': 'Documentos:',
      'sl': 'DOK.:',
    },
    'jfdgfk2h': {
      'en': 'Inventory status:  ',
      'es': 'Estado de inventario:',
      'sl': 'STAT. BLAG:',
    },
    '1xbyxef0': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'jrmz0qkd': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'm6u9emjf': {
      'en': 'najava',
      'es': 'najava',
      'sl': 'najava',
    },
    'muuxrfd4': {
      'en': 'obdelava',
      'es': 'obdelava',
      'sl': 'obdelava',
    },
    '8hy4f85f': {
      'en': 'izdano',
      'es': 'izdano',
      'sl': 'izdano',
    },
    'fsquvroe': {
      'en': 'zaloga',
      'es': 'zaloga',
      'sl': 'zaloga',
    },
    'byxykt3p': {
      'en': 'Announced time 1:  ',
      'es': 'Hora anunciada 1:',
      'sl': 'Napovedan čas 1:',
    },
    'mmasmgj8': {
      'en': 'Announced time 2:  ',
      'es': 'Hora anunciada 2:',
      'sl': 'Napovedan čas 2:',
    },
    '5jx8ei1h': {
      'en': 'Arrival:  ',
      'es': 'Llegada:',
      'sl': 'Prihod:',
    },
    '7n1wz3dg': {
      'en': 'RAMPA:  ',
      'es': 'Puerta de carga:',
      'sl': 'Vrata za nakladanje:',
    },
    'o1s3lijj': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'u0463ju1': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '2wf0bwqi': {
      'en': 'Loading gate sequence:  ',
      'es': 'Secuencia de puerta de carga:',
      'sl': 'ZAP.ŠT.PRIH.:',
    },
    'h6ak5k8v': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'zgrpo3te': {
      'en': 'Start (upload/unload):  ',
      'es': 'Iniciar (cargar/descargar):',
      'sl': 'Začetek:',
    },
    'bjs4ou59': {
      'en': 'Stop (upload/unload):  ',
      'es': 'Detener (cargar/descargar):',
      'sl': 'KONEC:',
    },
    '7o7laf2a': {
      'en': 'Licence plate No:  ',
      'es': 'Número de matrícula:',
      'sl': 'REG. ŠTEVILKA:',
    },
    '040ubt2z': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    '8l4ktgnn': {
      'en': 'Improvement:  ',
      'es': 'Mejora:',
      'sl': 'NADGRAD.:',
    },
    'ipq9i6k0': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'oo7imzeb': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '2imyah2q': {
      'en': 'kont.-20\"',
      'es': 'kont.-20\"',
      'sl': 'kont.-20\"',
    },
    'zwo8ap52': {
      'en': 'kont.-40\"',
      'es': 'kont.-40\"',
      'sl': 'kont.-40\"',
    },
    '41rqmaea': {
      'en': 'kont.-45\"',
      'es': 'conector-45\"',
      'sl': 'kont.-45\"',
    },
    '2hadsask': {
      'en': 'cerada',
      'es': 'cerada',
      'sl': 'cerada',
    },
    'k97naf92': {
      'en': 'hladilnik',
      'es': 'hladilnik',
      'sl': 'hladilnik',
    },
    'cvptjha4': {
      'en': 'silos',
      'es': 'silos',
      'sl': 'silos',
    },
    'otst498k': {
      'en': 'Container No:  ',
      'es': 'No contenedor:',
      'sl': 'ŠT. KONTEJNER:',
    },
    'mq0tkjys': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'y9prqowd': {
      'en': 'Comment:  ',
      'es': 'Comentario:',
      'sl': 'KOMENTAR RAZNO:',
    },
    'jutridg4': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'z0krpsur': {
      'en': 'Quantity:  ',
      'es': 'Cantidad:',
      'sl': 'Količina:',
    },
    'z0zeitio': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'xhr03gwm': {
      'en': 'Pallet position:  ',
      'es': 'Posición del palet:',
      'sl': 'PAL.MESTA',
    },
    'kwuyrj9a': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'od7hk99b': {
      'en': 'Unit:  ',
      'es': 'Unidad:',
      'sl': 'SCAN.VRST.:',
    },
    '913l23f5': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'yx7l9lto': {
      'en': 'Weight:  ',
      'es': 'Peso:',
      'sl': 'TEŽA/KG:',
    },
    'c0ibmp0t': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'ht9lg19b': {
      'en': 'Other manipulations:  ',
      'es': 'Otras manipulaciones:',
      'sl': 'MANIPULACIJA:',
    },
    '9ulabaix': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    '041hw8ml': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'v0605lcd': {
      'en': 'paletiranje',
      'es': 'paletiranje',
      'sl': 'paletiranje',
    },
    'tmtr4y35': {
      'en': 'čiščenje',
      'es': 'čiščenje',
      'sl': 'čiščenje',
    },
    '5khc979z': {
      'en': 'ovijanje-folija',
      'es': 'ovijanje-folija',
      'sl': 'ovijanje-folija',
    },
    'z88b9v9x': {
      'en': 'povezovanje',
      'es': 'povezovanje',
      'sl': 'povezovanje',
    },
    '4gp0ce5z': {
      'en': 'Type of un/upload:  ',
      'es': 'Tipo de descarga/descarga:',
      'sl': 'DELO Z:',
    },
    'ukdhot6n': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    '0adkqdb5': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'dmx4t6wo': {
      'en': 'viličar',
      'es': 'viličar',
      'sl': 'viličar',
    },
    'e2m4u9ep': {
      'en': 'ročno',
      'es': 'ročno',
      'sl': 'ročno',
    },
    '7ydq3891': {
      'en': 'Type of un/upload 2:  ',
      'es': 'Tipo de descarga/descarga 2:',
      'sl': 'DELO Z 2:',
    },
    'ts5hctjo': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'olzhk09c': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'fx5olq4n': {
      'en': 'viličar',
      'es': 'viličar',
      'sl': 'viličar',
    },
    'jq0mat9m': {
      'en': 'ročno',
      'es': 'ročno',
      'sl': 'ročno',
    },
    'zytdv2ys': {
      'en': 'Responsible: ',
      'es': 'Responsable:',
      'sl': 'ODG.SKL.:',
    },
    'wxjgz326': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'u80efgss': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'jnlfkmmw': {
      'en': 'Assistant 1:  ',
      'es': 'Asistente 1:',
      'sl': 'SKLADIŠČNIK 1:',
    },
    'csazqy88': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'yhfsslm2': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    's426vfgc': {
      'en': 'Assistant 2:  ',
      'es': 'Asistente 2:',
      'sl': 'SKLADIŠČNIK 2:',
    },
    'swcholxu': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'qg1iiw0j': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'jgpsl4dd': {
      'en': 'Assistant 3:  ',
      'es': 'Asistente 3:',
      'sl': 'SKLADIŠČNIK 3:',
    },
    'hlv8vfr3': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    't1v9iowk': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '8036iqop': {
      'en': 'Assistant 4:  ',
      'es': 'Asistente 4:',
      'sl': 'SKLADIŠČNIK 4:',
    },
    'r2cw4w1m': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'ow8i19ho': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '7a6k2c70': {
      'en': 'Assistant 5:  ',
      'es': 'Asistente 5:',
      'sl': 'SKLADIŠČNIK 5:',
    },
    '24ma87ab': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'rtsoidp1': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '8yhti2ho': {
      'en': 'Assistant 6:  ',
      'es': 'Asistente 6:',
      'sl': 'SKLADIŠČNIK 6:',
    },
    'ui5ftwzv': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    'xrvq7npn': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '661m7b63': {
      'en': 'Universal ref num:  ',
      'es': 'Número de referencia universal:',
      'sl': 'REF.1:',
    },
    '7ucthrgi': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'uzqbwrs4': {
      'en': 'FMS ref:  ',
      'es': 'Referencia FMS:',
      'sl': 'REF.2:',
    },
    '4eyjotd7': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'm83558ve': {
      'en': 'Load ref/dvh:  ',
      'es': 'Cargar ref/dvh:',
      'sl': 'REF.3:',
    },
    'rifu34tn': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'gv7oe9hp': {
      'en': 'Good:  ',
      'es': 'Bien:',
      'sl': 'BLAGO:',
    },
    'u695q7kd': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    's4gle6c6': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'hrowwhe2': {
      'en': 'Good description:  ',
      'es': 'Buena descripción:',
      'sl': 'OPIS BLAGA:',
    },
    '3vtdt1fk': {
      'en': 'Packaging:  ',
      'es': 'Embalaje:',
      'sl': 'EMB.:',
    },
    'jlucklwu': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
      'sl': 'Prosim izberite...',
    },
    '3p880det': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '2bivx6rb': {
      'en': 'Barcodes:  ',
      'es': 'Códigos de barras:',
      'sl': 'črtne kode:',
    },
    'pk58e2bi': {
      'en': 'Insert new value...',
      'es': 'Insertar nuevo valor...',
      'sl': 'Vstavi novo vrednost ...',
    },
    'xhdbltbx': {
      'en': 'Save changes',
      'es': 'Guardar cambios',
      'sl': 'Shrani spremembe',
    },
  },
  // documents
  {
    'dfjn6g41': {
      'en': 'Documents',
      'es': 'Documentos',
      'sl': 'Dokumenti',
    },
    '0a2yk14h': {
      'en': 'Pdf',
      'es': 'Pdf',
      'sl': 'PDF',
    },
    'url3h1t4': {
      'en': 'Name',
      'es': 'Nombre',
      'sl': 'Ime',
    },
  },
  // userDetails
  {
    'q2ttw3nx': {
      'en': 'Log out',
      'es': 'Cerrar sesión',
      'sl': 'Odjava',
    },
  },
  // newWarehouse
  {
    'o97erejm': {
      'en': 'Warehouse: ',
      'es': 'Depósito:',
      'sl': 'Skladišče:',
    },
    'p1lfr17r': {
      'en': 'New warehouse...',
      'es': 'Nuevo almacén...',
      'sl': 'Novo skladišče...',
    },
  },
  // newClient
  {
    'h6jtdngy': {
      'en': 'Client:  ',
      'es': 'Cliente:',
      'sl': 'Naročnik:',
    },
    '1px7ctty': {
      'en': 'New client...',
      'es': 'Cliente nuevo...',
      'sl': 'Nova stranka...',
    },
    'sjbvje91': {
      'en': 'Address: ',
      'es': 'DIRECCIÓN:',
      'sl': 'Naslov:',
    },
    'vz4q8jsk': {
      'en': 'New address...',
      'es': 'Nueva direccion...',
      'sl': 'Nov naslov...',
    },
    '65cnxij8': {
      'en': 'City: ',
      'es': 'Ciudad:',
      'sl': 'mesto:',
    },
    'enfhsq8e': {
      'en': 'New city...',
      'es': 'Ciudad Nueva...',
      'sl': 'Novo mesto...',
    },
    'kj7tuqhy': {
      'en': 'Country: ',
      'es': 'País:',
      'sl': 'Država:',
    },
    'dljeiog1': {
      'en': 'New country...',
      'es': 'Nuevo país...',
      'sl': 'Nova država...',
    },
    'eslqukvn': {
      'en': 'Name aiss: ',
      'es': 'Nombre:',
      'sl': 'Ime aiss:',
    },
    'mdbs2xhl': {
      'en': 'New name aiss...',
      'es': 'Nuevo nombre ais...',
      'sl': 'Novo ime aiss...',
    },
    'jm18165z': {
      'en': 'Vat no: ',
      'es': 'N° IVA:',
      'sl': 'DDV številka:',
    },
    'tem12gym': {
      'en': 'New vat no...',
      'es': 'cuba nueva no...',
      'sl': 'Nova pdv št...',
    },
    'h1eq3lya': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'j76z399g': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    'h6pnjwkz': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'eerv76l0': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    'rtp7499s': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'js7r29h2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    'ohi3ikuc': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'fw0xj1uq': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    '44nfv83y': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    '6cw4jtvg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    '5oph71lk': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    '2scpc0r9': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
  },
  // newCustom
  {
    'gfr0zflc': {
      'en': 'Custom: ',
      'es': 'Costumbre:',
      'sl': 'Po meri:',
    },
    'cnq234w7': {
      'en': 'New custom...',
      'es': 'Nueva costumbre...',
      'sl': 'Nov običaj...',
    },
    'u5vics5e': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'jtaa65zm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
  },
  // newGoodDescription
  {
    'qbsp1a8h': {
      'en': 'Description: ',
      'es': 'Descripción:',
      'sl': 'Opis:',
    },
    'kmm0hkye': {
      'en': 'New description...',
      'es': 'Nueva descripción...',
      'sl': 'Nov opis...',
    },
    'dj9hrp0p': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'yu78z8qo': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
  },
  // newGood
  {
    'xwu1uyct': {
      'en': 'Good: ',
      'es': 'Bien:',
      'sl': 'dobro:',
    },
    '2un22j9z': {
      'en': 'New good...',
      'es': 'Nuevo bueno...',
      'sl': 'Nova dobra...',
    },
    'sq2f2k0w': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    '64b7o6um': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
  },
  // newLoadingGate1
  {
    '95q7dja7': {
      'en': 'Warehouse: ',
      'es': 'Depósito:',
      'sl': 'Skladišče:',
    },
    '3696mz9p': {
      'en': 'Select warehouse...',
      'es': 'Seleccionar almacén...',
      'sl': 'Izberite skladišče...',
    },
    'hz84ye0l': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'wx224juo': {
      'en': 'Option 1',
      'es': 'Opción 1',
      'sl': 'Možnost 1',
    },
    'spkxcu4p': {
      'en': 'Ramp: ',
      'es': 'Rampa:',
      'sl': 'Rampa:',
    },
    'r5pyn0sn': {
      'en': 'New ramp...',
      'es': 'Nueva rampa...',
      'sl': 'Nova rampa...',
    },
    'lwps3dsm': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    '8bzeqmly': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
  },
  // newManipulation
  {
    'y4j5k3yp': {
      'en': 'Manipulation: ',
      'es': 'Manipulación:',
      'sl': 'Manipulacija:',
    },
    'ke8apo4f': {
      'en': 'New manipulation...',
      'es': 'Nueva manipulación...',
      'sl': 'Nova manipulacija...',
    },
    'tsup8plf': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    '5b1cdr4g': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
  },
  // newPackaging
  {
    '9mqkzgm4': {
      'en': 'Packaging: ',
      'es': 'Embalaje:',
      'sl': 'Pakiranje:',
    },
    'b56ct651': {
      'en': 'New packaging...',
      'es': 'Nuevo envase...',
      'sl': 'Nova embalaža...',
    },
    'hxgjg6fl': {
      'en': 'Abbreviation: ',
      'es': 'Abreviatura:',
      'sl': 'Okrajšava:',
    },
    'u3sqa3vh': {
      'en': 'New abbreviation...',
      'es': 'Nueva abreviatura...',
      'sl': 'Nova okrajšava...',
    },
    'pmyl2hn9': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'fwiuhoz2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
  },
  // newWarehousePosition
  {
    'fxao088z': {
      'en': 'Warehouse position: ',
      'es': 'Posición del almacén:',
      'sl': 'Položaj skladišča:',
    },
    '1a0c3b08': {
      'en': 'New warehouse position...',
      'es': 'Nueva posición de almacén...',
      'sl': 'Nova skladiščna pozicija...',
    },
  },
  // newLoadingGate
  {
    '2t2g5v79': {
      'en': 'Loading gate: ',
      'es': 'Puerta de carga:',
      'sl': 'Vrata za nakladanje:',
    },
    '67xoxtv5': {
      'en': 'New loading gate...',
      'es': 'Nueva puerta de carga...',
      'sl': 'Nova nakladalna vrata...',
    },
  },
  // editAccount
  {
    '569byazq': {
      'en': 'Edit account',
      'es': 'Crea una cuenta',
      'sl': 'Ustvari račun',
    },
    'fkjnp44c': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Comencemos completando el formulario a continuación.',
      'sl': 'Začnimo z izpolnitvijo spodnjega obrazca.',
    },
    '8gfdxdke': {
      'en': 'Name',
      'es': 'Nombre',
      'sl': 'Ime',
    },
    'ch73p8if': {
      'en': 'Last name',
      'es': 'Apellido',
      'sl': 'Priimek',
    },
    'tctidibz': {
      'en': 'User type',
      'es': 'Tipo de usuario',
      'sl': 'Vrsta uporabnika',
    },
    'z29l1qwb': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    '9m5mxg7y': {
      'en': 'administrator',
      'es': 'administrator',
      'sl': 'administrator',
    },
    'ononnqos': {
      'en': 'employee',
      'es': 'employee',
      'sl': 'employee',
    },
    'mi522foy': {
      'en': 'superadmin',
      'es': 'superadmin',
      'sl': 'superadmin',
    },
    'se61s3dd': {
      'en': 'Status',
      'es': 'Estado',
      'sl': 'Stanje',
    },
    'bgklx6w8': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'sl': 'Iskanje predmeta ...',
    },
    'elbd5t7m': {
      'en': 'active',
      'es': 'activo',
      'sl': 'aktivna',
    },
    '8k0yud3h': {
      'en': 'inactive',
      'es': 'inactivo',
      'sl': 'neaktiven',
    },
    'q4pev31f': {
      'en': 'Photo',
      'es': 'Foto',
      'sl': 'Fotografija',
    },
    '8zguilsy': {
      'en': 'Job role',
      'es': 'Puesto de trabajo',
      'sl': 'Delovna vloga',
    },
    'shg9qxqm': {
      'en': 'Edit account',
      'es': 'Crear una cuenta',
      'sl': 'Ustvari račun',
    },
    's3vvyxm6': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'bt7o842k': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    '259fkeou': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'cp896q5d': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    '0xfa5vwm': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'knpo9n99': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    '4rnb3pbu': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'tz8bgrky': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    'rgn0h99z': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'e6g57ay5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
    '1hwmzrn9': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
      'sl': 'Polje je obvezno',
    },
    'uijjh2c5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'sl': 'V spustnem meniju izberite možnost',
    },
  },
  // associateQuery
  {
    'dpzbgv5i': {
      'en': 'Associate order?',
      'es': '¿Asociar orden?',
      'sl': 'Pridruženo naročilo?',
    },
    'ly6tq4ee': {
      'en': 'Yes',
      'es': 'Sí',
      'sl': 'ja',
    },
    'u0ajul0e': {
      'en': 'No',
      'es': 'No',
      'sl': 'ne',
    },
  },
  // Miscellaneous
  {
    'k5pc0j8z': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'pwf0ghf1': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'ivaqlgfi': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'csrov8n9': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'rbtfyzf9': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'eez6rkdb': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'itz1hf3a': {
      'en': '',
      'es': '',
      'sl': '',
    },
    '4x1hv0mu': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'odohdhvj': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'hwsma49d': {
      'en': '',
      'es': '',
      'sl': '',
    },
    '3kxbw6bg': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'srz7eazo': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'f5zcz2oi': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'rivmqkjo': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'etrzh6wy': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'bsq5h3vg': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'czm8n72j': {
      'en': '',
      'es': '',
      'sl': '',
    },
    '6ujolk1u': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'lb236u7h': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'y5umfypx': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'y78gwke6': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'mdqz4w2b': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'bgnkabsd': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'dxo7iz23': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'otczd5kt': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'k4rb355g': {
      'en': '',
      'es': '',
      'sl': '',
    },
    'yp3jf95w': {
      'en': '',
      'es': '',
      'sl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
