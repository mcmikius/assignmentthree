//
//  ViewController.swift
//  AssignmentThree
//
//  Created by Michail Bondarenko on 4/12/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let myName = "Михаил"
    let middleName = "Валериевич"
    let joinedNameAndLastName = "MichailBondarenko"
    let str = "Hello, world!"
    let number = "12345948"
    let password = "32556reWDr"
    let someArray = [9, 1, 2, 5, 1, 7]
    let string = "ЯЗЗЬ"
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let countName = nameCount(name: myName)
        print("My name contains \(countName) characters.")
        
        let mySufixName = sufixSurname(middleName: middleName)
        print("Your siffix - \(mySufixName)")
        
        let nameAndSurname = splitWords(string: joinedNameAndLastName)
        print(nameAndSurname)
        let name = onlyName(string: nameAndSurname)
        print(name)
        let surname = onlySurname(string: nameAndSurname)
        print(surname)
        
        let reverseString = reverse(string: str)
        print(reverseString)
        
        let formatedNumber = addNumberDividers(number: number)
        print(formatedNumber)
        
        let secureLevel = checkSecureLavel(password: password)
        print("the password - \(password), secure level - \(secureLevel)")
        
        let editedArray = sortAndDelete(someArray)
        print("Base array - \(someArray), new array - \(editedArray)")
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
    
    func splitWords(string: String) -> String {
        var result = ""
        
        for character in string {
            if String(character) == String(character).uppercased() {
                result.append(" ")
            }
            
            result.append(character)
        }
        
        return result
    }
    
    func onlyName(string: String) -> String {
        let index = string.lastIndex(of: " ") ?? string.endIndex
        let beginning = string[..<index]
        let name = String(beginning)
        return name
    }
    
    func onlySurname(string: String) -> String {
        let index = string.lastIndex(of: " ") ?? string.endIndex
        let beginning = string[index...]
        let surname = String(beginning)
        return surname
    }
    
    
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
    
    //    6 проверить пароль на надежность от 1 до 5
    //    4) если пароль содержит числа +1
    //    b) символы верхнего регистра +1
    //    c) символы нижнего регистра +1
    //    d) спец символы +1
    //    e) если содержит все вышесказанное
    //    пример:123456 - 1
    //    qwertyui - 1
    //    12345qwerty - 2
    //    32556reWDr - 3
    //    4) b) c)
    
    func checkSecureLavel(password: String) -> Int{
        var secureLevel = 0
        
        if containsNumber(password) {
            secureLevel += 1
        }
        if  containsLowcaseChar(password) {
            secureLevel += 1
        }
        if  containsUpercaseChar(password) {
            secureLevel += 1
        }
        if  containsSpecialChar(password) {
            secureLevel += 1
        }
        return secureLevel
    }
    
    func containsNumber(_ string: String) -> Bool {
        let numbersRange = string.rangeOfCharacter(from: .decimalDigits)
        return (numbersRange != nil)
    }
    
    func containsLowcaseChar(_ string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil
    }
    
    func containsUpercaseChar(_ string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
    }
    
    func containsSpecialChar(_ string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil
    }
    
    //    7 сортировка массива не встроенным методом по возрастанию + удалить дубликаты[9, 1, 2, 5, 1, 7]
    
    func sortAndDelete(_ array: [Int]) -> [Int] {
        func arraySort(_ array: [Int]) -> [Int] {
            var result = array
            
            for x in 1..<result.count {
                var y = x
                while y > 0 && result[y] < result[y - 1] {
                    result.swapAt(y - 1, y)
                    y -= 1
                }
            }
            return result
        }
        
        func removeDuplicates(array: [Int]) -> [Int] {
            let baseArray = Array(Set(array))
            return baseArray
        }
        
        let result = arraySort(removeDuplicates(array: array))
        
        return result
    }
    
    //    8 написать метод который будет переводить строку в транслит - пример print(convertStrToTr4nslite(:”ЯЗЗЬ”)) -> “YAZZ”print(convertStrToTr4nslite:”морДа”) -> “morD4”
    
    
    let dictionary = ["А": "A", "Б": "B", "В": "V", "Г": "G", "Д": "D", "Е": "E", "Ё": "E", "Ж": "Zh", "З": "Z", "И": "I", "Й": "I", "К": "K", "Л": "L", "М": "M", "Н": "N", "О": "O", "П": "P", "Р": "R", "С": "S", "Т": "T", "У": "U", "Ф": "F", "Х": "Kh", "Ц": "C", "Ч": "Ch", "Ш": "Sh", "Щ": "Sch", "Ъ": "'", "Ы": "Y", "Ъ": "'", "Э": "E", "Ю": "Yu", "Я": "Ya"]
    
    
    
    
}

