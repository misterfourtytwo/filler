import 'package:flutter/material.dart';

/// Sleek and minimalistic design system inspired by Apple Storefront aesthetics.
///
/// Features refined typography, sophisticated color schemes, and elegant spacing
/// that creates a premium, clean, and modern user experience.
class DesignSystem {
  // Private constructor to prevent instantiation
  DesignSystem._();

  // ===== SPACING =====
  /// Ultra-thin spacing for precise layouts
  static const double spaceXs = 4.0;

  /// Small spacing for compact elements
  static const double spaceSm = 8.0;

  /// Medium spacing for standard layouts
  static const double spaceMd = 16.0;

  /// Large spacing for comfortable layouts
  static const double spaceLg = 24.0;

  /// Extra large spacing for breathing room
  static const double spaceXl = 32.0;

  /// Extra extra large spacing (48px).
  static const double spaceXxl = 48.0;

  /// Extra extra extra large spacing (64px).
  static const double spaceXxxl = 64.0;

  /// Huge spacing for dramatic layouts
  static const double spaceHuge = 48.0;

  // ===== BORDER RADIUS =====
  /// Subtle radius for minimal elements
  static const double radiusXs = 6.0;

  /// Standard radius for most components
  static const double radiusSm = 8.0;

  /// Medium radius for cards and containers
  static const double radiusMd = 12.0;

  /// Large radius for prominent elements
  static const double radiusLg = 16.0;

  /// Extra large radius for dramatic curves
  static const double radiusXl = 24.0;

  // ===== CANVAS SIZING =====
  /// Mobile pixel size for touch-friendly interaction
  static const double mobilePixelSize = 32.0;

  /// Desktop pixel size for precise control
  static const double desktopPixelSize = 40.0;

  /// Thumbnail pixel size for previews
  static const double thumbnailPixelSize = 16.0;

  // ===== STROKES & BORDERS =====
  /// Ultra-thin stroke for subtle borders
  static const double strokeUltraThin = 0.5;

  /// Thin stroke for standard borders
  static const double strokeThin = 1.0;

  /// Medium stroke for emphasis
  static const double strokeMedium = 1.5;

  /// Thick stroke for strong emphasis
  static const double strokeThick = 2.0;

  // ===== COLOR PALETTE =====
  /// Sophisticated color palette inspired by Apple's design language
  static const Map<String, Color> palette = {
    // Primary colors
    'Pure White': Color(0xFFFFFFFF),
    'Pure Black': Color(0xFF000000),

    // Neutral grays
    'Light Gray': Color(0xFFF5F5F7),
    'Medium Gray': Color(0xFF8E8E93),
    'Dark Gray': Color(0xFF1D1D1F),

    // Accent colors
    'Blue': Color(0xFF007AFF),
    'Indigo': Color(0xFF5856D6),
    'Purple': Color(0xFFAF52DE),
    'Pink': Color(0xFFFF2D92),
    'Red': Color(0xFFFF3B30),
    'Orange': Color(0xFFFF9500),
    'Yellow': Color(0xFFFFCC02),
    'Green': Color(0xFF34C759),
    'Teal': Color(0xFF5AC8FA),
  };

  // ===== SHADOWS =====
  /// Subtle shadow for depth
  static List<BoxShadow> get shadowSubtle => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  /// Medium shadow for elevation
  static List<BoxShadow> get shadowMedium => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  /// Strong shadow for prominence
  static List<BoxShadow> get shadowStrong => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  /// Primary glow effect
  static List<BoxShadow> get glowPrimary => [
    BoxShadow(
      color: palette['Blue']!.withValues(alpha: 0.3),
      blurRadius: 20,
      spreadRadius: 2,
    ),
  ];

