//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Fernanda Andreia Nascimento on 04/01/21.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    
    var pacoteComprado:PacoteViagem? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteComprado {
            print(pacote.viagem.titulo)
        }

        // Do any additional setup after loading the view.
    }
    
   
    
    
}
