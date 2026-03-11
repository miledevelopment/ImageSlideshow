//
//  KingfisherSource.swift
//  ImageSlideshow
//
//  Created by feiin
//
//
import Foundation
import UIKit
import Kingfisher

/// Input Source to image using Kingfisher
@MainActor
public class KingfisherSource: NSObject, InputSource {

    /// URL to load
    public var url: URL

    /// Placeholder used before image is loaded
    public var placeholder: UIImage?

    /// Options for displaying, e.g. [.transition(.fade(0.2))]
    public var options: KingfisherOptionsInfo?

    /// Initializes a new source with a URL
    public init(url: URL, placeholder: UIImage? = nil, options: KingfisherOptionsInfo? = nil) {
        self.url = url
        self.placeholder = placeholder
        self.options = options
        super.init()
    }

    /// Initializes a new source with a URL string
    public init?(urlString: String, placeholder: UIImage? = nil, options: KingfisherOptionsInfo? = nil) {
        guard let validUrl = URL(string: urlString) else { return nil }
        self.url = validUrl
        self.placeholder = placeholder
        self.options = options
        super.init()
    }

    /// Load an image to a UIImageView
    /// - Parameters:
    ///   - imageView: UIImageView that receives the loaded image
    ///   - callback: Completion callback with an optional image
    public func load(to imageView: UIImageView, with callback: @escaping (UIImage?) -> Void) {

        imageView.kf.setImage(
            with: self.url,
            placeholder: self.placeholder,
            options: self.options
        ) { result in

            Task { @MainActor in
                switch result {
                case .success(let imageResult):
                    callback(imageResult.image)
                case .failure:
                    callback(nil)
                }
            }

        }
    }

    /// Cancel an image download task
    public func cancelLoad(on imageView: UIImageView) {
        imageView.kf.cancelDownloadTask()
    }
}
