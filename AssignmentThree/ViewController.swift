//
//  ViewController.swift
//  AssignmentThree
//
//  Created by Michail Bondarenko on 4/12/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myName = "Michail"

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let countName = nameCount(name: myName)
        print("My name contains \(countName) characters.")
        
        
    }
    
//    1 создать строку с своим именемвывести количество символов содержащихся в ней
    func nameCount(name: String) -> Int {
        let count = name.count
        return count
    }
//    2 создать строку с своим отчествомпроверить его на окончание “ич/на”(в классе написан метод который позволяет проверить на суффикс или префикс, найдите и используйте его)

}

