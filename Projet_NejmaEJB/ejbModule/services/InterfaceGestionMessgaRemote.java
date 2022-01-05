package services;

import java.util.ArrayList;

import javax.ejb.Local;

import entityBeans.Message;
import entityBeans.Utilisateur;
@Local
public interface InterfaceGestionMessgaRemote {
void EnvoyerMessage(Message m);
ArrayList<Message> getAllmessage();
ArrayList<Message> getMessageRecente();
void SupprimerMessagePourUser(int id);
Long nbrMSG();
Long nbrMSGattente();
ArrayList<Message> getMessageClient(Utilisateur u) ;
Message getMessageById(int id);
void ModiiferEtat01(int id);
void ModiiferTypeRE(int id);
void ModiiferTypeER(int id);
void Vu(int id);
 void ModiiferEtat03(int id);
 Long nbrMSGRepondre() ;
Long nbrMSGClientNL(Utilisateur u);
	

}
