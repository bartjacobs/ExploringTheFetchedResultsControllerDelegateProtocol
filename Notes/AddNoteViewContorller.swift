//
//  AddNoteViewContorller.swift
//  Notes
//
//  Created by Bart Jacobs on 08/03/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

protocol AddNoteViewControllerDelegate {
    func controller(_ controller: AddNoteViewController, didAddNoteWithTitle title: String)
}

class AddNoteViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!

    var delegate: AddNoteViewControllerDelegate?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func save(_ sender: Any) {
        guard let title = titleTextField.text else { return }
        guard let delegate = delegate else { return }

        // Notify Delegate
        delegate.controller(self, didAddNoteWithTitle: title)

        // Dismiss View Controller
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
