//
//  RunUIView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 09/08/2023.
//

import SwiftUI

struct RunUIView: View {
    let url = "https://www.athensauthenticmarathon.gr/site/index.php/en/registration-en"
    let description = """
The Athens Classic Marathon The Authentic is an annual marathon road race held in Athens, Greece, normally in early November (the second Sunday of November), since 1972.

Distance course: 42.195 kilometers (26.2 mile) course
Starting line: Marathon Stadium in Marathon city
Finish line: Panathenaic Stadium in Athens

The marathon race and course is inspired by the Ancient Greek legend of Pheidippides, a messenger who is said to have run from Marathon to Athens to bring news of the Greek victory over the Persians at the Battle of Marathon.

Taking from the tradition of the Olympic Torch, the race features the Marathon Flame, which is lit at the Tomb of the Battle of Marathon and carried to the stadium in Marathon before the beginning of each race, every year.

It is perhaps the most difficult major marathon race: the course is uphill from the 10 km mark to the 31 km mark – the toughest uphill climb of any major marathon.The course begins in the town of Marathon, where it passes the tomb of the Athenian soldiers, and it traces a path near the coast through Nea Makri. Following the steep rise, the course goes lightly downhill towards the city of Athens. It passes a statue of a runner in the city centre before finishing up at the Panathinaiko Stadium; a site for athletics competitions in ancient times and the finishing point for both the 1896 and 2004 Olympic marathons.
"""
    var body: some View {
        ScrollView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Image("runBG")
                        .resizable()
                        .frame(height: 300)
                        .clipped()
                        .padding(.bottom)
                    
                    
                    Image(systemName: "link")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("Secondary"))
                        .background(Circle().fill(Color.white).frame(width: 40, height: 40))
                        .offset(y: -36)
                        .padding(.leading, 16)
                        .shadow(radius: 7)
                    
                    
                    Text("Athens Marathon the Authentic")
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.system(size: 20))
                        .padding(.horizontal)
                        .padding(.bottom, 16)
                    
                    Text(description)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                        .padding(.horizontal)
                }
            }
        } .frame(maxHeight: .infinity).background(Color("Primary"))
    }
}

struct RunUIView_Previews: PreviewProvider {
    static var previews: some View {
        RunUIView()
    }
}
