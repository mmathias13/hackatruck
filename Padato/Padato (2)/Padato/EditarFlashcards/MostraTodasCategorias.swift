import SwiftUI

struct MostraTodasCategorias: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack
        {
            ZStack {
                Color("darkblue")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Editar Baralhos")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    ScrollView
                    {
                        ForEach(viewModel.flashcards, id: \.self) { item in
                            if (item.pergunta == "" && item.resposta == "" && item.dificuldade == "")
                            {
                                NavigationLink(destination:
                                                MostraTodosFlashcards(categoria: item.categoria!))
                                {
                                    HStack {
                                        
                                        Text(item.categoria ?? "")
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .bold()
                                }
                            }
                        }
                        .padding()
                    }
                    NavigationLink(destination: EscolherCategoria())
                    {
                        
                        HStack {
                            
                            Image(systemName: "plus")
                                .frame(width: 30, height: 30)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                }
                .onAppear {
                    viewModel.fetchFlashcards()
                }
            }
        }
    }
}

#Preview {
    MostraTodasCategorias()
}

