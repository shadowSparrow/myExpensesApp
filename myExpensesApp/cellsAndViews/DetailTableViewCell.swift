//
//  DetailTableViewCell.swift
//  myExpensesApp
//
//  Created by mac on 16.06.2023.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let expenseItemLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "на что"
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    private let expenseTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "когда"
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    private let expenseAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "сколько"
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(expenseItemLabel)
        labelsStackView.addArrangedSubview(expenseTimeLabel)
        labelsStackView.addArrangedSubview(expenseAmountLabel)
    }
    
    private func setupConstraints(){
        labelsStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        labelsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

}
