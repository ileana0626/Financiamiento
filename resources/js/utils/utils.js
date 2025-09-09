/*
* @description Archivo de ayuda en vistas .vue
* @author Tony 😉
* @version 1.0.2
* @date 18/08/2025
* @updated 08/09/2025
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
 * Trunca un número a 2 decimales
 * @param {number} value - Valor numérico a truncar
 * @returns {string} - Valor truncado a 2 decimales
 */
export const truncateTo2Decimals = (value) => {
    if (!value && value !== 0) return '0.00';
    const num = Number(value); // (falla si hay caracteres no numéricos)
    return (Math.trunc(num * 100) / 100).toFixed(2);
};


/**
 * Trunca un número a 2 decimales
 * @param {number|string} value - Valor a truncar (número o string numérico)
 * @returns {string} - Valor truncado a 2 decimales o '0.00' si hay error
 */
export const truncateTo2DecimalsSafe = (value) => {
    try {
        // Manejo de null/undefined/string vacío
        if (value === null || value === undefined || value === '') {
            return '0.00';
        }
        
        // Convertir a número
        const num = Number(value);
        
        // Verificar si la conversión fue exitosa
        if (isNaN(num)) {
            console.warn('Valor no numérico recibido:', value);
            return '0.00';
        }
        
        // Manejar infinitos
        if (!isFinite(num)) {
            console.warn('Valor infinito recibido:', value);
            return '0.00';
        }
        
        // Truncar a 2 decimales
        return (Math.trunc(num * 100) / 100).toFixed(2);
    } catch (error) {
        console.error('Error en truncateTo2Decimals:', error);
        return '0.00';
    }
};