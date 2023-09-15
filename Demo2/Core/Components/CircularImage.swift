//
//  CircularImage.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import Kingfisher

enum ImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall: return 40
        case .small: return 48
        case .medium: return 64
        case .large: return 148
        }
    }
}

struct CircularImage: View {
    let imageUrl: String
    let size: ImageSize
    
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: size.dimension, height: size.dimension)
            .clipShape(Circle())
    }
}

struct CircularImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularImage(imageUrl: "fak", size: ImageSize.large)
    }
}
