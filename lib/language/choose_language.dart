
// import 'package:flutter/cupertino.dart';
import 'package:eventgo/language/language_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

// void showDemoActionSheet(
//     {required BuildContext context, required Widget child}) {
//   showCupertinoModalPopup<String>(
//       context: context,
//       builder: (BuildContext context) => child).then((String? value) {
//     if (value != null) changeLocale(context, value);
//   });
// }


// void onActionSheetPress(BuildContext context) {
//   showDemoActionSheet(
//     context: context,
//     child: CupertinoActionSheet(
//       title: AppText(
//           text: translate('language.selection.title'),
//           color: AppColors.bigTextColor),
//       message: AppText(
//           text: translate('language.selection.message'),
//           color: AppColors.bigTextColor),
//       actions: <Widget>[
//         CupertinoActionSheetAction(
//             child: AppText(
//                 text: translate('language.name.en'),
//                 color: AppColors.bigTextColor),
//             onPressed: () {
//               Navigator.pop(context, 'en_US');
//               TranslatePreferences('en_US');
//             }),
//         CupertinoActionSheetAction(
//             child: AppText(
//                 text: translate('language.name.fr'),
//                 color: AppColors.bigTextColor),
//             onPressed: () {
//               Navigator.pop(context, 'fr');
//               TranslatePreferences('fr');
//             }),
//       ],
//       cancelButton: CupertinoActionSheetAction(
//         isDefaultAction: true,
//         onPressed: () => Navigator.pop(context, null),
//         child: AppText(
//             text: translate('button.cancel'), color: AppColors.bigTextColor),
//       ),
//     ),
//   );
// }


void showI18nDialog({required BuildContext context}) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(

            title: Text(translate('language.selection.title')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(translate('language.name.en')),
                  onTap: () {
                    Navigator.pop(context, 'en_US');
                    TranslatePreferences('en_US');
                  },
                ),
                ListTile(
                  title: Text(translate('language.name.fr')),
                  onTap: () {
                    Navigator.pop(context, 'fr');
                    TranslatePreferences('fr');
                  },
                ),
              ],
            ),
            actions: [],
          )
    ).then((String? value) {
      if (value != null) changeLocale(context, value);
  });
}


