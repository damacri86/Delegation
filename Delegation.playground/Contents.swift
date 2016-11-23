// Example of the Delegation Pattern
// This is a very usefull pattern used to talk between classes

protocol SuperVillainMachineDelegate: class {
    
    func willAttackTo(superVillainMachine: SuperVillainMachine) -> String
    func willUseMainWeapon(superVillainMachine: SuperVillainMachine) -> String
    func willUseSuperSkill(superVillainMachine: SuperVillainMachine) -> String
    func shouldUseDeathPower(superVillainMachine: SuperVillainMachine) -> Bool
    func didEndAttack(superVillainMachine: SuperVillainMachine)
}

class SuperVillainMachine {

    weak var delegate: SuperVillainMachineDelegate?
    var target: String?
    var mainWeapon: String?
    var superSkill: String?
    
    func attack() {
        
        self.setTarget()
        self.setMainWeapon()
        self.setSuperSkill()
        self.delegate?.shouldUseDeathPower(superVillainMachine: self)
        self.delegate?.didEndAttack(superVillainMachine: self)
    }
    
    private func setTarget() {
        
        self.target = self.delegate?.willAttackTo(superVillainMachine: self)
        print("Set target to: " + self.target!)
    }
    
    private func setMainWeapon() {
        
        self.mainWeapon = self.delegate?.willUseMainWeapon(superVillainMachine: self)
        print("Set main weapon to: " + self.mainWeapon!)
    }
    
    private func setSuperSkill() {
        
        self.superSkill = self.delegate?.willUseSuperSkill(superVillainMachine: self)
        print("Set super skill to: " + self.superSkill!)
    }
}

class Villain: SuperVillainMachineDelegate {
    
    func attackTarget(superVillainMachine: SuperVillainMachine) {
        
        superVillainMachine.delegate = self
        superVillainMachine.attack()
    }
    
    // MARK: - SuperVillainMachineDelegate
    
    internal func willAttackTo(superVillainMachine: SuperVillainMachine) -> String {
    
        return "Center Bank"
    }
    
    internal func willUseMainWeapon(superVillainMachine: SuperVillainMachine) -> String {
        
        return "Rockets"
    }
    
    internal func willUseSuperSkill(superVillainMachine: SuperVillainMachine) -> String {
        
        return "Anti Spiders"
    }
    
    internal func superSkill(superVillainMachine: SuperVillainMachine) -> String {
        
        return "Anti Spiders"
    }
    
    internal func shouldUseDeathPower(superVillainMachine: SuperVillainMachine) -> Bool {
        
        return true
    }

    internal func didEndAttack(superVillainMachine: SuperVillainMachine) {
        
        print("Well done machine :)")
    }
}

let villain = Villain()
let superVillainMachine = SuperVillainMachine()
villain.attackTarget(superVillainMachine: superVillainMachine)
