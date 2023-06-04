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
        self.view.backgroundColor = UIColor.white
        self.expensesView.frame = self.view.frame
        self.view.addSubview(expensesView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


