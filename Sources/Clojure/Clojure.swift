//
//  Clojure.swift
//  Clojure
//
//  Created by Seoksun Jang on 2021/01/26.
//  Copyright © 2021 LambdaDog. All rights reserved.
//

import Foundation

public typealias ClosedRangeGeneratorTuple = (AnySequence<Int>, ClosedRange<Int>)

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

public func Cycle(_ range: ClosedRangeGeneratorTuple) -> AnySequence<Int> {
    return MakeRangeGeneratorTuple(range.1, isCycle: true).0
}

public func Take(_ upto: Int, _ range: Any) -> Array<Int> {
    if let range = range as? ClosedRangeGeneratorTuple {
        let tuple = range
        
        let generator = tuple.0
        let range = tuple.1
        
        let lowerBound = range.lowerBound
        let upperBound = range.upperBound

        let sum = abs(lowerBound) + abs(upperBound)
        if upto <= sum {
            return Array(generator.lazy.prefix(upto))
        } else {
            return Array(generator.lazy.prefix(sum))
        }
    } else {
        if let generator = range as? AnySequence<Int> {
            let iterator = generator.makeIterator()
            return Array((0...upto).map { _ in iterator.next() ?? 0 }.lazy.prefix(upto))
        } else {
            return []
        }
    }
}

public func Range(_ lowerBound: Int, _ upperBound: Int) -> ClosedRangeGeneratorTuple {
    MakeRangeGeneratorTuple(lowerBound...upperBound)
}

// (for [x (range 0 10)] x)
// return lazy sequence
// (0 1 2 3 4 5 6 7 8 9)

// For((Range 0 10)).forEach { print(x) }
public func For<T>(range: ClosedRangeGeneratorTuple) -> AnySequence<T> {
    Generate(range.lowerBound...range.upperBound, isCycle: false)
}

// while doseq is for executing side-effects and returns nil.
// (doseq [x (range 0 10) (prn x))
//0
//1
//2
//3
//4
//5
//6
//7
//8
//9
//nil

    // (doseq [x (range 0 10) x)
// nil
public func DoseQ(range: ClosedRangeGeneratorTuple) -> Void {

}

public func prn(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    items.forEach {
        Swift.print($0, separator: separator, terminator: terminator)
    }
    #endif
}

