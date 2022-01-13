import Foundation

private class BundleFinder {}

extension Foundation.Bundle {
	/// Returns the resource bundle associated with the current Swift module.
	static var current: Bundle = {
		#if SWIFT_PACKAGE
			let bundleName = "XS2AiOS_XS2AiOS"
		#else
			let bundleName = "XS2AiOS"
		#endif

		let candidates = [
			// Bundle should be present here when the package is linked into an App.
			Bundle.main.resourceURL,
			// Bundle should be present here when the package is linked into a framework.
			Bundle(for: BundleFinder.self).resourceURL,
			// For command-line tools.
			Bundle.main.bundleURL,
		]

		for candidate in candidates {
			let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
			if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
				return bundle
			}
		}

		print("unable to find bundle named \(bundleName)")
		
		return Bundle(for: BundleFinder.self)
	}()
}
