import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:social_profile_ui/main.dart';

void main() {
  testWidgets('renders the social profile at desktop width', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1100, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const SocialProfileApp());
    await tester.pumpAndSettle();

    expect(find.text('Maya Rivera'), findsOneWidget);
    expect(find.text('Interests'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('renders without exceptions at mobile width', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const SocialProfileApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Maya Rivera'), findsOneWidget);
  });
}
