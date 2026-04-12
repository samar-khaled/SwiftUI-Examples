//
//  AsyncImageView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 12/04/2026.
//
import SwiftUI

// https://wesleydegroot.nl/blog/asyncimage-in-swiftui
struct AsyncImageView: View {
    var body: some View {
        EnhancedImageView()
            .background(Color.red)
        ImageGalleryView()
            .background(Color.yellow)
    }
}

#Preview {
    AsyncImageView()
}

struct EnhancedImageView: View {
    let imageURL = URL(string: "https://wesleydegroot.nl/assets/avatar/avatar.png")

    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case let .success(image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "photo")
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    EnhancedImageView()
}

struct ImageGalleryView: View {
    let imageUrls = [
        "https://wesleydegroot.nl/assets/avatar/avatar_401.png",
        "https://wesleydegroot.nl/assets/avatar/avatar_402.png",
        "https://wesleydegroot.nl/assets/avatar/avatar_403.png",
        "https://wesleydegroot.nl/assets/avatar/avatar_404.png"
    ]

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(imageUrls, id: \.self) { urlString in
                AsyncImage(url: URL(string: urlString)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    ImageGalleryView()
}
