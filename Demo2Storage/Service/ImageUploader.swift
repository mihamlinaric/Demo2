//
//  ImageUploader.swift
//  Demo2Storage
//
//  Created by Miha Mlinaric on 14/09/2023.
//
import Firebase
import Foundation
import UIKit
import FirebaseStorage

public struct ImageUploader {
    public static func uploadImage(image: UIImage, storagePath: String) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "\(storagePath)\(filename)")
        
        let _ = try await ref.putDataAsync(imageData)
        let url = try await ref.downloadURL()
        
        return url.absoluteString
    }
}
