#!/bin/bash
 
torcer(){
    echo $1 
}
 
executar(){
   PS3='Selecione qual ferramenta deseja usar: '
   options=("Active root" "Active SSL" "SAIR")
   select opt in "${options[@]}"
   do
      echo "Preparando para iniciar $opt..."
      case $opt in
         "Active root") torcer "Vai Corinthians!!!";; clear;
         "Active SSL") torcer "Vai São Paulo!!!";; clear;
         "SAIR") break;; clear;
         *) echo "Opção inválida ($REPLY)";; clear;
      esac
   done
}
 
executar