import SwiftUI

struct Perfil: View {
    @State private var nome: String = UserDefaults.standard.string(forKey: "nome") ?? "Nome do Usuário"
    @State private var fotoPerfil: UIImage? = loadImage(named: "fotoPerfil")
    @State private var capa: UIImage? = loadImage(named: "capa")
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("darkblue")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                ScrollView {
                    VStack(spacing: 20) {
                        // Capa do perfil
                        if let capa = capa {
                            Image(uiImage: capa)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .clipped()
                        } else {
                            Color.white
                                .frame(height: 200)
                        }
                        
                        // Foto de perfil
                        if let fotoPerfil = fotoPerfil {
                            Image(uiImage: fotoPerfil)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                                .offset(y: -50)
                                .padding(.bottom, -50)
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .offset(y: -50)
                                .padding(.bottom, -50)
                        }
                        
                        // Nome do usuário
                        Text(nome)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        // Navegação para editar perfil
                        NavigationLink(destination: editarPerfil(nome: $nome, fotoPerfil: $fotoPerfil, capa: $capa)) {
                            Text("Editar Perfil")
                                .font(.headline)
                                .foregroundColor(Color("darkblue"))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    Color.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        NavigationLink(destination: Estatisticas_do_Usuario()) {
                            Text("Estatísticas")
                                .font(.headline)
                                .foregroundColor(Color("darkblue"))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        NavigationLink(destination: Amigos()) {
                            Text("Amigos")
                                .font(.headline)
                                .foregroundColor(Color("darkblue"))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }
            .onAppear {
                self.nome = UserDefaults.standard.string(forKey: "nome") ?? "Nome do Usuário"
                self.fotoPerfil = loadImage(named: "fotoPerfil")
                self.capa = loadImage(named: "capa")
            }
        }
    }
}

func loadImage(named: String) -> UIImage? {
    if let data = UserDefaults.standard.data(forKey: named) {
        return UIImage(data: data)
    }
    return nil
}

struct Perfil_Previews: PreviewProvider {
    static var previews: some View {
        Perfil()
    }
}

