/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quickbooksync;

import java.sql.SQLException;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author nmohamed
 */
public class UpdatePayment {
    static Logger log = Logger.getLogger(UpdatePayment.class.getName());
    
    public void updatePayment (List<QBPayment> updatelist) throws SQLException, ClassNotFoundException
    {
    // take the input(which has the ID from invoicelineitem and the new itemAmount) and looping through them to update item amount column in QB InvoiceLineItem table based on the invoiceid
        
   
        DBconnection connectQB = new DBconnection();
        connectQB.createconnQB();
        String fixamount;
      
        for (QBPayment payment : updatelist) {
            double dd=  payment.getAmount();///100;
         fixamount = Double.toString(dd);
             
            connectQB.statementQB.executeUpdate("update ReceivePayments SET Amt = '"+ fixamount + "' where ID = '"+payment.getpaymentId()+"'");
        }
    
    }

    
    
}
