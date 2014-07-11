//
//  TableViewController.swift
//  GitHubToday
//
//  Created by Sam Davies on 11/07/2014.
//  Copyright (c) 2014 ShinobiControls. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  var dataProvider = GitHubDataProvider()
  var events: [GitHubEvent] = [GitHubEvent]() {
  didSet {
    tableView.reloadData()
  }
  }
  
  override func awakeFromNib() {
    title = "GitHub Events"
    dataProvider.getEvents("sammyd", callback: {
      githubEvents in
      self.events = githubEvents
      })
  }
  
  
  // DataSource
  override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    return events.count
  }
  
  override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    return tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as UITableViewCell
  }
  
  override func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!) {
    if let eventCell = cell as? EventTableViewCell {
      let event = events[indexPath.row]
      eventCell.event = event
    }
  }
  
  
}
