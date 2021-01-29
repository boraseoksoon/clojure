//
//  Private.swift
//  Clojure
//
//  Created by Seoksoon Jang on 2021/01/29.
//

import Foundation

func MakeRangeGeneratorTuple(_ range: ClosedRange<Int>,
                             isCycle: Bool = false) -> ClosedRangeGeneratorTuple {
    Generate(range.lowerBound...range.upperBound, isCycle: isCycle)
}

private func Generate(_ range: ClosedRange<Int>,
                      isCycle: Bool = false) -> ClosedRangeGeneratorTuple {
    let lowerBound = range.lowerBound
    let upperBound = range.upperBound
    
    let offset = 1

    var number = lowerBound - offset
    
    let sequence = AnySequence<Int> {
        AnyIterator {
            if isCycle {
                let conditionClosure: ((Int) -> Int) = { currentNumber in
                    if currentNumber >= upperBound - 1 {
                        return lowerBound - offset
                    } else {
                        return currentNumber
                    }
                }
                
                number = conditionClosure(number)
            }

            number += 1
            return number
        }
    }

    return (sequence, range)
}


