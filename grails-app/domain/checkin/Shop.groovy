package checkin

class Shop {

    String name;
    String location;
    
    static constraints = {
        name blank:false
        location blank:false
    }
    
    String toString() { return "$name $location"; }
}
