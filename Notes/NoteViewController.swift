//
//  NoteViewController.swift
//  Notes
//
//  Created by Bart Jacobs on 08/03/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!

    // MARK: -

    var note: Note?

    // MARK: - View Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Update User Interface
        titleTextField.text = note?.title
        contentTextView.text = note?.content
    }

    // MARK: - Actions

    @IBAction func save(_ sender: Any) {
        guard let title = titleTextField.text else { return }
        guard let content = contentTextView.text else { return }

        // Update Note
        note?.title = title
        note?.content = content
        note?.updatedAt = Date()

        // Pop View Controller From Navigation Stack
        _ = navigationController?.popViewController(animated: true)
    }

}
