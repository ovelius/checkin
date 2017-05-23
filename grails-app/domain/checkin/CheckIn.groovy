package checkin

class CheckIn {

    Shop shop;
    Customer customer;
    Date time = new Date();
    
    static constraints = {
    }
    
    String toString() { return customer == null ? "New" : customer.reg; }
}
