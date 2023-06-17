//
//  ExpenseDetailsViewController.swift
//  myExpensesApp
//
//  Created by mac on 14.06.2023.
//

import UIKit

class ExpenseDetailsViewController: UIViewController {

    var text: String = "Ремонт"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        
        let image = UIImage(systemName: "plus.circle")
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 60
        button.addTarget(self, action: #selector(addExpenseButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = text
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        
        setUIElements()
        setConstraints()
        
    }
    
    @objc func addExpenseButtonPressed() {
    }
    
    private func setUIElements() {
        self.view.addSubview(tableView)
        self.view.addSubview(button)
    }
    
   
    
    private func setConstraints() {
        let guide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -300),
            
            button.heightAnchor.constraint(equalToConstant: 120),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -64),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
            ])
        
    }
    
}

extension ExpenseDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DetailTableViewCell(style: .default, reuseIdentifier: "cell")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = DetailExpensesTableViewHeaderView(reuseIdentifier: "header")
        return header
    }
}
