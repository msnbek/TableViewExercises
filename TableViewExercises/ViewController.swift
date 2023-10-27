//
//  ViewController.swift
//  TableViewExercises
//
//  Created by Mahmut Senbek on 6.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isEditing = false
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let teamName = getTeamName(section: section)
        return ViewController.passengers.filter { $0.team == teamName }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let teamName = getTeamName(section: indexPath.section)
        let teamPassengers = ViewController.passengers.filter { $0.team == teamName }
        let passenger = teamPassengers[indexPath.row]
        
        cell.textLabel?.text = "\(passenger.name) \(passenger.surname)"
        cell.label.text = "Age: \(passenger.age), Hometown: \(passenger.hometown)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getTeamName(section: section)
    }
    private func getTeamName(section: Int) -> String {
        switch section {
        case 0:
            return "iOS Team"
        case 1:
            return "Android Team"
        case 2:
            return "Designer Team"
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // ???????
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedPerson = ViewController.passengers.remove(at: sourceIndexPath.row)
        ViewController.passengers.insert(movedPerson, at: destinationIndexPath.row)
    }
    /*
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
     
     let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (_, _, completion) in
     }
     let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
     return configuration
     }
     */
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let uptadedPassengers = UITableViewRowAction(style: .default, title: "Delete") { _, _ in
            print("shared")
        }
        return [uptadedPassengers]
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addFavorite = UIContextualAction(style: .normal, title: "Favorite") { (_, _, completion) in
        }
        let configuration = UISwipeActionsConfiguration(actions: [addFavorite])
        return configuration
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = #colorLiteral(red: 0.7695015073, green: 1, blue: 0.7531556487, alpha: 1)
            headerView.backgroundView?.backgroundColor = .blue
            headerView.textLabel?.textColor = .red
        }
    }
}

