enum FlavorEnum {
  DRIVER,
  DRIVER_ADMIN,
}

class Flavors {
  static FlavorEnum? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case FlavorEnum.DRIVER:
        return 'Driver';
      case FlavorEnum.DRIVER_ADMIN:
        return 'Driver Admin';
      default:
        return 'Driver';
    }
  }

}
