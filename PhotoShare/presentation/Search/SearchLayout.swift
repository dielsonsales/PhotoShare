//
//  SearchLayout.swift
//  PhotoShare
//
//  Created by Dielson Sales de Carvalho on 23/07/24.
//

import SwiftUI

// Based on https://github.com/apptekstudios/SwiftUILayouts/blob/main/Sources/SwiftUILayouts/VerticalWaterfallLayout.swift
struct SearchLayout: Layout {

    struct Column {
        var height: CGFloat = 0
        var width: CGFloat = 0
        var items: [Int: CGRect] = [:]
    }

    var columnsCount: Int
    var spacingX: CGFloat
    var spacingY: CGFloat

    public init(spacingX: CGFloat = 8, spacingY: CGFloat = 8, columns: Int = 3) {
        self.spacingX = spacingX
        self.spacingY = spacingY
        self.columnsCount = columns
    }

    public struct LayoutCache {
        var targetContainerWidth: CGFloat // invalidates cache on change
        var columnCount: Int // invalidates cache on change
        var items: [Int: CGRect] = [:]
        var size: CGSize = .zero

        func ifValidForParams(_ width: CGFloat, columns: Int) -> Self? {
            guard targetContainerWidth == width,
                    columnCount == columns
            else { return nil }
            return self
        }
    }



    // MARK: - Layout method

    public func makeCache(subviews: Subviews) -> LayoutCache? {
        return nil
    }

    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout LayoutCache?) -> CGSize {
        let containerWidth = proposal.replacingUnspecifiedDimensions().width
        let calc = layout(subviews: subviews, containerWidth: containerWidth)
        cache = calc
        return calc.size
    }

    public func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout LayoutCache?
    ) {
        let calc = cache?.ifValidForParams(proposal.replacingUnspecifiedDimensions().width, columns: columnsCount) ??
            layout(subviews: subviews, containerWidth: bounds.width)
        for (index, subview) in zip(subviews.indices, subviews) {
            if let value: CGRect = calc.items[index] {
                subview.place(
                    at: CGPoint.pointByAdding(bounds.origin, to: value.origin),
                    proposal: .init(value.size)
                )
            }
        }
    }

    // MARK: - Private methods

    private func layout(subviews: Subviews, containerWidth: CGFloat) -> LayoutCache {
        guard containerWidth != 0 else  {
            return LayoutCache(targetContainerWidth: 0, columnCount: columnsCount)
        }
        var result = LayoutCache(targetContainerWidth: containerWidth, columnCount: columnsCount)
        let columnWidth: CGFloat = (containerWidth - CGFloat(columnsCount - 1) * spacingX) / CGFloat(columnsCount)
        var columns: [Column] = .init(repeating: Column(width: columnWidth), count: columnsCount)
        for (index, subview) in zip(subviews.indices, subviews) {
            let size = subview.sizeThatFits(.init(width: columnWidth, height: nil))
            let smallestColumnIndex = zip(columns, columns.indices).min(by: { $0.0.height < $1.0.height })?.1 ?? 0
            var currentColumn: Column {
                get { columns[smallestColumnIndex] }
                set { columns[smallestColumnIndex] = newValue }
            }
            let x: CGFloat = (columnWidth + spacingX) * CGFloat(smallestColumnIndex)
            let y: CGFloat = currentColumn.height + spacingY
            let item = CGRect(x: x, y: y, width: size.width, height: size.height)
            currentColumn.items[index] = item
            currentColumn.height = currentColumn.height + spacingY + item.size.height
        }
        let maxHeight: CGFloat = columns.max(by: { $0.height < $1.height })?.height ?? .zero
        result.size = CGSize(width: containerWidth, height: maxHeight)
        result.items = columns.reduce(into: [Int: CGRect](), { partialResult, line in
            partialResult.merge(line.items, uniquingKeysWith: { $1 })
        })
        return result
    }
}
