/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mail;

/**
 *
 * @author TGMaster
 */

public class Mail {

    protected String to;
    protected String from;
    protected String message;
    protected String subject;
    protected String smtpServ;

    public Mail() {
    }

    public Mail(String to, String from, String message, String subject, String smtpServ) {
        this.to = to;
        this.from = from;
        this.message = message;
        this.subject = subject;
        this.smtpServ = smtpServ;
    }
    
    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSmtpServ() {
        return smtpServ;
    }

    public void setSmtpServ(String smtpServ) {
        this.smtpServ = smtpServ;
    }
    
}