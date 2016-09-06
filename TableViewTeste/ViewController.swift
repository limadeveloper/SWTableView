//
//  ViewController.swift
//  TableViewTeste
//
//  Created by John Lima on 06/09/16.
//  Copyright © 2016 limadeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var toolBarContraintBottom: NSLayoutConstraint!
    
    private var tableData = [Model]()
    private let model = Model()
    private let cellIdentifier = "cell"
    private var isEditing: Bool = false
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getData()
        self.updateUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.layoutIfNeeded()
    }
    
    // MARK: - Actions
    @IBAction func edit() {
        
        self.isEditing = self.isEditing ? false : true
        
        self.table.setEditing(self.isEditing, animated: true)
        
        self.checkEdit()
    }
    
    private func updateUI() {
        
        let background = UIView(frame: CGRectZero)
        self.table.tableFooterView = background
        self.table.backgroundColor = UIColor.whiteColor()
        
        self.table.delegate = self
        self.table.dataSource = self
        
        self.toolBarContraintBottom.constant = -44
        self.tabBarController?.setTabBarVisible(true, animated: true)
    }
    
    private func getData() {
        self.tableData = self.model.getData()
    }
    
    private func checkEdit() {
        dispatch_async(dispatch_get_main_queue()) { 
            if self.isEditing {
                self.tabBarController?.setTabBarVisible(false, animated: true)
                UIView.animateWithDuration(0.4) {
                    self.toolBarContraintBottom.constant = 0
                    self.view.layoutIfNeeded()
                }
            }else {
                self.tabBarController?.setTabBarVisible(true, animated: true)
                UIView.animateWithDuration(0.2) {
                    self.toolBarContraintBottom.constant = -44
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    // MARK: - TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = self.tableData[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // MARK: - TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
}

