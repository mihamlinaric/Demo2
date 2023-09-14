//
//  ImageUploader.swift
//  Demo2Storage
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import Foundation
import UIKit
import FirebaseStorage

public struct ImageUploader {
    public static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        let _ = try await ref.putDataAsync(imageData)
        let url = try await ref.downloadURL()
        
        return url.absoluteString
    }
}
