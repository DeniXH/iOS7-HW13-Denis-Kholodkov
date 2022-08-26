//
//  SwitchTableViewCell.swift
//  iOS7-HW13-Denis Kholodkov
//
//  Created by Денис Холодков on 26.08.2022.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    static let identifier = "SwitchTableViewCell"

    // MARK: - Create elements table

    private lazy var iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private lazy var componentSwitch: UISwitch = {
        let componentSwitch = UISwitch()
        componentSwitch.onTintColor = .systemGreen
        return componentSwitch
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(componentSwitch)
        iconContainer.addSubview(iconImageView)
        accessoryType = .none //  символ справа
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)

        componentSwitch.sizeToFit()
        componentSwitch.frame = CGRect(x: contentView.frame.size.width - componentSwitch.frame.size.width - 20,
                                       y: (contentView.frame.size.height - componentSwitch.frame.size.height)/2,
                                       width: componentSwitch.frame.size.width,
                                       height: componentSwitch.frame.size.height)

        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width-20-iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        componentSwitch.isOn = false
    }

    public func configurate(with model: CellSwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        componentSwitch.isOn = model.isOn
    }
}
