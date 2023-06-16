//
//  ExpensesViewController.swift
//  myExpensesApp
//
//  Created by mac on 30.05.2023.
//

import UIKit

class ExpensesViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 58))
        button.setTitle("Добавить категорию раходов", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(addExpensesButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var texField: UITextField = {
        let texField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        texField.isHidden = true
        texField.delegate = self
        texField.attributedPlaceholder = NSAttributedString(
            string: "наименование",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        texField.textAlignment = .left
        texField.layer.cornerRadius = 4
        texField.backgroundColor = .white
        texField.textColor = .black
        texField.translatesAutoresizingMaskIntoConstraints = false
        return texField
    }()
    
    var expenses: [Expense] = []
    var isShowingKeybord = false
    //var isButtonEnabled: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Расходы"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28)]
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = UIColor.white
        setUIElements()
        setConstraints()
        setKeyboardNotification()
    }
        
    
    private func setUIElements() {
        
        self.view.addSubview(tableView)
        self.view.addSubview(button)
        self.view.addSubview(texField)
        
    }
    
    private func setConstraints() {
        let guide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -60),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            
            button.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -229),
            
            texField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            texField.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
            texField.leadingAnchor.constraint(equalTo: guide.leadingAnchor , constant: 16),
            texField.trailingAnchor.constraint(equalTo: guide.trailingAnchor , constant: -16),
            texField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func addExpensesButtonPressed() {
        if button.backgroundColor == UIColor.darkGray {
               button.backgroundColor = UIColor.blue
            texField.isHidden = true
            let newExpense = Expense(gathegory: texField.text ?? "jo")
            expenses.append(newExpense)
            tableView.reloadData()
            self.view.endEditing(true)
           }
           else if button.backgroundColor == UIColor.blue {
               button.backgroundColor = UIColor.darkGray
               texField.isHidden = false
               texField.becomeFirstResponder()
           }
    }
    
    private func setKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if isShowingKeybord {
                self.view.frame.origin.y = -keyboardSize.height/2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.view.frame.origin.y = 0
    }

    
}

extension ExpensesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expenses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let image = UIImage(systemName: "chevron.right")
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = expenses[indexPath.row].gathegory
        
        let accessory = UIImageView(image: image)
        accessory.tintColor = .blue
        cell.accessoryView = accessory
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = ExpenseDetailsViewController()
        let cell = tableView.cellForRow(at: indexPath)
        detailVC.text = cell?.textLabel?.text ?? "Wrong"
        show(detailVC, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
}

extension ExpensesViewController: UITextFieldDelegate {

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.view.endEditing(true)
}
    
func textFieldDidBeginEditing(_ textField: UITextField) {
    isShowingKeybord = true
}
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        isShowingKeybord = false
        
    }

}





