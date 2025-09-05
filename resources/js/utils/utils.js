/*
* @description Archivo de ayuda en vistas .vue
* @author Tony 😉
* @version 1.0.1
* @date 18/08/2025
* @updated 05/09/2025
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
        console.log('🐛 ', ...args);
    }
};
export const debugError = (...args) => {
    if (process.env.NODE_ENV === 'development') {
        //console.error('❌', ...args)
        console.error('🔴 ', ...args);
    }
};
export const debugWarn = (...args) => {
    if (process.env.NODE_ENV === 'development') {
        console.warn('⚠️ ', ...args);
    }
};
