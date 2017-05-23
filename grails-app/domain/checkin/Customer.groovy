package checkin

class Customer {

    String name;
    String reg;
    String location;
    
    static constraints = {
        name blank: false
        reg blank: false
        location blank: false
    }
    
    String toString() { return reg; }
}
