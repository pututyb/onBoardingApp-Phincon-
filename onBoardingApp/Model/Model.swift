//
//  Model.swift
//  onBoardingApp
//
//  Created by Putut Yusri Bahtiar on 24/07/23.
//

import Foundation

struct ModelData {
    var imageBg: String = ""
    var imageObject: String = ""
    var txtTitle: String = ""
    var txtDesc: String = ""
}

struct DummyData {
    let data = [
        ModelData(imageBg: "background", imageObject: "beanbag", txtTitle: "Let's Get Started", txtDesc: "Our goal is to ensure that you have everything you need to feel comfortable, confident, and ready to make an impact."),
        ModelData(imageBg: "background", imageObject: "workindesk", txtTitle: "Your Onboarding Journey Begins!", txtDesc: "Our goal is to ensure that you have everything you need to feel comfortable, confident, and ready to make an impact."),
        ModelData(imageBg: "background", imageObject: "jempol", txtTitle: "Your First Steps to Success", txtDesc: "Our goal is to ensure that you have everything you need to feel comfortable, confident, and ready to make an impact.")
    ]
}
