import Foundation
import SwiftUI
import Combine

enum ImageViewState{
    case loading, ready
}

class ImageViewModel: ObservableObject{
    @Published var data: Data
    
    var imageRepository: GetImagesRepository = GetImagesRepository()
    var cancellable: AnyCancellable?
    var imageViewState: ImageViewState
    
    init(){
        self.data = Data()
        self.imageViewState = .loading
    }
    
    func loadImage(url: String){
        cancellable = imageRepository
            .loadImage(url: url)
            .replaceError(with: Data())
            .sink{ data in
                DispatchQueue.main.async{
                    self.imageViewState = .ready
                    self.data = data
                }
            }
    }
}