  /// Gets adaptive padding based on screen size.
  static EdgeInsets getAdaptivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) {
      return const EdgeInsets.all(spaceXl);
    } else if (width > 600) {
      return const EdgeInsets.all(spaceLg);
    } else {
      return const EdgeInsets.all(spaceMd);
    }
  }

  /// Checks if the current screen is mobile size.
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  /// Checks if the current screen is tablet size.
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1200;
  }

  /// Checks if the current screen is desktop size.
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  /// Gets adaptive spacing based on screen size.
  static double getAdaptiveSpacing(BuildContext context) {
    if (isMobile(context)) {
      return spaceSm;
    } else if (isTablet(context)) {
      return spaceMd;
    } else {
      return spaceLg;
    }
  }

  // ===== THEME DATA =====
  /// Create theme data with sleek Apple-inspired design
  static ThemeData theme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: 'SF Pro Display',

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
        ),
        iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outline.withValues(alpha: 0.2),
        thickness: strokeUltraThin,
        space: 1,
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: strokeMedium,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spaceMd,
          vertical: spaceMd,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: spaceLg,
            vertical: spaceMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.4,
          ),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline.withValues(alpha: 0.3)),
          padding: const EdgeInsets.symmetric(
            horizontal: spaceLg,
            vertical: spaceMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.4,
          ),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: spaceMd,
            vertical: spaceSm,
          ),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.4,
          ),
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          side: BorderSide(color: colorScheme.outline.withValues(alpha: 0.1)),
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        selectedColor: colorScheme.primaryContainer,
        labelStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMd),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: spaceMd,
          vertical: spaceSm,
        ),
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 57,
          fontWeight: FontWeight.w400,
          letterSpacing: -1.5,
          height: 1.12,
        ),
        displayMedium: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 45,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5,
          height: 1.16,
        ),
        displaySmall: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.22,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 32,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.25,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.29,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.33,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.27,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          height: 1.5,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
        ),
        bodyLarge: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          height: 1.43,
        ),
        bodySmall: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          height: 1.33,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.33,
        ),
        labelSmall: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.45,
        ),
      ),
    );
  }

  // ===== COLOR SCHEMES =====
  /// Light color scheme with Apple-inspired colors
  static ColorScheme get sleekLightColorScheme => const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF007AFF),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE3F2FD),
    onPrimaryContainer: Color(0xFF0D47A1),
    secondary: Color(0xFF5856D6),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFF3E5F5),
    onSecondaryContainer: Color(0xFF4A148C),
    tertiary: Color(0xFF34C759),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE8F5E8),
    onTertiaryContainer: Color(0xFF1B5E20),
    error: Color(0xFFFF3B30),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFEBEE),
    onErrorContainer: Color(0xFFB71C1C),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1D1D1F),
    surfaceContainerHighest: Color(0xFFF5F5F7),
    surfaceContainerHigh: Color(0xFFFAFAFA),
    surfaceContainer: Color(0xFFF0F0F0),
    surfaceContainerLow: Color(0xFFF8F8F8),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    onSurfaceVariant: Color(0xFF8E8E93),
    outline: Color(0xFFC7C7CC),
    outlineVariant: Color(0xFFE5E5EA),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF1D1D1F),
    onInverseSurface: Color(0xFFF5F5F7),
    inversePrimary: Color(0xFF90CAF9),
    surfaceTint: Color(0xFF007AFF),
  );

  /// Dark color scheme with Apple-inspired colors
  static ColorScheme get sleekDarkColorScheme => const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF0A84FF),
    onPrimary: Color(0xFF000000),
    primaryContainer: Color(0xFF1C3A5F),
    onPrimaryContainer: Color(0xFF90CAF9),
    secondary: Color(0xFF5E5CE6),
    onSecondary: Color(0xFF000000),
    secondaryContainer: Color(0xFF2D1B69),
    onSecondaryContainer: Color(0xFFCE93D8),
    tertiary: Color(0xFF30D158),
    onTertiary: Color(0xFF000000),
    tertiaryContainer: Color(0xFF1C3A1C),
    onTertiaryContainer: Color(0xFFA5D6A7),
    error: Color(0xFFFF453A),
    onError: Color(0xFF000000),
    errorContainer: Color(0xFF3E1B1B),
    onErrorContainer: Color(0xFFFFCDD2),
    surface: Color(0xFF1D1D1F),
    onSurface: Color(0xFFF5F5F7),
    surfaceContainerHighest: Color(0xFF2C2C2E),
    surfaceContainerHigh: Color(0xFF3A3A3C),
    surfaceContainer: Color(0xFF48484A),
    surfaceContainerLow: Color(0xFF636366),
    surfaceContainerLowest: Color(0xFF8E8E93),
    onSurfaceVariant: Color(0xFFAEAEB2),
    outline: Color(0xFF48484A),
    outlineVariant: Color(0xFF636366),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFF5F5F7),
    onInverseSurface: Color(0xFF1D1D1F),
    inversePrimary: Color(0xFF0A84FF),
    surfaceTint: Color(0xFF0A84FF),
  );
}
