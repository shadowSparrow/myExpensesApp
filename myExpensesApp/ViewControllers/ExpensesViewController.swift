//
//  ExpensesViewController.swift
//  myExpensesApp
//
//  Created by mac on 30.05.2023.
//

import UIKit

class ExpensesViewController: UIViewController {

    let expensesView = ExpensesView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Расходы"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28)]
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = UIColor.white
        self.expensesView.frame = self.view.frame
        self.view.addSubview(expensesView)
    }
    
}


