//
//  Clojure.swift
//  Swift functions that implements Clojure standard library
//
//  Created by Seoksoon Jang on 2020/01/05.
//  Copyright © 2021 LambdaDog. All rights reserved.
//

import Foundation

public func Map<T>(_ seq: [T], closure: (T) -> Any) -> [Any] {
    seq.map(closure)
}

public func Filter<T>(_ seq: [T], closure: (T) throws -> Bool) -> [Any] {
    try! seq.filter(closure)
}

public func Reduce<T>(from initialValue: T,
                      sequence: [T],
                      closure: (T, T) throws -> T) -> T {
    try! sequence.reduce(initialValue, closure)
}

public func Take<T>(_ count: Int,
                    _ sequence: Array<T>) -> Array<T>.SubSequence where T: Any {
    sequence[0..<count]
}

// Clojure => (map (fn [i] (str i "!\n")) (range 0 10))
//let res = Map(Array((0...10))) { String($0) + "\n!" }
//res

// Clojure => (filter (fn [item] (= (mod item 2) 0)) (range 0 10))
// => (0 2 4 6 8 10)
//let res2 = Filter(Array((0...10))) { $0.isMultiple(of: 2) }
//res2
// => [0, 2, 4, 6, 8, 10]

// Clojure => (reduce + (range 0 10))
// => 45
//let res3 = Reduce(from: 0, sequence: Array((0...10))) { $0 + $1 }
// => 55

// Clojure => (take 3 (range 0 10))
// (0 1 2)
//let res4 = Take(3, Array(0...10))
//res4
// => [0,1,2]
