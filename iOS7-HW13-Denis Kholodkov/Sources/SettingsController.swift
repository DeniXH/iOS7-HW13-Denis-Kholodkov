//
//  ViewController.swift
//  iOS7-HW13-Denis Kholodkov
//
//  Created by Денис Холодков on 25.08.2022.
//

import UIKit
import Foundation

class SettingsController: UIViewController, UITableViewDelegate {

    var models = [Section]()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self,
                           forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self,
                           forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.register(SettingsTableViewCellRightNote.self,
                           forCellReuseIdentifier: SettingsTableViewCellRightNote.identifier)
        tableView.register(SettingsTableViewCellNotification.self,
                           forCellReuseIdentifier: SettingsTableViewCellNotification.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurate ()
        view.backgroundColor = .white
        title = "Настройки"
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    func configurate () {
        models.append(Section(title: "General", options: [
            .switchCell(model: CellSwitchOption(title: "Авиарежим",
                                                icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange,
                                                handler: {

                                                }, isOn: false)),

            .rightNoteCell(model: RightNoteCellOption(title: "Wi-Fi",
                                                      icon: UIImage(systemName: "wifi"),
                                                      iconBackgroundColor: .systemBlue,
                                                      handler: {

                                                      },
                                                      rightSideText: "Не подключено")),
            .rightNoteCell(model: RightNoteCellOption(title: "Bluetooth",
                                                      icon: UIImage(named: "bluetoothS"),
                                                      iconBackgroundColor: .systemBlue,
                                                      handler: {

                                                      },
                                                      rightSideText: "Вкл.")),
            .staticCell(model:Cell(title: "Сотовая связь",
                                   icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                                   iconBackgroundColor: .systemGreen) {
            }),
            .staticCell(model:Cell(title: "Режим модема",
                                   icon: UIImage(systemName: "personalhotspot"),
                                   iconBackgroundColor: .systemGreen) {
            }),
            .switchCell(model: CellSwitchOption(title: "VPN",
                                                icon: UIImage(named: "vpn"), iconBackgroundColor: .systemBlue,
                                                handler: {

                                                }, isOn: false)),
        ]))

        models.append(Section(title: "Information", options: [
            .staticCell(model: Cell(title:"Уведомления",
                                    icon: UIImage(systemName: "bell.badge.fill"),
                                    iconBackgroundColor: .systemRed) {
                                    }),
            .staticCell(model:Cell(title:"Звуки, тактильные сигналы",
                                   icon: UIImage(systemName: "speaker.wave.3.fill"),
                                   iconBackgroundColor: .systemRed) {
            }),
            .staticCell(model:Cell(title:"Не беспокоить",
                                   icon: UIImage(systemName: "moon"),
                                   iconBackgroundColor: .systemIndigo) {
            }),
            .staticCell(model:Cell(title:"Экранное время",
                                   icon: UIImage(systemName: "hourglass"),
                                   iconBackgroundColor: .systemIndigo) {
            })
        ]))

        models.append(Section(title: "General", options: [
            .rightNotificationCell(model: RightNotificationCell(title: "Основные",
                                                                icon: UIImage(systemName: "gear"),
                                                                iconBackgroundColor: .systemGray, handler: {

                                                                },
                                                                rightIcon: UIImage(systemName: "1.circle.fill"))),

            .staticCell(model:Cell(title:"Bluetooth",
                                   icon: UIImage(systemName: "play"),
                                   iconBackgroundColor: .systemRed) {
            }),
            .staticCell(model:Cell(title:"Airplane Mode",
                                   icon: UIImage(systemName: "play"),
                                   iconBackgroundColor: .systemGreen) {
            }),
            .staticCell(model:Cell(title:"iCloud",
                                   icon: UIImage(systemName: "play"),
                                   iconBackgroundColor: .systemBlue) {
            })
        ]))
    }

    // MARK: - Setup Layout

    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
                    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
                ])
    }
}
