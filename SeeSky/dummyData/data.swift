//
//  datas.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 26/03/23.
//

import Foundation
import UIKit

var planetOfDay: Celestial = Celestial(name: "Mars", image: UIImage(named: "mars_png")!, description: "Marte è il quarto pianeta del sistema solare in ordine di distanza dal Sole; è visibile a occhio nudo ed è l’ultimo dei pianeti di tipo terrestre dopo Mercurio, Venere e la Terra. Chiamato pianeta rosso per via del suo colore caratteristico causato dalla grande quantità di ossido di ferro che lo ricopre, Marte prende il nome dall’omonima divinità della mitologia romana e il suo simbolo astronomico è la rappresentazione stilizzata dello scudo e della lancia del dio.", technical: "Visibility\n-Rise: 6:35\n-Zenit: 11:47\n-Set: 16:56", isFavorite: true)

var mythOfDay: Celestial = Celestial(name: "Andromeda", image: UIImage(named: "andromeda-cons")!, description: "Le disgrazie di Andromeda, figlia di Cefeo e Cassiopea (sovrani d’Etiopia) , cominciarono il giorno in cui sua madre sostenne di essere più bella delle Nereidi,[2] un gruppo di ninfe marine particolarmente seducenti. Queste, offese, decisero che la vanità di Cassiopea aveva decisamente superato i limiti e chiesero a Poseidone, il dio del mare, di punirla. Per punizione, Poseidone mandò un mostro terribile (alcuni dicono anche un’inondazione) a razziare le coste del territorio del re Cefeo. Sbigottito per le devastazioni, con i sudditi che reclamavano una sua reazione, l’assediato Cefeo si rivolse all’Oracolo di Ammone per trovare una via d’uscita. Gli fu detto che per quietare il mostro doveva sacrificare la sua figlia vergine: Andromeda. Ecco che allora l’innocente Andromeda fu incatenata a una costa rocciosa per espiare le colpe della madre, che dalla riva guardava in preda al rimorso. Mentre Andromeda se ne stava incatenata alla rupe battuta dalle onde, pallida di terrore e in lacrime per la fine imminente, l’eroe Perseo, fresco dell’impresa della decapitazione della Gorgone Medusa, capitò da quelle parti. Il suo cuore fu rapito alla vista di quella fragile bellezza in preda all’angoscia. Il poeta latino Ovidio nel suo libro Metamorphoses ci dice che Perseo in un primo momento scambiò Andromeda per una statua di marmo. Ma il vento che le scompigliava i capelli e le calde lacrime che le scorrevano sulle guance gli rivelarono la sua natura umana. Perseo le chiese come si chiamasse e perché fosse incatenata lì. Andromeda, completamente diversa dalla sua vanitosa madre, in un primo momento, per timidezza, neanche gli rispose; anche se l’attendeva una morte orribile fra le fauci bavose di un mostro, avrebbe preferito, per modestia, nascondere il viso tra le mani se non le avesse avute incatenate a quella roccia. Perseo continuò a interrogarla. Alla fine, per timore che il suo silenzio potesse essere interpretato come ammissione di colpevolezza, gli raccontò la sua storia, che interruppe improvvisamente, lanciando un urlo di terrore alla vista del mostro che, avanzando fra le onde, muoveva verso di lei. Prima di entrare in azione, Perseo chiese ai genitori di Andromeda la mano della fanciulla, poi si lanciò contro il mostro, lo uccise con la sua spada, liberò l’estasiata Andromeda e ne fece la sua sposa. Anni dopo Andromeda gli diede sei figli, compreso Perse, progenitore dei Persiani, e Gorgofone, madre di Tindaro e Icario, entrambi re di Sparta. Si dice che sia stata la dea greca Atena a collocare l’immagine di Andromeda fra le stelle, dove si trova tra Perseo e sua madre Cassiopea. Solo la costellazione dei Pesci la separa dal Mostro Marino, Cetus (Balena). Le carte celesti rappresentano Andromeda con le mani incatenate. La testa è indicata dalla stella di seconda grandezza Alfa di Andromeda, stella questa che un tempo la costellazione di Andromeda aveva in comune con quella di Pegaso, dove segnava il punto dell’ombelico del cavallo. Alfa di Andromeda è nota con due nomi diversi, Alpheratz o Sirrah, entrambi derivanti dall’arabo, al-faras che significa «il cavallo», e surrat che significa «ombelico». Oggi la stella appartiene solo ad Andromeda. Il punto è indicato dalla stella Beta di Andromeda, chiamata anche Mirach, una derivazione dall’arabo al mi’zar che significa «la guaina» o «perizoma». Il piede è segnato da Gamma di Andromeda, il cui nome è scritto sia Almach che Alamak, dall’arabo all’anaq, con riferimento alla lince del deserto o caracal, che gli antichi Arabi visualizzavano in questa posizione. Anche con telescopi piccoli si può ammirare questa stella doppia dai contrastanti colori giallo e blu.", technical: "Visibility\n-Rise: 6:35\n-Zenit: 11:47\n-Set: 16:56", isFavorite: false)








let sectionOfTheDay = ["Planet of the day","Myth of the day"]

let favorites = [Celestial(name: "a", image: UIImage(named: "andromeda-cons")!, description: "bello", technical: "molto bello", isFavorite: true),
                 Celestial(name: "b", image: UIImage(named: "andromeda-cons")!, description: "bello", technical: "molto bello", isFavorite: true),
                 Celestial(name: "c", image: UIImage(named: "andromeda-cons")!, description: "bello", technical: "molto bello", isFavorite: true),
                 Celestial(name: "d", image: UIImage(named: "andromeda-cons")!, description: "bello", technical: "molto bello", isFavorite: true),
                 Celestial(name: "e", image: UIImage(named: "andromeda-cons")!, description: "bello", technical: "molto bello", isFavorite: true),
                 Celestial(name: "f", image: UIImage(named: "andromeda-cons")!, description: "bello", technical: "molto bello", isFavorite: false)]


