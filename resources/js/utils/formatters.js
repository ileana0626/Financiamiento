/*
* @description Archivo de ayuda para formatear datos de la base de datos 
* y mostrar en vistas .vue
* @author Tony
* @version 1.0.0
* @date 18/08/2025
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


/*
* Formatea a moneda
* @param {number} valor - El valor a formatear
* @returns {string} - El valor formateado
*/
export const formatoMoneda = (valor, defaultDecimal = 2) => {
    return new Intl.NumberFormat('es-MX', {
    style: 'currency',
    currency: 'MXN',
    minimumFractionDigits: defaultDecimal,
    maximumFractionDigits: defaultDecimal
    }).format(valor);
}

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