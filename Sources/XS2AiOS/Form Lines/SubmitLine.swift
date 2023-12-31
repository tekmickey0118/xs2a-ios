import UIKit

class SubmitLine: UIViewController, FormLine {
	var actionDelegate: ActionDelegate?

	private let button: UIButton
	private let actionType: XS2AButtonType
	
	/**
	 - Parameters:
	   - label: The label for this submit line
	   - actionType: The type of action for this submit line (the action submitted when tapped)
	*/
	init(label: String, actionType: XS2AButtonType) {
		button = UIButton.make(buttonType: actionType)
		button.setTitle(label, for: .normal)

		self.actionType = actionType

		super.init(nibName: nil, bundle: nil)
		
		/// Attach buttonTapped function to the button
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}
	
	@objc func buttonTapped(_ sender: UIButton) {
		/// If the keyboard is still open, close it
		view.superview?.endEditing(true)

		triggerHapticFeedback(style: .light)
		actionDelegate?.sendAction(actionType: actionType, withLoadingIndicator: true, additionalPayload: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		view.addSubview(button)
		
		NSLayoutConstraint.activate([
			view.heightAnchor.constraint(equalTo: button.heightAnchor),
			button.widthAnchor.constraint(equalTo: view.widthAnchor),
		])
	}
}
