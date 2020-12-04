//
//  ViewController.swift
//  GCD
//
//  Created by chandrika R on 12/11/20.
//  Copyright © 2020 chandrika R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//
    }
    @IBAction func button(_ sender: Any) {
//        let queue = DispatchQueue.global(qos: .default)
//                queue.async {
//                    [weak self] in
//                    self?.task1()
//                }
//                queue.async {
//                    [weak self] in
//                    self?.task2()
//                }
        
        let queue = OperationQueue()
        let task1 = BlockOperation { [weak self] in
            self?.task1()
        }
        let task2 = BlockOperation { [weak self] in
            self?.task2()
        }
        task1.completionBlock = {
            print("completed")
        }
        queue.maxConcurrentOperationCount = 1
        //task2.addDependency(task1)
        queue.addOperation(task1)
        queue.addOperation(task2)
        
    }
    func task1() {
        for i in 1...10000 {
            print("1")
            OperationQueue.main.addOperation { [weak self] in
           // DispatchQueue.main.async { [weak self] in
                self?.label.text = "\(i)"
            }
        }
        
    }
    func task2() {
        for i in 1...10000 {
            print("2")
        }
        
    }

}



