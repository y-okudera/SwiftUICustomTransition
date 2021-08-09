//
//  DetailView+Transition.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/09.
//

import SwiftUI

extension DetailView {
    enum TransitionItem {
        case shareSheet
        case hide
        case hideIfBelowThreshold
    }
}

extension DetailView {

    func transition(to transitionItem: TransitionItem?) {
        switch transitionItem {
        case .shareSheet:
            viewControllerHolder?.present {
                SlideOverCard {
                    ShareSheet(
                        activityItems: [ShareActivityItemSource(shareText: viewModel.selectedItem.title, shareImage: UIImage(named: viewModel.selectedItem.logo)!)]
                    )
                }
            }
        case .hide:
            withAnimation(.spring()) {
                viewModel.hide()
            }
        case .hideIfBelowThreshold:
            withAnimation(.spring()) {
                if scale < 0.9 {
                    viewModel.hide()
                }
                scale = 1
            }
        case .none:
            break
        }
    }
}
