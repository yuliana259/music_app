import 'package:get/get.dart';

class MyAppTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'ru_RU': {
      'title_admin':'Профиль',
      'button_admin':'Выйти',
      'button1_admin':'Поменять язык',
      'button2_admin':'Пользователи',
      'button3_admin':'Песни',
      'title_users':'Пользователи',
    },
    'en_US': {
      'title_admin':'Profile',
      'button_admin':'Exit',
      'button1_admin':'Switch language',
      'button2_admin':'Users',
      'button3_admin':'Songs',
      'title_users':'Users',
    },
    'es_ES': {
      'title_admin':'Perfil',
      'button_admin':'Salida',
      'button1_admin':'Cambiar de idioma',
      'button2_admin':'Usuarios',
      'button3_admin':'Canciones',
      'title_users':'Usuarios',
    },

  };

}