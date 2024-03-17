//
//  ColorResourcesAsset.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import UIKit


final class ColorResourceAssets {
    lazy var greenLight: UIColor = {
        UIColor().hexStringToUIColor(hex: "#4CB24E")
    }()
    lazy var grayDark: UIColor = {
        UIColor().hexStringToUIColor(hex: "#222325")
    }()
    lazy var blue: UIColor = {
        UIColor().hexStringToUIColor(hex: "#2B7EFE")
    }()
    lazy var grayLight: UIColor = {
        UIColor().hexStringToUIColor(hex: "#9F9F9F")
    }()
    lazy var grayMedium: UIColor = {
        UIColor().hexStringToUIColor(hex: "#313234")
    }()
    lazy var specialBlue: UIColor = {
        UIColor().hexStringToUIColor(hex: "#00427D")
    }()
    lazy var darkGreen: UIColor = {
        UIColor().hexStringToUIColor(hex: "#015905")
    }()
}
