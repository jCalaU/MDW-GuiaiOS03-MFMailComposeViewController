//
//  ViewController.m
//  MDW-Guia-iOS03
//
//  Created by Javier Cala Uribe on 19/10/11.
//  Copyright (c) 2011 *. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize respuesta;

- (IBAction)verEditMail:(id)sender 
{
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil) 
    {
		// Verifica que este habilitada la opcion para enviar correos en el dispositivo
		if ([mailClass canSendMail])
			[self configurarMail];
		else
			[self ejecutarMailApp];
	}
	else 
		[self ejecutarMailApp];
	
}

// Configura vista para editar y enviar un email
- (void)configurarMail 
{
	MFMailComposeViewController *mailView = [[MFMailComposeViewController alloc] init];
	mailView.mailComposeDelegate = self;	
	[mailView setSubject:@"Mejorando la Web!"];
    
	// Destinatarios
	NSArray *toRecipients = [NSArray arrayWithObject:@"cvander@maestrosdelweb.com"]; 
	NSArray *ccRecipients = [NSArray arrayWithObjects:@"info@forosdelweb.com",  nil]; 
	
	[mailView setToRecipients:toRecipients];
	[mailView setCcRecipients:ccRecipients];	
	
	// Mensaje
	NSString *emailBody = @"Un saludo a tod@s!";
	[mailView setMessageBody:emailBody isHTML:NO];
	
	[self presentModalViewController:mailView animated:YES];
    [mailView release];
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{ 	
	respuesta.hidden = NO;
	// Notifica al usuario los resultados del envio
	switch (result)
	{
		case MFMailComposeResultCancelled:
			respuesta.text = @"Mensaje: cancelado";
			break;
		case MFMailComposeResultSaved:
			respuesta.text = @"Mensaje: guardado";
			break;
		case MFMailComposeResultSent:
			respuesta.text = @"Mensaje: enviado";
			break;
		case MFMailComposeResultFailed:
			respuesta.text = @"Mensaje: falló";
			break;
		default:
			respuesta.text = @"Mensaje: no enviado";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}

// Ejecuta la App Mail del dispositivo
-(void)ejecutarMailApp
{
	NSString *recipients = @"mailto:cvander@maestrosdelweb.com?cc=info@forosdelweb.com&subject=Mejorando la Web!";
	NSString *body = @"&body=Un saludo a tod@s!";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}


- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc 
{
	[respuesta release];
    [super dealloc];
}

@end