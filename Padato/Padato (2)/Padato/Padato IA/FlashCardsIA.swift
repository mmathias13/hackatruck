import SwiftUI

struct FlashCardsIA: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack
        {
            ZStack {
                Color("darkblue")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Editar Decks IA")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    ScrollView
                    {
                        ForEach(viewModel.flashcards, id: \.self) { item in
                            if (item.categoria == "PadatoIA" && item.pergunta != "")
                            {
                                NavigationLink(destination: EditarOuRemover(flashcardEditarOuRemover: item))
                                {
                                    HStack {
                                            Text(item.pergunta ?? "")
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                }
                            }
                        }
                        .padding()
                    }
                    NavigationLink(destination: PadatoIA())
                    {
                        HStack {
                            
                            Image("Tigre")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
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
    FlashCardsIA()
}

