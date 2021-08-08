//
//  DetailView+Transition.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/09.
//

import SwiftUI

extension DetailView {

    func hide() {
        withAnimation(.spring()) {
            viewModel.hide()
        }
    }

    func hideIfNeeded() {
        withAnimation(.spring()) {
            if scale < 0.9 {
                viewModel.hide()
            }
            scale = 1
        }
    }
}
