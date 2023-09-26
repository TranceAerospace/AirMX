//
//  WorkOrderDetailViewModel.swift
//  AirMX
//
//  Created by Mark Trance on 8/27/23.
//

import SwiftUI
import Observation

@Observable
final class WorkOrderDetailVM {
    var workOrder: AircraftWorkOrder
    var parts: [Part] = []
    
    var showingDeleteAlert = false
    
    init(workOrder: AircraftWorkOrder) {
        self.workOrder = workOrder
        self.parts = workOrder.parts ?? []
    }
    
    @MainActor
    func render(importedView: some View) -> URL {
        // 1: Render Hello World with some modifiers
        let renderer = ImageRenderer(content: importedView)
        
        // 2: Save it to our documents directory
        let url = URL.documentsDirectory.appending(path: "output.pdf")
        
        // 3: Start the rendering process
        renderer.render { size, context in
            // 4: Tell SwiftUI our PDF should be the same size as the views we're rendering
            let padding = 8
            let yScaleFactor: CGFloat = 792 / size.height
            let xScaleFactor: CGFloat = 612 / size.width
            let scale = min(xScaleFactor, yScaleFactor)
            var scaledContentSize = CGSize(width: size.width * scale, height: size.height * scale)
            var box = CGRect(x: 0, y: 0, width: scaledContentSize.width, height: scaledContentSize.height)
//            let options: [CFString: Any] = [
//                kCGPDFContextMediaBox: CGRect(origin: .zero, size: scaledContentSize)
//            ]
            // 5: Create the CGContext for our PDF pages
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                return
            }
            
            // 6: Start a new PDF page
            pdf.beginPDFPage(nil)
            //pdf.scaleBy(x: scale, y: scale)
            //pdf.translateBy(x: (abs(612 - size.width) / 2), y: (abs(792 - size.height) / 2))
            
            // 7: Render the SwiftUI view data onto the page
            context(pdf)
            
            // 8: End the page and close the file
            pdf.endPDFPage()
            pdf.closePDF()
        }
        
        return url
    }
    
}
