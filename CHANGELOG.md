# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0+2] - 2025-02-11
### Fixed
- Fixed throw error state issue to prevent unexpected crashes.

---

## [0.1.0] - 2024-12-11
### Added
- **Overlay Loading Mode**: Improved behavior for modal loading indicators during async operations.
- **Example App**: Added a comprehensive example app in the README to demonstrate various use cases.

### Changed
- **`onError` Removed**: The `onError` property has been removed, allowing users to handle exceptions directly outside the package for better flexibility and tracking.

### Fixed
- Improved internal logic for handling mounted state during async operations.
- Enhanced documentation for better clarity and usability.

---

## [0.0.1] - 2024-10-16
### Added
- Initial release of `Async Button Handler` package.
- `AsyncButtonHandler` widget for handling async actions with built-in loading state handling.
- `onPressed` property to handle async or sync actions.
- `loadingChild` property to display a custom loading indicator.
- `buttonChild` property for the button's main content.
- `style` property to customize button appearance.
- `onError` property to handle error states without requiring additional state management.

### Fixed
- N/A

### Changed
- N/A
