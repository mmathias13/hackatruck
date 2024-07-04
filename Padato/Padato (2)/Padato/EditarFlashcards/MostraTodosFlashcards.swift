import SwiftUI

struct MostraTodosFlashcards: View {
    @StateObject var viewModel = ViewModel()
    @State var categoria = ""
    
    var body: some View {
        NavigationStack
        {
            ZStack {
                Color("darkblue")
                    .ignoresSafeArea()
                
                VStack {
                    Text(categoria)
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    ScrollView
                    {
                        ForEach(viewModel.flashcards, id: \.self) { item in
                            if (item.categoria == categoria && item.pergunta != "")
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
                                    .bold()
                                }
                            }
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
    MostraTodosFlashcards()
}

