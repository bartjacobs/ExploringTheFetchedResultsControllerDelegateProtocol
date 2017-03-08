### [Managing Records With Fetched Results Controllers](https://cocoacasts.com/managing-records-with-fetched-results-controllers/)

#### Author: Bart Jacobs

The `NSFetchedResultsController` class isn't an essential component of a Core Data application, but it makes working with collections of managed objects much easier. This tutorial introduces you to the, almost magical, `NSFetchedResultsController` class.

## What Is It?

An application powered by Core Data needs to make sure the state of the persistent store is reflected by the user interface and vice versa. If a record is deleted from the persistent store, the user interface needs to be updated, informing the user about this event.

The boilerplate code required to update a table view is pretty lengthy. For every table view that manages a list of records, you need to write the same boilerplate code. By using the `NSFetchedResultsController` class, you only need to write code that is specific to your application. Trivial tasks, such as updating a table view cell when a record is modified, are handled by the fetched results controller.

A fetched results controller manages the results of a fetch request. It notifies its delegate about any changes that affect the results of that fetch request. It even offers the ability to use an in-memory cache to improve performance.

Even though the `NSFetchedResultsController` class was designed with table views in mind, it also works great with collection views. In this tutorial, we build a basic notes application that keeps track of your notes. We first need to create a project, set up the Core Data stack, and design the data model.

**Read this article on [Cocoacasts](https://cocoacasts.com/managing-records-with-fetched-results-controllers/)**.
