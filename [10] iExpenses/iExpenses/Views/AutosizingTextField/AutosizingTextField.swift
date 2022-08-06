//
//  AutosizingTextField.swift
//  iExpenses
//
//  Created by Joe Pham on 2022-08-05.
//

import SwiftUI

/// A custom autosizing text field, link here: <a>https://www.youtube.com/watch?v=Jf8SzGLaRdA</a>
///
/// In the parent SwiftUI view, create a designated `@State` variable to decide its height,
/// then use `.frame()` modifier to decide if this text field should expand further
/// or fixed at its maximum height with the static `fixedHeight` constant.
///
///
/// A sample snippet would look like this
///
/// 	@State
/// 	var autosizingTextFieldHeight: CGFloat = 0
///
///		let maxHeightOrDefault =
///			(autosizingTextFieldHeight <= AutosizingTextField.fixedHeight) ?
///			autosizingTextFieldHeight : AutosizingTextField.fixedHeight
///
///		AutosizingTextField(
///			text: $viewModel.expenseNotes,
///			hint: "Any extra notes...",
///			containerHeight: $autosizingTextFieldHeight
///		)
///		.frame(height: maxHeightOrDefault)
///
struct AutosizingTextField: UIViewRepresentable {
	
	@Binding
	var text: String
	
	private(set) var hint: String
	
	@Binding
	var containerHeight: CGFloat
	
	static let fixedHeight: CGFloat = 120
	
	func makeUIView(context: Context) -> UITextView {
		let textView = UITextView()
		
		// Display hint text
		textView.text = hint
		textView.font = .preferredFont(forTextStyle: .body)
		textView.textColor = .tertiaryLabel
		textView.backgroundColor = .clear
		
		// Set delegate
		textView.delegate = context.coordinator
		return textView
	}
	
	func updateUIView(_ uiView: UITextView, context: Context) {
		DispatchQueue.main.async {
			if containerHeight == 0 {
				containerHeight = uiView.contentSize.height
			}
		}
	}
	
	func makeCoordinator() -> Coordinator {
		return AutosizingTextField.Coordinator(parent: self )
	}
	
	internal class Coordinator: NSObject, UITextViewDelegate {
		var parent: AutosizingTextField
		
		init(parent: AutosizingTextField) {
			self.parent = parent
		}
		
		func textViewDidBeginEditing(_ textView: UITextView) {
			clearHintAndMakeTextPrimary(in: textView)
		}
		
		fileprivate func clearHintAndMakeTextPrimary(in textView: UITextView) {
			if textView.text == parent.hint {
				textView.text = ""
				textView.textColor = .label
			}
		}
		
		func textViewDidChange(_ textView: UITextView) {
			parent.text = textView.text
			parent.containerHeight = textView.contentSize.height
		}
		
		func textViewDidEndEditing(_ textView: UITextView) {
			showHintWithGrayColorAgain(in: textView)
		}
		
		fileprivate func showHintWithGrayColorAgain(in textView: UITextView) {
			if textView.text == "" {
				textView.text = parent.hint
				textView.textColor = .tertiaryLabel
			}
		}
	}
}
