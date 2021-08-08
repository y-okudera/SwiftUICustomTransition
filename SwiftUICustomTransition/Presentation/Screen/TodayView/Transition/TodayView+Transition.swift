//
//  TodayView+Transition.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

extension TodayView {
    enum TransitionItem {
        case detail(TodayItem)
    }
}

extension TodayView {
    func transition(to transitionItem: TransitionItem?) {
        switch transitionItem {
        case .detail(let item):
            withAnimation(.spring()) {
                detail.show(item: item)
            }
        case .none:
            break
        }
    }
}
