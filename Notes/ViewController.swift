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

    @IBOutlet var tableView: UITableView!

    // MARK: -

    fileprivate let coreDataManager = CoreDataManager(modelName: "Notes")

    // MARK: -

    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Note> = {
        // Initialize Fetch Request
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()

        // Add Sort Descriptors
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        // Initialize Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.coreDataManager.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)

        return fetchedResultsController
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("Unable to Save Note")
            print("\(fetchError), \(fetchError.localizedDescription)")
        }
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

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else {
            return 0
        }

        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)

        // Fetch Note
        let note = fetchedResultsController.object(at: indexPath)

        // Configure Cell
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.content

        return cell
    }

}

extension ViewController: UITableViewDelegate {

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
