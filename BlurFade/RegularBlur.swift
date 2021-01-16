//
//  RegularBlur.swift
//  RegularBlur
//
//  Created by Philip Davis on 1/14/21.
//

import SwiftUI

struct RegularBlur: View {
    private var materials: [UIBlurEffect.Style] = [ .systemUltraThinMaterial, .systemThinMaterial, .systemMaterial, .systemThickMaterial, .systemChromeMaterial]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .padding(.all, -32)
                .blur(radius: 18)
                .overlay(Image("background")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .padding(.all, -32).mask(LinearGradient(
                                gradient:
                                    Gradient(
                                        stops: [.init(color: .clear, location: 0),
                                                .init(color: .clear, location: 0.5),
                                                .init(color: .black, location: 1)
                                        ]),
                                startPoint: .bottom, endPoint: .center
                                
                            )))
                
        
            
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct RegularBlur_Previews: PreviewProvider {
    static var previews: some View {
        RegularBlur()
    }
}
