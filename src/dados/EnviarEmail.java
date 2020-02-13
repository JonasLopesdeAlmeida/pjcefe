package dados;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author marcelosiedler
 */
public class EnviarEmail {

    private String emailDestinatario;

    private String assunto;
    private String msg;

    
    
    public EnviarEmail() {
		
	}
    
    

	public String getEmailDestinatario() {
        return emailDestinatario;
    }

    public void setEmailDestinatario(String emailDestinatario) {
        this.emailDestinatario = emailDestinatario;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public boolean enviarGmail() {
        boolean retorno = false;
        //pega o objeto 
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session s = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {

                        return new PasswordAuthentication("jmdlopes.almeida@gmail.com", "*DmmAbomai7369");//email e senha usu�rio 
                    }
                });

        //mensagem 
        try {
            MimeMessage message = new MimeMessage(s);
            message.setFrom(new InternetAddress("jmdlopes.almeida@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.emailDestinatario));

            message.setSubject(this.assunto);
            message.setContent(this.msg, "text/html; charset=utf-8");

            //send message  
            Transport.send(message);

            retorno = true;

        } catch (MessagingException e) {
            retorno = false;
            e.printStackTrace();
        }
        return retorno;
    }
    
//    public boolean enviarHotmail()
//    {
//        boolean retorno = false; 
//        Properties props = new Properties();
//            /** Par�metros de conex�o com servidor Hotmail */
//            props.put("mail.transport.protocol", "smtp");
//            props.put("mail.smtp.host", "smtp.live.com");
//            props.put("mail.smtp.socketFactory.port", "587");
//            props.put("mail.smtp.socketFactory.fallback", "false");
//            props.put("mail.smtp.starttls.enable", "true");
//            props.put("mail.smtp.auth", "true");
//            props.put("mail.smtp.port", "587");
//
//            Session session = Session.getDefaultInstance(props,
//                        new javax.mail.Authenticator() {
//                             protected PasswordAuthentication getPasswordAuthentication() 
//                             {
//                                   return new PasswordAuthentication("ruben.junior.2@hotmail.com", "*******");
//                             }
//                        });
//            /** Ativa Debug para sess�o */
//            session.setDebug(true);
//            try {
//
//                  Message message = new MimeMessage(session);
//                  message.setFrom(new InternetAddress("ruben.junior.2@hotmail.com")); //Remetente
//
//                  message.setRecipients(Message.RecipientType.TO, 
//                                    InternetAddress.parse("siedler@gmail.com")); //Destinat�rio(s)
//                  message.setSubject("Enviando email com JavaMail");//Assunto
//                  message.setText("Enviei este email utilizando JavaMail com minha conta Hotmail!");
//                  /**M�todo para enviar a mensagem criada*/
//                  Transport.send(message);
//                  System.out.println("Feito!!!");
//                  retorno = true;
//             } catch (MessagingException e) {
//                  throw new RuntimeException(e);
//            }
//            
//            return retorno;
//    
//    }

}
