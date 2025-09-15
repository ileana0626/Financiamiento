/*
* @description Archivo de ayuda en vistas .vue
* @author Tony 😉
* @version 1.0.2
* @date 18/08/2025
* @updated 12/09/2025
*/
/**
 * 🐛 Función para depuración development
 * @param {...any} args - Uno o más mensajes a mostrar en consola
 * @example
 * debugLog('Mensaje de prueba', {data: 123});
 * debugError('Error de prueba', {data: 123});
 * debugWarn('Advertencia de prueba', {data: 123});
 */
export const debugLog = (...args) => {
    if (process.env.NODE_ENV === 'development') {
        //console.log('🐛 ', ...args);
        console.log(...args);
    }
};
export const debugError = (...args) => {
    if (process.env.NODE_ENV === 'development') {
        //console.error('❌', ...args)
        //console.error('🔴 ', ...args);
        console.error(...args);
    }
};
export const debugWarn = (...args) => {
    if (process.env.NODE_ENV === 'development') {
        //console.warn('⚠️ ', ...args);
        console.warn(...args);
    }
};

/**
 * Trunca un número a la cantidad de decimales especificada
 * @param {number|string} value - Valor numérico a truncar
 * @param {number} [decimals=2] - Cantidad de decimales (por defecto: 2)
 * @returns {string} - Valor truncado con los decimales especificados
 */
export const truncateTo2Decimals = (value, decimals = 2) => {
    const num = Number(value);
    // return (Math.trunc(num * 100) / 100).toFixed(decimals); 
    // Más eficiente al usar toFixed() directamente en lugar de operaciones matemáticas
    return Number.isNaN(num) ? '0.00' : num.toFixed(decimals);
};


// VALIDADORES 📝

/**
 * Valida que un valor sea un número válido
 * @param {number|string} value - Valor a validar
 * @returns {boolean} - True si el valor es un número válido, false en caso contrario
 */
export const isValidNumber = (value) => {
    if (value === null || value === undefined || value === '') {
        return false;
    }
    
    // Convertir a string, reemplazar todo excepto números, punto decimal y signo negativo
    const stringValue = String(value);
    const cleanValue = stringValue.replace(/[^\d.-]/g, '');
    
    // Validar que solo haya un punto decimal
    if ((cleanValue.match(/\./g) || []).length > 1) {
        return false;
    }
    
    // Validar que solo haya un signo negativo al inicio
    if ((cleanValue.match(/-/g) || []).length > 1 || 
        (cleanValue.includes('-') && !cleanValue.startsWith('-'))) {
        return false;
    }
    
    const num = Number(cleanValue);
    return !Number.isNaN(num);
};