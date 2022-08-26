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

    // MARK: - Create main Table

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

    // MARK: - Filling main Table

    func configurate () {
        models.append(Section(title: "General", options: [
            .switchCell(model: CellSwitchOption(title: "Авиарежим",
                                                icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange,
                                                handler: {
                                                    print("Авиарежим")
                                                }, isOn: false)),

                .rightNoteCell(model: RightNoteCellOption(title: "Wi-Fi",
                                                          icon: UIImage(systemName: "wifi"),
                                                          iconBackgroundColor: .systemBlue,
                                                          handler: {
                                                              print("Wi-Fi")
                                                          },
                                                          rightSideText: "Не подключено")),
            .rightNoteCell(model: RightNoteCellOption(title: "Bluetooth",
                                                      icon: UIImage(named: "bluetoothS"),
                                                      iconBackgroundColor: .systemBlue,
                                                      handler: {
                                                          print("Bluetooth")
                                                      },
                                                      rightSideText: "Вкл.")),
            .staticCell(model:Cell(title: "Сотовая связь",
                                   icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                                   iconBackgroundColor: .systemGreen) {
                                       print("Сотовая связь")
                                   }),
            .staticCell(model:Cell(title: "Режим модема",
                                   icon: UIImage(systemName: "personalhotspot"),
                                   iconBackgroundColor: .systemGreen) {
                                       print("Режим модема")
                                   }),
            .switchCell(model: CellSwitchOption(title: "VPN",
                                   icon: UIImage(named: "vpn"), iconBackgroundColor: .systemBlue,
                                   handler: {
                                        print("VPN")
                                   }, isOn: false)),
        ]))

        models.append(Section(title: "Information", options: [
            .staticCell(model: Cell(title:"Уведомления",
                                    icon: UIImage(systemName: "bell.badge.fill"),
                                    iconBackgroundColor: .systemRed) {
                                        print("Уведомления")
                                    }),
            .staticCell(model:Cell(title:"Звуки, тактильные сигналы",
                                   icon: UIImage(systemName: "speaker.wave.3.fill"),
                                   iconBackgroundColor: .systemRed) {
                                       print("Звуки, тактильные сигналы")
                                   }),
            .staticCell(model:Cell(title:"Не беспокоить",
                                   icon: UIImage(systemName: "moon"),
                                   iconBackgroundColor: .systemIndigo) {
                                       print("Не беспокоить")
                                   }),
            .staticCell(model:Cell(title:"Экранное время",
                                   icon: UIImage(systemName: "hourglass"),
                                   iconBackgroundColor: .systemIndigo) {
                                       print("Экранное время")
                                   })
        ]))

        models.append(Section(title: "General", options: [
            .rightNotificationCell(model: RightNotificationCell(title: "Основные",
                                                                icon: UIImage(systemName: "gear"),
                                                                iconBackgroundColor: .systemGray, handler: {
                                                                    print("Основные")
                                                                },
                                                                rightIcon: UIImage(systemName: "1.circle.fill"))),

            .staticCell(model:Cell(title:"Пункт управления",
                                   icon: UIImage(systemName: "switch.2"),
                                   iconBackgroundColor: .systemGray) {
                                           print("Пункт управления")
                                       }),
            .staticCell(model:Cell(title:"Экран и яркость",
                                   icon: UIImage(systemName: "textformat.size"),
                                   iconBackgroundColor: .systemBlue) {
                                       print("Экран и яркость")
                                   }),
            .staticCell(model:Cell(title:"Экран «Домой»",
                                   icon: UIImage(systemName: "square.grid.4x3.fill"),
                                   iconBackgroundColor: .systemBlue) {
                                       print("Экран «Домой")
                                   }),
            .staticCell(model:Cell(title:"Универсальный доступ",
                                   icon: UIImage(systemName: "figure.wave.circle.fill"),
                                   iconBackgroundColor: .systemBlue) {
                                       print("Универсальный доступ")
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
