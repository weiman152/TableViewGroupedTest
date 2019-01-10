//
//  ViewController.swift
//  Test
//
//  Created by iOS on 2018/12/29.
//  Copyright © 2018 weiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private lazy var viewModel = ViewModel(newTableView)
//    private var viewModel: ViewModel?
    
    private lazy var newTableView: UITableView = {
        return $0
    }( UITableView(frame: .zero, style: .grouped) )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
//        setup()
        loadData()
    }

    private func setup() {
//        let _ = viewModel
//        viewModel = ViewModel(tableView)
        
        let frame = CGRect(x: 0,
                           y: 100,
                           width: view.frame.size.width,
                           height: view.frame.size.height - 100 - 49)
        newTableView.frame = frame
        newTableView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
    }

}

extension ViewController {
    
    private func loadData() {
        
//        let group = DispatchGroup()
//
//        group.enter()
//        let work1 = DispatchQueue(label: "1")
//        work1.async {
//            print("线程1")
//            Thread.sleep(forTimeInterval: 2)
//            print("线程1执行完成")
//            group.leave()
//        }
//
//        group.enter()
//        let work2 = DispatchQueue(label: "2")
//        work2.async {
//            print("线程2")
//            Thread.sleep(forTimeInterval: 3)
//            print("线程2执行完成")
//            group.leave()
//        }
//
//        group.notify(queue: .main) { [weak self] in
//            guard let self = self else { return }
//            let _ = self.viewModel
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
//                print("reload")
//                self.viewModel.reload()
//            })
//        }
        
//        self.viewModel.reload()
        /*
         while(!isFinished) { [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]; }

         */
       
        viewModel.tableView.delegate = viewModel
        viewModel.tableView.dataSource = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.setup()
            self.view.addSubview(self.newTableView)
//            self.newTableView.delegate = self.viewModel
//            self.newTableView.dataSource = self.viewModel
            self.viewModel.reload()
        }
    }
}
