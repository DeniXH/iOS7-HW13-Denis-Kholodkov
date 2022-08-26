//
//  ExtensionSettingsController.swift
//  iOS7-HW13-Denis Kholodkov
//
//  Created by Денис Холодков on 25.08.2022.
//

import UIKit

extension SettingsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
       guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier,
                                                      for: indexPath) as? SettingsTableViewCell else {
           return UITableViewCell()
       }
        cell.configurate(with: model)
        return cell
    }
}
