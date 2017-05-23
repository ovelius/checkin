package checkin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CheckInController {

    static allowedMethods = [save: "POST", saveRegistration: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CheckIn.list(params), model:[checkInInstanceCount: CheckIn.count()]
    }
    
    def list(Integer max) {
        if (params.shop == null) {
            redirect controller: 'shop', action: "index"
            return
        }
        Shop shop = Shop.get(params.long('shop'));
        if (shop == null) {
            redirect controller: 'shop', action: "index"
        }
        params.max = Math.min(max ?: 10, 100)
        def checkins = CheckIn.findAll("From CheckIn as b WHERE b.shop=? ORDER BY b.time",
                [shop], [max: params.max]);
        render view:"list", model:[checkInInstanceList: checkins]
    }

    def show(CheckIn checkInInstance) {
        respond checkInInstance
    }

    def create() {
        respond new CheckIn(params)
    }
    
    def register() {
        if (params.shop == null) {
            redirect controller: 'shop', action: "index"
        }
        Shop shop = Shop.get(params.long('shop'));
        if (shop == null) {
            redirect controller: 'shop', action: "index"
        }
        respond new CheckIn(params), model: [shop: shop]
    }
    
    def done(CheckIn checkInInstance) {
        respond checkInInstance
    }

    @Transactional
    def save(CheckIn checkInInstance) {
        if (checkInInstance == null) {
            notFound()
            return
        }

        if (checkInInstance.hasErrors()) {
            respond checkInInstance.errors, view:'create'
            return
        }

        checkInInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'checkIn.label', default: 'CheckIn'), checkInInstance.id])
                redirect checkInInstance
            }
            '*' { respond checkInInstance, [status: CREATED] }
        }
    }
    
    @Transactional
    def saveRegistration() {
        Shop shop = Shop.get(params.long('shop'));
        if (shop == null) {
            notFound()
            return
        }
        
        Customer customer = Customer.findByReg(params.reg.toUpperCase())
        
        if (customer == null) {
            customerNotFound()
            return
        }
        
        CheckIn checkInInstance = new CheckIn(customer: customer, shop:shop);
 
        if (checkInInstance.hasErrors()) {
            respond checkInInstance.errors, view:'register'
            return
        }

        checkInInstance.save flush:true

        request.withFormat {
            form multipartForm {
                 render view:'done', model:[checkInInstance: checkInInstance]
            }
            '*' { respond checkInInstance, view:'done', [status: CREATED] }
        }
    }

    def edit(CheckIn checkInInstance) {
        respond checkInInstance
    }

    @Transactional
    def update(CheckIn checkInInstance) {
        if (checkInInstance == null) {
            notFound()
            return
        }

        if (checkInInstance.hasErrors()) {
            respond checkInInstance.errors, view:'edit'
            return
        }

        checkInInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CheckIn.label', default: 'CheckIn'), checkInInstance.id])
                redirect checkInInstance
            }
            '*'{ respond checkInInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CheckIn checkInInstance) {

        if (checkInInstance == null) {
            notFound()
            return
        }

        checkInInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CheckIn.label', default: 'CheckIn'), checkInInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'checkIn.label', default: 'CheckIn'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
     protected void customerNotFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.customer.not.found', args: [params.reg])
                redirect action: "register", method: "GET", params:params
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
