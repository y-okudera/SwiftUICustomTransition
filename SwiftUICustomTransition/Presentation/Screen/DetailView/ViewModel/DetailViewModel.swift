//
//  DetailViewModel.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    typealias TransitionItem = DetailView.TransitionItem

    // MARK: - Outputs
    @Published private(set) var selectedItem = TodayItem()
    @Published private(set) var isShown = false
    @Published private(set) var transitionItem: TransitionItem?
}

// MARK: - Inputs
extension DetailViewModel {

    func show(item: TodayItem) {
        selectedItem = item
        transitionItem = nil
        isShown = true
    }

    func hide() {
        transitionItem = nil
        isShown = false
    }

    func didTapClose() {
        transitionItem = .hide
    }

    func didEndDragging() {
        transitionItem = .hideIfBelowThreshold
    }

    func didTapShare() {
        transitionItem = .shareSheet
    }
}
