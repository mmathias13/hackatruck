//
//  ContentView.swift
//  Aula06UFES
//
//  Created by Turma02-19 on 13/06/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -15.721487, longitude: -48.1021691),
    span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
                        )
    @State var PaisSelecionado = ""
    @State private var showingSheet = false
    
    var arrayMapa =
    [
        Location(name: "Brazil", coordinate: CLLocationCoordinate2D(latitude: -15.721487, longitude: -48), flag: "Brazil", description: "Brazil is the largest country in South America and the fifth largest nation in the world. It forms an enormous triangle on the eastern side of the continent with a 4,500-mile (7,400-kilometer) coastline along the Atlantic Ocean. It has borders with every South American country except Chile and Ecuador."),
        Location(name: "Spain", coordinate: CLLocationCoordinate2D(latitude: 40.4378373, longitude: -3.75), flag: "Spain", description: "Spain is a storied country of stone castles, snowcapped mountains, vast monuments, and sophisticated cities, all of which have made it a favoured travel destination. The country is geographically and culturally diverse. Its heartland is the Meseta, a broad central plateau half a mile above sea level."),
        Location(name: "China", coordinate: CLLocationCoordinate2D(latitude: 39.938417, longitude: 116.0678181), flag: "China", description: "Stretching 3,100 miles (5,000 kilometers) from east to west and 3,400 miles (5,500 kilometers) from north to south, China is a large country with widely varying landscapes. Its territory includes mountains, high plateaus, sandy deserts, and dense forests. One-third of China's land area is made up of mountains."),
        Location(name:"Canada", coordinate: CLLocationCoordinate2D(latitude: 45.2496824, longitude: -76.129893), flag: "Canada", description: "Canada is a country in North America. Its ten provinces and three territories extend from the Atlantic Ocean to the Pacific Ocean and northward into the Arctic Ocean, making it the world's second-largest country by total area, with the world's longest coastline."),
        Location(name: "Australia", coordinate: CLLocationCoordinate2D(latitude: -35.3138679, longitude: 148.9649739), flag: "Australia", description: "Australia is a stable, democratic and culturally diverse nation with a highly skilled workforce and one of the strongest performing economies in the world. With spectacular landscapes and a rich ancient culture, Australia is a land like no other.")
    ]

    var body: some View {
        ZStack{
            Map(position: $position){
                ForEach(arrayMapa){ local in
                    Annotation(local.name, coordinate: local.coordinate){
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.teal)
                            Button{
                                showingSheet.toggle()
                            } label: {
                                Image(systemName: "list.bullet.clipboard.fill")
                                    .padding(6)
                            }
                            .foregroundStyle(.white)
                            .sheet(isPresented: $showingSheet){
                                VStack{
                                    Spacer()
                                    Text(local.name).padding().bold().font(.title)
                                    Image(local.flag)
                                        .resizable()
                                        .scaledToFit()
                                    Spacer()
                                    Text(local.description)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
                    .ignoresSafeArea()
            ZStack{
                Rectangle()
                        .foregroundColor(.white)
                        .opacity(0.5)
                        .padding(.bottom, 710)
                        .ignoresSafeArea()
                        .shadow(radius: 5)
                VStack(){
                    Text("World Map")
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Text("\(PaisSelecionado)")
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Spacer()
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(arrayMapa){
                                local in
                                HStack{
                                    Button {
                                        PaisSelecionado = local.name
                                        position = MapCameraPosition.region(MKCoordinateRegion(
                                            center: local.coordinate,
                                            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                                                )
                                    }
                                label: {
                                    Image(local.flag)
                                        .resizable()
                                        .frame(width: 125, height:100)
                                }
                                }
                            }
                        }
                    }
                }
                
            }
            }
        //.padding()
    }
}

#Preview {
    ContentView()
}
