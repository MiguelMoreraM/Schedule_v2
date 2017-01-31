/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quickbooksync;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nmohamed
 */
public class AddDiscounts {
       
    public void addDiscounts(List<QBInvoice> discountlist) throws SQLException, ClassNotFoundException
       {
          
         DBconnection connectQB = new DBconnection();
        connectQB.createconnQB();
        String fixamount;
        
        for(QBInvoice d : discountlist)
        {
        ResultSet rs = connectQB.statementQB.executeQuery("SELECT InvoiceId FROM InvoiceLineItems where CustomerId = '"+d.getqbCustomer().getId()+"' and Date = '"+d.getDate()+"'");
        while(rs.next())
        {
        if(rs.getString("InvoiceId")!= null)
        {
         
            double dd=  d.getAmount();///100;
         fixamount = Double.toString(dd);
        connectQB.statementQB.executeUpdate("insert into InvoiceLineItems (InvoiceId,CustomerId,Date,Memo,DueDate,CustomFields,ItemName,ItemAmount) values ('"+rs.getString("InvoiceId")+"','"+ d.getqbCustomer().getId() + "','"+d.getDate()+"','"+d.getMemo()+"','"+ d.getdueDate()+ "','"+d.getcustomFields()+"','"+d.getItem().getitemName()+"','"+fixamount+"')");//discount does not need quantity
        }
        else
        {
            connectQB.statementQB.executeUpdate("insert into CreditMemoLineItem (CustomerId, ItemName, ItemQuantity,ItemAmount,Date,Memo,DueDate,CustomFields) values ('"+d.getqbCustomer().getId()+"','"+d.getItem().getitemName()+"','"+d.getItem().getitemQuantity()+"','"+d.getAmount()+"','"+d.getDate()+"','"+d.getMemo()+"','"+d.getdueDate()+"','"+d.getcustomFields()+"'");
        }
            
        }
       
       }

       }
}
