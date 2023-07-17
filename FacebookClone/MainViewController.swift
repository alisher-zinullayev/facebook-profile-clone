//
//  ViewController.swift
//  FacebookClone
//
//  Created by Alisher Zinullayev on 08.07.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let sectionSymbols = ["person.2.fill", "calendar", "person.3.fill", "graduationcap.fill", "house.fill", "gamecontroller.fill", "", "", "questionmark", "gearshape", "lock.fill", ""]
    private let firstSectionNames = ["Friends", "Events", "Groups", "CMU", "Town Hall", "Instant Games", "See More..."]
    private let secondSectionNames = ["Add favorites..."]
    private let thirdSectionNames = ["Settings", "Privacy Shortcuts", "Help and Support"]
    private let lastSectionNames = ["Log Out"]
    
    private let userTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.register(SectionsTableViewCell.self, forCellReuseIdentifier: SectionsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(userTableView)
        userTableView.delegate = self
        userTableView.dataSource = self
        configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userTableView.frame = view.bounds
    }
    
}
// 3b5998
// Navigation Bar
extension MainViewController {
    
    private func configureNavigationBar() {
        navigationItem.title = "Facebook"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(
            red: CGFloat(0x3B) / 255.0,
            green: CGFloat(0x59) / 255.0,
            blue: CGFloat(0x98) / 255.0,
            alpha: 1.0
        )
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

// TableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return firstSectionNames.count
        }
        if section == 2 {
            return secondSectionNames.count
        }
        if section == 3 {
            return thirdSectionNames.count
        }
        else {
            return lastSectionNames.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
            cell.configure(picture: "profile", name: "BayMax", detail: "View your profile")
            cell.accessoryType = .disclosureIndicator
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SectionsTableViewCell.identifier, for: indexPath) as! SectionsTableViewCell
            if indexPath.section == 1 {
                cell.configure(picture: sectionSymbols[indexPath.row], name: firstSectionNames[indexPath.row])
            } else if indexPath.section == 2 {
                cell.configure(picture: sectionSymbols[indexPath.row + firstSectionNames.count], name: secondSectionNames[indexPath.row])
            } else if indexPath.section == 3 {
                cell.configure(picture: sectionSymbols[indexPath.row + firstSectionNames.count + secondSectionNames.count], name: thirdSectionNames[indexPath.row])
            } else {
                cell.configure(picture: sectionSymbols[indexPath.row + firstSectionNames.count + secondSectionNames.count + thirdSectionNames.count], name: lastSectionNames[indexPath.row])
            }
            if indexPath.row != 7 && indexPath.row != 8 {
                cell.accessoryType = .disclosureIndicator
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        }
        if section == 1 {
            return ""
        }
        if section == 2 {
            return "Favorites"
        }
        if section == 3 {
            return ""
        }
        else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0 {
                return 0.1
            } else {
                return 30
            }
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section != 0 {
                let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
                headerView.backgroundColor = .clear
                
                let label = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.width - 32, height: 40))
                label.font = UIFont.boldSystemFont(ofSize: 16)
                label.textColor = .gray
                if section == 2 {
                    label.text = "Favorites"
                    label.frame.origin.y -= 5
                }
                headerView.addSubview(label)
                return headerView
            }
            return nil
        }
}
