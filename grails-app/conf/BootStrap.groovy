
import checkin.CheckIn
import checkin.Customer
import checkin.Shop

class BootStrap {

    def init = { servletContext ->
        Shop shop = new Shop(location: "Karlskoga", name: "Däckson");
        shop.save();
        
        Customer customer = new Customer(name: "Pepps Persson", reg: "MTZ617", location:"B14");
        customer.save();
        
        Customer customer2 = new Customer(name: "Torgny Tersson", reg: "WMN250",  location:"B24");
        customer2.save();
        
        Customer customer3 = new Customer(name: "Per Andersson", reg: "CYG652", location:"C66");
        customer3.save();
        
        Date now = new Date();
        Date c1date = new Date(now.getTime() - 3600 * 1000);
        CheckIn c1 = new CheckIn(
            customer: customer, shop: shop, time:c1date);
        Date c2date = new Date(now.getTime() - 3600 * 500);
        c1.save();
        CheckIn c2 = new CheckIn(
            customer: customer3, shop: shop, time:c2date);
        c2.save();
        
    }
    def destroy = {
    }
}
