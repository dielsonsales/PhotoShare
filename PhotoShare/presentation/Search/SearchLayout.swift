//
//  SearchLayout.swift
//  PhotoShare
//
//  Created by Dielson Sales de Carvalho on 23/07/24.
//

import SwiftUI

// Based on https://github.com/apptekstudios/SwiftUILayouts/blob/main/Sources/SwiftUILayouts/VerticalWaterfallLayout.swift
struct SearchLayout: Layout {
    var columns: Int
    var spacingX: Double
    var spacingY: Double

    public init(columns: Int = 3, spacingX: Double = 8, spacingY: Double = 8) {
        self.columns = columns
        self.spacingX = spacingX
        self.spacingY = spacingY
    }

    public struct LayoutCache {
        var targetContainerWidth: Double // invalidates cache on change
        var columnCount: Int // invalidates cache on change
        var items: [Int: CacheItem] = [:]
        var size: CGSize = .zero

        func ifValidForParams(_ width: Double, columns: Int) -> Self? {
            guard targetContainerWidth == width,
                    columnCount == columns
            else { return nil }
            return self
        }
    }

    struct Column {
        var height: Double = 0
        var width: Double = 0
        var items: [Int: CacheItem] = [:]
    }

    struct CacheItem {
        var position: CGPoint
        var size: CGSize
    }

    public func makeCache(subviews: Subviews) -> LayoutCache? {
        return nil
    }

    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout LayoutCache?) -> CGSize {
        let containerWidth = proposal.replacingUnspecifiedDimensions().width
        let calc = layout(subviews: subviews, containerWidth: containerWidth)
        cache = calc
        return calc.size
    }

    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout LayoutCache?) {
        let calc = cache?.ifValidForParams(proposal.replacingUnspecifiedDimensions().width, columns: columns) ?? layout(subviews: subviews, containerWidth: bounds.width)
        for (index, subview) in zip(subviews.indices, subviews) {
            if let value: SearchLayout.CacheItem = calc.items[index] {
                subview.place(
                    at: CGPoint.pointByAdding(bounds.origin, to: value.position),
                    proposal: .init(value.size)
                )
            }
        }
    }

    func layout(subviews: Subviews, containerWidth: CGFloat) -> LayoutCache {
        guard containerWidth != 0 else  {
            return LayoutCache(targetContainerWidth: 0, columnCount: columns)
        }
        var result: LayoutCache = .init(targetContainerWidth: containerWidth, columnCount: columns)
        let columnWidth = (containerWidth - Double(columns - 1) * spacingX) / Double(columns)
        var columns: [Column] = .init(repeating: Column(width: columnWidth), count: columns)
        for (index, subview) in zip(subviews.indices, subviews) {
            let size = subview.sizeThatFits(.init(width: columnWidth, height: nil))
            let smallestColumnIndex = zip(columns, columns.indices).min(by: { $0.0.height < $1.0.height })?.1 ?? 0
            var currentColumn: Column {
                get { columns[smallestColumnIndex] }
                set { columns[smallestColumnIndex] = newValue }
            }
            let x = (columnWidth + spacingX) * Double(smallestColumnIndex)
            let y = currentColumn.height + spacingY
            let item = CacheItem(position: CGPoint(x: x, y: y), size: size)
            currentColumn.items[index] = item
            currentColumn.height = currentColumn.height + spacingY + item.size.height
        }
        let maxHeight = columns.max(by: { $0.height < $1.height })?.height ?? .zero
        result.size = CGSize(width: containerWidth, height: maxHeight)
        result.items = columns.reduce(into: [Int: CacheItem](), { partialResult, line in
            partialResult.merge(line.items, uniquingKeysWith: {$1})
        })
        return result
    }
}
