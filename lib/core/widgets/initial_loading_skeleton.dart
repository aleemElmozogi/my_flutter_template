import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class InitialLoadingSkeleton extends StatelessWidget {
  const InitialLoadingSkeleton({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;

    return IgnorePointer(
      child: Skeletonizer(effect: const SolidColorEffect(), child: child),
    );
  }
}
