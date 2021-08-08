//
//  TabBar.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

struct TabBar: View {
    @Namespace var animation
    @StateObject var detailObject = DetailViewModel()

    var body: some View {
        ZStack {
            TabView {
                TodayView(animation: animation)
                    .environmentObject(detailObject)
                    .tabItem {
                        Image("today")
                            .renderingMode(.template)

                        Text("Today")
                    }

                Text("Games")
                    .tabItem {
                        Image("games")
                            .renderingMode(.template)

                        Text("Games")
                    }

                Text("Apps")
                    .tabItem {
                        Image("apps")
                            .renderingMode(.template)

                        Text("Apps")
                    }

                Text("Search")
                    .tabItem {
                        Image("search")
                            .renderingMode(.template)

                        Text("Search")
                    }
            }
            .opacity(detailObject.isShown ? 0 : 1) // detailObject表示時はタブを非表示にする

            if detailObject.isShown {
                DetailView(viewModel: detailObject, animation: animation)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
