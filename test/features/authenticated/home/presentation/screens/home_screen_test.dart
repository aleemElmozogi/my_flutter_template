import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/features/authenticated/home/presentation/screens/home_screen.dart';
import 'package:my_flutter_template/generated/l10n.dart';

void main() {
  testWidgets('HomeScreen renders starter skeleton content', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          locale: const Locale('ar'),
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('ar')],
          home: const HomeScreen(),
        ),
      ),
    );

    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.text('مرحباً بك'), findsOneWidget);
    expect(find.text('ابدأ من هنا'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -240));
    await tester.pump();

    expect(find.text('قالب جاهز للتوسعة'), findsOneWidget);
  });
}
