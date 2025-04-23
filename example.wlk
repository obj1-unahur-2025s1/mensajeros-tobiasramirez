object roberto {
  var vehiculo = camion
  const peso = vehiculo.peso() + self.pesoPropio()
  method peso() = peso
  method pesoPropio() = 90
  method puedeLlamar() = false
  method vehiculo() = vehiculo
  method cambiarVehiculo(unVehiculo) {vehiculo = unVehiculo}
  method puedeEntregarPaquete(lugar) {
    return paquete.estaPago() && lugar.puedePasar(self)
  }
}

object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true
  method puedeEntregarPaquete(lugar) {
    return paquete.estaPago() && lugar.puedePasar(self)
  }
}

object neo {
  var credito = 10
  method peso() = 0
  method puedeLlamar() {self.tieneCredito()}
  method tieneCredito() = credito > 0
  method nuevoCredito(unCredito) {credito = unCredito}
  method puedeEntregarPaquete(lugar) {
    return paquete.estaPago() && lugar.puedePasar(self)
 
  }
}
object paquete {
  var estaPago = null
  method estaPago()  {estaPago = true}
  method noEstaPago() {estaPago = false}
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
    alguien.peso() <= 1000
  }
}

object matrix {
  method puedePasar(alguien) {
    alguien.puedeLlamar()
  }
}
