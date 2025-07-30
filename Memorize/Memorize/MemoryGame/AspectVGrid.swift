//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Igor Terletskyi on 25.06.2025.
//
import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat = 1
    var content: (Item) -> ItemView
    
    init(_ items: [Item],
         aspectRatio: CGFloat,
         @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(count: items.count,
                                                     size: geometry.size,
                                                     atAspectRatio: aspectRatio)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    private func gridItemWidthThatFits(count: Int,
                               size: CGSize,
                               atAspectRatio aspectRatio: CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var colomnCount = 1.0
        
        repeat {
            let width = size.width / colomnCount
            let height = width / aspectRatio
            
            let rowCount = (count / colomnCount).rounded(.up)
            
            if rowCount * height < size.height {
                return (size.width / colomnCount).rounded(.down)
            }
            
            colomnCount += 1
        } while colomnCount < count
        print(size.width / count," - ", size.height * aspectRatio.rounded(.down), " - " , size.width)
        return max(size.width / count, size.height * aspectRatio.rounded(.down))
    }
}
