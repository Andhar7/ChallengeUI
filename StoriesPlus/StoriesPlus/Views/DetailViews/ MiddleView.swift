//
//   MiddleView.swift
//  StoriesPlus
//
//  Created by Andrej Kling on 04.07.21.
//

import SwiftUI

struct MiddleView: View {
    
    @Binding var currentIndex: Int
    @Binding var count : Int
    @Binding var selected : Model
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
 
    var body: some View {
        VStack(alignment: .leading, spacing: 75)  {
            
            ZStack(alignment: Alignment.bottom) {
                
                PagingView(index: $currentIndex, maxIndex: selected.images.count - 1){
                    
                    ForEach(selected.images, id:\.self) { image in
                        
                        Image(image)
                            .resizable()
                            .cornerRadius(69, corners: [.bottomLeft])
                        
                    }
                }
                
                ZStack {
                    
                    VStack(alignment: .leading, spacing: 12)  {
                        
                        Text(selected.title)
                            .font(.system(size: 21, weight: .bold, design: .serif))
                            .foregroundColor(.white)
                        
                        StarsView(card: selected)
                        
                        HStack {
                            
                            Image(systemName: "timer")
                                .foregroundColor(.white)
                            
                            Text("\(selected.time)hours")
                                .font(.footnote)
                                .foregroundColor(.white)
                            
                        }
                        
                        Text(selected.description)
                            .font(.system(size: 13, weight: .regular, design: .serif))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .frame(width: width - 120)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .frame(width: width, height: height / 2.5)
                .background(
                    
                    LinearGradient.darkBlueGradient
                        .cornerRadius(69, corners: [.bottomLeft])
                    
                )
                
                HStack {
                    
                    ForEach(0...(selected.images.count - 1), id:\.self) { index in
                        
                        Circle()
                            .fill(currentIndex == index ? Color.white : Color.gray)
                            .frame(width: currentIndex == index ? 12 : 8, height:  currentIndex == index ? 12 : 8)
                    }
                }
                .padding(.bottom, 21)
            }
            
            HStack  {
                
                Text("Persons")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .blur(radius: 0.3)
                
                Spacer().frame(width: 21)
                
                Button(action: {
                    if self.count != 0 {
                        self.count -= 1
                    }
                }, label: {
                    Image(systemName: "minus.circle")
                        .font(.title)
                        .foregroundColor(.white)
                        .blur(radius: 0.8)
                })
                
                Text("\(self.count)")
                    .font(.title)
                    .foregroundColor(.white)
                    .blur(radius: 0.8)
                
                Button(action: {
                    
                    self.count += 1
                    
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .foregroundColor(.white)
                        .blur(radius: 0.8)
                })
                
                Spacer().frame(width: 95)
                
                Text("$\(selected.price * self.count)")
                    .font(.title).bold()
                    .foregroundColor(Color("Color4"))
                    .blur(radius: 0.8)
            }
            .padding(.horizontal, 21)
            
        }
        .padding(.bottom, height < 750 ?  95 : 100)
        .ignoresSafeArea(.all, edges: .top)
    }
}
