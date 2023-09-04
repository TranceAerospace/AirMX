//
//  SquawkModel.swift
//  AirMX
//
//  Created by Mark Trance on 9/4/23.
//

import Foundation

struct SquawkModel: Identifiable {
    var id = UUID()
    var tailNumber: String
    var squawkText: String
    var dateText: String
    var completed: Bool = false
}


extension SquawkModel {
    static var squawkExamples = [SquawkModel(tailNumber: "N893WB", squawkText: "Stuffs Broke", dateText: "9/2/2010"),
                                 SquawkModel(tailNumber: "N555EB", squawkText: "Knob's Missing", dateText: "9/3/2010"),
                                 SquawkModel(tailNumber: "N239TB", squawkText: "Hangar Rash", dateText: "9/2/2010"),
    ]
}
