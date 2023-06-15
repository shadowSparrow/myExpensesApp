//
//  ExpenseDetailsViewController.swift
//  myExpensesApp
//
//  Created by mac on 14.06.2023.
//

import UIKit

class ExpenseDetailsViewController: UIViewController {

    var text: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = text
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
