//
//  ZXNavBarConfig.swift
//  ZXStructs
//
//  Created by screson on 2017/4/1.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

class ZXNavBarConfig: NSObject {
    
    class var zxNavBarConfig: NSDictionary {
        return NSDictionary(contentsOfFile: Bundle.zx_navBarConfigPath())!
    }
    
    //MARK: - Bool Value
    class var userSystemBackButton: Bool {
        return configBoolValue(forKey: "zx_userSystemBackButton", defaultValue: true)
    }
    
    class var showSeparatorLine: Bool {
        return configBoolValue(forKey: "zx_showSeparatorLine", defaultValue: true)
    }
    
    class var isTranslucent: Bool {
        return configBoolValue(forKey: "zx_isTranslucent", defaultValue: false)
    }
    //MARK: - Color Hex String
    class var narBarColorStr: String {
        return configStringValue(forKey: "zx_navBarColor", defaultValue: "#3B87EE")
    }
    
    class var titleColorStr: String {
        return configStringValue(forKey: "zx_titleColor", defaultValue: "#ffffff")
    }
    
    class var barButtonColor: String  {
        return configStringValue(forKey: "zx_barButtonColor", defaultValue: "#ffffff")
    }
    
    //MARK: - Font Size
    
    class var titleFontSize: CGFloat {
        return configFontSizeValue(forKey: "zx_titleFontSize", defaultSize: 18)
    }
    
    class var barButtonFontSize: CGFloat {
        return configFontSizeValue(forKey: "zx_barButtonFontSize", defaultSize: 16)
    }
    //MARK: - Nav Title Font
    class var navTilteFont: UIFont! {
        return UIFont(name: configStringValue(forKey: "zx_navTitleFont", defaultValue: "Arial"), size: titleFontSize)
    }
}

extension ZXNavBarConfig: ZXConfigValueProtocol{
    static func configStringValue(forKey key: String!, defaultValue: String!) -> String! {
        if let configStr = (zxNavBarConfig.object(forKey: key) as? String),configStr.characters.count > 0 {
            return configStr
        }
        return defaultValue
    }
    
    static func configFontSizeValue(forKey key:String,defaultSize:CGFloat) -> CGFloat {
        if let dicF = zxNavBarConfig.object(forKey: key) as? NSDictionary {
            switch UIDevice.zx_DeviceSizeType() {
            case .s_4_0Inch:
                return dicF.object(forKey: "4_0") as! CGFloat
            case .s_4_7Inch:
                return dicF.object(forKey: "4_7") as! CGFloat
            case .s_5_5_Inch:
                return dicF.object(forKey: "5_5") as! CGFloat
            default:
                return dicF.object(forKey: "5_5") as! CGFloat
            }
        }
        return defaultSize
    }
    
    static func configBoolValue(forKey key:String, defaultValue: Bool) -> Bool {
        if let boolValue = zxNavBarConfig.object(forKey: key) as? Bool {
            return boolValue
        }
        return defaultValue
    }
}