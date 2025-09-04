/*
* @description Archivo de ayuda para formatear datos de la base de datos 
* y mostrar en vistas .vue
* @author Tony 😉
* @version 1.2.1
* @date 18/08/2025
* @updated 04/09/2025
*/
/**
 * Formatea una fecha de entrada a un formato específico con el separador indicado.
 * @param {String} dateString - Fecha en formato 'YYYY-MM-DD', 'DD/MM/YYYY' o 'DD-MM-YYYY'
 * @param {String} separator - Separador de salida ('/' o '-')
 * @returns {String} Fecha formateada o cadena vacía si no es válida
 */
export const formatDateToDMY = (dateString, separator = '/') => {
    // Si no se proporciona una fecha, devolver cadena vacía
    if (!dateString) return '';

    // Expresión regular para validar los formatos de fecha aceptados:
    // - YYYY-MM-DD (ISO)
    // - DD/MM/YYYY
    // - DD-MM-YYYY
    const dateRegex = /^(\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]))|((0[1-9]|[12][0-9]|3[01])[\/-](0[1-9]|1[0-2])[\/-]\d{4})$/;
    
    // Validar el formato de la fecha con la expresión regular
    if (!dateRegex.test(dateString)) {
        console.error('Formato de fecha inválido');
        return '';
    }
    try {
        let day, month, year;
        
        // Determinar el formato de la fecha y extraer día, mes y año
        if (dateString.includes('-') && dateString.match(/-/g).length === 2) {
            // Formato YYYY-MM-DD
            [year, month, day] = dateString.split('-').map(Number);
        } else {
            // Formato DD/MM/YYYY o DD-MM-YYYY
            const sep = dateString.includes('/') ? '/' : '-';
            [day, month, year] = dateString.split(sep).map(Number);
        }
        
        // Validar si la fecha es real (días en mes, años bisiestos, etc.)
        if (!isValidDate(day, month, year)) {
            console.error('Fecha no válida');
            return '';
        }
        // Función auxiliar para agregar ceros a la izquierda si es necesario
        const pad = n => n < 10 ? `0${n}` : n;
        
        // Devolver la fecha formateada con el separador especificado
        return `${pad(day)}${separator}${pad(month)}${separator}${year}`;
    } catch (error) {
        // Manejar cualquier error inesperado durante el procesamiento
        console.error('Error al formatear la fecha:', error);
        return '';
    }
};

 /**
 * Valida si una fecha es válida (incluyendo días en meses y años bisiestos)
 * @param {number} day - Día del mes
 * @param {number} month - Mes (1-12)
 * @param {number} year - Año (4 dígitos)
 * @returns {boolean} true si la fecha es válida
 */
const isValidDate = (day, month, year) => {
    // Ajustar mes (JavaScript cuenta meses desde 0-11)
    const date = new Date(year, month - 1, day);
    return (
        date.getFullYear() === year &&
        date.getMonth() === month - 1 &&
        date.getDate() === day
    );
};


/**
 * Convierte una fecha en formato YYYY-MM-DD a un formato legible con nombre de mes en español.
 * 
 * @example
 * // returns "18/AGO/2025"
 * formatDateToDMYWithMonthName("2025-08-18", 'mmm')
 * 
 * @example
 * // returns "18/agosto/2025"
 * formatDateToDMYWithMonthName("2025-08-18")
 * 
 * @param {string} dateString - La fecha a formatear en formato YYYY-MM-DD
 * @param {string} [format='full'] - Formato del mes: 'full' para nombre completo, 'mmm' para primeras 3 letras en mayúsculas
 * @returns {string} La fecha formateada como "DD/mes/YYYY" o "DD/MMM/YYYY" según el formato
 * 
 * @requires module:./getMonthName
 */
