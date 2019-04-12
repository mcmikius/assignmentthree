//
//  ViewController.swift
//  AssignmentThree
//
//  Created by Michail Bondarenko on 4/12/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myName = "Михаил"
    let middleName = "Валериевич"
    let joinedNameAndLastName = "MichailBondarenko"
    let str = "Hello, world!"
    let number = "12345"
    
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let countName = nameCount(name: myName)
        print("My name contains \(countName) characters.")
        
        let mySufixName = sufixSurname(middleName: middleName)
        print("Your siffix - \(mySufixName)")
        
        
        
        let reverseString = reverse(string: str)
        print(reverseString)
        
        let formatedNumber = addNumberDividers(number: number)
        print(formatedNumber)
        
        
        
    }
    
//    1 создать строку с своим именемвывести количество символов содержащихся в ней
    func nameCount(name: String) -> Int {
        let count = name.count
        return count
    }
//    2 создать строку с своим отчеством проверить его на окончание “ич/на”(в классе написан метод который позволяет проверить на суффикс или префикс, найдите и используйте его)
    
    func sufixSurname(middleName: String) -> String {
        var suffix = ""
        
        if middleName.lowercased().hasSuffix("ич") {
            suffix = "ич"
        } else if middleName.lowercased().hasSuffix("на") {
            suffix = "на"
        } else {
            suffix = "Your name does not contain a suffix"
        }
        
        return suffix
    }
    
//    3 создать строку где слитно написано Ваши ИмяФамилия “Iv4nV4silevich"разбить на две отдельных строки из предыдущей создать третью где они обе будут разделены пробеломstr1 = “Iv4n”str2 = “V4silevich”str3 = “Iv4n V4silevich"
    
//    func divideWords(word: String) -> (String, String, String) {
//        word.reversed()
//    }
    
    
//    4 вывести строку зеркально Ось -> ьсОне используя reverse (посимвольно)
    
    func reverse(string: String) -> String {
        var result = ""
        for character in string {
            let asString = "\(character)"
            result = asString + result
        }
        return result
    }
    
//    5 добавить запятые в строку как их расставляет калькулятор 1234567 -> 1,234,56712345 -> 12,345(не использовать встроенный метод для применения формата)
    
    func addNumberDividers(number: String) -> String {
        var result = ""
        for (index, element) in number.reversed().enumerated() {
            result.insert(element, at: result.startIndex)
            if((index + 1) % 3 == 0 && index != number.count - 1) {
                result.insert(",", at: result.startIndex)
            }
        }
        
        return result
    }
    
    

}

