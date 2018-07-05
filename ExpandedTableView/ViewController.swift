//
//  ViewController.swift
//  ExpandedTableView
//
//  Created by Isaías on 7/4/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit
import CoreData

struct CellData {
    var opened: Bool
    var title: String
    var sectionData = [Sector]()
}

class ViewController: UIViewController {

    var tableView: UITableView!
    var projects: [Project] = []
    var tableViewData = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        setupUI()
        
        //addData()
        
        getData()
    }

    func setupUI() {
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        addConstraints()
    }
    
    func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    }

    func addData() {
        let context = CoreDataStack.managedObjectContext
        
        for val in 1...10 {
            let newProject = NSEntityDescription.insertNewObject(forEntityName: "Project", into: context) as! Project
            newProject.id  = Int32(val)
            newProject.name = "Project \(val)"
            
            let newSector = NSEntityDescription.insertNewObject(forEntityName: "Sector", into: context) as! Sector
            newSector.name = "Sector \(val)"
            newSector.project = newProject
            
            let newSector2 = NSEntityDescription.insertNewObject(forEntityName: "Sector", into: context) as! Sector
            newSector2.name = "Sector \(val + 1)"
            newSector2.project = newProject
        }
        
        do {
            try context.save()
        } catch {
            fatalError("Error ==> \(error.localizedDescription)")
        }
    }
    
    func getData() {
        let context = CoreDataStack.managedObjectContext
        
        let fetchRequest = NSFetchRequest<Project>(entityName: "Project")
        let sort = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            let projects = try context.fetch(fetchRequest)
            
            for p in projects {
                let sectors: [Sector] = p.sectors?.allObjects as! [Sector]
                tableViewData.append(CellData(opened: false, title: p.name!, sectionData: sectors))
            }
            
            tableView.reloadData()
        } catch  {
            fatalError("Error 2 ==> \(error.localizedDescription)")
        }
    }

}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex].name
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 12.5)
            return cell
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Previene seleccionar celdas hijos
        if indexPath.row > 0 {
            return
        }
        
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .fade)
        }
        else{
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
}
