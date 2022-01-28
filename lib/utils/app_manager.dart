enum Flavor { dev, stg, prd }

class AppManager {
  static flavor() {
    switch (const String.fromEnvironment("FLAVOR")) {
      case "DEV":
        return Flavor.dev;
      case "STG":
        return Flavor.stg;
      case "PRD":
        return Flavor.prd;
    }
    throw AssertionError("Invalid Flavor");
  }
}
