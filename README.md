# Sketch-Project-HCI

Project lockscreen + music player

La mia idea iniziale del progetto è creare un ibrido tra l'applicazione Zen Mode del OnePlus (Eccole un link per intenderci di più: https://www.androidauthority.com/zen-mode-oneplus-987246/) ed un player musicale locale, l'obiettivo finale di questa app ibrida è quello di creare un app che blocchi completamente il telefono dal suo normale uso se non chiamate di emergenza ed in più l'utilizzo del player locale con i tuoi brani preferiti in modo di non essere disturbato durante lo studio, però puoi ascoltare la musica che vuoi.

Angolo delle idee:
•	Creazione delle icone, immagini ed ecc.… dell’applicazione, quindi cercare un video che spieghi come crearli (una delle prime cose da fare) 
•	Utilizzo del player Vanced YouTube Music per la riproduzione della musica
•	Creazione modalità notte e giorno
•	Gestione notifiche 
•	Gestione suoni nell’app

## #1 Aggiornamento

Come framework e linguaggio di scrittura dell'app ho scelto Flutter e Dart, che sono di Google e permettono di implementare l'applicazione sia per iOS che per Android.

## #2 Aggiornamento

Dopo aver visto il funzionamento di Flutter, dato lo svolgimento del progetto da solo e l'impossibilità di provare in prima persona l'applicazione su un dispositivo iOS, ho scelto di svilupparlo solo per Android con l'emulatore di Android Studio 

## #3 Aggiornamento

Dopo molte ricerche su Stackoverflow, GitHub e Reddit, sono venuto a sapere che la funzionalità principale dell'app di non poter uscire da una schermata (che sarebbe stato la mia app), non è possibile se non modificando qualche dato del OS.

## #4 Aggiornamento

Come altra alternativa ho provato ad utilizzare la schermata di blocco default dei telefoni, ma è impossibile per lo stesso motivo dell'aggiornamento #3.

## #5 Aggiornamento

L'unica alternativa rimasta è quella di usare un messaggio di allerta se l'utente tenta di uscire dall'app prima che il timer finisca. Dato che in ogni modo l'utente può accedere alle app, nella schermata disclaimer dell'app avvertirò l'utente di poter selezionare una playlist a suo piacimento dall'app che desidera prima che il timer inizi.
