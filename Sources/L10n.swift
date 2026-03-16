import Foundation

enum L10n {
    private static let bundle = Bundle.main

    static let appSubtitle = NSLocalizedString("app.subtitle", bundle: bundle, comment: "")
    static let preferredTerminal = NSLocalizedString("settings.preferred_terminal", bundle: bundle, comment: "")
    static let notInstalled = NSLocalizedString("settings.not_installed", bundle: bundle, comment: "")
    static let instructionsTitle = NSLocalizedString("instructions.title", bundle: bundle, comment: "")
    static let step1Title = NSLocalizedString("instructions.step1.title", bundle: bundle, comment: "")
    static let step1Detail = NSLocalizedString("instructions.step1.detail", bundle: bundle, comment: "")
    static let step2Title = NSLocalizedString("instructions.step2.title", bundle: bundle, comment: "")
    static let step2Detail = NSLocalizedString("instructions.step2.detail", bundle: bundle, comment: "")
    static let settingsTitle = NSLocalizedString("instructions.settings.title", bundle: bundle, comment: "")
    static let settingsDetail = NSLocalizedString("instructions.settings.detail", bundle: bundle, comment: "")
    static let tipOpenSettings = NSLocalizedString("tip.open_settings", bundle: bundle, comment: "")
}
