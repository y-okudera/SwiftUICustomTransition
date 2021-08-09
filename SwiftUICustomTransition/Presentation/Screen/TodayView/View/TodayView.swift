//
//  TodayView.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

struct TodayView: View {

    @EnvironmentObject var detail: DetailViewModel
    @ObservedObject private var viewModel: TodayViewModel
    private var animation: Namespace.ID

    init(viewModel: TodayViewModel, animation: Namespace.ID) {
        self.viewModel = viewModel
        self.animation = animation
    }

    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text(viewModel.todayText)
                            .foregroundColor(.gray)

                        Text("Today")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                    }
                }
                .padding()

                ForEach(viewModel.items) { item in
                    if detail.isShown {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 320)
                            .padding(.horizontal)
                            .padding(.top)
                    } else {
                        TodayCardView(item: item, animation: animation)
                            .padding(.horizontal)
                            .padding(.top)
                            .onTapGesture {
                                viewModel.didTapItem(item)
                            }
                    }
                }
            }
            .padding(.bottom)
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea())
        .onAppear(perform: viewModel.onAppear)
        .onReceive(viewModel.$transitionItem, perform: transition(to:))
    }
}
