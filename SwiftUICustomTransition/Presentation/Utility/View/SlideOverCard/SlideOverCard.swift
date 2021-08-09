//
//  SlideOverCard.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/10.
//

import SwiftUI

struct SlideOverCard<Content: View>: View {

    @GestureState private var dragState = DragState.inactive
    @State var position = UIScreen.main.bounds.height / 2

    var bounds = UIScreen.main.bounds
    var content: () -> Content

    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)

        return Group {
            Handle()
            content()
        }
        .frame(height: UIScreen.main.bounds.height)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10.0)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
        .offset(y: position + dragState.translation.height)
        .animation(dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
        .gesture(drag)
    }

    private func onDragEnded(drag: DragGesture.Value) {
        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
        let cardTopEdgeLocation = position + drag.translation.height
        let positionAbove: CGFloat
        let positionBelow: CGFloat
        let closestPosition: CGFloat

        if cardTopEdgeLocation <= bounds.height / 2 {
            positionAbove = bounds.height / 7
            positionBelow = bounds.height / 2
        } else {
            positionAbove = bounds.height / 2
            positionBelow = bounds.height - (bounds.height / 9)
        }

        if (cardTopEdgeLocation - positionAbove) < (positionBelow - cardTopEdgeLocation) {
            closestPosition = positionAbove
        } else {
            closestPosition = positionBelow
        }

        if verticalDirection > 0 {
            position = positionBelow
        } else if verticalDirection < 0 {
            position = positionAbove
        } else {
            position = closestPosition
        }
    }
}

// MARK: - DragState
private struct Handle: View {

    private let handleThickness = CGFloat(5.0)

    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color(UIColor.secondaryLabel))
            .padding(5)
    }
}

// MARK: - DragState
private enum DragState {
    case inactive
    case dragging(translation: CGSize)

    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }

    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
