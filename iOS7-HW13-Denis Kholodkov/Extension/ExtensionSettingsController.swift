//
//  ExtensionSettingsController.swift
//  iOS7-HW13-Denis Kholodkov
//
//  Created by Денис Холодков on 25.08.2022.
//

import UIKit

extension SettingsController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCell.identifier,
                for: indexPath
            ) as? SettingsTableViewCell else {
                return UITableViewCell()
            }
             cell.configurate(with: model)
             return cell
       case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
            return UITableViewCell()
           }
            cell.configurate(with: model)
            return cell
        case .rightNoteCell(let model):
             guard let cell = tableView.dequeueReusableCell(
                 withIdentifier: SettingsTableViewCellRightNote.identifier,
                 for: indexPath
             ) as? SettingsTableViewCellRightNote else {
             return UITableViewCell()
            }
             cell.configurate(with: model)
             return cell
        case .rightNotificationCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCellNotification.identifier,
                for: indexPath
            ) as? SettingsTableViewCellNotification else {
            return UITableViewCell()
           }
            cell.configurate(with: model)
            return cell
       }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        case .rightNoteCell(let model):
            model.handler()
        case .rightNotificationCell(let model):
            model.handler()
        }
     }
}
