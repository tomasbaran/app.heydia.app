/// Feature flags configuration for the app
///
/// These flags can be controlled via build-time environment variables
/// or runtime configuration depending on your needs.
class FeatureFlags {
  // Authentication & User Management
  static bool get allowNewSignups => false;
}
