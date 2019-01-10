//
//  ViewModel.swift
//  Test
//
//  Created by iOS on 2018/12/29.
//  Copyright © 2018 weiman. All rights reserved.
//

import UIKit

class ViewModel: NSObject {

    let tableView: UITableView
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setup()
    }
    
    private func setup() {
        
//        tableView.delegate = self
//        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(Footer.self, forHeaderFooterViewReuseIdentifier: "footer")
    }
    
    func reload() {
        tableView.reloadData()
    }
}

extension ViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:     return 1
        case 1:     return 3
        case 2:     return 1
        default:    return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "哈哈哈哈"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        header?.contentView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer  = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer")
        footer?.contentView.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return footer
    }
}

extension ViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        print("heightForHeaderInSection: \(section)")
        switch section {
        case 1, 2: return 60
        default: return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        print("heightForFooterInSection: \(section)")
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableView.contentOffset)
    }
}