export const formatDateToDMYWithMonthName = (dateString, format = 'full') => {
    if (!dateString) return '';

    try {
        const [year, month, day] = dateString.split('-').map(Number);
        const date = new Date(year, month - 1, day);
        
        // solo verifica si la fecha es un valor de fecha válido según JavaScript, 
        // pero puede tener falsos positivos (ej: 31/02/2023 lo convierte a 03/03/2023).
        if (isNaN(date.getTime())) {
            console.error('Fecha no válida');
            return '';
        }

        let monthName;
        if (format.toLowerCase() === 'mmm') {
            monthName = getMonthName(month).substring(0, 3).toUpperCase();
        } else {
            monthName = getMonthName(month);
        }

        return `${day.toString().padStart(2, '0')}/${monthName}/${year}`;
    } catch (error) {
        console.error('Error al formatear la fecha:', error);
        return '';
    }
}

/**
 * Valida si un string tiene formato de número con o sin símbolo de moneda
 * @param {string} str - String a validar
 * @returns {boolean} - true si el formato es válido
 */
const tieneFormatoMonedaValido = (str) => {
    // Acepta números con/sin signo, con/sin separadores de miles, y con/sin decimales
    const formatoMonedaRegex = /^[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]+)?$/;
    return formatoMonedaRegex.test(str);
};

/**
 * Formatea un número como moneda mexicana
 * @param {number|string} valor - Valor a formatear (puede ser número o string numérico)
 * @param {number} [decimales=2] - Número de decimales a mostrar (0-20)
 * @returns {string} - Valor formateado como moneda mexicana
 * @example
 * formatoMoneda(1234.567);      // "$1,234.57"
 * formatoMoneda("1234.567", 3); // "$1,234.567"
 * formatoMoneda(null);          // "$0.00"
 * formatoMoneda("abc");         // "$0.00"
 */
export const formatoMoneda = (valor, decimales = 2) => {
    // Validación de entrada
    if (valor === null || valor === undefined || valor === '') return '$0.00';
    
     // Si es string, validar formato y limpiar
     if (typeof valor === 'string') {
        // Eliminar espacios y símbolos de moneda existentes
        const valorLimpio = valor.trim().replace(/[$\s,]/g, '');
        
        // Validar que sea un número válido
        if (!tieneFormatoMonedaValido(valorLimpio) || isNaN(Number(valorLimpio))) {
            return '$0.00';
        }
        // Convertir a número
        valor = Number(valorLimpio);
    }

    const num = Number(valor);
    if (isNaN(num)) return '$0.00';
    
    // Asegurar que los decimales estén en el rango permitido (0-20)
    const decimalesAjustados = Math.min(Math.max(0, Math.floor(decimales)), 20);
    
    // const options = {
    //     style: 'currency',
    //     currency: 'MXN',
    //     minimumFractionDigits: decimalesAjustados,
    //     maximumFractionDigits: decimalesAjustados,
    //     useGrouping: true
    // };
    
    try {
        const formatter = new Intl.NumberFormat('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: decimalesAjustados,
            maximumFractionDigits: decimalesAjustados,
            useGrouping: true
        });
        //return num.toLocaleString('es-MX', options);
        return formatter.format(num);
    } catch (error) {
        console.error('Error al formatear moneda:', error);
        // Fallback básico en caso de error
        return `$${num.toFixed(decimalesAjustados)}`;
    }
};

/* Función para formatear el porcentaje (solo formatea)
* @param {number} valor - El valor a formatear
* @returns {string} - El valor formateado
*/
export const formatearPorcentajeSimple = (valor, defaultDecimal = 5) => {
    if (!valor) return '0.00000 %';
    const numero = parseFloat(valor.toString().replace(/[^0-9.]/g, ''));
    return isNaN(numero) ? '0.00000 %' : numero.toFixed(defaultDecimal) + ' %';
}

/**
 * Formatea un número a porcentaje con una cantidad fija de decimales
 * @param {number|string} valor - El valor a formatear como porcentaje
 * @param {number} defaultDecimal - Número de decimales a mostrar (por defecto: 5)
 * @returns {string} - El valor formateado como porcentaje con los decimales especificados
 * @example
 * formatearPorcentaje(5)       // "5.00000 %"
 * formatearPorcentaje(5.5, 3)  // "5.500 %"
 * formatearPorcentaje(null)    // "0.00000 %"
 * formatearPorcentaje('abc')   // "0.00000 %"
 */
