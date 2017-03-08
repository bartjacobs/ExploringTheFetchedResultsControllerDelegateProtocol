//
//  ViewController.swift
//  Notes
//
//  Created by Bart Jacobs on 08/03/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // MARK: - Properties

    fileprivate let coreDataManager = CoreDataManager(modelName: "Notes")

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SegueAddNoteViewController" else { return }
        guard let navigationController = segue.destination as? UINavigationController else { return }
        guard let viewController = navigationController.viewControllers.first as? AddNoteViewController else { return }

        // Configure View Controller
        viewController.delegate = self
    }

}

extension ViewController: AddNoteViewControllerDelegate {

    func controller(_ controller: AddNoteViewController, didAddNoteWithTitle title: String) {
        // Create Note
        let note = Note(context: coreDataManager.managedObjectContext)

        // Populate Note
        note.content = ""
        note.title = title
        note.updatedAt = NSDate()
        note.createdAt = NSDate()

        do {
            try note.managedObjectContext?.save()
        } catch {
            let saveError = error as NSError
            print("Unable to Save Note")
            print("\(saveError), \(saveError.localizedDescription)")
        }
    }

}
