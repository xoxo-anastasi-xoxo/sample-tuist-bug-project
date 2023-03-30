
import UIKit
import SwiftUI

public enum UIImages {

    public enum Icons {

        public enum Size12 {
            public static var play: UIImage { UIImage(named: "icons_size12_play", in: .swiftUIPreviewsCompatibleModule, compatibleWith: nil)! }
            public static var dropright: UIImage { UIImage(named: "icons_size12_dropright", in: .swiftUIPreviewsCompatibleModule, compatibleWith: nil)! }
            public static var cross: UIImage { UIImage(named: "icons_size12_cross", in: .swiftUIPreviewsCompatibleModule, compatibleWith: nil)! }
        }
    }
}

public enum Images {

    public enum Icons {

        public enum Size12 {
            public static var play: Image { Image("icons_size12_play", bundle: .swiftUIPreviewsCompatibleModule) }
            public static var dropright: Image { Image("icons_size12_dropright", bundle: .swiftUIPreviewsCompatibleModule) }
            public static var cross: Image { Image("icons_size12_cross", bundle: .swiftUIPreviewsCompatibleModule) }
        }
    }
}
