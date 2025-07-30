//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Igor on 27.12.2024.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRation: CGFloat = 1
    var content: (Item) -> ItemView
    
    init(_ items: [Item],
         aspectRation: CGFloat,
         @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRation = aspectRation
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(count: items.count,
                                                     size: geometry.size,
                                                     atAspectRation: aspectRation)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRation, contentMode: .fit)
                }
            }
        }
    }
    
    private func gridItemWidthThatFits(count: Int,
                               size: CGSize,
                               atAspectRation aspectRation: CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var colomnCount = 1.0
        
        repeat {
            let width = size.width / colomnCount
            let height = width / aspectRation
            
            let rowCount = (count / colomnCount).rounded(.up)
            
            if rowCount * height < size.height {
                return (size.width / colomnCount).rounded(.down)
            }
            
            colomnCount += 1
        } while colomnCount < count
        
        return min(size.width / count, size.height * aspectRation.rounded(.down))
    }
}

//#Preview {
//    AspectVGrid()
//}
