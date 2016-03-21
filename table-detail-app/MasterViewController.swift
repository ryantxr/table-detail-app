//
//  MasterViewController.swift
//  table-detail-app
//
//  Created by ryan teixeira on 3/21/16.
//  Copyright © 2016 Ryan Teixeira. All rights reserved.
//

    import UIKit

    struct PageTwoItem {
        var name : String
        var summary : String
        var photo : String
    }

    struct PageData {
        var name: String
        var subitems: [PageTwoItem]
    }

    class MasterViewController: UITableViewController {

        var detailViewController: DetailViewController? = nil
        // Make an array of PageTwoItem
        var objects = [PageData]()


        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            setupData()
        }

        override func viewWillAppear(animated: Bool) {

            super.viewWillAppear(animated)
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        
        func setupData() {
            objects = [
                PageData(name: "Cleaning", subitems: [
                    PageTwoItem(name: "Cleaning 1", summary: "", photo: ""),
                    PageTwoItem(name: "Cleaning 2", summary: "", photo: ""),
                    PageTwoItem(name: "Cleaning 3", summary: "", photo: ""),
                    PageTwoItem(name: "Cleaning 4", summary: "", photo: "")
                    ] ),
                PageData(name: "Plumbing", subitems: [
                    PageTwoItem(name: "Plumbing 1", summary: "", photo: ""),
                    PageTwoItem(name: "Plumbing 2", summary: "", photo: ""),
                    PageTwoItem(name: "Plumbing 3", summary: "", photo: ""),
                    PageTwoItem(name: "Plumbing 4", summary: "", photo: "")
] ),
                PageData(name: "Electrical", subitems: [
                    PageTwoItem(name: "Electrical 1", summary: "", photo: ""),
                    PageTwoItem(name: "Electrical 2", summary: "", photo: ""),
                    PageTwoItem(name: "Electrical 3", summary: "", photo: ""),
                    PageTwoItem(name: "Electrical 4", summary: "", photo: "")
] ),
                PageData(name: "Craftswork", subitems: [
                    PageTwoItem(name: "Craftswork 1", summary: "", photo: ""),
                    PageTwoItem(name: "Craftswork 2", summary: "", photo: ""),
                    PageTwoItem(name: "Craftswork 3", summary: "", photo: ""),
                    PageTwoItem(name: "Craftswork 4", summary: "", photo: "")
] ),
                PageData(name: "Automotive", subitems: [
                    PageTwoItem(name: "Automotive 1", summary: "", photo: ""),
                    PageTwoItem(name: "Automotive 2", summary: "", photo: ""),
                    PageTwoItem(name: "Automotive 3", summary: "", photo: ""),
                    PageTwoItem(name: "Automotive 4", summary: "", photo: "")
] ),
            ]
        }
        /*
        func insertNewObject(sender: AnyObject) {
            objects.insert(NSDate(), atIndex: 0)
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        */

        // MARK: - Segues

        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            print(segue.identifier)
            if segue.identifier == "showDetail" {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let object = objects[indexPath.row]
                    let controller = segue.destinationViewController as! DetailViewController
                    controller.detailItem = object
                }
            }
        }

        // MARK: - Table View

        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return objects.count
        }

        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

            let object = objects[indexPath.row]
            cell.textLabel!.text = object.name
            return cell
        }

        override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }

        override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle == .Delete {
                objects.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            } else if editingStyle == .Insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
        }


    }

