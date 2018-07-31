//
//  ViewController.swift
//  ContactsApp-Prog
//
//  Created by chris  on 7/30/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // model via static
    private let contacts = ContactAPI.getContacts()
    
    let contactsTableView = UITableView()
    
    let cellId = "contactCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        contactsTableView.rowHeight = UITableViewAutomaticDimension
        contactsTableView.estimatedRowHeight = 100
        
        view.addSubview(contactsTableView)
        
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: cellId)
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        setUpNavigation()
    }
    
    func setUpNavigation(){
        
        navigationItem.title = "Contacts"
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactTableViewCell
        
//        let job = contacts[indexPath.row].jobTitle
//        let name = contacts[indexPath.row].name
//        let country = contacts[indexPath.row].country
//        cell.nameLabel.text = name
//        cell.jobTitleDetailedLabel.text = job
//        cell.profileImageView.image = UIImage(named: name!)
//        cell.countryImageView.image = UIImage(named: country!)

        cell.contact = contacts[indexPath.row]
        
        return cell
    }


}

