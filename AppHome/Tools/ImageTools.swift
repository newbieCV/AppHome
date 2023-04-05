//
//  ImageTools.swift
//  AppHome
//
//  Created by ByteDance on 2023/4/5.
//

import Foundation
import UIKit

class ImageTools {
    // 裁剪图片到指定大小
    class func tailorImage(image: UIImage?, newSize: CGSize) -> UIImage {
        guard let originImg = image else {
            return UIImage()
        }
        UIGraphicsBeginImageContext(newSize)
        originImg.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImg = UIGraphicsGetImageFromCurrentImageContext() ?? originImg
        UIGraphicsEndImageContext()
        return newImg
    }
}
