import UIKit

/*
 Contrast ratio is calculated using the proceedure here:
 https://www.w3.org/TR/WCAG20-TECHS/G17.html#G17-procedure
 */

public extension UIColor {
    /// Relative luminance of the color.
    var relativeLuminance: CGFloat {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        guard getRed(&red, green: &green, blue: &blue, alpha: nil) else { return 1.0 }
        
        let convert: (CGFloat) -> CGFloat = { component in
            guard component > 0.03928 else { return component / 12.92 }
            return pow(((component + 0.055) / 1.055), 2.4)
        }
        return 0.2126 * convert(red) + 0.7152 * convert(green) + 0.0722 * convert(blue)
    }
    
    /// Returns contrast ratio with other color.
    /// - Parameter otherColor: UIColor in RGB color space.
    /// - Returns: Contrast ratio of two colors.
    func contrastRatio(_ otherColor: UIColor) -> CGFloat {
        let luminance1 = relativeLuminance
        let luminance2 = otherColor.relativeLuminance
        return (min(luminance1, luminance2) + 0.05) / (max(luminance1, luminance2) + 0.05)
    }
}