export const formatearPorcentaje = (valor, defaultDecimal = 5) => {
    if (valor === null || valor === undefined || valor === '') {
        return '0'.padEnd(defaultDecimal + 1, '.0').padEnd(defaultDecimal + 2, '0') + ' %';
    }
    const numero = typeof valor === 'number' ? valor : parseFloat(valor.toString().replace(/[^0-9.]/g, ''));
    if (isNaN(numero)) {
        return '0'.padEnd(defaultDecimal + 1, '.0').padEnd(defaultDecimal + 2, '0') + ' %';
    }
    return numero.toFixed(defaultDecimal) + ' %';
}


/**
 * Formatea un número a string con una cantidad fija de decimales
 * @param {number|string} valor - El valor a formatear
 * @param {number} defaultDecimal - Número de decimales a mostrar (por defecto: 2)
 * @returns {string} - El valor formateado como string con los decimales especificados
 * @example
 * formatearDecimal(5)       // "5.00"
 * formatearDecimal(5.5, 3)  // "5.500"
 * formatearDecimal(5.6789)  // "5.67"
 * formatearDecimal(null)    // "0.00"
 * formatearDecimal('abc')   // "0.00"
 */
export const formatearDecimal = (valor, defaultDecimal = 2) => {
    if (valor === null || valor === undefined || valor === '') {
        return '0'.padEnd(defaultDecimal + 1, '.0').padEnd(defaultDecimal + 2, '0');
    }
    
    const numero = typeof valor === 'number' ? valor : parseFloat(valor.toString().replace(/[^0-9.]/g, ''));
    
    if (isNaN(numero)) {
        return '0'.padEnd(defaultDecimal + 1, '.0').padEnd(defaultDecimal + 2, '0');
    }
    
    const partes = numero.toString().split('.');
    let parteEntera = partes[0];
    let parteDecimal = partes[1] || '';
    
    // Asegurar la cantidad correcta de decimales
    parteDecimal = parteDecimal.padEnd(defaultDecimal, '0').slice(0, defaultDecimal);
    
    return parteDecimal ? `${parteEntera}.${parteDecimal}` : parteEntera;
}

/**
 * Limpia y valida un valor numérico de un input
 * @param {string} valor - Valor a limpiar
 * @returns {string} - Valor limpio y validado
 * @example
 * limpiarNumeroInput("$1,234.56") // "1234.56"
 * limpiarNumeroInput("abc123.45") // "123.45"
 * limpiarNumeroInput("12.34.56")  // "12.3456"
 * 
 * @example
 * "12.34.56" → "12.3456"
 * ".123" → "0.123"
 * "0012.34" → "12.34"
 * 
 * @example
 * methods: {
 *     onInputMoneda(event) {
 *         const valorLimpio = limpiarNumeroInput(event.target.value);
 *         this.miValor = valorLimpio;
 *         // Actualizar el valor del input
 *         event.target.value = valorLimpio;
 *     }
 * }
 * <input 
 *     type="text" 
 *     :value="miValor" 
 *     @input="onInputMoneda" 
 *     placeholder="0.00" 
/>
 */
export const limpiarNumeroInput = (valor) => {
    if (typeof valor !== 'string') return '';
    
    // Elimina todo excepto números y puntos
    const soloNumerosYPunto = valor.replace(/[^0-9.]/g, '');
    // Maneja múltiples puntos, manteniendo solo el primero
    const partes = soloNumerosYPunto.split('.');
    const parteEntera = partes[0] || '';
    const parteDecimal = partes.length > 1 ? '.' + partes.slice(1).join('') : '';

    // Une las partes y limpia ceros a la izquierda
    return (parteEntera + parteDecimal)
        .replace(/^0+(\d)/, '$1')  // Elimina ceros iniciales
        .replace(/^\./, '0.')      // Si empieza con punto, agrega 0
        .replace(/^$/, '0');       // Si está vacío, devuelve "0"
};