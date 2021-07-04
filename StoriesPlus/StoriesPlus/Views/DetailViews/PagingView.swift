//
//  PagingView.swift
//  StoriesPlus
//
//  Created by Andrej Kling on 03.07.21.
//

import SwiftUI

struct PagingView<Content>: View where Content: View {
    
    @Binding var index: Int
    let maxIndex: Int
    let content: () -> Content
    
    @State private var _offset: CGFloat = .zero
    @State private var _isDragging = false
    
    init(index: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping() -> Content) {
        self._index = index
        self.maxIndex = maxIndex
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    self.content()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
            }
            .content.offset(x: self.offset(in: geometry), y: 0)
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(
                DragGesture().onChanged { value in
                    _isDragging = true
                    _offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
                }
                .onEnded { value in
                    let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
                    let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                    self.index = clampedIndex(from: predictedIndex)
                    withAnimation(.easeOut) {
                        _isDragging = false
                    }
                }
            )
        }.clipped()
    }
    
    func offset(in geometry: GeometryProxy) -> CGFloat {
        if _isDragging {
            return max(min(self._offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
        }
        return -CGFloat(self.index) * geometry.size.width
    }
    
    func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        return newIndex
    }
    
}
