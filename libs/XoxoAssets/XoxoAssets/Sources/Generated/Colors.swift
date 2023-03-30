import UIKit
import SwiftUI


public enum UIColors {

    public enum Button {
        public static let two = UIColor(named: "button_two", in: .swiftUIPreviewsCompatibleModule, compatibleWith: nil)!
        public static let four = UIColor(named: "button_four", in: .swiftUIPreviewsCompatibleModule, compatibleWith: nil)!
        public static let one = UIColor(named: "button_one", in: .swiftUIPreviewsCompatibleModule, compatibleWith: nil)!
        public static let three = UIColor(named: "button_three", in: .swiftUIPreviewsCompatibleModule, compatibleWith: nil)!
    }

}

public enum Colors {
    public enum Button {
        public static var two: Color { Color("button_two", bundle: .swiftUIPreviewsCompatibleModule) }
        public static var four: Color { Color("button_four", bundle: .swiftUIPreviewsCompatibleModule) }
        public static var one: Color { Color("button_one", bundle: .swiftUIPreviewsCompatibleModule) }
        public static var three: Color { Color("button_three", bundle: .swiftUIPreviewsCompatibleModule) }
    }
}
