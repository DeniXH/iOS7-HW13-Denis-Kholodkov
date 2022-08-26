//
//  SettingsTableViewCellNotification.swift
//  iOS7-HW13-Denis Kholodkov
//
//  Created by Денис Холодков on 26.08.2022.
//

import UIKit

class SettingsTableViewCellNotification: UITableViewCell {

    static let identifier = "SettingsTableViewCellNotification"

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

    private lazy var rightImageBack: UIView = {
        let rightImageBack = UIView()
        rightImageBack.clipsToBounds = true
        rightImageBack.layer.cornerRadius = 20
        rightImageBack.layer.masksToBounds = true
        return rightImageBack
    }()

    private lazy var rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(rightImageBack)
        rightImageBack.addSubview(rightIcon)
        iconContainer.addSubview(iconImageView)
        accessoryType = .disclosureIndicator

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)

        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)

        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width-20-iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
        rightImageBack.frame = CGRect(x: 325, y: 0, width: size, height: size)
        rightIcon.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize), width: imageSize, height: imageSize)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        rightIcon.image = nil
    }

    public func configurate(with model: RightNotificationCell) {
        label.text = model.title
        rightIcon.image = model.rightIcon
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
}
