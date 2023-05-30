//
//  ExpensesView.swift
//  myExpensesApp
//
//  Created by mac on 30.05.2023.
//

import Foundation
import UIKit

class ExpensesView: UIView {
    
    var tableView: UITableView!
    var button: UIButton!
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        
            UIElementsInit()
         }

         required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
         }
    
}

extension ExpensesView {
    private func UIElementsInit(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
   
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 58))
        button.setTitle("Добавить категорию раходов", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
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
        

    }
    
}

extension ExpensesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let image = UIImage(systemName: "chevron.right")
        cell.textLabel?.text = "Магазин"
        let accessory = UIImageView(image: image)
        accessory.tintColor = .blue
        cell.accessoryView = accessory
        
        return cell
    }
}


