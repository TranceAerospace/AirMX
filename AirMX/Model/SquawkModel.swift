//
//  SquawkModel.swift
//  AirMX
//
//  Created by Mark Trance on 9/4/23.
//

import Foundation

struct SquawkModel: Identifiable, Codable, Equatable {
    var id: String
    var tailNumber: String
    var squawkText: String
    var dateText: String
    var completed: Bool = false
    var organization: String
}


extension SquawkModel {
    static var squawkExamples = [SquawkModel(id: "", tailNumber: "N893WB", squawkText: "Stuffs Broke", dateText: "9/2/2010", organization: "@aci"),
                                 SquawkModel(id: "", tailNumber: "N555EB", squawkText: "Knob's Missing", dateText: "9/3/2010", organization: "@aci"),
                                 SquawkModel(id: "", tailNumber: "N239TB", squawkText: "Hangar Rash", dateText: "9/2/2010", organization: "@aci"),
    ]
}
