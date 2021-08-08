//
//  DetailView.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject private var viewModel: DetailViewModel
    var animation: Namespace.ID

    @State var scale = CGFloat(1)

    init(viewModel: DetailViewModel, animation: Namespace.ID) {
        self.viewModel = viewModel
        self.animation = animation
    }

    var body: some View {
        ScrollView {

            VStack {

                GeometryReader { reader in
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {

                        Image(viewModel.selectedItem.contentImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "image" + viewModel.selectedItem.id, in: animation)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)

                        HStack {

                            Text(viewModel.selectedItem.overlay)
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)

                            Spacer(minLength: 0)

                            Button(action: {
                                withAnimation(.spring()) {
                                    viewModel.hide()
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black.opacity(0.7))
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal)
                        // since we ignore top area
                        .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
                    }
                    .offset(y: (reader.frame(in: .global).minY > 0 && scale == 1) ? -reader.frame(in: .global).minY : 0)
                    .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)).onEnded(onEnded(value:)))
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)

                HStack {
                    Image(viewModel.selectedItem.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .cornerRadius(15)

                    VStack(alignment: .leading, spacing: 6) {

                        Text(viewModel.selectedItem.title)
                            .fontWeight(.bold)

                        Text(viewModel.selectedItem.category)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    Spacer(minLength: 0)

                    VStack {
                        Button(action: {}) {
                            Text("GET")
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(Color.primary.opacity(0.1))
                                .clipShape(Capsule())
                        }

                        Text("In App Purchases")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .matchedGeometryEffect(id: "content" + viewModel.selectedItem.id, in: animation)
                .padding()

                Text(viewModel.selectedItem.text)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()

                Button(action: {}) {
                    Label(title: {
                        Text("Share")
                            .foregroundColor(.primary)
                    }) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding()
            }
        }
        .scaleEffect(scale)
        .ignoresSafeArea(.all, edges: .top)
    }

    func onChanged(value: DragGesture.Value) {
        let scale = value.translation.height / UIScreen.main.bounds.height
        if 1 - scale > 0.75 {
            self.scale = 1 - scale
        }
    }

    func onEnded(value: DragGesture.Value) {
        withAnimation(.spring()) {
            if scale < 0.9 {
                viewModel.hide()
            }
            scale = 1
        }
    }
}
