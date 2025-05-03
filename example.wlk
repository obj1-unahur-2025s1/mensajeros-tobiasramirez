object roberto {
  var vehiculo = camion
  const peso = vehiculo.peso() + self.pesoPropio()
  method peso() = peso
  method pesoPropio() = 90
  method puedeLlamar() = false
  method vehiculo() = vehiculo
  method cambiarVehiculo(unVehiculo) {vehiculo = unVehiculo}
  
}

object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true
  
}

object neo {
  var credito = 10
  method peso() = 0
  method puedeLlamar() {return self.tieneCredito()}
  method tieneCredito() = credito > 0
  method nuevoCredito(unCredito) {credito = unCredito}
 
}
object paquete {
  var estaPago = null
  var destino = null
  method pagado()  {estaPago = true}
  method noPagado() {estaPago = false}
  method estaPago() = estaPago
  method puedeSerEntregadoPor(mensajero) {
    return self.estaPago() && destino.puedePasar(mensajero)
 
  }
  method destino() = destino
  method nuevoDestino(nuevo) {destino = nuevo}
  method precio() = 50
  
}

object bicicleta {
  method peso() = 5
}

object camion{
  var acoplados = 1
  method peso() = acoplados * 500
  method acoplados() = acoplados
  method acoplados(nuevaCantidad) {acoplados = nuevaCantidad}
}

object puenteBrooklyn {
  method puedePasar(alguien) {
    return alguien.peso() <= 1000
  }
}

object matrix {
  method puedePasar(alguien) {
    return alguien.puedeLlamar()
  }
}

object mensajeria {
  const mensajeros = []
  const enviados = []
  const pendientes = []
  method contratar(mensajero) = mensajeros.add(mensajero)
  method despedirA(mensajero) = mensajeros.remove(mensajero)
  method despedirATodos() = mensajeros.clear()
  method esGrande() { return mensajeros.size() > 2}
  method puedeEntregarElPrimero(unPaquete) = unPaquete.puedeSerEntregadoPor(mensajeros.head())
  method pesoDelUltimo() {mensajeros.last().peso()}
  method mensajeros() = mensajeros
  method quienesPuedenEntregar(unPaquete) = mensajeros.filter({m=>unPaquete.puedeSerEntregadoPor(m)})
  method algunoPuedeEntregar(unPaquete) = mensajeros.any({m=> unPaquete.puedeSerEntregadoPor(m)}) 
  method tieneSobrepeso() {if (mensajeros.isEmpty()) false else self.pesoTotal() / mensajeros.size() > 500 }
  method pesoTotal() = mensajeros.sum({m=>m.peso()})
  method enviarPaquete(unPaquete) {
    if (self.algunoPuedeEntregar(unPaquete)) {
      enviados.add(unPaquete)
    } else{
      pendientes.add(unPaquete)
    }
  }
  method facturacionTotal() = enviados.sum({p=>p.precio()})
  
  method enviarlosATodos(paquetesAEnviar) {
    paquetesAEnviar.forEach({p=>p.enviarPaquete(p)})
    enviados.add(paquetesAEnviar)
  }
  method enviarPendienteCaro() {
    const caro = self.pendienteCaro()
    pendientes.remove(caro)
    self.enviarPaquete(caro)
  }
  method pendienteCaro() = pendientes.max({p=>p.precio()})
    
}

object paquetito {
  var destino = null
  method estaPago()= true
  method puedeSerEntregadoPor(mensajero) = true
   
  method precio() = 0
  method destino() = destino
  method nuevoDestino(nuevo) {destino = nuevo}
}

object paqueton {
  var pagado = null
  const destinos = [matrix, puenteBrooklyn]
  method estaPago() {return pagado >= self.precio()} 
  method precio() = destinos.size() * 100
  method pagar(importe) {pagado = pagado + importe}
  method pasaPorTodos(alguien) = destinos.all({d=>d.puedePasar(alguien)})
  method puedeSerEntregadoPor(mensajero) {
    return self.estaPago() and self.pasaPorTodos(mensajero)
  }
}
object paquetePremium {
  var estaPago = null
  const destinos = [matrix, puenteBrooklyn]
  method estaPago() = estaPago
  method precio() = destinos.size() * 1000
  method pagar() {estaPago = true}
  method puedeSerEntregadoPor(mensajero) {
    return self.estaPago() and mensajero.peso() == 100 and  mensajero.puedeLlamar()
  }

}
object jose {
method peso() = 100
method puedeLlamar() = true

}

