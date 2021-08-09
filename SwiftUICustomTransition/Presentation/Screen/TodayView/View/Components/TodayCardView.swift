//
//  TodayCardView.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

struct TodayCardView: View {

    @Environment(\.colorScheme) var color
    private var item: TodayItem
    private var animation: Namespace.ID

    init(item: TodayItem, animation: Namespace.ID) {
        self.item = item
        self.animation = animation
    }

    var body: some View {
        VStack {
            TodayItemImageView(item: item, animation: animation)
                .frame(width: UIScreen.main.bounds.width - 30)

            TodayItemTitleView(item: item, animation: animation)

            Spacer(minLength: 16)
        }
        .frame(height: 320)
        .background(color == .dark ? Color.black : Color.white)
        .cornerRadius(15)
    }
}
