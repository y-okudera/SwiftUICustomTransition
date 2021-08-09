//
//  TouchGestureView.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/09.
//

import SwiftUI

struct TouchGestureView: UIViewRepresentable {

    private let touchDownCallback: (() -> Void)
    private let touchMovedCallback: ((CGFloat) -> Void)
    private let touchUpCallback: (() -> Void)

    init(touchDownCallback: @escaping (() -> Void),
         touchMovedCallback: @escaping ((CGFloat) -> Void),
         touchUpCallback: @escaping (() -> Void)) {
        self.touchDownCallback = touchDownCallback
        self.touchMovedCallback = touchMovedCallback
        self.touchUpCallback = touchUpCallback
    }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> Self.UIViewType {
        let view = UIView(frame: .zero)
        let tap = SingleScrollAndLongPressGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.tap))
        tap.delegate = context.coordinator
        view.addGestureRecognizer(tap)
        return view
    }

    class Coordinator: NSObject, UIGestureRecognizerDelegate {

        private var touchDownCallback: (() -> Void)
        private var touchMovedCallback: ((CGFloat) -> Void)
        private var touchUpCallback: (() -> Void)

        init(touchDownCallback: @escaping (() -> Void),
             touchMovedCallback: @escaping ((CGFloat) -> Void),
             touchUpCallback: @escaping (() -> Void)) {
            self.touchDownCallback = touchDownCallback
            self.touchMovedCallback = touchMovedCallback
            self.touchUpCallback = touchUpCallback
        }

        @objc func tap(gesture: SingleScrollAndLongPressGestureRecognizer) {
            switch gesture.state {
            case .began:
                touchDownCallback()
            case .changed:
                touchMovedCallback(gesture.distance)
            case .ended, .cancelled:
                touchUpCallback()
            case .possible, .failed:
                break
            @unknown default:
                print("unknown case", gesture.state)
            }
        }

        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(touchDownCallback: touchDownCallback, touchMovedCallback: touchMovedCallback, touchUpCallback: touchUpCallback)
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {

    }
}

final class SingleScrollAndLongPressGestureRecognizer: UIGestureRecognizer {

    private var startLocation: CGPoint = .zero
    private(set) var distance: CGFloat = .zero

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if state == .possible {
            startLocation = touches.first?.location(in: nil) ?? .zero
            state = .began
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .cancelled
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .changed
        let location = touches.first?.location(in: nil) ?? .zero
        let dx = startLocation.x - location.x
        let dy = startLocation.y - location.y
        distance = sqrt(dx * dx + dy * dy)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .ended
        startLocation = .zero
        distance = .zero
    }
}
