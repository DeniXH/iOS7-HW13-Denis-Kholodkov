//
//  GroupStructure.swift
//  iOS7-HW13-Denis Kholodkov
//
//  Created by Денис Холодков on 25.08.2022.
//

import Foundation
import UIKit

struct Cell {
    var title: String
    var icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct Section {
    let title: String
    let options: [CellType]
}

enum CellType {
    case staticCell(model: Cell)
    case switchCell(model: CellSwitchOption)
    case rightNoteCell(model: RightNoteCellOption)
    case rightNotificationCell(model: RightNotificationCell)
}

struct CellSwitchOption {
    var title: String
    var icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct  RightNoteCellOption {
    var title: String
    var icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var rightSideText: String
}

struct  RightNotificationCell {
    var title: String
    var icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var rightIcon: UIImage?
}
