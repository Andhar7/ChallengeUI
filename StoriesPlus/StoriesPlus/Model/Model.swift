//
//  Model.swift
//  StoriesPlus
//
//  Created by Andrej Kling on 02.07.21.
//

import SwiftUI

struct Model:  Identifiable, Hashable {
    
    let id = UUID().uuidString
    let title : String
    let image : String
    let images : [String]
    let price : Int
    let rating : Int
    let time : Int
    let description : String
}

let dataModel : [Model] = [
    Model(title: "Hot Air Balloon\nFlight", image: "p1", images: ["p1","s2","s3","s4","s1"], price: 340, rating: 3, time: 2, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vulputate gravida neque id mollis. Aliquam erat volutpat. Ut vel ipsum orci. "),
    Model(title: "Paragiding\nFlight", image: "p2", images: ["p2","p4","p9","p6","p8"], price: 610, rating: 2, time: 1, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vulputate gravida neque id mollis. Aliquam erat volutpat. Ut vel ipsum orci. "),
    Model(title: "Awesome\nSafari", image: "p3", images: ["p3","p5","p6","p3","p4"], price: 240, rating: 3, time: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vulputate gravida neque id mollis. Aliquam erat volutpat. Ut vel ipsum orci. "),
    Model(title: "Stars in Dark", image: "p7", images: ["p7","p4","p9","p6","p8"], price: 510, rating: 4, time: 2, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vulputate gravida neque id mollis. Aliquam erat volutpat. Ut vel ipsum orci.")
]
