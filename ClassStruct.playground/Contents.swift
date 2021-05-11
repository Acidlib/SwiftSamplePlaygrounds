import UIKit

enum CardShape: Int {
    case wild = -1
    case heart = 1, bar, rectagular
}

enum CardColor: Int {
    case wild = -1
    case red = 1, yellow, blue, green
}

enum CardFill: Int {
    case wild = -1
    case fill = 1, dot, cross, half
}
struct Card {
    var shape: CardShape
    var number: Int
    var color: CardColor
    var fill: CardFill
}

let cards = [Card(shape: .bar, number: 1, color: .red, fill: .dot),
             Card(shape: .bar, number: 2, color: .blue, fill: .wild),
             Card(shape: .bar, number: 3, color: .yellow, fill: .cross)]

func allSameOrDifferent(_ set: Set<Int>) -> Bool {
    return set.count == 1 || set.count == 3 || set.count == 2 && set.contains(-1)
}

func isSetValid(cards: [Card]) -> Bool {
    guard cards.count == 3 else { return false }
    let initial: (Set<Int>, Set<Int>, Set<Int>, Set<Int>) = ([], [], [], [])
    let mapTuple = cards.reduce(initial) { (result, card) -> (Set<Int>, Set<Int>, Set<Int>, Set<Int>) in
        var newResult = result
        newResult.0.insert(card.shape.rawValue)
        newResult.1.insert(card.number)
        newResult.2.insert(card.color.rawValue)
        newResult.3.insert(card.fill.rawValue)
        return newResult
    }

    return allSameOrDifferent(mapTuple.0) && allSameOrDifferent(mapTuple.1) &&
        allSameOrDifferent(mapTuple.2) &&
        allSameOrDifferent(mapTuple.3)
}

let isValid = isSetValid(cards: cards)
print(isValid)



