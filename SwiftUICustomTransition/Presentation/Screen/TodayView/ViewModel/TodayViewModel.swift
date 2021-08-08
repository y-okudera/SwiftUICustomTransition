//
//  TodayViewModel.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import Combine
import Foundation

final class TodayViewModel: ObservableObject {
    typealias TransitionItem = TodayView.TransitionItem

    // MARK: - Outputs
    @Published private(set) var todayText: String = ""
    @Published private(set) var items: [TodayItem] = []
    @Published private(set) var transitionItem: TransitionItem?

    private var cancellables: Set<AnyCancellable> = []

    init() {

    }
}

// MARK: - Inputs
extension TodayViewModel {

    func onAppear() {
        self.todayFormat()
        self.items = TodayItem.items
    }

    func didTapItem(_ item: TodayItem) {
        transitionItem = .detail(item)
    }
}

// MARK: - Private
private extension TodayViewModel {
    static var todayFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "JST")
        dateFormatter.dateFormat = "EEEE dd MMMM"
        return dateFormatter
    }

    func todayFormat() {
        let now = Date()
        self.todayText = Self.todayFormatter.string(from: now)
    }
}
