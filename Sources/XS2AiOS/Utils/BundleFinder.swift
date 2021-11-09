import Foundation

private class BundleFinder {}

extension Foundation.Bundle {
	/// Returns the resource bundle associated with the current Swift module.
	static var current: Bundle = {
		let bundleName = "XS2AiOS_XS2AiOS"

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

		fatalError("unable to find bundle named XS2AiOS_XS2AiOS")
	}()
}
