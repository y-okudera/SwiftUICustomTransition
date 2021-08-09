//
//  DetailView.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

struct DetailView: View {

    @Environment(\.viewController) var viewControllerHolder: UIViewController?
    @ObservedObject var viewModel: DetailViewModel
    private var animation: Namespace.ID

    @State var scale = CGFloat(1)

    init(viewModel: DetailViewModel, animation: Namespace.ID) {
        self.viewModel = viewModel
        self.animation = animation
    }

    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { geometryProxy in
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {

                        TodayItemImageView(item: viewModel.selectedItem, animation: animation)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)

                        HStack(alignment: .top) {

                            Text(viewModel.selectedItem.overlay)
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)

                            Spacer(minLength: 0)

                            CloseButton { viewModel.didTapClose() }
                        }
                        .padding(.horizontal)
                        .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
                    }
                    .offset(y: (geometryProxy.frame(in: .global).minY > 0 && scale == 1) ? -geometryProxy.frame(in: .global).minY : 0)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged(onChanged(value:))
                            .onEnded(onEnded(value:))
                    )
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)

                TodayItemTitleView(item: viewModel.selectedItem, animation: animation)

                Text(viewModel.selectedItem.text)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()

                ShareButton {
                    viewModel.didTapShare()
                }
                .padding()
            }
        }
        .scaleEffect(scale)
        .ignoresSafeArea(.all, edges: .top)
        .onReceive(viewModel.$transitionItem, perform: transition(to:))
    }

    func onChanged(value: DragGesture.Value) {
        let scale = value.translation.height / UIScreen.main.bounds.height
        if 1 - scale > 0.75 {
            self.scale = 1 - scale
        }
    }

    func onEnded(value: DragGesture.Value) {
        viewModel.didEndDragging()
    }
}
