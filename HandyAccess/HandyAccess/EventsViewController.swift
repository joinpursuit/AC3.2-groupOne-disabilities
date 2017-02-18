//
//  EventsViewController.swift
//  HandyAccess
//
//  Created by Karen Fuentes on 2/17/17.
//  Copyright © 2017 NYCHandyAccess. All rights reserved.
//

import UIKit

class EventsViewController: UITableViewController {
    
    var events = [NYCEventCalendarModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIRequestManager.shared.getData(endPoint: "https://api.cityofnewyork.us/calendar/v1/search.htm?app_id=e40a1f49&app_key=077f86713488d92de18df675a800dcd8") { (data: Data?) in
            guard let validData = data else { return }
            //dump(validData)
            self.events = NYCEventCalendarModel.getEvents(from: validData)!
            dump(self.events)
        }
        
        view.backgroundColor = .gray
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        
        return cell
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
