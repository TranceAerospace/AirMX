    //
    //  WorkOrderDetailView.swift
    //  AirMX
    //
    //  Created by Mark Trance on 2/25/23.
    //

import SwiftUI
import CoreData

struct WorkOrderDetailView: View {
    
   // let workOrder: AircraftWorkOrder
    
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    
    func deleteWorkOrder() {
       
        dismiss()
    }
    
    var body: some View {
        ScrollView {
            
//            WorkOrderRowView(label: "Date Performed:", passedItem: workOrder.datePerformed)
//            WorkOrderRowView(label: "Aircraft Hobbs:", passedItem: workOrder.hobbs)
//            WorkOrderRowView(label: "Aircraft Cycles:", passedItem: workOrder.cycles)
//
//            WorkOrderVerticalView(label: "Work Performed:", passedItem: workOrder.workNotes)
//
//            Spacer()
//
//            if workOrder.parts?.count != 0 {
//                    // TODO: FIX - Will crash app if a part is not assigned, uncomment to test
//                ForEach(Helper.toArray(workOrder.parts)) { part in
//
//                    WorkOrderRowView(label: "Part Number:", passedItem: part.partNumberOff)
//                }
//
//
//            }
        }
        
        Button("Render PDF", action: {
            
        })
            .padding(.top)
            //.navigationTitle(workOrder.tailNumber ?? "Unknown Aircraft")
            .alert("Delete Book", isPresented: $showingDeleteAlert) {
                Button("Delete", role: .destructive, action: deleteWorkOrder)
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Are you sure?")
            }
            .toolbar {
                Button {
                    showingDeleteAlert = true
                } label: {
                    Label("Delete this book", systemImage: "trash")
                        .foregroundColor(.red)
                }
            }
    }
    
//    @MainActor
//    func render() -> URL {
//            // 1: Render Hello World with some modifiers
//        let renderer = ImageRenderer(content: Text(workOrder.tailNumber ?? "no tail number"))
//
//            // 2: Save it to our documents directory
//        let url = URL.documentsDirectory.appending(path: "output.pdf")
//
//            // 3: Start the rendering process
//        renderer.render { size, context in
//                // 4: Tell SwiftUI our PDF should be the same size as the views we're rendering
//            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
//
//                // 5: Create the CGContext for our PDF pages
//            guard let pdf = CGContext(url as CFURL, mediaBox: nil, nil) else {
//                return
//            }
//
//                // 6: Start a new PDF page
//            pdf.beginPDFPage(nil)
//
//                // 7: Render the SwiftUI view data onto the page
//            context(pdf)
//
//                // 8: End the page and close the file
//            pdf.endPDFPage()
//            pdf.closePDF()
//        }
//
//        return url
//    }
//
//    @MainActor func rendertwo() {
//        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//
//        let renderedUrl = documentDirectory.appending(path: "test.pdf")
//
//        if let consumer = CGDataConsumer(url: renderedUrl as CFURL),
//           let pdfContext = CGContext(consumer: consumer, mediaBox: nil, nil) {
//
//            let renderer = ImageRenderer(content: Text(workOrder.tailNumber ?? "Tail number missing"))
//            renderer.render { size, renderer in
//                let options: [CFString: Any] = [
//                    kCGPDFContextMediaBox: CGRect(origin: .zero, size: size)
//                ]
//
//                pdfContext.beginPDFPage(options as CFDictionary)
//
//                renderer(pdfContext)
//                pdfContext.endPDFPage()
//                pdfContext.closePDF()
//            }
//        }
//
//        print("Saving PDF to \(renderedUrl.path())")
//    }
    
}





    //struct WorkOrderDetailView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        WorkOrderDetailView()
    //
    //
    //    }
    //}



