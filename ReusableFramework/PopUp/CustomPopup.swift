//
//  CustomPopup.swift
//  ReusableFramework
//
//  Created by JEEVAN TIWARI on 09/01/19.
//  Copyright © 2019 AccountingApp. All rights reserved.
//

import UIKit

open class CustomPopup: UIView{
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6602662852)
    }
    
    func addViews(){
        addSubview(cardView)
        cardView.addSubview(searchBar)
        cardView.addSubview(tableView)
        
        cardView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        cardView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -32).isActive = true
        cardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        searchBar.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        searchBar.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 8).isActive = true
        searchBar.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -8).isActive = true
        
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 8).isActive = true
        tableView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8).isActive = true
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        searchBar.isTranslucent = true
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = #colorLiteral(red: 0.4470588235, green: 0.568627451, blue: 0.9568627451, alpha: 1)
        return searchBar
    }()
    
    lazy var cardView: CardView = {
       let cardView = CardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.cornerRadius = 10
        cardView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cardView
    }()
}
