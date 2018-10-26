//
//  Extractor.swift
//  Exercise 4 Pick Me
//
//  Created by Tom Nuss on 2018-01-25.
//  Copyright © 2018 Tom Nuss. All rights reserved.
//

import Foundation

class Extractor {

    var verbs:[String] = []
    var numbers:[String] = []
    var nouns:[String] = []
    
    init() {
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        verbs = dict!.object (forKey:"verbs")as! [String]
        numbers = dict!.object (forKey:"numbers")as! [String]
        nouns = dict!.object (forKey:"nouns")as! [String]
        print(verbs)
        print(numbers)
        print(nouns)
    }
    
    func getVerb(index: Int) -> String {
        return self.verbs[index]
    }
    
    func getNumber(index: Int) -> String {
        return self.numbers[index]
    }
    
    func getNoun(index: Int) -> String {
        return self.nouns[index]
    }
    
    func verbCount() -> Int {
        return verbs.count
    }
    
    func numberCount() -> Int {
        return numbers.count
    }
    
    func nounCount() -> Int {
        return nouns.count
    }
}

/*func input() -> String {
 let keyboard = FileHandle.standardInput
 let inputData = keyboard.availableData
 return NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)!as String
 }*/
