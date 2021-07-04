//
//  CardView.swift
//  StoriesPlus
//
//  Created by Andrej Kling on 01.07.21.
//

import SwiftUI

struct CardView: View {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    let card : Model
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            Image(card.image)
                .resizable()
                .frame(width: width - 180, height: height / 2.5, alignment: .center)
                .cornerRadius(15)
  
                    VStack{
                        
                        HStack {
                            
                            VStack(alignment: .leading)  {
                            
                                Text(card.title)
                                .font(.system(size: 16, weight: .bold, design: .serif))
                                .italic()
                                .fixedSize()
                            
                                StarsView(card: card)
                            
                            Spacer().frame(height: 55)
                            
                                Text("$\(card.price)")
                                .font(.system(size: 18, weight: .bold, design: .serif))
                                .italic()
                                
                            }
                            
                            VStack {
                                 
                                Spacer().frame(height: 65)
                                
                                Buttons(image: "heart", size: 24, color: Color.white.opacity(0.3))
                                
                                Spacer().frame(height: 15)
                                
                                Buttons(image: "bag", size: 24, color: Color.orange)
                            }
                        }
                    }
                    .padding(10)
                    .foregroundColor(Color.white)
                    .frame(width: width - 180)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(15)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: dataModel[0])
    }
}


struct StarsView: View {
    
    @State private var rating = 3
    
    let card : Model
    
    var body: some View {
        ZStack {
            
            customStar
                .overlay(
                    overlayView.mask(customStar)
                )
        }
    }
    private var overlayView: some View {
        
        GeometryReader { geometry in
            
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(card.rating) / 5 * geometry.size.width)
            }
            
        }
        .allowsHitTesting(false)
    }
    private var customStar : some View {
        HStack {
            
            ForEach(0 ..< 5) { item in
                
                Image(systemName: "star.fill")
                    .font(.footnote)
                    .foregroundColor(card.rating >= item ? Color.yellow : Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            rating = item
                        }
                    }
            }
        }
        
    }
}

//struct StarsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarsView()
//    }
//}
