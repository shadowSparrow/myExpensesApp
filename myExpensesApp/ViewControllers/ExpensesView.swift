//
//  ExpensesView.swift
//  myExpensesApp
//
//  Created by mac on 30.05.2023.
//

import Foundation
import UIKit
import NotificationCenter

class ExpensesView: UIView {
    
    var tableView: UITableView!
    var button: UIButton!
    var texField: UITextField!
    var expenses: [Expense] = []
    var isShowingKeybord = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        UIElementsInit()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc func keyboardWillShow(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    if isShowingKeybord {
        self.frame.origin.y = -keyboardSize.height/2
        
    }
    }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        self.frame.origin.y = 0
        
    }
    }
    

         required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
         }
}

extension ExpensesView {
    
    private func UIElementsInit() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
   
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 58))
        button.setTitle("Добавить категорию раходов", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(addExpensesButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        
        texField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        texField.isHidden = true
        texField.delegate = self
        texField.placeholder = "наименование"
        
        texField.textAlignment = .left
        texField.layer.cornerRadius = 4
        texField.backgroundColor = .white
        texField.borderStyle = .line
        texField.textColor = .black
        texField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(texField)
        
        
        //Contraints
        let guide = self.safeAreaLayoutGuide
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -60).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        button.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -229).isActive = true
        
        texField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        texField.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8).isActive = true
        texField.leadingAnchor.constraint(equalTo: guide.leadingAnchor , constant: 16).isActive = true
        texField.trailingAnchor.constraint(equalTo: guide.trailingAnchor , constant: -16).isActive = true
        texField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
  
    
    @objc func addExpensesButtonPressed() {
        print("add Expenses")
        texField.isHidden = false
        
    }
    
    @objc func didTapDone() {
        
        let newExpense = Expense(gathegory: texField?.text ?? "jo")
        expenses.append(newExpense)
        texField.isHidden = true
        tableView.reloadData()
        
        self.endEditing(true)
    }
}

extension ExpensesView: UITableViewDelegate, UITableViewDataSource {
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
}


extension ExpensesView: UITextFieldDelegate {

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.endEditing(true)
}


    
func textFieldDidBeginEditing(_ textField: UITextField) {
    let keyboardToolbar = UIToolbar()
    keyboardToolbar.standardAppearance.doneButtonAppearance = UIBarButtonItemAppearance(style: .done)
    keyboardToolbar.sizeToFit()
    textField.inputAccessoryView = keyboardToolbar
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
    keyboardToolbar.items = [doneButton]
    isShowingKeybord = true
}
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        isShowingKeybord = false
        
    }

}

