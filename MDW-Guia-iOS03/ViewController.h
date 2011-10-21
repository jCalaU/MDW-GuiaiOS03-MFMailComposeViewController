//
//  ViewController.h
//  MDW-Guia-iOS03
//
//  Created by Javier Cala Uribe on 19/10/11.
//  Copyright (c) 2011 *. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController

    // Delegate de la clase MFMailComposeViewController
    <MFMailComposeViewControllerDelegate>
{
    
    IBOutlet UILabel *respuesta;
    
}

@property (nonatomic, retain) IBOutlet UILabel *respuesta;

// Verifica si esta disponible la clase MFMailComposeViewController

-(IBAction)verEditMail:(id)sender;

// Configura vista para editar y enviar un email

-(void)configurarMail;

// Ejecuta la App Mail del dispositivo

-(void)ejecutarMailApp;

@end