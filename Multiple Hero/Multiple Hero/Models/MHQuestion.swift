//
//  MHQuestion.swift
//  Multiple Hero
//
//  Created by Joe Pham on 2022-08-01.
//

import Foundation

struct MHQuestion {
	let questionString: String
	let resultString: String
}

extension MHQuestion {
	func allQuestions(tablesUpTo: Int, numQuestions: Int) -> [MHQuestion] {
		return generateQuestionsShuffled(for: tablesUpTo, numQuestions: numQuestions)
	}
	
	private func generateQuestionsShuffled(
		for tablesUpTo: Int,
		numQuestions: Int
	) -> [MHQuestion] {
		var temp: [MHQuestion] = []
		createMultiplicationQuestionsWithoutDuplicates(upperBound: tablesUpTo, in: &temp)
		
		temp.shuffle()
		return temp.selectFromStartTo(element: numQuestions)
	}
	
	fileprivate func createMultiplicationQuestionsWithoutDuplicates(
		upperBound tablesUpToBound: Int,
		in tempTableToFill: inout [MHQuestion]
	) -> Void {
		for i in 2...tablesUpToBound {
			for j in 1...12 {
				if j >= i {
					let multiplicationResult = String(i * j)
					tempTableToFill.append(
						MHQuestion(questionString: "\(i) x \(j) =", resultString: multiplicationResult)
					)
					
					if i != j {
						tempTableToFill.append(
							MHQuestion(questionString: "\(j) x \(i) =", resultString: multiplicationResult)
						)
					}
				}
			}
		}
	}
}
