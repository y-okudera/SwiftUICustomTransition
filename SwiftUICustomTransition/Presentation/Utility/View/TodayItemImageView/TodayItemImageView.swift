//
//  TodayItemImageView.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/09.
//

import SwiftUI

struct TodayItemImageView: View {

    private var item: TodayItem
    private var animation: Namespace.ID
    private var isSource: Bool

    init(item: TodayItem, animation: Namespace.ID, isSource: Bool = true) {
        self.item = item
        self.animation = animation
        self.isSource = isSource
    }

    var body: some View {
        Image(item.contentImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .matchedGeometryEffect(id: "image" + item.id, in: animation, isSource: isSource)
    }
}

struct TodayItemImageView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        TodayItemImageView(
            item: TodayItem(
                title: "",
                category: "",
                overlay: "",
                text: "",
                contentImage: "back1",
                logo: ""
            ),
            animation: animation
        )
    }
}
