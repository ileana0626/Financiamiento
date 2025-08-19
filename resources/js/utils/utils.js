/**
 * 🐛 Función para depuración development
 * @param {...any} args - Uno o más mensajes a mostrar en consola
 * @example
 * debug('Mensaje de prueba', {data: 123});
 */
const debug = (...args) => {
    if (process.env.NODE_ENV === 'development') {
        console.log(...args);
    }
};