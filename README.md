# Delegation

![Pattern](https://img.shields.io/badge/Behavioral-Patterns-green.svg)
![Languages](https://img.shields.io/badge/Language-swift-green.svg)

### Motivación
- ¿Cómo un objeto puede informar de que algo aconteció a otro? 
- ¿Cómo puedo obtener esta información?
- ¿La implementación de todo esto no debería estar en otro lugar?

¡Pon un delegado en tu vida y encárgalo de hacer todo!

### Idea
**Delegar la implementación de una determinada tarea en otro determinado objeto.**

### Problema

Pasar de:

```swift
superVillainMachine.attack(target: "Bank", mainWeapon: "Rockets", specialSkill: "Anti Spiders")
```

a:

```swift
superVillainMachine.delegate = self
superVillainMachine.attack()
```

### Solución

Dentro del playground podréis ver la implementación de este pequeño ejemplo de una forma corta, elegante y fácil de entender. Para ello, la súper máquina malvada delegará su control a un malvado villano.
