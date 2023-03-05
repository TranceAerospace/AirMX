    //
    //  WorkOrderDetailView.swift
    //  AirMX
    //
    //  Created by Mark Trance on 2/25/23.
    //

import SwiftUI
import CoreData

struct WorkOrderDetailView: View {
    
    let workOrder: AircraftWorkOrder
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    
    func deleteWorkOrder() {
        moc.delete(workOrder)
        try? moc.save()
        dismiss()
    }
    
    var body: some View {
        ScrollView {
            
            WorkOrderRowView(label: "Date Performed:", passedItem: workOrder.datePerformed)
            WorkOrderRowView(label: "Aircraft Hobbs:", passedItem: workOrder.hobbs)
            WorkOrderRowView(label: "Aircraft Cycles:", passedItem: workOrder.cycles)
            
            WorkOrderVerticalView(label: "Work Performed:", passedItem: workOrder.workNotes)
           
            // TODO: FIX - Will crash app if a part is not assigned, uncomment to test
            //WorkOrderRowView(label: "Parts", passedItem: Helper.toArray(workOrder.parts)[0].partNumberOff)
            
        }
        // Used to test parts
//        .onAppear {
//            print(workOrder.parts?.allObjects)
//        }
        .padding(.top)
        .navigationTitle(workOrder.tailNumber ?? "Unknown Aircraft")
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
}





    //struct WorkOrderDetailView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        WorkOrderDetailView()
    //
    //
    //    }
    //}



