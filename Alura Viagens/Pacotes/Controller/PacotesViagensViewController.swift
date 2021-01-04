//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Fernanda Andreia Nascimento on 02/01/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate{
    
    @IBOutlet weak var collectionPacotes: PacoteViagemCollectionViewCell!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    
    
    
    let listaComTodasViagens:Array<PacoteViagem> = PacoteViagemDAO()
    var listaViagens:Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
       // collectionPacotes.delegate = self
//        collectionPacotes.dataSource  = self
        pesquisarViagens.delegate = self
        self.labelContadorPacotes.text = self.atualizaContadorLabel()

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let pacoteAtual = listaViagens[indexPath.item]
        
        celulaPacote.configuraCelula(pacoteViagem: pacoteAtual)
        
        return celulaPacote
    }



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return UIDevice.current.userInterfaceIdiom == .phone; CGSize(width: collectionView.bounds.width/2-20, height: 160); : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        listaViagens = listaComTodasViagens
        if searchText != "" {
        let filtroListaViagem = NSPredicate(format: "viagem.titulo contains %@", searchText)
        let listaFiltrada:Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
//        collectionPacotes.reloadData()
    }
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
    }
    
    func atualizaContadorLabel() -> String {
        return listaViagens.count == 1 ? "pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pacote = listaViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhes") as! DetalhesViagemViewController
        controller.pacoteSelecionado = pacote
//        self.present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

