//
//  DetailExpenseTableHeaderView.swift
//  myExpensesApp
//
//  Created by mac on 17.06.2023.
//

import Foundation
import UIKit

class DetailExpensesTableViewHeaderView: UITableViewHeaderFooterView {

    // MARK: - Private Properties

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
        label.text = "на что"
        //label.font = Const.Fonts.helveticaNeueCyrBlack(size: 13)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()

    private let expenseTimeLabel: UILabel = {
        let label = UILabel()
         label.text = "когда"
        //label.font = Const.Fonts.helveticaNeueCyrBlack(size: 13)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()

    private let expenseAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "сколько"
        //label.font = Const.Fonts.helveticaNeueCyrBlack(size: 13)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()

    private let topBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()

    private let bottomBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()

    // MARK: - Initializers

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(expenseItemLabel)
        labelsStackView.addArrangedSubview(expenseTimeLabel)
        labelsStackView.addArrangedSubview(expenseAmountLabel)
        labelsStackView.addSubview(topBorderView)
        labelsStackView.addSubview(bottomBorderView)
    }

    private func setupConstraints() {
        labelsStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        labelsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
