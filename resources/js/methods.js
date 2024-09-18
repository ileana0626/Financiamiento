exports.catchHandler = (error, nombreMetodo) => {
  console.log(nombreMetodo)
  if (Object.hasOwn(error, 'response')) {
    if (error.response.message == "Unauthenticated" || error.response.status == 401) {
      Swal.fire({
        icon: 'warning',
        title: 'La sesión ha expirado, por favor ingresa nuevamente',
        showConfirmButton: true,
        confirmButtonText: 'De acuerdo'
      }).then((result) => {
        sessionStorage.clear();
        this.$router.push({ name: 'login' });
        location.reload();
      });
    }
    else {
      const errorParts = this.splitStringByDot(error.response.data.message);
      let errCode = this.encryptStringWithXORtoHex(nombreMetodo + '.' + errorParts[1]);
      console.log(errCode);
      let decoded = this.decryptStringWithXORFromHex(errCode);
      console.log(decoded);
      Swal.fire({
        icon: 'error',
        title: errorParts[0] + ".",
        text: "Código de error: " + errCode,
        showConfirmButton: true,
        confirmButtonText: 'De acuerdo'
      });
    }
  }
  else {
    let codigoCompuesto = nombreMetodo + '.0';
    let errCode = this.encryptStringWithXORtoHex(codigoCompuesto);
    let decoded = this.decryptStringWithXORFromHex(errCode);
    console.log(decoded);
    Swal.fire({
      icon: 'error',
      title: 'Ha ocurrido un error, inténtelo más tarde',
      text: "Código de error: " + errCode,
      showConfirmButton: true,
      confirmButtonText: 'De acuerdo'
    });
  }
}


exports.splitStringByDot = (string) => {
  return string.split('.');
}

exports.encryptStringWithXORtoHex = (input) => {
  console.log("INPUT CONTENT:" + input)
  var c = '';
  let key = "C0r(in24";

  while (key.length < input.length) {
    key += key;
  }
  for (var i = 0; i < input.length; i++) {
    var value1 = input[i].charCodeAt(0);
    var value2 = key[i].charCodeAt(0);

    var xorValue = value1 ^ value2;

    var xorValueAsHexString = xorValue.toString("16");

    if (xorValueAsHexString.length < 2) {
      xorValueAsHexString = "0" + xorValueAsHexString;
    }

    c += xorValueAsHexString;
  }
  return c;
}

exports.decryptStringWithXORFromHex = (input) => {
  let c = "";
  let key = "C0r(in24";

  while (key.length < input.length / 2) {
    key += key;
  }

  for (let i = 0; i < input.length; i += 2) {
    let hexValueString = input.substring(i, i + 2);
    let value1 = parseInt(hexValueString, 16);
    let value2 = key.charCodeAt(i / 2);

    let xorValue = value1 ^ value2;
    c += String.fromCharCode(xorValue)
  }
  console.log("HOLA: ", c.toString())
  return c;
};

/**
 * Animación de loading de Vuesax.
 * @param {object} vsInstance - La instancia de Vuesax (this.$vs)
 * @return {object} La instancia de la animación de loading. 
 */
exports.loading = (vsInstance) => {
  return vsInstance.loading({
    type: 'square',
    color: '#00a19a',
    background: '#FFFFFF',
    text: 'Cargando...'
  });    
};

/**Devuelve la fecha actual en formato Timestamp de MySQL
 * @returns {String} 
 */
exports.getTimestamp = () => {
  const currentDate = new Date();
  const year = currentDate.getFullYear();
  const month = String(currentDate.getMonth() + 1).padStart(2, '0'); // Months are zero-based
  const day = String(currentDate.getDate()).padStart(2, '0');
  const hours = String(currentDate.getHours()).padStart(2, '0');
  const minutes = String(currentDate.getMinutes()).padStart(2, '0');
  const seconds = String(currentDate.getSeconds()).padStart(2, '0');    
  return (`${year}-${month}-${day} ${hours}:${minutes}:${seconds}`);
};