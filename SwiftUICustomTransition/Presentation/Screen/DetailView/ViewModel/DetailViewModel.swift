//
//  DetailViewModel.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    @Published private(set) var selectedItem = TodayItem(title: "", category: "", overlay: "", text: "", contentImage: "", logo: "")
    @Published private(set) var isShown = false
}

// MARK: - Inputs
extension DetailViewModel {

    func show(item: TodayItem) {
        selectedItem = item
        isShown = true
    }

    func hide() {
        isShown = false
    }
}
