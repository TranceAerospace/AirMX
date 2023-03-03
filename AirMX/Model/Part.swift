//
//  Part.swift
//  AirMX
//
//  Created by Mark Trance on 2/27/23.
//

//import Foundation


// CLASS is deprecated, Part was incorporated into Core Data
/*
public class aPart: NSObject, NSSecureCoding {
    
    var partNumberOff: String
    var serialNumberOff: String
    var partNumberOn: String
    var serialNumberOn: String
    
    public static var supportsSecureCoding = true
    
    public func encode(with coder: NSCoder) {
        coder.encode(partNumberOff, forKey: "partNumberOff")
        coder.encode(serialNumberOff, forKey: "serialNumberOff")
        coder.encode(partNumberOn, forKey: "partNumberOn")
        coder.encode(serialNumberOn, forKey: "serialNumberOn")

    }
    
    public required init?(coder: NSCoder) {
        partNumberOff = coder.decodeObject(of: NSString.self, forKey: "partNumberOff") as String? ?? ""
        serialNumberOff = coder.decodeObject(of: NSString.self, forKey: "serialNumberOff") as String? ?? ""
        partNumberOn = coder.decodeObject(of: NSString.self, forKey: "partNumberOn") as String? ?? ""
        serialNumberOn = coder.decodeObject(of: NSString.self, forKey: "serialNumberOn") as String? ?? ""

    }
    

    
    init(partNumberOff: String, serialNumberOff: String, partNumberOn: String, serialNumberOn: String) {
        self.partNumberOff = partNumberOff
        self.serialNumberOff = serialNumberOff
        self.partNumberOn = partNumberOn
        self.serialNumberOn = serialNumberOn
    }
    
    static let empty = Part(partNumberOff: "", serialNumberOff: "", partNumberOn: "", serialNumberOn: "")
}


     It has to be a subclass of `NSSecureUnarchiveFromDataTransformer` and we need to expose it to ObjC.

@objc(PartArrayValueTransformer)
final class PartArrayValueTransformer: NSSecureUnarchiveFromDataTransformer {
    
        // The name of the transformer. This is what we will use to register the transformer `ValueTransformer.setValueTrandformer(_"forName:)`.
    static let name = NSValueTransformerName(rawValue: String(describing: PartArrayValueTransformer.self))
    
        // Our class `Test` should in the allowed class list. (This is what the unarchiver uses to check for the right class)
    override static var allowedTopLevelClasses: [AnyClass] {
        return [Part.self]
    }
    
        /// Registers the transformer.
    public static func register() {
        let transformer = PartArrayValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
*/
