//
//  CatalogTableViewController.swift
//  GBShop
//
//  Created by Алексей Мальков on 21.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit

class CatalogTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    var catalog: [CatalogResult] = []
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "catalogCell")
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView.contentInset.top = 20
        tableView.frame = CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight)
        let contentSize = self.tableView.contentSize
        let footer = UIView(frame: CGRect(x: self.tableView.frame.origin.x,
                                          y: self.tableView.frame.origin.y + contentSize.height,
                                          width: self.tableView.frame.size.width,
                                          height: self.tableView.frame.height - self.tableView.contentSize.height))
        
        self.tableView.tableFooterView = footer
                
        view.addSubview(tableView)
                
        let goods = requestFactory.makeGoodsRequestFactory()
        
                goods.doCatalogList(){ response in
                    switch response.result {
                    case .success(let catalogResult):
                        self.catalog = catalogResult
                        self.tableView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogCell", for: indexPath)
        let object = catalog[indexPath.row]
        cell.textLabel?.text = object.productName
        cell.detailTextLabel?.text = String(object.productPrice)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.count
    }
    
}
