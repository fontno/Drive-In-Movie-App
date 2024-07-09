//
//  BarcodeView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/28/23.
//

import SwiftUI


// Bug workaround
struct Barcode: UIViewRepresentable {
    var string = ""
    var darkMode: Bool = false
    
    func makeUIView(context: Context) -> UIImageView {
        return UIImageView()
    }
    
    func updateUIView(_ uiImageView: UIImageView, context: Context) {
        guard let data = string.data(using: String.Encoding.ascii) else { return }
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else { return }
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue(80, forKey: "inputBarcodeHeight")
        filter.setValue(20, forKey: "inputQuietSpace")
        if darkMode {
            guard let output = filter.outputImage else { return }
            guard let invertFilter = CIFilter(name: "CIColorInvert") else { return }
            invertFilter.setValue(output, forKey: "inputImage")
            guard let invertOutput = invertFilter.outputImage else { return }
            uiImageView.image = UIImage(ciImage: invertOutput)
        } else {
            guard let output = filter.outputImage else { return }
            
            uiImageView.image = UIImage(ciImage: output)
        }
    }
}

struct BarcodeView: View {
    var string = ""
    var body: some View {
        Barcode(string: string)
            //.scaledToFit()
//            .frame(height: 200)
//            .padding()
    }
}
struct BarcodeView_Preview: PreviewProvider {
    
    static var previews: some View {
        BarcodeView(string: "ticket")
    }
}

