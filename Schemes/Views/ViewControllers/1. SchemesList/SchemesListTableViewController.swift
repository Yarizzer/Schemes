//
//  SchemesListTableViewController.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 14/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class SchemesListTableViewController: UITableViewController {

    // MARK: - view model
    var viewModel: SchemesListViewModelType?
    private func updateModelSelectedIndex(withIndexPath indexPath: IndexPath) {
        guard let model = viewModel else { return }
        model.selectedIndexPath(forIndexPath: indexPath)
    }
    
    @IBAction func addNewScheme(_ sender: UIBarButtonItem) {
        //clear model currentIndex
        guard let model = viewModel else { return }
        model.selectedIndexPath(forIndexPath: nil)
        self.performSegue(withIdentifier: "showSchemeSettings", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SchemeListViewModel()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let model = viewModel else { return }
        model.updateSchemesArray()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = viewModel else { return 0 }
        return model.getItemsCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SchemeListCell", for: indexPath) as? SchemesListTableViewCell,
                let model = viewModel else { return UITableViewCell() }
        
        cell.viewModel = model.getSchemeListCellViewModel(forIndexPath: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        updateModelSelectedIndex(withIndexPath: indexPath)
        
        let editScheme = UITableViewRowAction(style: .normal, title: "Edit") { [unowned self] (action, IndexPath) in
            self.performSegue(withIdentifier: "showSchemeSettings", sender: nil)
        }
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { [unowned self] (action, IndexPath) in
            guard let model = self.viewModel else { return }
            model.removeItem()
            
            tableView.deleteRows(at: [indexPath], with: .right)
        }
        
        editScheme.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        return [delete, editScheme]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        updateModelSelectedIndex(withIndexPath: indexPath)
        
        performSegue(withIdentifier: "showCanvasList", sender: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let model = viewModel else { return }
        if identifier == "showCanvasList" {
            if let dvc = segue.destination as? CanvasListViewController {
                dvc.canvasListViewModel = model.getCanvasListViewModel()
            }
        } else if identifier == "showSchemeSettings" {
            if let dvc = segue.destination as? SchemeSettingsViewController {
                guard let model = viewModel else { return }
                dvc.viewModel = model.getSchemeSettingsViewModel()
            }
        }
    }
    

}
