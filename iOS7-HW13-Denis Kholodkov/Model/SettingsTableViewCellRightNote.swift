//
//  SettingsTableViewCellRightNote.swift
//  iOS7-HW13-Denis Kholodkov
//
//  Created by Денис Холодков on 26.08.2022.
//

import UIKit

class SettingsTableViewCellRightNote: UITableViewCell {

    static let identifier = "SettingsTableViewCellRightNote"

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

    private lazy var rightLabel: UILabel = {
        let rightLabel = UILabel()
        rightLabel.numberOfLines = 1
        rightLabel.font = .systemFont(ofSize: 15)
        rightLabel.textColor = .lightGray
        rightLabel.textAlignment = .right
        return rightLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(rightLabel)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        rightLabel.frame = CGRect(x: -4 + iconContainer.frame.size.width,
                                  y: 0,
                                  width: contentView.frame.size.width-5-iconContainer.frame.size.width,
                                  height: contentView.frame.size.height)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        rightLabel.text = nil
    }

    public func configurate(with model: RightNoteCellOption) {
        label.text = model.title
        rightLabel.text = model.rightSideText
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
}
