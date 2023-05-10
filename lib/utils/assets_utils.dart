class AssetsUtils {
  static AssetsImages images = AssetsImages();
  static AssetsIcons icons = AssetsIcons();
}

class AssetsImages {
  static const String path = 'assets/images';
  final String logoImage = '$path/logo.png';
  final String masterclassLogoImage = '$path/masterclass_logo.png';
}

class AssetsIcons {
  static const String path = 'assets/icons';
  final String toysIcon = '$path/toys.svg';
  final String githubIcon = '$path/github.svg';
  final String glassesIcon = '$path/glasses.svg';
  final String moonIcon = '$path/moon.svg';
  final String runningIcon = '$path/running.svg';
  final String targetIcon = '$path/target.svg';
}
